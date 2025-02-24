Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B3BC021A4
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 11:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56150605DC;
	Mon, 24 Feb 2025 11:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJIpVL-aNta5; Mon, 24 Feb 2025 11:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 326AA60C14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 326AA60C14;
	Mon, 24 Feb 2025 11:48:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CBF14920
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 11:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACA5A40BDE
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 11:48:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qU2Uprmk-7kG for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 11:48:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B1B4440BEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1B4440BEB
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1B4440BEB
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 11:48:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.124.97]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7b2d-1tf4ov1qkn-001vzx; Mon, 24
 Feb 2025 12:48:00 +0100
To: buildroot@buildroot.org
Cc: Spenser Gilliland <spenser@gillilanding.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Mon, 24 Feb 2025 12:47:36 +0100
Message-ID: <20250224114736.1525367-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:YsaSAMhs0SshqD+yIVAtB4L1d+r0TRG7UeyKEzvTnNVy439Y7AB
 qLZKlOhk3LpPsJVQkpxMhm/38PPFe6g6xsAcrOe6vKLJZkAPHzeCyMZ9e+w9cwaAGsn6tOm
 9GjeKcwqcNgT+AXOl/zHR+kowcYxGf68dSeprLppvVSXMDbSdRgpF3K3uIa7e/mbqILIMbm
 8mq9Tj8Z8ktQsWa19S9Bg==
UI-OutboundReport: notjunk:1;M01:P0:eq6ew7JHSlo=;tG6zrIDzLfM09BSmjkWc9wgfQTD
 nFy/bKwv5Qrf7ypo1fZFJ0d9b2Uk5zbEMPDTTIAN2cIcK8p+z1wriggA+4Ro/0e9AFGiCsRxm
 IbA/r2DCKcscpFGQS8upbmTiE91jcgsvJVomdyGSlM9UyK8VEcMQFZLEy3KAsSo2P+qSBclDP
 IEFz7Jc+qmF8Wwa9/IBcS/k5dAaB7V780xpUBjKMVL1TBTOZRVUJPfHP5e7x/OST+aeW5oRpx
 8GwLobFTg3yjGLC201OP04B7KvtBkKKkkkHX4259xsyuTSoW9PJcJ6ObK+HiZ0U0szPQROgI8
 HIDjW5rc+/4C7BeiN5qlmxfmBGna4ztIZoCDpuz+v8yxx4wQObp15pgkZiDsMWKeRNV4Gyatx
 2nyqJ2aPx/BhftPHAIEE9xpqAGccluUIhq+UJ40ZBVNOpO7JVEzd92eQRFwFS+JNybe9M+lyP
 hLgfemwDqOKbZW6TdHtFw8ggzNxn6IjExzNwi4PSy1LzYesXvSQZDFA02iKfwEkour6i9XWDm
 XYsgon0k3yHbAhKcE6zp99Ie5lasYtrjYWMS6hTG5HtGSbpxAd7bi4C0CTwzmhyHtDNq2wQJk
 yR0SGZQErnokejS2wKoB9yGK0tmJvKMYovO6PQ61nB76f+ka5HQINgFHM9ZihKfBTl5B5bP0j
 kDAQTSfLb/mUvN7bjA+ktzvfFpP6HdTAl9zP2+T5+kW/GIulVcCh2AWw5Y9a/5/I7Ak72Dwcp
 61kQL+/QrqmcYjrSCQy1V+tH5y6m3jsCoiDJ2qEPbbY9dd0e8XhlOfOoKp/gseLQAgMkUN6X2
 ziq93chOGTUJA0jx2Ni3Oe61C8y0xJo2EvMikWzIUt1wrJbAGJfXHdzJDknVkvm05iFWQDGeM
 3z4VtR6QgmQOuW5Uzv/Pr5eu5OMArQsayqICM5S6rv13Rh8GlP+89qa4KqmPw/UV5ya5FyV+l
 JuEGAB6AUGuTW0aWYrJUX0GuJRhodGiWmbeuPWTY9bVeGy/Ktm1u7Q7yXlypmlES9u4gNs03N
 3EZJvlApHctei07aT813xEHI91/5Ye+0kP/JB5WYoYvjLqzzAc9J1WRxJtdX1yulkXstOvtRQ
 Px6GKthYK9z65rjfPlBkEuOzfb5CVavOYuY6MyfMKcKT1YK6LH1tVB0LcXDd5S3ZfK81+YhNN
 IRFHyInnH9RAIYkFmNwWhBEVPh0YgyKlgiKYRO9nJ6fuZeSNp7GI1gECkc6wU0uTmZgn1e3Bn
 t4CXgbAcniC2CETbQSPFvHhqO4MANoQ27W17pN/Qh5MpjDKsZlieqSiuB2iscuFDeZid+phHp
 yhVktKuM5mpUmDxOKre0ecYgBH9MR9svwGTeuTEFhjdvkhTLmPCsph7ge46e8QYbRLuJCqcnL
 uNqWpKJ5TrOoQyUwOUkmrkh3w+qUUtz0KjQfhCgWJMa88WlddT3gWhjBsc1v6fL4pv8pVeRyT
 tw0gjMg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1740397680; x=1741002480; i=fiona.klute@gmx.de;
 bh=F+S/GgjpzdpykoMQHsmIQJ7veAt0/MdzohrUEdyAx4Q=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=jR/Z6/2Y3cj98x3gBc3w15E03F+0jduZkQEhUYS93sjiYrg04sMmpYblBQhhYHa+
 T7QI96ZpyzRfgZnRWdRC//0eF6Kuxw01kCeb01/JxLJnGXoDaf6FIvhUj3H1WAtvu
 GxCPu4aER9eSdY5Z8KJ4qAXhwuwDjHBeCX6iaTLPJYtrWE0NWO9QK7AL1GdDILVwz
 XQ+8CnkM7JkOOMjWH/FSO9kVb1Gf8tC9TC3eiez+csOv6KecUsb4gfjWomkPUlxmf
 d7NWtoYlRRApwfvlQN0GmgwqUlJCu/iZ12pHJqSeJHUFGKxdT1R/nlPTMLyOPpfHz
 Tb4i3ZdogmcAVxufzQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=jR/Z6/2Y
Subject: [Buildroot] [PATCH v2 1/1] package/mesa3d-demos: fix build failure
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
80304d9911 "package/mesa3d-demos: bump version to 9.0.0".

[1] https://gitlab.freedesktop.org/mesa/demos/-/commit/813ebef7671f0e54d1b55be9e15ae5586b2b9eb1
[2] https://gitlab.freedesktop.org/mesa/demos/-/commit/5aaa7faeb4de9497535738830e6ebb8f10071877

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
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
