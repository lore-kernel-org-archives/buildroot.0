Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9527C3601E
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 13:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F37F813CB;
	Thu, 10 Apr 2025 13:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NuOliiVpy25X; Thu, 10 Apr 2025 13:49:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EB01802EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EB01802EB;
	Thu, 10 Apr 2025 13:49:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D7D8C193
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 13:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7D3C41ED8
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 13:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ohgG5_RiMHBq for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 13:49:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4A3C941EC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A3C941EC5
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A3C941EC5
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 13:49:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.125.230]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mr9Fs-1tEjwd0lvi-00gO81; Thu, 10
 Apr 2025 15:49:37 +0200
To: buildroot@buildroot.org
Date: Thu, 10 Apr 2025 15:49:12 +0200
Message-ID: <20250410134914.916804-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410134914.916804-1-fiona.klute@gmx.de>
References: <20250410134914.916804-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:v1iViOb/rlTHRL48GUewUojD/4CL4zc7hcPU60pHhdlFH1QQ7/h
 VAhlqaGfUp57QGDngnfphrBe6W4EEzN4blI6rUWPewy9kwg7BLv64C1mzb8CXMlrLaV1eat
 43rB8z8kK4k3rIBoj9jNLLeD1dcLeW1IZKakguiH0J5S4X4aKC9zE9ektrmb8M0KcvjXxhN
 zZeWBmyqomxDaOsYBxdSQ==
UI-OutboundReport: notjunk:1;M01:P0:zF63NURcyJI=;uHPZQ2Wgn79gnlZbI+H0RKUzd/8
 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
 O/iG1qc/l1kCmR4lfiy0wuZC3u72W6cPSF
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1744292977; x=1744897777; i=fiona.klute@gmx.de;
 bh=ZiIXU2JsOzU3M14ErTvAJsrMIObu2x7WLOFRTXFLw6w=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=nVjn6pJaPGh0ZxYRCbvuFyrOHqqlWAF5nFBiywf8a3TcKwMw3xbfIL5Fmdh30rFv
 63+oZgInyASfhamlrK/DyD/Im+NU8kSYK+JRyGQfOlX212i2GJDskD6asoqOgt5fF
 On5fYkh7Bl5PmMbLnBBrCUCmgagSgGHM0hoL5y1HfAaxHi5PKCx/sdpRGsBqpUKbI
 vKnuRfcPnJ2qmOw8XG9xZTFU3+P81FiqeRyVpZV4ChpkhuCDS7YT1taemUEQsbkuR
 sYaLd8AQ5ePondz2Z8sSItM7RLWlGbW3m1hVstsMgXcBk1Cc2wi63CvbMTGVT2H52
 ebm+33/W0a4kf8rFFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=nVjn6pJa
Subject: [Buildroot] [PATCH v3 2/4] package/python-gobject: fix event source
 registration with Python 3.13
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Since Python 3.13 BaseSelectorEventLoop.add_reader() and
BaseSelectorEventLoop.add_writer() use the mapping returned by
selector.get_map() to detect if a file object is already
registered. This fails with the implementation in gi.events._Selector
if some calls use a file object, and others the raw file descriptor.

Full upstream bug report:
https://gitlab.gnome.org/GNOME/pygobject/-/issues/689

This bug breaks package/python-aiomqtt, because its client object uses
file objects in some places for the connection socket, and the file
descriptor in others. The result is that the connection attempt times
out because source registration fails, and the Future that marks
successful connection never resolves.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
The bug fixed by this patch is present in 3.50.0 and 3.52.3 alike, the
reason for applying the update first is simply that the patch doesn't
apply with 3.50.0, and backporting would be unnecessary effort when
the update is due anyway.

Change v1 -> v2: Patch has been merged, switch upstream URL from MR to
commit on main branch.

 ...tor.get_map-look-up-file-objects-by-.patch | 164 ++++++++++++++++++
 1 file changed, 164 insertions(+)
 create mode 100644 package/python-gobject/0001-gi.events._Selector.get_map-look-up-file-objects-by-.patch

