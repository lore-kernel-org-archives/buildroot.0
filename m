Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A58DC5DF89
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1B6281566;
	Fri, 21 Aug 2026 15:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2RwRZVwiwlb; Fri, 21 Aug 2026 15:08:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324912;
	bh=U+9ubapqgxfPjjas0fm/o8iQ7GaiBvAu4L6Pe6SAGtg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kCWaJI/SLmwfcgq7fHdz5pgcGpIreNADsfyovHS7h9bAwwt7Cp5SHiogH9gl6Fxvf
	 hUOQeXMNy3SY4Vu/RhgeKiIOuVDSVswIwYqy24IHcm6UgZWiCImkyErxIEVmTeYlNb
	 oVyrkw8daaqDlCjBTb7fUPKmXj6NIPYUVGZ/5BNtzYWQBqAY4RyBH9TxChyMEPP/kr
	 5n54h8AFwSXCcGxJ2tIax1toZZ8sEqa4Zk/luWYZWCPYLDU8o/kAI5w7jsp8mw6FtH
	 c7wet0C6Ut52p4ga/G20zwCWohBpvgO1XyxThCP+C+xuJdfXLzLYfnSlV3YklOs76C
	 CCM/jW4niceSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F150581567;
	Fri, 21 Aug 2026 15:08:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1904329B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B10840026
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5GsoH8ekMbt5 for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE2294042F
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D95D8E0EC; Fri, 21 Aug 2026 15:06:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:04:28 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: da203b8b8fa2fd6eaccd6db440384d82c12002a9
X-Git-Newrev: f627aa27f79ad4b7321a1ccb3b98d0ae4c43ebce
X-Patchwork-Hint: ignore
Message-Id: <20260821150615.5D95D8E0EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wpa_supplicant:
 security bump to 2.12
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f627aa27f79ad4b7321a1ccb3b98d0ae4c43ebce
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See here for a Changelog:
https://git.w1.fi/cgit/hostap/tree/wpa_supplicant/ChangeLog?id=e6386389448a4e0ec568fa7a27026e03f95bb768

Security issues fixed in this release:
https://w1.fi/security/2026-4/incomplete-bounds-checking-of-mesh-ampe-messages-in-wpa_supplicant.txt
https://w1.fi/security/2026-3/unexpected-sae-commit-message-contents-terminating-wpa_suppliant.txt
https://w1.fi/security/2026-2/missing-network-context-validation-for-pmksa-caching.txt
https://w1.fi/security/2026-1/missing-ml-parsing-validation.txt

Patches 0001 and 0002 are upstream.

Tested on Raspberry PI4 (64 Bit).

License changed:
-Copyright (c) 2002-2024, Jouni Malinen <j@w1.fi> and contributors
+Copyright (c) 2002-2026, Jouni Malinen <j@w1.fi> and contributors

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9ec3435c0add9c5fc8310fa65f40b076aa121609)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...-authorization-completed-on-driver-indica.patch | 55 ----------------------
 ...x-Hardware-offload-requires-Linux-headers.patch | 53 ---------------------
 package/wpa_supplicant/wpa_supplicant.hash         |  4 +-
 package/wpa_supplicant/wpa_supplicant.mk           |  2 +-
 4 files changed, 3 insertions(+), 111 deletions(-)

