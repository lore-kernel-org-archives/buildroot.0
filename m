Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A99C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 12:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBD6381221;
	Mon, 19 May 2025 12:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Hs9iERsYxpX; Mon, 19 May 2025 12:14:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C204A80A89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C204A80A89;
	Mon, 19 May 2025 12:14:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C73F0D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 12:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACFD761039
 for <buildroot@buildroot.org>; Mon, 19 May 2025 12:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbPWoRaNZ0XR for <buildroot@buildroot.org>;
 Mon, 19 May 2025 12:14:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 06A3560FC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06A3560FC1
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06A3560FC1
 for <buildroot@buildroot.org>; Mon, 19 May 2025 12:14:37 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.126.193]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLzFr-1uYNoW0Ib3-00IYex; Mon, 19
 May 2025 14:14:33 +0200
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 14:14:22 +0200
Message-ID: <20250519121425.1316837-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:1r/haS53WgM7kfY2dXmgSSMUiXBYzAOxAiYLrC/64AiKC98yERN
 tv9oS60KDoS6uW9KpD0iArTh9joOzy4RcXVPnKWVLUth9igNlvD7aqBdla7xK7MNitwbb+T
 VDGWe2SLwS+/APSWskg6AtDbi/JCPHzUrK848Qd6qrJLQsdDfsjkHNIqff7D2N8SSMTTmOP
 ge1wsSoyKCMNBtk5nhe1Q==
UI-OutboundReport: notjunk:1;M01:P0:GQmFFfLZx5A=;6ZwMdvtENWLBve7v6CObkt9Cjuk
 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
 Og8h14VSKBa0i2qbz47AO98wLdp+mEAtJE
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1747656873; x=1748261673; i=fiona.klute@gmx.de;
 bh=xjMEhfc9bWH3sFXGfRt0Z/cDENwMvhO3Vwsz5Hom+eY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=JB2gPSfCHt0TKER5imyZlJR4reKvmZA0gWTawKqTQOU99iwgQ9keMwSy0MhS5oV/
 wgfIDag7pwL6QCzz1P6ZBP3yLEwpesz8MWpDvKt29DAZ1eUIKx8BFrEsRihG5cCxh
 kP55gB9JsCVAKMuiTJVU8NZUVCmoG9H9AFdIV4C/yew0Qd+TJr6gEnHUzdQNqoZ8/
 kfrmd8vUyBKyLOAwp0Hi3sp7xyh1IUvfvNNrsy4BZfQ2NfCAku2g2zBFVkBPZrhmn
 Cu5P2SV4cdjESAoH0O9BRJGWrY/FjdXzv9NKpSEGWJqUhkQSjxIskQ4uEdZtOFiO2
 OV8Zdkq65PZ8q5caBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=JB2gPSfC
Subject: [Buildroot] [PATCH v5 1/4] package/python-gobject: fix event source
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
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

This commit adds the fix as backported to PyGObject 3.50 [1] so it can
be cherry-picked to Buildroot stable versions using that version.

[1] https://gitlab.gnome.org/GNOME/pygobject/-/merge_requests/423

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Change v4 -> v5: Reorder patch before version bump to support backport
to stable, replace patch with version applicable to 3.50.

Change v1 -> v2: Patch has been merged, switch upstream URL from MR to
commit on main branch.

 ...tor.get_map-look-up-file-objects-by-.patch | 163 ++++++++++++++++++
 1 file changed, 163 insertions(+)
 create mode 100644 package/python-gobject/0001-gi.events._Selector.get_map-look-up-file-objects-by-.patch

diff --git a/package/python-gobject/0001-gi.events._Selector.get_map-look-up-file-objects-by-.patch b/package/python-gobject/0001-gi.events._Selector.get_map-look-up-file-objects-by-.patch
new file mode 100644
index 0000000000..baed785aa5
--- /dev/null
+++ b/package/python-gobject/0001-gi.events._Selector.get_map-look-up-file-objects-by-.patch
@@ -0,0 +1,163 @@
+From 3bb03bc5d095cf51c8605521fcc2ce8cad36995f Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+Upstream: https://gitlab.gnome.org/GNOME/pygobject/-/commit/3bb03bc5d095cf51c8605521fcc2ce8cad36995f
+---
+ gi/events.py         | 36 +++++++++++++++++++++-----
+ tests/test_events.py | 61 ++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 90 insertions(+), 7 deletions(-)
+
+diff --git a/gi/events.py b/gi/events.py
+index 9f00059ec..980cae0fe 100644
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
+@@ -381,9 +382,33 @@ if sys.platform != 'win32':
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
+@@ -432,15 +457,12 @@ if sys.platform != 'win32':
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
+index 81409abae..c075af095 100644
+--- a/tests/test_events.py
++++ b/tests/test_events.py
+@@ -45,6 +45,7 @@ import sys
+ import gi
+ import gi.events
+ import asyncio
++import socket
+ import threading
+ from gi.repository import GLib
+ 
+@@ -262,3 +263,63 @@ class GLibEventLoopPolicyTests(unittest.TestCase):
+         GLib.MainLoop().run()
+ 
+         loop.close()
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
+GitLab
+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
