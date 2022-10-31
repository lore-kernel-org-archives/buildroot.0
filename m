Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACDBC38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 10:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17CCE60B45;
	Mon, 31 Oct 2022 10:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17CCE60B45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mz6ROx9ah-e2; Mon, 31 Oct 2022 10:02:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37D0860B3D;
	Mon, 31 Oct 2022 10:02:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37D0860B3D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD69C1BF580
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B994160B3D
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:00:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B994160B3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WALlttQvObPq for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 10:00:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C78A060B2A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C78A060B2A
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 10:00:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 09BA8B0053A;
 Mon, 31 Oct 2022 11:00:41 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 11:00:41 +0100
Date: Mon, 31 Oct 2022 11:00:41 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221031100041.GV1058960@scaer>
References: <20221030212519.66340-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221030212519.66340-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667210444;
 bh=NX1wR9G9UKJm+8+gRclEn69oLz0EOJDlnv2Q5f8Jrcs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FRnWQRklI2i/HhDar7zfC6lUzNum+3BHv+fNXFk6MhP8Lo5HoZ0yosaKlVSbNy+Rr
 Iex818xfqs1lRczc5mxLCLnKq76uAMidkLjiSyMoBKpOcVfIC/IGK5LWcEczfYMYPF
 BzGuZsp4L6CEkpEx6VCPAPZGjdNgbyu0EBB851pgBTpXD4d7grDsfz8iRyt3z/YiZc
 HrLiUMk+ABUI759NiaRjPBabE8wzBtVUXNaxK2eC9fA8AM3dyfMOP5CqXGjw9vxtjO
 ivkJLGbxZhN7MZiXBrMEGxhA5PT2OXdjnRPuXaJEYH3adj3fgK9mk0InjhbYZ3NRLt
 NT0wH/+xM6eRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FRnWQRkl
Subject: Re: [Buildroot] [PATCH 1/1] package/motion: bump to version 4.5.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-10-30 22:25 +0100, Fabrice Fontaine spake thusly:
> https://github.com/Motion-Project/motion/releases/tag/release-4.5.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/motion/motion.hash | 2 +-
>  package/motion/motion.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/motion/motion.hash b/package/motion/motion.hash
> index 085ac90449..9b99256864 100644
> --- a/package/motion/motion.hash
> +++ b/package/motion/motion.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  3fb0d14fff8a8a143716223b5d2d55c0f52b11badf13a2e485b98bae3cf1b572  motion-4.4.0.tar.gz
> +sha256  42320a1c7b54a3f0b5a49cecf34a5d752760b28383bc573b3ca1240581786fe5  motion-4.5.0.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/motion/motion.mk b/package/motion/motion.mk
> index 5d54ecea01..18fe0eb630 100644
> --- a/package/motion/motion.mk
> +++ b/package/motion/motion.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MOTION_VERSION = 4.4.0
> +MOTION_VERSION = 4.5.0
>  MOTION_SITE = $(call github,Motion-Project,motion,release-$(MOTION_VERSION))
>  MOTION_LICENSE = GPL-2.0
>  MOTION_LICENSE_FILES = LICENSE
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
