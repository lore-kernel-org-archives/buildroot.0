Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0B8C36018
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 19:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2662460603;
	Wed,  2 Apr 2025 19:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NaPfHUFV53bT; Wed,  2 Apr 2025 19:38:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56C7060684
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56C7060684;
	Wed,  2 Apr 2025 19:38:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53C8B11F
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4556D83F36
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6N2yoRcIMcb for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 19:38:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 575C683F33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 575C683F33
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 575C683F33
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:38:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3EC02780368;
 Wed,  2 Apr 2025 21:38:10 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50820])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 02 Apr 2025 21:38:10 +0200
MIME-Version: 1.0
Date: Wed, 02 Apr 2025 21:38:10 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250401194506.317668-1-giulio.benetti@benettiengineering.com>
References: <46b77ff81a96ebcb9e707d4de114a79e@free.fr>
 <20250401194506.317668-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <83efa708da680e88394c89f786e661be@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743622691;
 bh=V5DC+xPkOg/79gMmrweq9o7cZv7PDf7wEqpsn0vHcbA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K2UXe24heR8t0LSYrj0aXEkRdfiPKrtHZk6bnFQQWlka8SgmkXxrpZPyY+63r77Kc
 jO5LEfx+J4siYJfftznVA3WxBDX0wmTjtXv5qymLYV6fVd30bXvwCy8PA5zFDuf+m8
 Qa72ZGKbz7392Ky3wUIIC5W6+Yqo3hGnRAMWRgpagSCWjVzyDOcWYMV+uvX19g39Xf
 idE1XpI8hj5ulxdo8KZyvyNOsQtm7s6TAxulTACmXpEHnIdBTULOwYhiy0yi/nHz14
 wRDLMsR7oEH4s4CGCpb65uqJOB+/y3RlL3SkLqSxKhN9l5/DVrqZ+8cDTumVH/7704
 dGKkiXl76HM6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=K2UXe24h
Subject: Re: [Buildroot] [PATCH v2] package/libfuse3: bump to version 3.17.1
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

Hi Giulio,

Thanks for the updated patch.

On 01/04/2025 21:45, Giulio Benetti wrote:
> Release notes:
> https://github.com/libfuse/libfuse/releases/tag/fuse-3.17.1
> 
> Add local patch pending upstream to fix build with linux version < 5.9.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * fix linux version < 5.9 build failure by adding local patch pending 
> upstream
[...]
> diff --git a/package/libfuse3/libfuse3.mk 
> b/package/libfuse3/libfuse3.mk
> index f5c9dae8f7..2fba6792cb 100644
> --- a/package/libfuse3/libfuse3.mk
> +++ b/package/libfuse3/libfuse3.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBFUSE3_VERSION = 3.16.2
> +LIBFUSE3_VERSION = 3.17.1

Even with the patch resolving the issue with Kernel headers < 5.9, I 
still
see few remaining build failures with this version. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/1749236624

Could you have a look please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
