Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480B4C636CB
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 21:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E013760E40;
	Sat, 28 Jan 2023 21:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E013760E40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nNV8o4w_ePD9; Sat, 28 Jan 2023 21:56:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A39960C12;
	Sat, 28 Jan 2023 21:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A39960C12
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD3C31BF3C0
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A389D410CB
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A389D410CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QJKhy91fb1tZ for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 21:56:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36506408D0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36506408D0
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 21:56:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3CA3FFF804;
 Sat, 28 Jan 2023 21:56:05 +0000 (UTC)
Date: Sat, 28 Jan 2023 22:56:04 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230128225604.08f6741b@windsurf>
In-Reply-To: <20230127223855.72359-1-fontaine.fabrice@gmail.com>
References: <20230127223855.72359-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674942965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qXyYcB8bRqgQRB58d+sNSuuk21unkPKp8OIIz2EOBRQ=;
 b=JrJGjFM1sKtwB/F4L8ugddWKZI69IhjuklblNxR3cRB/SHKBzCLmDZi3Dedxti2b57nMTc
 nkNAlHxPiANGZjqdAN3i7bGsLACsW1VzwT42WMHYFzsfIEa5jm/RidPbUKgzJBaFWEZFhY
 oSJ9fMON4zY/MomJRyZolaWjqFXar56VNAkRzfv0uInv23Yu065vucArIxHhi6ui7CxrIo
 J7K2jlK7fy7LFlu6Hhqmm1t1W9wBQLUjtahHIt35imB8UTkWIfEE4r0COprml9qpx5+QPY
 zmJeOvT8vi7+opDwJqazLCG7FciptfSkGr9puQZvvjdYcrra4XKrtugLLIs76w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JrJGjFM1
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2: security bump to version
 2.26.2
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
Cc: Michael Fischer <mf@go-sys.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 27 Jan 2023 23:38:55 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - Fix CVE-2022-4743: A potential memory leak issue was discovered in
>   SDL2 in GLES_CreateTexture() function in SDL_render_gles.c. The
>   vulnerability allows an attacker to cause a denial of service attack.
> 
> https://github.com/libsdl-org/SDL/releases/tag/release-2.26.0
> https://github.com/libsdl-org/SDL/releases/tag/release-2.26.1
> https://github.com/libsdl-org/SDL/releases/tag/release-2.26.2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...t-have-a-mode-configured-use-the-pre.patch | 76 -------------------
>  package/sdl2/sdl2.hash                        |  4 +-
>  package/sdl2/sdl2.mk                          |  2 +-
>  3 files changed, 3 insertions(+), 79 deletions(-)
>  delete mode 100644 package/sdl2/0001-If-a-CRTC-doesn-t-have-a-mode-configured-use-the-pre.patch

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
