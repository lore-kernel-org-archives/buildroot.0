Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144D3C28B30
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 10:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9C1440CA6;
	Mon, 10 Mar 2025 10:54:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Yrm9m3WOL4u; Mon, 10 Mar 2025 10:54:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 790AC40CBD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 790AC40CBD;
	Mon, 10 Mar 2025 10:54:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BDCE5DC
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 10:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD45240CB1
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 10:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5KFw-ytR0Qys for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 10:54:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0046240CA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0046240CA6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0046240CA6
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 10:54:11 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.124.30]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCbEf-1u09cq3ACh-00Fizn; Mon, 10
 Mar 2025 11:54:07 +0100
To: buildroot@buildroot.org
Cc: Spenser Gilliland <spenser@gillilanding.com>,
 Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Mon, 10 Mar 2025 11:53:50 +0100
Message-ID: <20250310105350.2848707-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310105350.2848707-1-fiona.klute@gmx.de>
References: <20250310105350.2848707-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:HgtVMSDoQAcArtmobGWw+78DTTzEcvF0SjBBkMF858dwk8oOi8y
 7XTMQJISkK8hYCBfgi790Q//Bken7fN7lld2bIkc9fMnhdzlJsb4sfoytMmmb6G5N4S6c1B
 kBmeIVx0yk21KvN62aPffJU9NZCo4Ki3epzuffsiicrwpoZBT4lGK/Uq0C4ltd54HzRZ6ot
 TKCBD2pU8ad2GPUoCgjVA==
UI-OutboundReport: notjunk:1;M01:P0:wa8K2rtlSeE=;AV6fiaGZIPCDbvFTzapFXOAReZl
 /2y7jNf+D8T5lTK0ARZZWVXPPW+52dlQO8LnF8IhiYZZzGRk55i943XcpHfZUhrV4trebFaLp
 D8FPkb1sF9uU5T0W5QpmITs4fJR71rA9Io+Ve8Lqt3/RIG12YyBPp5Qb2d7bBRZki2SXoRtyg
 ym/HsT6+HgImOjg/PidN/k3NuJjbYt+DCJq2S4unmmq+sdAM26+bfrUe/3zjIdsGMX3a78SFV
 O0ufJH4yJ+MLmk0BIAORD4Jo58tmnTgssl389XBh8vgjL4fcuvQcWgfezTu6wNdS8Ge7Z4z3a
 ptjI2zrLAbsMq0JAm4SiBBstEh2RXvePViDrq9uQSUNoNIgtUfvi6pjnqZQ8hWOIRjXrEWx8o
 VC9kk/QMkHtutt+IyusI2nSTK8TV/XQCrAEIgtgBBYAXhPvNp7gIwjTvSNIifafdE/KigSiCX
 i7KN+dpD/cbVNtAhj1PfgInLyL2fclUf6Ie6CfejA26JJbX0dsKY8nGxcbWJ6H9/cXYYCULGP
 J3lPhm0ddhp+nhF45VXxuk7j8VdZDfUidr2Duce+Skj+6cHYvJ21IH2shNc50Y7rmeiNcNybo
 BixXeKkFJRUI6xajGHRasu1PXe16huice/PeV+U0RIim+2exrbMjQZYZ7htqxBbuXge0FCrPV
 elbaAxHDITng4qkDCEyEatq0joJU/7QvnzLNjCaqVYV/q5EQar7RQsDxrsltwgBHM493nTHTx
 5glYGD8faf5V65EXZCZmKQZjaNPBGZGEMpP+94Xy5n9mSfVKgjlJB6hmWHCnp2mQZ2fyN6/DJ
 GbWWUrVNiER7V6whFD1dK+o5x+pNfamTLJEAR3oDtFYbjsveVMvYGsJpAX5ug4YqmXExqNaXR
 VCs5vSNbexbibhyIESgRqypYcM/FZg66YD7BMs2ZF3+oBWD//qRbgv5a11Dp1emuAz5QI6x37
 5xNCXGTxFEWHcn5qk9Zvl3TLTLfibVKjHxCYf9QiBNsp4PHG2KGEiT84I8r5w6c3SjOjU6CKQ
 io0kT7rdBNB13pS5Ig6esclFgkAukmn4iRgfjhi9LoWM9meXnRM6icDq5YaD2BZgzR5D6oK3A
 05jlDNaI4mzKhHqGG/c65iSRSksN1SmImUUnHwnR7Z+eb36RRrzXXN7hnycsYHhwCHKDwhOrP
 uqxt+8GmlrTO0bF1NKLVq9PPWma6nf313815u9/zBbL3fVzJ8MCL4eEWJQMoNgnD8M/VKaUss
 bHW0xt+LhGBbmORMt0TAV/kxBOgumN1A29b/qDtBSBuiFLTXtAK3zFmGvKQN/mWdMji0/uXVj
 j91u6xufRs3EDzas4Qxs2AEOIvTMWfIjwJCelks1O5mv0X6EM7fBUYwm0zBOzSIDPtmoxxPbs
 5axH59TAuKLAVnP3gi/FXkMGpWpUDFJ5RyXHQOyYJd0txNpt13NUyv6tX4TjK//kC6UESm03f
 8WJlCGg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1741604047; x=1742208847; i=fiona.klute@gmx.de;
 bh=WoSAjYXbsJe842d1NnXG66IUzDqUPUaie4jg9uSNxis=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=gsmBdA5xKLzEuyCW1YFkvSUF/G9n4Axno3363/mqDlm522tapKCNmdaiMWU79osE
 +kF5lUQ5MxiBKXVhMgcby78nvFikFleM2vt2ppijT+BSOyChDL0/UKK0RIhKtKAoD
 K7tsCRLZhS4Ond1zmP4pK4wdsdvsYUyajpzjCMULzYoXZ/atKW4DL0bHQZ3X471Lu
 +yx2jtrbFsYXf0KoeoITVVxXWSH/P5sntCshcPZdTMXSsPpOK7weRIvkYcQe+46T3
 PCo2M81lI5y2q7BKNeryl0YgdOSJJFh5kEMDk8n1h6j4WqXgWN8mPT0hu4AxKfbgy
 2jHAtq5POVUUeURpYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=gsmBdA5x
