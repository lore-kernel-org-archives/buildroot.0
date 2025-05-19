Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05CCC3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 12:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25F48410FF;
	Mon, 19 May 2025 12:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJA0X8NDe8X5; Mon, 19 May 2025 12:14:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0990941117
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0990941117;
	Mon, 19 May 2025 12:14:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ED98193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 12:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F62F410FF
 for <buildroot@buildroot.org>; Mon, 19 May 2025 12:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qsVoLzoByRAD for <buildroot@buildroot.org>;
 Mon, 19 May 2025 12:14:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 188E4410F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 188E4410F6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 188E4410F6
 for <buildroot@buildroot.org>; Mon, 19 May 2025 12:14:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.126.193]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1ML9uK-1uY6pi0FjW-00HjZw; Mon, 19
 May 2025 14:14:36 +0200
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 14:14:23 +0200
Message-ID: <20250519121425.1316837-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519121425.1316837-1-fiona.klute@gmx.de>
References: <20250519121425.1316837-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ydqY75SH5RasuhH4wqSY9CyaXJKL9utlww4w835BxxInwo0vq+M
 tsF7YnR+rPoNM9F8cAW+7yC0fF0W0NLPhERT3GIJZ0L7OR1q1d2B//FXSOxuIDO0RqINfQn
 q9wiAFzwjnmY17g81JAmA0lGWtMjPZVjfAS41xEChq8yd5yT2Sq6WmFpaBrlvfqRaIXl+Nt
 FsnHPjAHeQF5YBK6DvGog==
UI-OutboundReport: notjunk:1;M01:P0:eXZIoV8dFHg=;KzWhYmh951BWAdcaX8ylpIIzW0p
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1747656876; x=1748261676; i=fiona.klute@gmx.de;
 bh=jn6GY11BIc7RXiz8S4tFto0oMWEP+fM7XW2ASbzNOs0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=YPmaJsuJ3bssqV/h/DbtS67G9Q5bo1kI0+4djxsOyJu3V1LRYnVtdbfervgpFVbE
 /f8zo+D421BSXQSv5u9Ry8sabrqRUfOgJANRQ7kWkX3dv6VVLbRKNE03CFRkfYDpM
 BUlEew69rXFdKmumDk0J2ncXI6qNFce8Lbj6Lk5VcIZzjHbOwJoKqdZWAoJRYz0UN
 JYMnuIV6uTeOIulOWYgC3Jm5D5jK21xvjPampYcc95ko0S7ggzU8k2LmbeeLfUEH9
 o68hSpdlWg3flS1cwf+NTu411ckriaRFUX4vRW2FkpVTF0BOEAg2C207QbghOQ2Ey
 lTsZEmjMFxRUz/K/UQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=YPmaJsuJ
Subject: [Buildroot] [PATCH v5 2/4] package/python-gobject: bump version to
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
