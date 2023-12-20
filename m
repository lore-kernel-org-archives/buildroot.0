Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC3DC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 22:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5767F610A8;
	Wed, 20 Dec 2023 22:07:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5767F610A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Aqx4gUncPf_s; Wed, 20 Dec 2023 22:07:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 903B561098;
	Wed, 20 Dec 2023 22:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 903B561098
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C117C1BF471
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 22:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98DB961098
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 22:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98DB961098
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C0ouIgImKKND for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 22:07:09 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EE34610A2
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 22:07:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EE34610A2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41FE6E0007;
 Wed, 20 Dec 2023 22:07:06 +0000 (UTC)
Date: Wed, 20 Dec 2023 23:07:05 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231220230705.0385be25@windsurf>
In-Reply-To: <20231218194001.544887-3-adam.duskett@amarulasolutions.com>
References: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
 <20231218194001.544887-3-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703110026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7N2WwSAM4OYihi5j6wCzE9EU/ZX1JQoa1Tb2dWWHTuU=;
 b=nVPhGotWNBp0Esb8Aw7p5eP/evrxfGtIaQFZcHhZXtsg0PyLdd5/Crb3hYzgvuIg35jTVx
 6TWgMAUgOFDKBJzRO57ws38Wrdu06JKeX8j7C0EreX2j9qy6g2VAwfEArenNBvcBtMAnhR
 iUg4NkQTGLSlboEZuc9nMmaLzHTv6+NCcwOhhgM4Y798XMZnnkdKmni/AMqS6cRASgMXTS
 bvuZCe2Ab4DhPhlMSbtfXWWe6CuVHHusW7rXXi0RtP+4ypoUUYUEXcFKT5wrS3deCW1c5X
 fQQ+t+S3EOuNd7OZG3Jo/AmHavombXg9PAScS5skZSrdFIV6sAWjWUXuw4Mh1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nVPhGotW
Subject: Re: [Buildroot] [PATCH v2 03/14] package/dmenu-wayland: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 18 Dec 2023 12:39:48 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> This package is an alternative to dmenu for X. Sway uses it by default as its
> menu bar.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
> v1 -> v2:
>   - ln -sf dmenu-wl $(TARGET_DIR)/usr/bin/dmenu (Thomas)
>   - v1 -> v2: Fix the sha256sum of LICENSE

I wanted to apply this, but unfortunately, it doesn't build:

Program /usr/bin/wayland-scanner found: NO

output/build/dmenu-wayland-a380201dff5bfac2dace553d7eaedb6cea6855f9/meson.build:30:22: ERROR: Program '/usr/bin/wayland-scanner' not found or not executable

I've quickly tried to find a way to feed the path to wayland-scanner,
but I haven't found. It's looking for it using pkg-config, but our
pkg-config doesn't return the path to our wayland-scanner.

Also, I did some adjustements in your patch:

1. Clean up the comments on the dependencies in the Config.in file, to
list only the first-order dependencies, but all of them

+       bool "dmenu-wayland"
+       depends on BR2_USE_MMU # pango, libglib2
+       depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango
+       depends on BR2_TOOLCHAIN_HAS_THREADS # pango, libglib2, wayland
+       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango
+       depends on !BR2_STATIC_LIBS # wayland
+       depends on BR2_INSTALL_LIBSTDCPP # pango
+       depends on BR2_USE_WCHAR # pango, libglib2

2. Use the github macro

+DMENU_WAYLAND_VERSION = a380201dff5bfac2dace553d7eaedb6cea6855f9
+DMENU_WAYLAND_SITE = $(call github,nyyManni,dmenu-wayland,$(DMENU_WAYLAND_VERSION))

Could you fix (1) and (2) in your patch series, and address the
wayland-scanner issue?

This kind of issue can be detected prior to submitting a patch series
by doing a build in a clean container.

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
