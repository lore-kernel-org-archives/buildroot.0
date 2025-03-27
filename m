Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91621C3600B
	for <buildroot@archiver.kernel.org>; Thu, 27 Mar 2025 11:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D82642EEF;
	Thu, 27 Mar 2025 11:58:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FjQ0xrQnknBn; Thu, 27 Mar 2025 11:58:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1238542F12
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1238542F12;
	Thu, 27 Mar 2025 11:58:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ADDB1B7
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 11:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C4E2849A5
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 11:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z66NECQupEk5 for <buildroot@buildroot.org>;
 Thu, 27 Mar 2025 11:58:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C311849D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C311849D7
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C311849D7
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 11:58:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.122.102]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKsnP-1th3HA1sZ3-00Vt9j; Thu, 27
 Mar 2025 12:58:25 +0100
To: buildroot@buildroot.org
Date: Thu, 27 Mar 2025 12:58:03 +0100
Message-ID: <20250327115804.3162110-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327115804.3162110-1-fiona.klute@gmx.de>
References: <20250327115804.3162110-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Ib4LZUE2wTWpEf5YYVwM7+CYcD2BLgXwIft6FgS2TgzabK9iVh8
 WzKFSPi0gezV2GkFEdExHVEcCkG5P8fDBRfTM+gfDCUNUR67bY2JsPPH3QyV2SCWZcxq7Rt
 rJd6obPdGyM/W6IgxNq9qVqP56gOQEfEwe/+Pw7ruI0Vf4jggl7PEmgfTA8SWcplQV/Iwj3
 2jakmKfzGBDVkVzY1s6uw==
UI-OutboundReport: notjunk:1;M01:P0:2sAA71BjJBQ=;NHtSzlRGlJy856q9sMVdm0OffBp
 SQg/SNfhuOoFhZvpul5DvsZuP1JmILVokQRLJ+piJGppG3VMCbQz2E0HwCppIWcjfFJiv0vzJ
 lMRl1fge8VUSzkyw9cDDPyCx0/sWevwJn4akzOiB14GYtupq5zXG+lqnOJ00CNX1aZdjUfAQA
 ADk3Q1uWbgfgnTCT95Dv9oAoSayM+j/GLoxA642Nal5i2TJWcmxm9pe1poZzSX/R+wrgccHTz
 OKeS90JmgrWaOX2exqIeKEafCfxrIiHWMCoIuNfD1P/HXnRWtpF7Rv9nLMlUsuAE9QApZQAoO
 EsqZ+BB8CuvFcGJAYMb/Q8hV6z5iy2BOcTSw+GwyiCFM9LVCHDZSxBy3b1Dc4DYJwHxQFV19t
 CKBkqFoXWlHj12Kw/1eo5DVHfdkQLZ1i+FBA8N1evt4LkVuWelOBOOfbx8Tepw/pacgsCUaw7
 VXeTnSEbQm1d1GqhtFmkzt8EP1cOmv0EB34ja0ojrMZBgT3YqcGmNuQNKmML991o2DepWxVmU
 V00iUHzW/C/xpHt1DNN2Qm26N1/JriuIYLWGXPn9c8gp5XWrbmbJgOibIcSH6Q6dwpxrRcKcz
 J+Ua8wUGMjGDB22Xm7pePVhfWiKVQLek6lPnDcO45dhg8YcUzGHZGv0iQL4OjONiXpnoBUHw1
 U9NYAfkpasLXzzdDfnm1BdWy9feZ7WBwEdDJ0nZLv0ufw1J1xjxeJ2OC1YNVdw8S4nTUrmEAL
 GMhsIaPWZgrkLw4wFn9rlG2P7UJKv95c0X5VaqoYtqWxz9cr3avNGGCAdFUicfrptDyqZDyXo
 37MM1PXFGHogy/ouKhD+OHBV9Yhjdwzrd10nObo66lbBH2cicZGJOU81eyCDsSAaK3BG3MuWo
 KCjkI3SUFocjBami5Sq5H7mjCMGpIl4fbb7LiyOa4QEUjm1Qu6EVt5rGcmoKg863f+m5mmZ37
 bhZswp/dVQY872APUIIQWG4s6+gtjgBKdLhdwrC8lN0sGaJbUV/9bTHd1zdfJn/B9+vkJQcsS
 d4U7dHGQhKtFn010g13BuJ48O/Jj6CEVsXYRK17Z4ouIF9latdMM5UXbwy3gOMICSnkd0soez
 qubMEBSWKLPdyjlB7LD3ufK+jez85YgtzIq4xvCSUtbj/+JLTRYMuZYdDjnLu7lM32l6BWvTg
 qRRjctKtbwSGOWAM0EXlnxQUrdppaz98O4lHY2Ic92c8iBoYNn0lTBVk1y1ROmlFRwOgz8UDx
 DcGvlPmuNhVLU1sGQu/pNUMMWXOzFK5nU+L5BM+LXLX1FqsmOlKYL3cNXQBguOPNY9X6y7GF6
 2nzofW/WXYCgmAi1gtQFhBZswXMePoitGLcgUwMH8uYNnVsM9PLBhiWYhyOqsuVeyF6PVr9Au
 dxXb1tHqQv5S13SYdN0ufaZfMgDAq8rS6mLKz/WATjFIgYM5Bz7H6lALUQPU+PhzrzbNP2HhF
 0GLSU2HQ7qjYmQV8a1lupXwkXms884HorbLv+USUnt5s0ClbT
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1743076705; x=1743681505; i=fiona.klute@gmx.de;
 bh=9LKZOU80uLIWrhJMzeEkzICzK2gB5jmzbGcg6J8JZ+g=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=OBOvlpdusAM0X8miHme0q4Al48G4vSw5tQRgr0+FcvyPhGQTDNgXfw86yc+Cw+JP
 gf4k3THxnv96K7P2bQHsF5TBI+gXNgEuzrC1ZWWi6yN1zJR5iH6cYs3Do8cmr2h3T
 qsFSh1X3sS1SHzFKXwrf0T9BGHCQJCLoMrZLuA9NaJdNss6KJU0vsP4G/Bo6YaGyB
 GczlmUiOQ3N2adaLC28DQdWSLO9k1YeQThqKEmoWtshZ1WONbLnW9gYROGbNa6iYf
 rABigyp4vefj6nxdmaqbIbX8Tv68cy/LW1CXTyPXlBlisJj9te0XNWziLwKiPWLX6
 GICdTta+41dHTumBZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=OBOvlpdu
Subject: [Buildroot] [PATCH 2/3] package/python-gobject: fix event source
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

 ...tor.get_map-look-up-file-objects-by-.patch | 164 ++++++++++++++++++
 1 file changed, 164 insertions(+)
 create mode 100644 package/python-gobject/0001-gi.events._Selector.get_map-look-up-file-objects-by-.patch

diff --git a/package/python-gobject/0001-gi.events._Selector.get_map-look-up-file-objects-by-.patch b/package/python-gobject/0001-gi.events._Selector.get_map-look-up-file-objects-by-.patch
new file mode 100644
index 0000000000..0f55e3d567
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
+Upstream: https://gitlab.gnome.org/GNOME/pygobject/-/merge_requests/421
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
