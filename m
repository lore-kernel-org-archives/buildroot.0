Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74ED0C43334
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1790B40C3F;
	Wed,  6 Jul 2022 21:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1790B40C3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a8PxP6mgSkVG; Wed,  6 Jul 2022 21:41:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F23A54049A;
	Wed,  6 Jul 2022 21:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F23A54049A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C06C1BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58A6A4049A
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58A6A4049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WpvEeCFoB7GI for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:41:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1F0D4011D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1F0D4011D
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:41:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D3A2AFF804;
 Wed,  6 Jul 2022 21:41:48 +0000 (UTC)
Date: Wed, 6 Jul 2022 23:41:48 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220706234148.6e126c35@windsurf>
In-Reply-To: <20220629181542.15848-1-bernd.kuhls@t-online.de>
References: <20220629181542.15848-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1657143709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gIGSAuZ0pFUIoRIc2m8N5ISh4smFH4U3PA2njmJFzAw=;
 b=c2SuX95x4YcIJrASV3fCixcdEna/1UYQ7TOoHujWjL0SrIy8wIYawo2vtTEtvJB2kMhPdd
 Dz5gD7TKNOLLfpA0ucMoKBxmwdehtxnRzAIG53O0v4o1iFRoGQ5YhyYEOPYYSLBIq5UmL9
 l1dsfZ8XMQUm9kbaXkJ5QIslFuDZ1YaSDwY0b9Jjicyxc2ZohGA47o2jH3595cR5Z5Ogbp
 cm1hdpJEU5mpb4uy0on3TfhCeePcnO6Fd1rHoEFWTw/FrwDM4sGSu87lx8juuxtzLDFhyI
 /UjaDsleNJ0PtAKxmuVR9EAiw7N+2mwHI6oU3u0QIWEtl+F97e5sAkvCeXZJQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c2SuX95x
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 22.1.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Wed, 29 Jun 2022 20:15:42 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes for 22.0.x:
> https://lists.freedesktop.org/archives/mesa-announce/2022-April/000670.html
> https://lists.freedesktop.org/archives/mesa-announce/2022-March/000667.html
> https://lists.freedesktop.org/archives/mesa-announce/2022-March/000665.html
> https://lists.freedesktop.org/archives/mesa-announce/2022-May/000673.html
> https://www.phoronix.com/scan.php?page=news_item&px=Mesa-22.0-Released
> 
> Release notes for 22.1.x:
> https://lists.freedesktop.org/archives/mesa-announce/2022-May/000675.html
> https://lists.freedesktop.org/archives/mesa-announce/2022-June/000678.html
> https://lists.freedesktop.org/archives/mesa-announce/2022-June/000681.html
> https://lists.freedesktop.org/archives/mesa-announce/2022-June/000682.html
> 
> Removed patch 0006, upstream committed a similar fix:
> https://cgit.freedesktop.org/mesa/mesa/commit/?h=22.1&id=623ff4ec4295dc67bc0c99ed5336eaae1ad76cc9
> 
> Backported patches and include proper uClibc fix, based on main branch.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk      |  12 +-
>  package/mesa3d/0006-fix-valist.patch          |  37 -----
>  ...emove-needless-c99-compat-h-includes.patch | 126 ++++++++++++++++++
>  package/mesa3d/0007-fix-cpp-detection.patch   |  40 ------
>  .../0007-include-drop-c11-compat-h.patch      | 100 ++++++++++++++
>  package/mesa3d/0008-Fix-uClibc-build.patch    |  65 +++++++++
>  package/mesa3d/Config.in                      |  69 +---------
>  package/mesa3d/mesa3d.hash                    |   9 +-
>  package/mesa3d/mesa3d.mk                      |  16 +--
>  9 files changed, 302 insertions(+), 172 deletions(-)
>  delete mode 100644 package/mesa3d/0006-fix-valist.patch
>  create mode 100644 package/mesa3d/0006-util-remove-needless-c99-compat-h-includes.patch
>  delete mode 100644 package/mesa3d/0007-fix-cpp-detection.patch
>  create mode 100644 package/mesa3d/0007-include-drop-c11-compat-h.patch
>  create mode 100644 package/mesa3d/0008-Fix-uClibc-build.patch

Thanks for the patch. However, it does a number of things that are not
explained in the commit log, and especially the removal of many DRI
drivers options. Could you explain what is going here? And also explain
why Config.in.legacy entries are not needed for these removed options?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
