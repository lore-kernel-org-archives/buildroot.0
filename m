Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3D7C3600B
	for <buildroot@archiver.kernel.org>; Mon, 31 Mar 2025 13:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8A3B4093D;
	Mon, 31 Mar 2025 13:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rHADpavVAgiZ; Mon, 31 Mar 2025 13:14:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83CC34094E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83CC34094E;
	Mon, 31 Mar 2025 13:14:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 13A6DD0
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 13:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE8CC40175
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 13:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2vOe7TfT61B for <buildroot@buildroot.org>;
 Mon, 31 Mar 2025 13:14:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7731E40168
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7731E40168
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7731E40168
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 13:14:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.117.119]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZCbB-1tdbND2Fsn-00IuiI; Mon, 31
 Mar 2025 15:14:34 +0200
To: buildroot@buildroot.org
Date: Mon, 31 Mar 2025 15:14:01 +0200
Message-ID: <20250331131402.3590411-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331131402.3590411-1-fiona.klute@gmx.de>
References: <20250331131402.3590411-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:BxHQFuoSxaJBEbZlUVKkz46j2a5ujHQMz0k1a75i+w5vdNGU1WG
 HID2ZSP8RsUQDmQ08IeJ11IJ7gxy2R3bXf6WlVr6PrHlVUl3ccgzhM+sAhzWtA544R+N9a+
 rfQ46wmxZXeIJZG7BTQUGGZDDybzQirFik2YTLF3Ywip3/Di/EUId4IbptzSqymkabAPDA1
 NoqL0t1ap1RnWB3zyBCsQ==
UI-OutboundReport: notjunk:1;M01:P0:XBNe7yo3I+U=;QAAaX4MG8H9sG2L7Lx6iLFi+/QC
 471IB2You+HZzDm1lKeGMe04lQd8830qwwzSe0RWKaZU9L6GTRKua7nzYVklBRueBOe2jKQbg
 DjcULnvsrxaWv+TeEm8TF7xd5+mb92YBCUzlObd7irTO1WXjKfnE4lfwzgtuEmFWfykLGlGUx
 TpnS3N/F19ptfv2FTb+x7LlOIQWi3Xau029++BsPEbjfz3XtGrXQ8UXDybLk75U80HspcbeVT
 cgHOjazCgECbIhMBMT9G3OS/2jcyNTI/UF0z4/kEbu0VWb+2oJ3IDDhIGIkll0Feqqzt8127H
 mHfqk3Fb3EX1M5pGgYB7HfWC2nQ/AEJ/fnfL7hnE5BvPgNLssZJoubL6S2P/wFp645ffkLzcb
 0lOHAJvp8fEAy4BYYyI7/zBtzMDUAOxqEtRwvifKG1e2jdqjJKm8aSdyiJ9JN2EGBXs02E4Uq
 c14vTM511CWDYqQ4BBxo7SvgWCM8oRjnoEUJ244LTvmvH9qcZI1qPEriXhWCBi3BdooOmeafR
 72/jvWFa8E3bHVQRlCKClpaOn91EHvzqJvLLmLZBVOUVa1WRHFuVr3Z1QDLvfEiIvKjhK9DnC
 aiPtoG8p5DMwaKwNA1CjRbo0pCqEBVN4h99Spk3PpJaP72w0oxQZ4sELGF0OSTCxqIJNSZhfp
 KtMlnDttuvknBk9vi+sq5iCRzNO4XlEcY3lKlsw2WzXznH9oJLaLzm54yidXCMg/c2CgsW8SS
 UXuRlXQ15VN9WQl2r+c3Ir7xxd2wVDdF12DvbbdqagvrYpKAh46QZqb/1K4RIvyyROEhz+fT1
 kX9eL6M4YteaQg5CNxZX5OmkcRRIMEfjHgQfriGzSHQsDV2Qk3FwXVDyW/O2BiNPnDuaOpFp9
 a/i3oX+ribiWmE579ax8DPPEIV6JIAz7cKuKE7RRk0RVS9Ks1qcQlN7ZwLf9YzLOs5gjO2FHH
 0YsYai/FtfdU9Yd88yNZm0ugsc+PEGEh8mL8Ez5dODfjyfEZzdlRaDMUQ8FpokYaU37sHSxDM
 8TzmJEZWVBRS7cK8+FkiJFnfGF/rnxPd/YI1jLDxNMIfs3/OGH7jVQAeOCqLKtVAsdKUON+WX
 5bbxF1bN7ROyq7cbFKCAjyb6CX+Yy8weDDOfMVWbzKtm8X8GXe7C/dp9hROEPYloehlnm3lFx
 SeWfhMLxFLClIsxuo6oTpIzdFbN9V+0I0hklUQSOxyz0ikkheKeC9V5WvhXovPMiTJYCVRi3N
 2sipQwoz6CUMmNrQ6/zM+CdPp90mO6ke6AAnEGCSmsC0/V5fxC3hPv5Y8UZlREVMU5EYmxFwZ
 ITNmhqCjen2S6eNB7YT0CnVX4FatL8fG32JvwapOoCL8TaUCzdGnx/BeFV3FQRJSZjPNh6bJl
 xNfh9Tpa2hNdgjb1tBZZwvCvXGPwp5qwaJjdJY27PK629/lyQ7XBZNlPYZLRYn79OL22ZmDbS
 vLMVb0saRJp2aumDMm5DkfbaKSO0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1743426874; x=1744031674; i=fiona.klute@gmx.de;
 bh=ZiIXU2JsOzU3M14ErTvAJsrMIObu2x7WLOFRTXFLw6w=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=TgVNyd4JgiJ9+QgZJ/YrNtFFtcociIMQS7xU9jFrjZZOEKj+aJf5GvXqj4wA8mKB
 G3Sbdbab6Yc68oru02ye0RcAfmavJEvNJOqej7cUB4W5xXLnt5w5mhXNvuK7BRGg9
 1ZeilUP2WvQcf5vAbV4v63o72ChmgNizWfkVRFc+Nkrf0ZXlCT0BhwjbQD4jtGuD4
 z8+Dq6xtfTJRRB3RFZkJWxga/Ddi6I/IoZOl2YSs0WvG7yVJk7ZmR0brJq70bTABh
 jliJzfr7xlo05BnQ1C4hEpE3pRzeb39UGeJaX9gQAAizmp5eC9ghgIZou46n8a2jN
 waCV+CvBvPei+LvMkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=TgVNyd4J
Subject: [Buildroot] [PATCH v2 2/3] package/python-gobject: fix event source
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
