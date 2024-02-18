Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081E3C4829E
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 08:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39D0B400CF;
	Sun, 18 Feb 2024 08:09:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xBZMxx8DpX7b; Sun, 18 Feb 2024 08:09:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C801940126
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C801940126;
	Sun, 18 Feb 2024 08:09:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 860B91BF3C1
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 08:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7319F60A40
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 08:09:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GG6GQye3UKhr for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 08:09:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.177;
 helo=smtpcmd15177.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9C049608F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C049608F1
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C049608F1
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 08:09:21 +0000 (UTC)
Received: from [192.168.50.163] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id bcEfrsFOY7rb2bcEgrkjBi; Sun, 18 Feb 2024 09:09:18 +0100
Message-ID: <ba5719b0-9b18-4148-bdfe-8a16ef06c4ee@benettiengineering.com>
Date: Sun, 18 Feb 2024 09:09:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kadambini Nema <kadambini.nema@gmail.com>, buildroot@buildroot.org
References: <20240218062239.1052785-1-kadambini.nema@gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240218062239.1052785-1-kadambini.nema@gmail.com>
X-CMAE-Envelope: MS4xfK4sJFeLeU+X94tDyi1pNRmuuLZaxzvkY+yO6G+2WfzeSgEGRPr3eoQRd3rnYCO5bxUWflWdYzysl6GEpDCez9n+H/NVzpr3pd6KKIb278BKSxaMqroM
 bfw0tcnhgd9mfLfpUbXkL9FV1VXPA95D37+R3+qbXnVkicExLu8+YdzZEQmR8ikpZCYM5bOTceJGk5VgY+LviKdu/8hWl5BCZfncZMLJRqJg0uUqtLLHp8Dx
 IVJoQnQq7CTC2WyRefcFfoaGrEVn2sWNZ0Kh+c9NMYTHcCzht1dhr/Qy3Znvo+zYjhbckdX/ahM25K6wn3HQvZbM90br/k9/0pGIkQJwQZU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708243758; bh=fsG+QGgyzntBhJHdCXYS2wfIcecZuewhCcyKn1bOeII=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=hX/4K5bPmhGpWoYNJWTYRlrCuAKrnItu4ksE1w1zlUkVMH4EE2rs1UaIJo+Ap6ilY
 ZQhSJ+9pq3IIKI8Y9CII0H8kFunSPRCmD54vVLpLjGlvJbtyG/Y07v4qyjhy9bmd64
 3phTnuPeIZqTHEDxfXjY1Hry72yA8K54ihTDeLGUwBEeXwMy53p1fyxx2sNTiukkXI
 f+YvJYing0hNx+LX3Q1VSJbjEUn3Fr3hMZqtFqWMCoz+Foxgmra7vrw0Rqa6c3dkrV
 fPB2CAWE8PI33rapfYxfRanECUXw28+MR4/zl9MSxn3rNvg58qQMP/fl9Sz+HJ9Ejk
 +iLDKoS9gzG9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=hX/4K5bP
Subject: Re: [Buildroot] [PATCH 1/1] package {sysrepo,
 libyang}: bump to version 2.2.150 (sysrepo), 2.1.148 (libyang)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?Q?Jan_Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Nema,

thank you for contributing!

Can you please split this into 2 patches?

If one package version requires another package minimum version then
please point it in the commit log.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

On 18/02/24 07:22, Kadambini Nema wrote:
> Release notes: https://github.com/sysrepo/sysrepo/releases
>                 https://github.com/CESNET/libyang/releases/tag/v2.1.148
> 
> $ ./utils/test-pkg -d br_test -k -c sysrepo.config sysrepo
>                      bootlin-armv5-uclibc [1/6]: OK
>                       bootlin-armv7-glibc [2/6]: OK
>                     bootlin-armv7m-uclibc [3/6]: SKIPPED
>                       bootlin-x86-64-musl [4/6]: OK
>                        br-arm-full-static [5/6]: SKIPPED
>                              sourcery-arm [6/6]: OK
> 6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
> ---
>   package/libyang/libyang.hash | 2 +-
>   package/libyang/libyang.mk   | 2 +-
>   package/sysrepo/sysrepo.hash | 2 +-
>   package/sysrepo/sysrepo.mk   | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
> index 3658b20e4e..e03278adfd 100644
> --- a/package/libyang/libyang.hash
> +++ b/package/libyang/libyang.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  3e52b922fcf371933ad7de1686ad83504e3358236e7817b5af795b0db52fa221  libyang-2.1.111.tar.gz
> +sha256  77a0aaaeb3df720aeb70d6896e32e2c2be099d48df73e3cfb52567051af3e44b  libyang-2.1.148.tar.gz
>   sha256  0b7ec43747d211a1e49c53588b0822062947bab6bdcc95238578beab34cba5bb  LICENSE
> diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
> index 5533c7c68e..fca0cd63f8 100644
> --- a/package/libyang/libyang.mk
> +++ b/package/libyang/libyang.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBYANG_VERSION = 2.1.111
> +LIBYANG_VERSION = 2.1.148
>   LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
>   LIBYANG_LICENSE = BSD-3-Clause
>   LIBYANG_LICENSE_FILES = LICENSE
> diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
> index 6a5e98f41b..056f70787d 100644
> --- a/package/sysrepo/sysrepo.hash
> +++ b/package/sysrepo/sysrepo.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  bebb7901682eb23bf4c73d086d0a45c124ec751a67793a66024f1d4203425730  sysrepo-2.2.36.tar.gz
> +sha256  467efed8d0f62c26a0d200602b911096eb2d67858e620937ab68f96b316fa9b7  sysrepo-2.2.150.tar.gz
>   sha256  88f1b7e5c64d2c113e07105aa9c0fb80639b40287565be1c2afd0949df83d826  LICENSE
> diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
> index 6b031ae6f9..7f2570bd7d 100644
> --- a/package/sysrepo/sysrepo.mk
> +++ b/package/sysrepo/sysrepo.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SYSREPO_VERSION = 2.2.36
> +SYSREPO_VERSION = 2.2.150
>   SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
>   SYSREPO_INSTALL_STAGING = YES
>   SYSREPO_LICENSE = BSD-3-Clause

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
