Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4C1C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 698056FC7D;
	Fri, 28 Feb 2025 16:57:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MhZnShmvHXtD; Fri, 28 Feb 2025 16:56:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D7016FCBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D7016FCBF;
	Fri, 28 Feb 2025 16:56:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 126DC711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23596419DB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAdhZo5Uzn3s for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58712424CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58712424CA
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F024821C6; Fri, 28 Feb 2025 16:30:08 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Jan 2025 12:22:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2646d3cbac2042f6b8c61e5b252e3daa8a4b5f04
X-Git-Newrev: 872919427e4bae7cfcb680fb27aab68bfc04828e
X-Patchwork-Hint: ignore
Message-Id: <20250228163008.4F024821C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-ws4py: bump to
 version 0.6.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=872919427e4bae7cfcb680fb27aab68bfc04828e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop patch which is no longer required.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 .../0001-Adjust-ws4py-for-Python-3.7-syntax.patch  | 55 ----------------------
 package/python-ws4py/python-ws4py.hash             |  4 +-
 package/python-ws4py/python-ws4py.mk               |  4 +-
 4 files changed, 4 insertions(+), 60 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 84b1e7ae00..ee89f7e4bf 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1023,7 +1023,6 @@ package/python-scipy/0001-build-sh4-FE.patch lib_patch.Upstream
 package/python-setuptools/0001-add-executable.patch lib_patch.Upstream
 package/python-sip/0001-remove-join-from-sip-h-files-string.patch lib_patch.Upstream
 package/python-web2py/S51web2py Shellcheck lib_sysv.Variables
-package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch lib_patch.Upstream
 package/python3/0001-Make-the-build-of-pyc-files-conditional.patch lib_patch.Upstream
 package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch lib_patch.Upstream
 package/python3/0003-Add-an-option-to-disable-pydoc.patch lib_patch.Upstream
diff --git a/package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch b/package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch
deleted file mode 100644
index 12dac30db8..0000000000
--- a/package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From dfe6f65b7078315c32cebb727e9c47ead7603475 Mon Sep 17 00:00:00 2001
-From: Asaf Kahlon <asafka7@gmail.com>
-Date: Sun, 13 Oct 2019 16:44:44 +0300
-Subject: [PATCH] Adjust ws4py for Python 3.7 syntax
-
-Since Python 3.7, "async" has become a keyword and cannot be used.
-Thus, instead of asyncio.async we will use asyncio.ensure_future.
-
-There's also a pull request with this change:
-https://github.com/Lawouach/WebSocket-for-Python/pull/245
-
-Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
----
- ws4py/async_websocket.py    | 4 ++--
- ws4py/server/tulipserver.py | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/ws4py/async_websocket.py b/ws4py/async_websocket.py
-index 9e2a4c7..ea296b4 100644
---- a/ws4py/async_websocket.py
-+++ b/ws4py/async_websocket.py
-@@ -84,7 +84,7 @@ class WebSocket(_WebSocket):
-         def closeit():
-             yield from self.proto.writer.drain()
-             self.proto.writer.close()
--        asyncio.async(closeit())
-+        asyncio.ensure_future(closeit())
- 
-     def _write(self, data):
-         """
-@@ -94,7 +94,7 @@ class WebSocket(_WebSocket):
-         def sendit(data):
-             self.proto.writer.write(data)
-             yield from self.proto.writer.drain()
--        asyncio.async(sendit(data))
-+        asyncio.ensure_future(sendit(data))
- 
-     @asyncio.coroutine
-     def run(self):
-diff --git a/ws4py/server/tulipserver.py b/ws4py/server/tulipserver.py
-index 2786c16..85312a2 100644
---- a/ws4py/server/tulipserver.py
-+++ b/ws4py/server/tulipserver.py
-@@ -40,7 +40,7 @@ class WebSocketProtocol(asyncio.StreamReaderProtocol):
-         #self.stream.set_transport(transport)
-         asyncio.StreamReaderProtocol.connection_made(self, transport)
-         # Let make it concurrent for others to tag along
--        f = asyncio.async(self.handle_initial_handshake())
-+        f = asyncio.ensure_future(self.handle_initial_handshake())
-         f.add_done_callback(self.terminated)
- 
-     @property
--- 
-2.20.1
-
diff --git a/package/python-ws4py/python-ws4py.hash b/package/python-ws4py/python-ws4py.hash
index 1e809fee0a..fc14748b8d 100644
--- a/package/python-ws4py/python-ws4py.hash
+++ b/package/python-ws4py/python-ws4py.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ws4py/json
-md5  68e0cfae9659dd059ff7e7a8218af548  ws4py-0.5.1.tar.gz
-sha256  29d073d7f2e006373e6a848b1d00951a1107eb81f3742952be905429dc5a5483  ws4py-0.5.1.tar.gz
+md5  373750c014b6a5e225aad4cf5b0a5721  ws4py-0.6.0.tar.gz
+sha256  9f87b19b773f0a0744a38f3afa36a803286dd3197f0bb35d9b75293ec7002d19  ws4py-0.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3c98d9e820de01b1ae3be846419700ab9cefa22b09aa0ef441b3bfd5613c3ba1  LICENSE
diff --git a/package/python-ws4py/python-ws4py.mk b/package/python-ws4py/python-ws4py.mk
index edfd5d0df1..c76c636d8b 100644
--- a/package/python-ws4py/python-ws4py.mk
+++ b/package/python-ws4py/python-ws4py.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WS4PY_VERSION = 0.5.1
+PYTHON_WS4PY_VERSION = 0.6.0
 PYTHON_WS4PY_SOURCE = ws4py-$(PYTHON_WS4PY_VERSION).tar.gz
-PYTHON_WS4PY_SITE = https://files.pythonhosted.org/packages/53/20/4019a739b2eefe9282d3822ef6a225250af964b117356971bd55e274193c
+PYTHON_WS4PY_SITE = https://files.pythonhosted.org/packages/cb/55/dd8a5e1f975d1549494fe8692fc272602f17e475fe70de910cdd53aec902
 PYTHON_WS4PY_SETUP_TYPE = setuptools
 PYTHON_WS4PY_LICENSE = BSD-3-Clause
 PYTHON_WS4PY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
