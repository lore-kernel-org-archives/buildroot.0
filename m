Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBC8C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 11:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9866580CCE;
	Sun, 11 Dec 2022 11:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9866580CCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mCAKg7tt_ciR; Sun, 11 Dec 2022 11:09:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8F4680C09;
	Sun, 11 Dec 2022 11:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8F4680C09
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A1951BF3C2
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 11:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12783801E8
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 11:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12783801E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QogwTFO3R1Ii for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 11:09:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 594038146A
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 594038146A
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 11:09:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4B34460009;
 Sun, 11 Dec 2022 11:09:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1p4KCj-008Aqb-0d; Sun, 11 Dec 2022 12:09:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 12:09:07 +0100
Message-Id: <20221211110908.1948270-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/xserver_xorg-server: add upstream
 security fixes for CVE-2022-355{0, 1}
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

- CVE-2022-3550: A vulnerability classified as critical was found in X.org
  Server.  Affected by this vulnerability is the function _GetCountedString
  of the file xkb/xkb.c.  The manipulation leads to buffer overflow.  It is
  recommended to apply a patch to fix this issue.  The associated identifier
  of this vulnerability is VDB-211051.

- CVE-2022-3551: A vulnerability, which was classified as problematic, has
  been found in X.org Server.  Affected by this issue is the function
  ProcXkbGetKbdByName of the file xkb/xkb.c.  The manipulation leads to
  memory leak.  It is recommended to apply a patch to fix this issue.  The
  identifier of this vulnerability is VDB-211052.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ntedString-against-request-length-at.patch | 35 +++++++++++
 ...possible-memleaks-in-XkbGetKbdByName.patch | 60 +++++++++++++++++++
 .../xserver_xorg-server.mk                    |  7 +++
 3 files changed, 102 insertions(+)
 create mode 100644 package/x11r7/xserver_xorg-server/0002-xkb-proof-GetCountedString-against-request-length-at.patch
 create mode 100644 package/x11r7/xserver_xorg-server/0003-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch

diff --git a/package/x11r7/xserver_xorg-server/0002-xkb-proof-GetCountedString-against-request-length-at.patch b/package/x11r7/xserver_xorg-server/0002-xkb-proof-GetCountedString-against-request-length-at.patch
new file mode 100644
index 0000000000..8c1869504c
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/0002-xkb-proof-GetCountedString-against-request-length-at.patch
@@ -0,0 +1,35 @@
+From 11beef0b7f1ed290348e45618e5fa0d2bffcb72e Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Tue, 5 Jul 2022 12:06:20 +1000
+Subject: [PATCH] xkb: proof GetCountedString against request length attacks
+
+GetCountedString did a check for the whole string to be within the
+request buffer but not for the initial 2 bytes that contain the length
+field. A swapped client could send a malformed request to trigger a
+swaps() on those bytes, writing into random memory.
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ xkb/xkb.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index f42f59ef3..1841cff26 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -5137,6 +5137,11 @@ _GetCountedString(char **wire_inout, ClientPtr client, char **str)
+     CARD16 len;
+ 
+     wire = *wire_inout;
++
++    if (client->req_len <
++        bytes_to_int32(wire + 2 - (char *) client->requestBuffer))
++        return BadValue;
++
+     len = *(CARD16 *) wire;
+     if (client->swapped) {
+         swaps(&len);
+-- 
+2.30.2
+
diff --git a/package/x11r7/xserver_xorg-server/0003-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch b/package/x11r7/xserver_xorg-server/0003-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
new file mode 100644
index 0000000000..39afec0988
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/0003-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
@@ -0,0 +1,60 @@
+From 18f91b950e22c2a342a4fbc55e9ddf7534a707d2 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Wed, 13 Jul 2022 11:23:09 +1000
+Subject: [PATCH] xkb: fix some possible memleaks in XkbGetKbdByName
+
+GetComponentByName returns an allocated string, so let's free that if we
+fail somewhere.
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ xkb/xkb.c | 26 ++++++++++++++++++++------
+ 1 file changed, 20 insertions(+), 6 deletions(-)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 4692895db..b79a269e3 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -5935,18 +5935,32 @@ ProcXkbGetKbdByName(ClientPtr client)
+     xkb = dev->key->xkbInfo->desc;
+     status = Success;
+     str = (unsigned char *) &stuff[1];
+-    if (GetComponentSpec(&str, TRUE, &status))  /* keymap, unsupported */
+-        return BadMatch;
++    {
++        char *keymap = GetComponentSpec(&str, TRUE, &status);  /* keymap, unsupported */
++        if (keymap) {
++            free(keymap);
++            return BadMatch;
++        }
++    }
+     names.keycodes = GetComponentSpec(&str, TRUE, &status);
+     names.types = GetComponentSpec(&str, TRUE, &status);
+     names.compat = GetComponentSpec(&str, TRUE, &status);
+     names.symbols = GetComponentSpec(&str, TRUE, &status);
+     names.geometry = GetComponentSpec(&str, TRUE, &status);
+-    if (status != Success)
++    if (status == Success) {
++        len = str - ((unsigned char *) stuff);
++        if ((XkbPaddedSize(len) / 4) != stuff->length)
++            status = BadLength;
++    }
++
++    if (status != Success) {
++        free(names.keycodes);
++        free(names.types);
++        free(names.compat);
++        free(names.symbols);
++        free(names.geometry);
+         return status;
+-    len = str - ((unsigned char *) stuff);
+-    if ((XkbPaddedSize(len) / 4) != stuff->length)
+-        return BadLength;
++    }
+ 
+     CHK_MASK_LEGAL(0x01, stuff->want, XkbGBN_AllComponentsMask);
+     CHK_MASK_LEGAL(0x02, stuff->need, XkbGBN_AllComponentsMask);
+-- 
+2.30.2
+
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 18ddd1cb07..8dba9f1ed0 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -11,6 +11,13 @@ XSERVER_XORG_SERVER_LICENSE = MIT
 XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
 XSERVER_XORG_SERVER_SELINUX_MODULES = xdg xserver
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
+
+# 0002-xkb-proof-GetCountedString-against-request-length-at.patch
+XSERVER_XORG_SERVER_IGNORE_CVES += CVE-2022-3550
+
+# 0003-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
+XSERVER_XORG_SERVER_IGNORE_CVES += CVE-2022-3551
+
 XSERVER_XORG_SERVER_DEPENDENCIES = \
 	xutil_util-macros \
 	xlib_libX11 \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
