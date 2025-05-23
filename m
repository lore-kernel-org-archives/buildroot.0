Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EE3C3DA6D
	for <buildroot@archiver.kernel.org>; Fri, 23 May 2025 12:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 639C080BE9;
	Fri, 23 May 2025 12:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id stGXKb71iIxF; Fri, 23 May 2025 12:15:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08F3280B54
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08F3280B54;
	Fri, 23 May 2025 12:15:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D154179
 for <buildroot@buildroot.org>; Fri, 23 May 2025 12:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A5E360836
 for <buildroot@buildroot.org>; Fri, 23 May 2025 12:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5BWMytnBp4u for <buildroot@buildroot.org>;
 Fri, 23 May 2025 12:15:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 89B7B6060E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89B7B6060E
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89B7B6060E
 for <buildroot@buildroot.org>; Fri, 23 May 2025 12:15:37 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.115.30]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5wLZ-1uH5bR1toh-004ZQR; Fri, 23
 May 2025 14:15:34 +0200
To: buildroot@buildroot.org
Date: Fri, 23 May 2025 14:15:18 +0200
Message-ID: <20250523121521.380704-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:B+bDoq412/ILoKdAkqs4qGStH5nVPhyU2lXx1CiK8H4gwIxxVnA
 9Y4SUQO5Hg4Tf7q2nnqQqSYWUp+sDSjdbz/TJV7dgZgaaMwVPXu7wpkmtr1SggwvkDUuaeN
 XtXYV9X5Ic3KBsq/OkkzHkoOhfXkzReB+Bt9oAGTNP0HfaA8rOIjBEEZaxa8Sq6kQJnMLqM
 AjhHTkvgJc9KycL0zPiCw==
UI-OutboundReport: notjunk:1;M01:P0:kWWI3J2PXCE=;lOBpfWiB++EC4SK1QGmlCkOEtgy
 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
 GJU+pN+8R/YZtoYArrLR8Rp4X
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1748002534; x=1748607334; i=fiona.klute@gmx.de;
 bh=xjMEhfc9bWH3sFXGfRt0Z/cDENwMvhO3Vwsz5Hom+eY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=LD6GH2uCaJYGEZQfDs791suMZ+9x6af/CBxLbUpwFAnBnniMhRlhqoRmp0KnvJ/G
 jIDys6F2J5dPOowVE2IVaDlQNKy3TBSWkQt4ddSWGF4jmIHeyfxjaGP0AnTEARkPl
 RUcgz6Ba+PY0Y/PkAdalYYTdT7+KKi6jIu0+LwXwMKjYNcNDmAgwnYCVuB+6rIOKO
 2AGA8Ds8KBJ0PGmYQgXEK2JDgoYKWaXO1BelrTctc7U9ZPobnplhRH8PJfgw8GRO8
 bOjnfClFtk8Q/i5lB3aQJ5/0mcKOtnF9aMd2HRPhpDHc0y3FGWlUflRcFzRwM0aK0
 5sCH6JJOM+ulMZuHqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=LD6GH2uC
Subject: [Buildroot] [PATCH v6 1/4] package/python-gobject: fix event source
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
