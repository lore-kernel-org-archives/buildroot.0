Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6E2C83F34
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 17:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B05F48475C;
	Sat, 19 Jul 2025 17:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RAgjnjnE6FQM; Sat, 19 Jul 2025 17:23:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFDF184755
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFDF184755;
	Sat, 19 Jul 2025 17:23:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B3369117
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 17:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFA6C84755
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 17:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3smeqM_3YjEj for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 17:23:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E477784752
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E477784752
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E477784752
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 17:23:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 5F70513F8A2;
 Sat, 19 Jul 2025 19:23:50 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Jul 2025 19:23:50 +0200
MIME-Version: 1.0
Date: Sat, 19 Jul 2025 19:23:50 +0200
To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org, Andrea Cervesato <andrea.cervesato@mailbox.org>
In-Reply-To: <20250718040903.1386179-1-petr.vorel@gmail.com>
References: <20250718040903.1386179-1-petr.vorel@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <07b1fa0c430c0c566d444c48bfcf1df1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752945832;
 bh=FsOSm0Xy2SJWHt9dG2Rls+pFTeD3/jvja7S/COSQMiQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=chZlQYy5yQYGx20u0BHR9syITXjQU50qwu4ABczhhak4ws6EwyuMoFrMdYqU1rWdJ
 pzLVC0zTgbJEMK1NBAJAj5G5ojltyY5rozra8ePnojgy3CKbuSAc70N6XGRzi7petu
 Ar0r5QlPwodvf0xnsGIBxPp7iigrQTlC2XPYzgVsvbIj0e3Z5pFYUx93ZecooCqb7Q
 i+BhxkzAB0u+MRU6UH74xgp+LUJ0CxSO1LRscJP0ZOLFITzrDg8lY9Ut0/VZLZnpsT
 P/RM0V3O6wvVJnfLXM8MUl7wdlUJ51n45pbZsq+L6miz68864Y+U9hVjo8VexsKX9/
 RvmZRnsitAj1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=chZlQYy5
Subject: Re: [Buildroot] [PATCH 1/1] package/ltp-testsuite: backport musl
 build fixes
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Petr,

Thanks for the patch!

On 18/07/2025 06:09, Petr Vorel wrote:
> Backport 2 commits from upstream which fixes LTP on musl on kernel >= 
> 6.14.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi all,
> 
> I did not experience the problem on current bootlin-x86-64-musl
> toolchain (used via utils/test-pkg), but Andrea is using a different
> toolchain based obviously on newer headers.

I am able to reproduce the issue with the following commands,
on branch master at commit 7c8cca9:

     cat >.config <<EOF
     BR2_aarch64=y
     BR2_TOOLCHAIN_BUILDROOT_MUSL=y
     BR2_LINUX_KERNEL=y
     BR2_LINUX_KERNEL_LATEST_VERSION=y
     BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
     BR2_PACKAGE_LTP_TESTSUITE=y
     EOF
     make olddefconfig
     make ltp-testsuite

However, this patch does not seem to fix it. It is probably because
you added a patch modifying configure.ac without adding in
ltp-testsuite.mk:

     # 0001-configure-Fix-build-on-kernel-6.14-headers.patch
     LTP_TESTSUITE_AUTORECONF = YES

Could you confirm the reproduced issue is the right one,
and adding _AUTORECONF fixes it, please?  If it is the right
fix, could you send a v2 including the commands to reproduce
in the commit log and adding this _AUTORECONF please?

Best regards,

Julien.

> Kind regards,
> Petr

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
