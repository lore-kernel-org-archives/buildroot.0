Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114C2C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 21:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 896B34056C;
	Mon,  6 Feb 2023 21:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 896B34056C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25AtEb69strf; Mon,  6 Feb 2023 21:46:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC7A04052E;
	Mon,  6 Feb 2023 21:46:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC7A04052E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6C411BF2A4
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 725A64052E
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 725A64052E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QSSjOLAssJvG for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 21:46:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EAA040514
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EAA040514
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 21:46:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1B3841BF203;
 Mon,  6 Feb 2023 21:46:31 +0000 (UTC)
Date: Mon, 6 Feb 2023 22:46:30 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230206224630.72b8c2cc@windsurf>
In-Reply-To: <20220920200521.18064-1-ju.o@free.fr>
References: <20220920200521.18064-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675719992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W31AOHYWP2ZuzsbDmRh2LUOg1H6T0v0gOIbg47pcNdk=;
 b=I8zCZctJ+O55s8w9dgsRTjPx1272b46O9wRMa7nuspYueNkfkpoX6BKiru+y8g4yZp9Ehz
 kJdgaT5WdtLwY5wkK3yyT4RJtuKnF0Izd0JI5aO/0Ozu5vcyr2n/XvL+fFNKNMjWrxXmYd
 RopklpqaJwhlbJh3eUVWehpb3sgIDpcPepRDMhlCVRU9ZFuSjM2bPcGO9ASpbFZNRr974x
 30MBnjIv9bvUI07BFmrLBaX3vCH6FaGkzxOLiMMHCaAgT4VJZ49HciPGNv7qrVpcCwTXLy
 Yf9x696ap5vnolpxIJy4fFOZEhnEl3cCeIpkCwSfEjd1m7AQvPlLNgJbyhVTCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I8zCZctJ
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d-demos: bump version to
 8.5.0
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
Cc: Spenser Gilliland <spenser@gillilanding.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 20 Sep 2022 22:05:21 +0200
Julien Olivain <ju.o@free.fr> wrote:

> The package build system changed from autotools to meson. Autotools
> was deprecated in commit [1], which is included in this 8.5.0
> version. It was definitevely removed soon after, in commit [2].
> 
> The package patch file making libgl optional was fully rewritten
> for meson.
> 
> This patch also updates the old ftp _SITE url to the new https one,
> published in the project README.rst file. See [3].
> 
> This patch also removes openvg and freetype2 dependencies, as their
> support was removed in commit [4]. The 'gbm' option is removed, and
> the option 'libdrm' is added.
> 
> The md5 and sha1 entries in hash files are also removed, to keep only
> sha256 and sha512 from the release announce email [5].
> 
> For change log, see the release announce [5].
> 
> [1] https://gitlab.freedesktop.org/mesa/demos/-/commit/2df8e9710834c3b42ce5cfb67b7662c110ab904e
> [2] https://gitlab.freedesktop.org/mesa/demos/-/commit/abfead37587f1f2e124bdfcde755b6e90421b538
> [3] https://gitlab.freedesktop.org/mesa/demos/-/blob/mesa-demos-8.5.0/README.rst
> [4] https://gitlab.freedesktop.org/mesa/demos/-/commit/e6d0d9a8682c544870fd41983ea2e0484b9767b1
> [5] https://lists.freedesktop.org/archives/mesa-announce/2022-May/000677.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  ...s-makes-opengl-an-optional-component.patch | 157 ++++++++++--------
>  package/mesa3d-demos/mesa3d-demos.hash        |   8 +-
>  package/mesa3d-demos/mesa3d-demos.mk          |  56 +++----
>  3 files changed, 112 insertions(+), 109 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
