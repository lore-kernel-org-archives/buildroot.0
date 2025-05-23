Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CB4C54ED0
	for <buildroot@archiver.kernel.org>; Fri, 23 May 2025 12:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0573F41770;
	Fri, 23 May 2025 12:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ay6ueTyN13on; Fri, 23 May 2025 12:15:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4189C40DA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4189C40DA8;
	Fri, 23 May 2025 12:15:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D940179
 for <buildroot@buildroot.org>; Fri, 23 May 2025 12:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F12980B10
 for <buildroot@buildroot.org>; Fri, 23 May 2025 12:15:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXAcZLeW3KEx for <buildroot@buildroot.org>;
 Fri, 23 May 2025 12:15:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2EE2380D00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EE2380D00
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2EE2380D00
 for <buildroot@buildroot.org>; Fri, 23 May 2025 12:15:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.115.30]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEFvj-1uAyeS4Bnx-00Cp25; Fri, 23
 May 2025 14:15:38 +0200
To: buildroot@buildroot.org
Date: Fri, 23 May 2025 14:15:19 +0200
Message-ID: <20250523121521.380704-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523121521.380704-1-fiona.klute@gmx.de>
References: <20250523121521.380704-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:mIjnQ7hF7yz9/I8cLh3qFAXc1YyVIdlDpwRnjotNEnHkzfz2hlW
 C0ILv5OlnKcCSp9no558o7LwGbjiQyzJsR0CChPm7PXhn7J6XpcoFkeOjo7uPZOeYyOzWMj
 ONirv5rS2XY7Jbsw0YflxipV4nJ0R9N8igeD9inN7Mr+oixuAwsEKwGaTwytGuAMDDxIAJq
 rF2Yfq6ATNQGuWrUyFxIg==
UI-OutboundReport: notjunk:1;M01:P0:HcO0x1l3wuw=;1/tuBwodIXIfb3xQy2euED6PqkC
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1748002538; x=1748607338; i=fiona.klute@gmx.de;
 bh=jn6GY11BIc7RXiz8S4tFto0oMWEP+fM7XW2ASbzNOs0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=VVaOLo6Gwsjr+7+p7TyUXVMLjXF9/ajjRCNwPOvYk9635Pw2ZGgIBq+mX/wJMoJh
 Lsi5sUvbwW3u0bfg7vKfi1RPsnp3I9R46DzHKc9wsr87gk9m1LgrhqD9gO4k142YI
 4kJnqRbsjPcldEOuQgaV9xpI6ltsDb7VldqvHQCfqPsW7GqIHwtLJyvrMmytxYuPa
 eihPRCLoCrDncFVjvBSzKFJFqCOiaiXGRIk0VHwuF0nOo82JmoglWLxqok2YMoqXC
 H93iBex4ss9dnSi9cQsMEEe7+zQhO4QJQVgo8f8swghkxu5IuE8eIV+Rc90puoG1D
 LD4Yh3Sp+bETG2CifA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=VVaOLo6G
Subject: [Buildroot] [PATCH v6 2/4] package/python-gobject: bump version to
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Upstream changelog:
https://gitlab.gnome.org/GNOME/pygobject/-/blob/3.52.3/NEWS?ref_type=tags

Patch updated to the version that applies to 3.52.3.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Change v4 -> v5: update patch together with version bump

 ...tor.get_map-look-up-file-objects-by-.patch | 27 ++++++++++---------
 package/python-gobject/python-gobject.hash    |  4 +--
 package/python-gobject/python-gobject.mk      |  6 ++---
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
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