diff --git a/package/python-gobject/0001-gi.events._Selector.get_map-look-up-file-objects-by-.patch b/package/python-gobject/0001-gi.events._Selector.get_map-look-up-file-objects-by-.patch
new file mode 100644
index 0000000000..a275abd9c7
--- /dev/null
+++ b/package/python-gobject/0001-gi.events._Selector.get_map-look-up-file-objects-by-.patch
@@ -0,0 +1,164 @@
+From 4b97688d527276fc1e835fed71dbb73bbd09ac11 Mon Sep 17 00:00:00 2001
+From: Fiona Klute <fiona.klute@gmx.de>
+Date: Tue, 25 Mar 2025 13:29:04 +0100
+Subject: [PATCH] gi.events._Selector.get_map(): look up file objects by file
+ descriptor
+
+File objects and their underlying file descriptors must be treated as
+equivalent for lookup, or one may incorrectly be treated as not
+registered when the other was used for the registration, leading to
+bugs.
+
+Fixes: #689
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+Upstream: https://gitlab.gnome.org/GNOME/pygobject/-/commit/4b97688d527276fc1e835fed71dbb73bbd09ac11
+---
+ gi/events.py         | 36 +++++++++++++++++++++-----
+ tests/test_events.py | 61 ++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 90 insertions(+), 7 deletions(-)
+
+diff --git a/gi/events.py b/gi/events.py
+index da4775dc..9eba1629 100644
+--- a/gi/events.py
++++ b/gi/events.py
+@@ -28,6 +28,7 @@ import threading
+ import selectors
+ import weakref
+ import warnings
++from collections.abc import Mapping
+ from contextlib import contextmanager
+ from . import _ossighelper
+ 
+@@ -508,9 +509,33 @@ if sys.platform != 'win32':
+         # Subclass to attach _tag
+         pass
+ 
++    class _FileObjectMapping(Mapping):
++        def __init__(self, fd_dict):
++            self.fd_dict = fd_dict
++
++        def __len__(self):
++            return len(self.fd_dict)
++
++        def get(self, fileobj, default=None):
++            fd = _fileobj_to_fd(fileobj)
++            return self.fd_dict.get(fd, default)
++
++        def __getitem__(self, fileobj):
++            value = self.get(fileobj)
++            if value is None:
++                raise KeyError("{!r} is not registered".format(fileobj))
++            return value
++
++        def __iter__(self):
++            return iter(self.fd_dict)
++
+     class _Selector(_SelectorMixin, selectors.BaseSelector):
+         """A Selector for gi.events.GLibEventLoop registering python IO with GLib."""
+ 
++        def __init__(self, context, loop):
++            super().__init__(context, loop)
++            self._map = _FileObjectMapping(self._fd_to_key)
++
+         def attach(self):
+             self._source.attach(self._loop._context)
+ 
+@@ -559,15 +584,12 @@ if sys.platform != 'win32':
+         # We could override modify, but it is only slightly when the "events" change.
+ 
+         def get_key(self, fileobj):
+-            fd = _fileobj_to_fd(fileobj)
+-            return self._fd_to_key[fd]
++            return self._map[fileobj]
+ 
+         def get_map(self):
+-            """Return a mapping of file objects to selector keys."""
+-            # Horribly inefficient
+-            # It should never be called and exists just to prevent issues if e.g.
+-            # python decides to use it for debug purposes.
+-            return {k.fileobj: k for k in self._fd_to_key.values()}
++            """Return a mapping of file objects or file descriptors to
++            selector keys."""
++            return self._map
+ 
+ 
+ else:
+diff --git a/tests/test_events.py b/tests/test_events.py
+index a6585468..9dbf3827 100644
+--- a/tests/test_events.py
++++ b/tests/test_events.py
+@@ -46,6 +46,7 @@ import sys
+ import gi
+ import gi.events
+ import asyncio
++import socket
+ import threading
+ from gi.repository import GLib, Gio
+ 
+@@ -344,3 +345,63 @@ class GLibEventLoopPolicyTests(unittest.TestCase):
+         self.assertEqual(order, [GLib.PRIORITY_HIGH] * 3 +
+                                 [GLib.PRIORITY_DEFAULT] * 3 +
+                                 [GLib.PRIORITY_DEFAULT_IDLE] * 3)
++
++    @unittest.skipIf(sys.platform == 'win32', 'add reader/writer not implemented')
++    def test_source_fileobj_fd(self):
++        """Regression test for
++        https://gitlab.gnome.org/GNOME/pygobject/-/issues/689
++        """
++        class Echo:
++            def __init__(self, sock, expect_bytes):
++                self.sock = sock
++                self.sent_bytes = 0
++                self.expect_bytes = expect_bytes
++                self.done = asyncio.Future()
++                self.data = bytes()
++
++            def send(self):
++                if self.done.done():
++                    return
++                if self.sent_bytes < len(self.data):
++                    self.sent_bytes += self.sock.send(
++                        self.data[self.sent_bytes:])
++                    print('sent', self.data)
++                if self.sent_bytes >= self.expect_bytes:
++                    self.done.set_result(None)
++                    self.sock.shutdown(socket.SHUT_WR)
++
++            def recv(self):
++                if self.done.done():
++                    return
++                self.data += self.sock.recv(self.expect_bytes)
++                print('received', self.data)
++                if len(self.data) >= self.expect_bytes:
++                    self.sock.shutdown(socket.SHUT_RD)
++
++        async def run():
++            loop = asyncio.get_running_loop()
++            s1, s2 = socket.socketpair()
++            sample = b'Hello!'
++            e = Echo(s1, len(sample))
++            # register using file object and file descriptor
++            loop.add_reader(s1, e.recv)
++            loop.add_writer(s1.fileno(), e.send)
++            s2.sendall(sample)
++            await asyncio.wait_for(e.done, timeout=2.0)
++            echo = bytes()
++            for _ in range(len(sample)):
++                echo += s2.recv(len(sample))
++                if len(echo) == len(sample):
++                    break
++            # remove using file object and file descriptor
++            loop.remove_reader(s1)
++            loop.remove_writer(s1.fileno())
++            s1.close()
++            s2.close()
++            # check if the data was echoed correctly
++            self.assertEqual(sample, echo)
++
++        policy = self.create_policy()
++        loop = policy.get_event_loop()
++        loop.run_until_complete(run())
++        loop.close()
+-- 
+2.49.0
+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
