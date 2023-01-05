Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495C7C64ED9
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB01482372;
	Mon, 20 Feb 2023 23:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB01482372
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c_9qPxl3fr7U; Mon, 20 Feb 2023 23:06:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A640D82865;
	Mon, 20 Feb 2023 23:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A640D82865
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0AA011BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FF2E414F1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FF2E414F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BWmo81Y2sQot for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6838C41717
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6838C41717
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64B0D86495; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Jan 2023 10:21:38 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2b249eca85819761140f670cc52dcf8fb09ef5b3
X-Git-Newrev: 60b4b04dc23d32641981df984f383c1bb3078f8c
X-Patchwork-Hint: ignore
Message-Id: <20230220205226.64B0D86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/x11r7/xserver_xorg-server: bump version to 21.1.6
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=60b4b04dc23d32641981df984f383c1bb3078f8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes a regression in XTestSwapFakeInput() introduced in the fix for
CVE-2022-46340 in 21.1.5.

Removed patches included in upstream release.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Peter: mention regression fix]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...etCountedString-against-request-length-at.patch | 35 -------------
 ...some-possible-memleaks-in-XkbGetKbdByName.patch | 60 ----------------------
 .../xserver_xorg-server/xserver_xorg-server.hash   |  6 +--
 .../xserver_xorg-server/xserver_xorg-server.mk     |  8 +--
 4 files changed, 4 insertions(+), 105 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/0002-xkb-proof-GetCountedString-against-request-length-at.patch b/package/x11r7/xserver_xorg-server/0002-xkb-proof-GetCountedString-against-request-length-at.patch
deleted file mode 100644
index 8c1869504c..0000000000
--- a/package/x11r7/xserver_xorg-server/0002-xkb-proof-GetCountedString-against-request-length-at.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 11beef0b7f1ed290348e45618e5fa0d2bffcb72e Mon Sep 17 00:00:00 2001
-From: Peter Hutterer <peter.hutterer@who-t.net>
-Date: Tue, 5 Jul 2022 12:06:20 +1000
-Subject: [PATCH] xkb: proof GetCountedString against request length attacks
-
-GetCountedString did a check for the whole string to be within the
-request buffer but not for the initial 2 bytes that contain the length
-field. A swapped client could send a malformed request to trigger a
-swaps() on those bytes, writing into random memory.
-
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- xkb/xkb.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/xkb/xkb.c b/xkb/xkb.c
-index f42f59ef3..1841cff26 100644
---- a/xkb/xkb.c
-+++ b/xkb/xkb.c
-@@ -5137,6 +5137,11 @@ _GetCountedString(char **wire_inout, ClientPtr client, char **str)
-     CARD16 len;
- 
-     wire = *wire_inout;
-+
-+    if (client->req_len <
-+        bytes_to_int32(wire + 2 - (char *) client->requestBuffer))
-+        return BadValue;
-+
-     len = *(CARD16 *) wire;
-     if (client->swapped) {
-         swaps(&len);
--- 
-2.30.2
-
diff --git a/package/x11r7/xserver_xorg-server/0003-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch b/package/x11r7/xserver_xorg-server/0003-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
deleted file mode 100644
index 39afec0988..0000000000
--- a/package/x11r7/xserver_xorg-server/0003-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 18f91b950e22c2a342a4fbc55e9ddf7534a707d2 Mon Sep 17 00:00:00 2001
-From: Peter Hutterer <peter.hutterer@who-t.net>
-Date: Wed, 13 Jul 2022 11:23:09 +1000
-Subject: [PATCH] xkb: fix some possible memleaks in XkbGetKbdByName
-
-GetComponentByName returns an allocated string, so let's free that if we
-fail somewhere.
-
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- xkb/xkb.c | 26 ++++++++++++++++++++------
- 1 file changed, 20 insertions(+), 6 deletions(-)
-
-diff --git a/xkb/xkb.c b/xkb/xkb.c
-index 4692895db..b79a269e3 100644
---- a/xkb/xkb.c
-+++ b/xkb/xkb.c
-@@ -5935,18 +5935,32 @@ ProcXkbGetKbdByName(ClientPtr client)
-     xkb = dev->key->xkbInfo->desc;
-     status = Success;
-     str = (unsigned char *) &stuff[1];
--    if (GetComponentSpec(&str, TRUE, &status))  /* keymap, unsupported */
--        return BadMatch;
-+    {
-+        char *keymap = GetComponentSpec(&str, TRUE, &status);  /* keymap, unsupported */
-+        if (keymap) {
-+            free(keymap);
-+            return BadMatch;
-+        }
-+    }
-     names.keycodes = GetComponentSpec(&str, TRUE, &status);
-     names.types = GetComponentSpec(&str, TRUE, &status);
-     names.compat = GetComponentSpec(&str, TRUE, &status);
-     names.symbols = GetComponentSpec(&str, TRUE, &status);
-     names.geometry = GetComponentSpec(&str, TRUE, &status);
--    if (status != Success)
-+    if (status == Success) {
-+        len = str - ((unsigned char *) stuff);
-+        if ((XkbPaddedSize(len) / 4) != stuff->length)
-+            status = BadLength;
-+    }
-+
-+    if (status != Success) {
-+        free(names.keycodes);
-+        free(names.types);
-+        free(names.compat);
-+        free(names.symbols);
-+        free(names.geometry);
-         return status;
--    len = str - ((unsigned char *) stuff);
--    if ((XkbPaddedSize(len) / 4) != stuff->length)
--        return BadLength;
-+    }
- 
-     CHK_MASK_LEGAL(0x01, stuff->want, XkbGBN_AllComponentsMask);
-     CHK_MASK_LEGAL(0x02, stuff->need, XkbGBN_AllComponentsMask);
--- 
-2.30.2
-
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 654552c8b6..0c3c807ff3 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003303.html
-sha256  05b0c8301cee7c5a78083df421ba3a071891553541a417b3d85adf5cf20f8720  xorg-server-21.1.5.tar.xz
-sha512  a39c6ba36f94241d330b679a9a6fe2c5fda73fc3f5a9308a7a9cfd0d58503e407291759c9e553455c07cf5a3862952ae3904334eeca29c97ff5af7cffd2e6953  xorg-server-21.1.5.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-December/003310.html
+sha256  1eb86ed674d042b6c8b1f9135e59395cbbca35ed551b122f73a7d8bb3bb22484  xorg-server-21.1.6.tar.xz
+sha512  5e3cf879facf3a04aa64b7f6129226ea68a97109a7daca5146b57b4c707cc76a4fbad1924997dd319efd8c8c20eb5bb59570a719101b76ae07e923b7e9656239  xorg-server-21.1.6.tar.xz
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 16b7438ee6..04eb5e90b7 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.5
+XSERVER_XORG_SERVER_VERSION = 21.1.6
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
@@ -12,12 +12,6 @@ XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
 XSERVER_XORG_SERVER_SELINUX_MODULES = xdg xserver
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
 
-# 0002-xkb-proof-GetCountedString-against-request-length-at.patch
-XSERVER_XORG_SERVER_IGNORE_CVES += CVE-2022-3550
-
-# 0003-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
-XSERVER_XORG_SERVER_IGNORE_CVES += CVE-2022-3551
-
 XSERVER_XORG_SERVER_DEPENDENCIES = \
 	xutil_util-macros \
 	xlib_libX11 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
