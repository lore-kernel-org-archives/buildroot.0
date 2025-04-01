Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C933C36010
	for <buildroot@archiver.kernel.org>; Tue,  1 Apr 2025 19:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7E48838E6;
	Tue,  1 Apr 2025 19:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQDwc2pPqIWC; Tue,  1 Apr 2025 19:00:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5E5983641
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5E5983641;
	Tue,  1 Apr 2025 19:00:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BECF2137
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 19:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A83B561128
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 19:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O0MKBDeN7aTB for <buildroot@buildroot.org>;
 Tue,  1 Apr 2025 19:00:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7C2D1606F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C2D1606F0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C2D1606F0
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 19:00:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A5DC960134;
 Tue,  1 Apr 2025 21:00:07 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:54240])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 01 Apr 2025 21:00:07 +0200
MIME-Version: 1.0
Date: Tue, 01 Apr 2025 21:00:07 +0200
From: Julien Olivain <ju.o@free.fr>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20250331-bump_linux_pam_1-7-0-v1-1-dfc4b55a0dd8@rivosinc.com>
References: <20250331-bump_linux_pam_1-7-0-v1-1-dfc4b55a0dd8@rivosinc.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <f0605945c9018fab7218ae831b193b3b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743534009;
 bh=6efxTmMBx3VwwY8jdCIIJPF8JMQePNxdPfNoA/68ciI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KUsNopzO1q/Ss3m7LmUfeTIfcx70JBKtNESMNuXfTZZBj3CxmIWX8wSLr24g0eNDx
 DcZq1VineshHoERp5PrVETZrKUody/1pOm6zu4tOWuxzl+jh/l9AiwS7c0J4pai4E3
 DDhzSSH9IwY2bQQl7OdCOj8WeUtv+42W9HKN8qyqEkAR6Xy0KvF0QICMqbIdDXejA1
 JMUwcRl/OGG19lji2E+vPr8hr4IzAlh2FP2GEmc12HGbVEc1bcRFXCirRTC4F5u6mD
 VeJuc2YDSUc6geNtVmRdq/LzlI4nHqgkt8y7xCON+vSmAoU6KW39mnPROMg3v0LoR3
 0c+FTpTeyCrwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KUsNopzO
Subject: Re: [Buildroot] [PATCH] package/linux-pam: bump to version 1.7.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Charlies,

Thanks for the patch.

On 01/04/2025 04:57, Charlie Jenkins wrote:
> Bump to latest version. Remove patch included in release and fixup the
> configure options due to linux-pam migrating to the Meson build system.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
[...]
> diff --git a/package/linux-pam/linux-pam.mk 
> b/package/linux-pam/linux-pam.mk
> index 
> 23b09efbaea6a148924bc0eb7721e6cbec7f8e6b..4f18a12c2059e70498ecb0adb1b23dff2fa04388 
> 100644
> --- a/package/linux-pam/linux-pam.mk
> +++ b/package/linux-pam/linux-pam.mk
> @@ -4,17 +4,15 @@
>  #
>  
> ################################################################################
> 
> -LINUX_PAM_VERSION = 1.6.1
> +LINUX_PAM_VERSION = 1.7.0

This new version seems to introduce new build failures. See: [1]

Apparently, setting BR2_PACKAGE_LINUX_PAM_LASTLOG=y requires a libc
with the logwtmp() function. Maybe this option should depends on !musl.
See for example [2].

Also, the bootlin-microblazeel-uclibc toolchain is failing. It seems
to be due to linker warnings to be treated as errors. Maybe a fix
like [3] should be added.

Could you have a look to those issues and send an updated patch,
please?

Best regards,

Julien.

[1] https://gitlab.com/jolivain/buildroot/-/pipelines/1747133176
[2] 
https://gitlab.com/buildroot.org/buildroot/-/commit/14532e4fc6e02a755b30e634fd60f53b92655bcd
[3] 
https://gitlab.com/buildroot.org/buildroot/-/commit/132eec5c47f5f9542d0c2e93d12341d624627de0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