Subject: [Buildroot] [PATCH v3 2/2] package/mesa3d-demos: fix build failure
 on musl
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Patch has been on upstream main for close to 2 years.

The "uint" use was introduced with [1] and [2], released with
mesa3d-demos 9.0.0 from March 2023, and added to Buildroot with commit
80304d9911 "package/mesa3d-demos: bump version to 9.0.0". The affected
code is built only if Wayland and Vulkan support are enabled, that is:

BR2_PACKAGE_LIBDECOR=y
BR2_PACKAGE_VULKAN_LOADER=y 
BR2_PACKAGE_WAYLAND=y

[1] https://gitlab.freedesktop.org/mesa/demos/-/commit/813ebef7671f0e54d1b55be9e15ae5586b2b9eb1
[2] https://gitlab.freedesktop.org/mesa/demos/-/commit/5aaa7faeb4de9497535738830e6ebb8f10071877

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v2 -> v3: Add note about config conditions for the bug to show

Changes v1 -> v2: Add details on when the bug was introduced into
mesa3d-demos and Buildroot to commit message.

 ...kan-wsi-use-unsigned-instead-of-uint.patch | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 package/mesa3d-demos/0003-vulkan-wsi-use-unsigned-instead-of-uint.patch

diff --git a/package/mesa3d-demos/0003-vulkan-wsi-use-unsigned-instead-of-uint.patch b/package/mesa3d-demos/0003-vulkan-wsi-use-unsigned-instead-of-uint.patch
new file mode 100644
index 0000000000..160dc9010d
--- /dev/null
+++ b/package/mesa3d-demos/0003-vulkan-wsi-use-unsigned-instead-of-uint.patch
@@ -0,0 +1,68 @@
+From 3f4d5ff34e061f3d47b9cf28bff2fc588d8c5326 Mon Sep 17 00:00:00 2001
+From: psykose <alice@ayaya.dev>
+Date: Thu, 23 Mar 2023 21:18:56 +0000
+Subject: [PATCH] vulkan/wsi: use unsigned instead of uint
+
+uint is not a standard type name and fails to build against musl libc
+
+Reviewed-by: Erik Faye-Lund <erik.faye-lund@collabora.com>
+Upstream: https://gitlab.freedesktop.org/mesa/demos/-/commit/3f4d5ff34e061f3d47b9cf28bff2fc588d8c5326
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
+---
+ src/vulkan/wsi/wayland.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/vulkan/wsi/wayland.c b/src/vulkan/wsi/wayland.c
+index 444d2bb81..5958d283a 100644
+--- a/src/vulkan/wsi/wayland.c
++++ b/src/vulkan/wsi/wayland.c
+@@ -128,7 +128,7 @@ dispatch_key(xkb_keycode_t xkb_key, enum wl_keyboard_key_state state)
+ }
+ 
+ static void
+-handle_key(uint key, enum wl_keyboard_key_state state)
++handle_key(unsigned key, enum wl_keyboard_key_state state)
+ {
+    xkb_keycode_t xkb_key = key + 8;
+    struct itimerspec timer = {0};
+@@ -151,15 +151,15 @@ handle_key(uint key, enum wl_keyboard_key_state state)
+ }
+ 
+ static void
+-key(void *data, struct wl_keyboard *keyboard, uint serial,
+-    uint time, uint key, enum wl_keyboard_key_state state)
++key(void *data, struct wl_keyboard *keyboard, unsigned serial,
++    unsigned time, unsigned key, enum wl_keyboard_key_state state)
+ {
+    handle_key(key, state);
+ }
+ 
+ static void
+-modifiers(void *data, struct wl_keyboard *keyboard, uint serial,
+-    uint mods_depressed, uint mods_latched, uint mods_locked, uint group)
++modifiers(void *data, struct wl_keyboard *keyboard, unsigned serial,
++    unsigned mods_depressed, unsigned mods_latched, unsigned mods_locked, unsigned group)
+ {
+    xkb_state_update_mask(keyboard_data.xkb_state, mods_depressed, mods_latched,
+                          mods_locked, 0, 0, group);
+@@ -184,7 +184,7 @@ keymap(void *data, struct wl_keyboard *keyboard,
+ }
+ 
+ static void
+-enter(void *data, struct wl_keyboard *keyboard, uint serial,
++enter(void *data, struct wl_keyboard *keyboard, unsigned serial,
+       struct wl_surface *surface, struct wl_array *keys)
+ {
+    uint32_t *key;
+@@ -194,7 +194,7 @@ enter(void *data, struct wl_keyboard *keyboard, uint serial,
+ }
+ 
+ static void
+-leave(void *data, struct wl_keyboard *keyboard, uint serial,
++leave(void *data, struct wl_keyboard *keyboard, unsigned serial,
+       struct wl_surface *surface)
+ {
+    struct itimerspec timer = {0};
+-- 
+GitLab
+
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
