Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AA2C71143
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 317CA61665;
	Thu, 12 Jun 2025 08:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vNdnhnzHT7OS; Thu, 12 Jun 2025 08:40:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94A1E61023
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94A1E61023;
	Thu, 12 Jun 2025 08:40:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 52C351BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDC044217F
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YUDy1OJzVVOT for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07FA0405C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07FA0405C6
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 057EE80FF9; Thu, 12 Jun 2025 08:38:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 30 May 2025 21:42:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3866fb3bedfe8d895d7ff6bc02c7a1fffb24daf7
X-Git-Newrev: 43fe686bd28f8683fafdfce80fc6a23ccab10072
X-Patchwork-Hint: ignore
Message-Id: <20250612083831.057EE80FF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gobject: bump version to
 3.52.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=43fe686bd28f8683fafdfce80fc6a23ccab10072
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream changelog:
https://gitlab.gnome.org/GNOME/pygobject/-/blob/3.52.3/NEWS?ref_type=tags

Patch updated to the version that applies to 3.52.3.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Selector.get_map-look-up-file-objects-by-.patch | 27 +++++++++++-----------
 package/python-gobject/python-gobject.hash         |  4 ++--
 package/python-gobject/python-gobject.mk           |  6 ++---
 3 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/package/python-gobject/0001-gi.events._Selector.get_map-look-up-file-objects-by-.patch b/package/python-gobject/0001-gi.events._Selector.get_map-look-up-file-objects-by-.patch
index baed785aa5..a275abd9c7 100644
--- a/package/python-gobject/0001-gi.events._Selector.get_map-look-up-file-objects-by-.patch
+++ b/package/python-gobject/0001-gi.events._Selector.get_map-look-up-file-objects-by-.patch
@@ -1,4 +1,4 @@
-From 3bb03bc5d095cf51c8605521fcc2ce8cad36995f Mon Sep 17 00:00:00 2001
+From 4b97688d527276fc1e835fed71dbb73bbd09ac11 Mon Sep 17 00:00:00 2001
 From: Fiona Klute <fiona.klute@gmx.de>
 Date: Tue, 25 Mar 2025 13:29:04 +0100
 Subject: [PATCH] gi.events._Selector.get_map(): look up file objects by file
@@ -9,15 +9,16 @@ equivalent for lookup, or one may incorrectly be treated as not
 registered when the other was used for the registration, leading to
 bugs.
 
+Fixes: #689
 Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
-Upstream: https://gitlab.gnome.org/GNOME/pygobject/-/commit/3bb03bc5d095cf51c8605521fcc2ce8cad36995f
+Upstream: https://gitlab.gnome.org/GNOME/pygobject/-/commit/4b97688d527276fc1e835fed71dbb73bbd09ac11
 ---
  gi/events.py         | 36 +++++++++++++++++++++-----
  tests/test_events.py | 61 ++++++++++++++++++++++++++++++++++++++++++++
  2 files changed, 90 insertions(+), 7 deletions(-)
 
 diff --git a/gi/events.py b/gi/events.py
-index 9f00059ec..980cae0fe 100644
+index da4775dc..9eba1629 100644
 --- a/gi/events.py
 +++ b/gi/events.py
 @@ -28,6 +28,7 @@ import threading
@@ -28,7 +29,7 @@ index 9f00059ec..980cae0fe 100644
  from contextlib import contextmanager
  from . import _ossighelper
  
-@@ -381,9 +382,33 @@ if sys.platform != 'win32':
+@@ -508,9 +509,33 @@ if sys.platform != 'win32':
          # Subclass to attach _tag
          pass
  
@@ -62,7 +63,7 @@ index 9f00059ec..980cae0fe 100644
          def attach(self):
              self._source.attach(self._loop._context)
  
-@@ -432,15 +457,12 @@ if sys.platform != 'win32':
+@@ -559,15 +584,12 @@ if sys.platform != 'win32':
          # We could override modify, but it is only slightly when the "events" change.
  
          def get_key(self, fileobj):
@@ -83,21 +84,21 @@ index 9f00059ec..980cae0fe 100644
  
  else:
 diff --git a/tests/test_events.py b/tests/test_events.py
-index 81409abae..c075af095 100644
+index a6585468..9dbf3827 100644
 --- a/tests/test_events.py
 +++ b/tests/test_events.py
-@@ -45,6 +45,7 @@ import sys
+@@ -46,6 +46,7 @@ import sys
  import gi
  import gi.events
  import asyncio
 +import socket
  import threading
- from gi.repository import GLib
+ from gi.repository import GLib, Gio
  
-@@ -262,3 +263,63 @@ class GLibEventLoopPolicyTests(unittest.TestCase):
-         GLib.MainLoop().run()
- 
-         loop.close()
+@@ -344,3 +345,63 @@ class GLibEventLoopPolicyTests(unittest.TestCase):
+         self.assertEqual(order, [GLib.PRIORITY_HIGH] * 3 +
+                                 [GLib.PRIORITY_DEFAULT] * 3 +
+                                 [GLib.PRIORITY_DEFAULT_IDLE] * 3)
 +
 +    @unittest.skipIf(sys.platform == 'win32', 'add reader/writer not implemented')
 +    def test_source_fileobj_fd(self):
@@ -159,5 +160,5 @@ index 81409abae..c075af095 100644
 +        loop.run_until_complete(run())
 +        loop.close()
 -- 
-GitLab
+2.49.0
 
diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index 1dbd40d038..e49c7ddd08 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from https://download.gnome.org/sources/pygobject/3.50/pygobject-3.50.0.sha256sum
-sha256  8d836e75b5a881d457ee1622cae4a32bcdba28a0ba562193adb3bbb472472212  pygobject-3.50.0.tar.xz
+# from https://download.gnome.org/sources/pygobject/3.52/pygobject-3.52.3.sha256sum
+sha256  00e427d291e957462a8fad659a9f9c8be776ff82a8b76bdf402f1eaeec086d82  pygobject-3.52.3.tar.gz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index 001f355844..3021937887 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOBJECT_VERSION_MAJOR = 3.50
-PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).0
-PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.xz
+PYTHON_GOBJECT_VERSION_MAJOR = 3.52
+PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).3
+PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.gz
 PYTHON_GOBJECT_SITE = https://download.gnome.org/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
 PYTHON_GOBJECT_LICENSE = LGPL-2.1+
 PYTHON_GOBJECT_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
