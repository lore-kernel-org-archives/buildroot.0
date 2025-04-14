Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CFEC369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 16:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3B8681751;
	Mon, 14 Apr 2025 16:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4tW8kl2ClVgM; Mon, 14 Apr 2025 16:16:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66C6F82C91
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66C6F82C91;
	Mon, 14 Apr 2025 16:16:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 109E3108
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 16:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 328D26066F
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 16:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DIcrx2ikOtfg for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 16:16:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 71F80608EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71F80608EB
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71F80608EB
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 16:16:05 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.122.10]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mz9Ux-1t9dE83god-00ySz4; Mon, 14
 Apr 2025 18:16:04 +0200
To: buildroot@buildroot.org
Date: Mon, 14 Apr 2025 18:15:43 +0200
Message-ID: <20250414161545.2863615-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414161545.2863615-1-fiona.klute@gmx.de>
References: <20250414161545.2863615-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:WslWPZq1VS19t4Fjfg0y7Bq1/EoIRNZypKbwjAJHXn5jxDOgEKa
 Fe/RKqsn+4J7efraBr5mzPt57Ey+qioiP4TyLAbsJH1vJaU5QRUKma+L28M90CEdPfYFxt6
 tvrdFkhuFnWoAX3WS+jQdc8PQsYq9sETazBCODN6dZ8Kt46rptgo3tR2EhqYUnNphA0Ryp1
 JaBy65Qvm1QzSEgvqJfjw==
UI-OutboundReport: notjunk:1;M01:P0:WcS6D94fjnA=;aJ/ndngybUL7NKks1Z0Ps+UVTxB
 c8TWIZ9QCWMp+PWAyVg1MrZDJPT8cyomR+eK6Ny9yodtB0GKJ/DBaPLvDlsiJnrzrY7caHfJA
 Y3VRIucMNqo/sTtniR6q1KGSk4QIxuFMHMUpXtxFWi+IYclGKOYDmaRMEbhwidXbE5ihc/6Bi
 d0XPS1ainwsOrU45dV2coc2UvJVgMi1c3TtjCsNQSbNAj3R5iOllGGCaTEwRob2bLvLNGdU0+
 AjFGREJ4PQcF0I9Zaf92zuiQTBgGSUrR3L6GETiYhk60eGZN0GKsYrQSVah/SDuipA9Ugp9K0
 ty3VMQHiEtrfRESnK7Xv8GafEGh9ftKpFIDzyCcp6aPVB3we9tvu42oAxCepWpjp1+sDiWrjI
 fq/tR2YEWld/nA9dW0miA40KUhTkyiVNfLQ4RGHReiev7yIIZh0yepbBm3UNWQDLB142dHY4M
 UbhFOaoenH1aM18Vsr6hI1efqUV6wNi17oFUjTB5H1gp6MyQErYUL1xkgyjdOUgSKRlz16fb/
 oBW5Llikgylkgz0N2my2Q3/WgAkOwiFJgUYySWptqrs18RxjQ8Z+2c7QdIXwNG20WzlXIEig5
 eFgbaFFMPcmTuU9J4RngAaGOA3MsgztOfS0s5//Rkxeoj6DATMTGqM0CK2S+UTEZnZkdm/jrk
 f92x67MJ0IWJ3WLJOvgA3+CQlGvhKyFqCfEtGYFKTZ23KMPJmW1Dl2i6x1/t1cTeVivJv7HTr
 udIuKVCzoE3rxOpuhRl/BJQ1KYqwSGXmPEiDH0ZNTS8m67w5n4SvjJYd2J0Kd/LrKuUeqTjQA
 F3B3Qj9UtFjbZQJq+wl5IyNHO+PAr8K2A6ZpFQazf+0ZjWT8kghDBc/qSWYCOE/QPIbiYqiY0
 ugig01T7gHhV8uboNgl1PKhL/qb8zG6yB5gfo93GB8YUUDhm3eJ+6v+StZGBD6+Wo1Bt3OTS5
 jdiiezaiPammKPf2NGFe7/KHfmaFYf5mj9w7cYmnzJ77eqV+/w/hg65dGcPeWt+m1SS5euPNj
 aljLmS7CFWIe6rVqGSm00aZptSrKrgUKSChFfRbhq1oXhXrzUZonJTPOThEdKebKhkfADqFbK
 f33D2JyM0KAPO1PnTAEmaF3rCGTarZdWNCfvKS9Mz6jhqMbht07yf6S8Gi68Yv5h8GVI8GYmJ
 gWFppCahTIFO+wq72F8rh0Oz1/NB7JMronztkD/LCYFlr5xA22qqeNAFuSEHOCfry+0h/0rw8
 gsi3QcQVLMcPgCpY8gKi3qbIRIkwHP5/2AaHyhYkf2DBH4F1KY/Na4ge82iN8FIW4bfXONCXA
 u/FRexCtRsAir3SWXXCkLEQ8B8NdCrDcfdW+yziPPhvjAOgLWmgTOORtgmimJagwY0rNz7QL/
 2BtMTMjF3qcU8bDty4OJCI0bUvLfntxhLyFs1zPjukqOekdzpg0fRIfLW8V3c2DWPXrBgBuLa
 Pjf2qV33p8CsakhII+pxK8MFM9C4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1744647364; x=1745252164; i=fiona.klute@gmx.de;
 bh=ZiIXU2JsOzU3M14ErTvAJsrMIObu2x7WLOFRTXFLw6w=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Xv758kSdYbp/bjXsjYYZVfRA8NHRX2UL9/tMQ+VcXt4edOqMByO8uxusUZgBS9mc
 nsKMKEpO5Ldw6ZDqXRqEpRiz0DC9jq24Zgpvuped6UtR+krJQgyddjzhkCP8Ntkxb
 duZWQAv00q1qIQKS3pFVuZXDQoV38xAK2lDa8EfNG5Q6VlNOuv62yLHiBhaayaiW8
 5/FPIQBNzzGTIyrQ3bGHIHu5HXx5N2Dt8x5RrO2st9SA+w07BmuN5CAQfjFhLeYMI
 zkRGgeYcQfMvmujzTR2XnxCh3fwMvYntnxJGRDrFIRvy5Ad5rLtanlLVX15XyNLn1
 zptXe33VIOgwefXjDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Xv758kSd
Subject: [Buildroot] [PATCH v4 2/4] package/python-gobject: fix event source
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