diff --git a/package/wpa_supplicant/0001-Revert-Mark-authorization-completed-on-driver-indica.patch b/package/wpa_supplicant/0001-Revert-Mark-authorization-completed-on-driver-indica.patch
deleted file mode 100644
index 89954eb7c5..0000000000
--- a/package/wpa_supplicant/0001-Revert-Mark-authorization-completed-on-driver-indica.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 170d8a433308ee39f87af94acaef461f8e80b67b Mon Sep 17 00:00:00 2001
-From: Janne Grunau <janne-fdr@jannau.net>
-Date: Sun, 4 Aug 2024 13:24:42 +0200
-Subject: [PATCH] Revert "Mark authorization completed on driver indication during 4-way HS offload"
-
-This reverts commit 41638606054a09867fe3f9a2b5523aa4678cbfa5.
-
-Signed-off-by: Janne Grunau <janne-fdr@jannau.net>
-Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
-
-Upstream: not yet sent, ongoing discussion http://lists.infradead.org/pipermail/hostap/2024-August/042893.html
-
----
- wpa_supplicant/events.c | 25 ++++++++-----------------
- 1 file changed, 8 insertions(+), 17 deletions(-)
-
-diff --git a/wpa_supplicant/events.c b/wpa_supplicant/events.c
-index 49917f7aa..bbb3a3eda 100644
---- a/wpa_supplicant/events.c
-+++ b/wpa_supplicant/events.c
-@@ -4327,23 +4327,14 @@ static void wpa_supplicant_event_assoc(struct wpa_supplicant *wpa_s,
- 		eapol_sm_notify_eap_success(wpa_s->eapol, true);
- 	} else if ((wpa_s->drv_flags & WPA_DRIVER_FLAGS_4WAY_HANDSHAKE_PSK) &&
- 		   wpa_key_mgmt_wpa_psk(wpa_s->key_mgmt)) {
--		if (already_authorized) {
--			/*
--			 * We are done; the driver will take care of RSN 4-way
--			 * handshake.
--			 */
--			wpa_supplicant_cancel_auth_timeout(wpa_s);
--			wpa_supplicant_set_state(wpa_s, WPA_COMPLETED);
--			eapol_sm_notify_portValid(wpa_s->eapol, true);
--			eapol_sm_notify_eap_success(wpa_s->eapol, true);
--		} else {
--			/* Update port, WPA_COMPLETED state from the
--			 * EVENT_PORT_AUTHORIZED handler when the driver is done
--			 * with the 4-way handshake.
--			 */
--			wpa_msg(wpa_s, MSG_DEBUG,
--				"ASSOC INFO: wait for driver port authorized indication");
--		}
-+		/*
-+		 * We are done; the driver will take care of RSN 4-way
-+		 * handshake.
-+		 */
-+		wpa_supplicant_cancel_auth_timeout(wpa_s);
-+		wpa_supplicant_set_state(wpa_s, WPA_COMPLETED);
-+		eapol_sm_notify_portValid(wpa_s->eapol, true);
-+		eapol_sm_notify_eap_success(wpa_s->eapol, true);
- 	} else if ((wpa_s->drv_flags & WPA_DRIVER_FLAGS_4WAY_HANDSHAKE_8021X) &&
- 		   wpa_key_mgmt_wpa_ieee8021x(wpa_s->key_mgmt)) {
- 		/*
--- 
-2.45.2
-
diff --git a/package/wpa_supplicant/0002-macsec_linux-Hardware-offload-requires-Linux-headers.patch b/package/wpa_supplicant/0002-macsec_linux-Hardware-offload-requires-Linux-headers.patch
deleted file mode 100644
index 7330319d06..0000000000
--- a/package/wpa_supplicant/0002-macsec_linux-Hardware-offload-requires-Linux-headers.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 809d9d8172db8e2a08ff639875f838b5b86d2641 Mon Sep 17 00:00:00 2001
-From: Sergey Matyukevich <geomatsi@gmail.com>
-Date: Thu, 22 Aug 2024 00:03:41 +0300
-Subject: [PATCH] macsec_linux: Hardware offload requires Linux headers >= v5.7
-
-Hardware offload in Linux macsec driver is enabled in compile time if
-libnl version is >= v3.6. This is not sufficient for successful build
-since enum 'macsec_offload' has been added to Linux header if_link.h
-in kernels v5.6 and v5.7, see commits:
-- https://github.com/torvalds/linux/commit/21114b7feec29e4425a3ac48a037569c016a46c8
-- https://github.com/torvalds/linux/commit/76564261a7db80c5f5c624e0122a28787f266bdf
-
-New libnl with older Linux headers is a valid combination. This is how
-hostapd build failure has been detected by Buildroot autobuilder, see:
-- http://autobuild.buildroot.net/results/b59d5bc5bd17683a3a1e3577c40c802e81911f84/
-
-Extend compile time condition for the enablement of the macsec hardware
-offload adding Linux headers version check.
-
-Fixes: 40c139664439 ("macsec_linux: Add support for MACsec hardware offload")
-Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
-
-Upstream: https://w1.fi/cgit/hostap/commit/?id=809d9d8172db8e2a08ff639875f838b5b86d2641
-
----
- src/drivers/driver_macsec_linux.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/drivers/driver_macsec_linux.c b/src/drivers/driver_macsec_linux.c
-index c86715498..fad47a292 100644
---- a/src/drivers/driver_macsec_linux.c
-+++ b/src/drivers/driver_macsec_linux.c
-@@ -19,6 +19,7 @@
- #include <netlink/route/link.h>
- #include <netlink/route/link/macsec.h>
- #include <linux/if_macsec.h>
-+#include <linux/version.h>
- #include <inttypes.h>
- 
- #include "utils/common.h"
-@@ -32,7 +33,8 @@
- 
- #define UNUSED_SCI 0xffffffffffffffff
- 
--#if LIBNL_VER_NUM >= LIBNL_VER(3, 6)
-+#if (LIBNL_VER_NUM >= LIBNL_VER(3, 6) && \
-+     LINUX_VERSION_CODE >= KERNEL_VERSION(5, 7, 0))
- #define LIBNL_HAS_OFFLOAD
- #endif
- 
--- 
-2.46.0
-
diff --git a/package/wpa_supplicant/wpa_supplicant.hash b/package/wpa_supplicant/wpa_supplicant.hash
index 2f38dc257a..bea1e99b1f 100644
--- a/package/wpa_supplicant/wpa_supplicant.hash
+++ b/package/wpa_supplicant/wpa_supplicant.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  912ea06f74e30a8e36fbb68064d6cdff218d8d591db0fc5d75dee6c81ac7fc0a  wpa_supplicant-2.11.tar.gz
-sha256  f1b5992bbdd015c3ccb7faaadd62ef58ed821e15b9329bf2ceb27511ccc3f562  README
+sha256  08e23937e16d0155e55cab2b51f51fbe10d80a1aa91c4e15442645059b737ef6  wpa_supplicant-2.12.tar.gz
+sha256  83be1b142c59ccf0d6c5dde0695d8f84dfba109bea058e78ec2942389ccf327f  README
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 44cfed495b..5a4a0a2f26 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPA_SUPPLICANT_VERSION = 2.11
+WPA_SUPPLICANT_VERSION = 2.12
 WPA_SUPPLICANT_SITE = http://w1.fi/releases
 WPA_SUPPLICANT_LICENSE = BSD-3-Clause
 WPA_SUPPLICANT_LICENSE_FILES = README
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
