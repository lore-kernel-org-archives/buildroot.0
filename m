Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ABEC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 22:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F27D40373;
	Thu, 30 Dec 2021 22:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LUum4ripk6PU; Thu, 30 Dec 2021 22:35:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A08BE40374;
	Thu, 30 Dec 2021 22:35:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E9C651BF3C2
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C901140374
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fqUzNVgyxnPe for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 22:35:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AC9E40373
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 22:35:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 659E282DD8; Thu, 30 Dec 2021 22:29:52 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 23:35:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b328a6a852abfb1ec713292e0ea0fd8f887b3461
X-Git-Newrev: bb77dc0917e5da87be66e059b9ba3fd3f32779ea
X-Patchwork-Hint: ignore
Message-Id: <20211230222952.659E282DD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp: bump to version
 3.8.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb77dc0917e5da87be66e059b9ba3fd3f32779ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash change due to removal of license full text:
https://github.com/aio-libs/aiohttp/commit/aca2c99f822af1b149c212c6566d8f116d8314d6

Drop upstream patch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...sync-timeout-version-for-aiohttp-3.8-5299.patch | 306 ---------------------
 package/python-aiohttp/python-aiohttp.hash         |   6 +-
 package/python-aiohttp/python-aiohttp.mk           |   4 +-
 3 files changed, 5 insertions(+), 311 deletions(-)

diff --git a/package/python-aiohttp/0001-Bump-async-timeout-version-for-aiohttp-3.8-5299.patch b/package/python-aiohttp/0001-Bump-async-timeout-version-for-aiohttp-3.8-5299.patch
deleted file mode 100644
index 95042b713e..0000000000
--- a/package/python-aiohttp/0001-Bump-async-timeout-version-for-aiohttp-3.8-5299.patch
+++ /dev/null
@@ -1,306 +0,0 @@
-From 572db464d3b5123e433759411a0c8796ea9fb5c9 Mon Sep 17 00:00:00 2001
-From: Andrew Svetlov <andrew.svetlov@gmail.com>
-Date: Sun, 29 Nov 2020 15:12:15 +0200
-Subject: [PATCH] Bump async-timeout version for aiohttp 3.8 (#5299)
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-1e6ec85e709db083d240c5ca249660d0fa56c61c]
----
- aiohttp/client.py                  |  4 +--
- aiohttp/client_ws.py               |  6 ++--
- aiohttp/connector.py               | 15 ++++++---
- aiohttp/helpers.py                 | 25 ++++++---------
- aiohttp/web_protocol.py            |  6 ++--
- aiohttp/web_ws.py                  |  6 ++--
- setup.py                           |  2 +-
- tests/test_client_ws_functional.py |  2 +-
- tests/test_helpers.py              | 49 +++++++-----------------------
- 10 files changed, 44 insertions(+), 73 deletions(-)
-
-diff --git a/aiohttp/client.py b/aiohttp/client.py
-index a9da8e15..2c87eb52 100644
---- a/aiohttp/client.py
-+++ b/aiohttp/client.py
-@@ -74,8 +74,8 @@ from .helpers import (
-     DEBUG,
-     PY_36,
-     BasicAuth,
--    CeilTimeout,
-     TimeoutHandle,
-+    ceil_timeout,
-     get_running_loop,
-     proxies_from_env,
-     sentinel,
-@@ -515,7 +515,7 @@ class ClientSession:
- 
-                     # connection timeout
-                     try:
--                        with CeilTimeout(real_timeout.connect, loop=self._loop):
-+                        async with ceil_timeout(real_timeout.connect):
-                             assert self._connector is not None
-                             conn = await self._connector.connect(
-                                 req, traces=traces, timeout=real_timeout
-diff --git a/aiohttp/client_ws.py b/aiohttp/client_ws.py
-index 28fa371c..a4c7371f 100644
---- a/aiohttp/client_ws.py
-+++ b/aiohttp/client_ws.py
-@@ -191,7 +191,7 @@ class ClientWebSocketResponse:
- 
-             while True:
-                 try:
--                    with async_timeout.timeout(self._timeout, loop=self._loop):
-+                    async with async_timeout.timeout(self._timeout):
-                         msg = await self._reader.read()
-                 except asyncio.CancelledError:
-                     self._close_code = 1006
-@@ -224,9 +224,7 @@ class ClientWebSocketResponse:
-             try:
-                 self._waiting = self._loop.create_future()
-                 try:
--                    with async_timeout.timeout(
--                        timeout or self._receive_timeout, loop=self._loop
--                    ):
-+                    async with async_timeout.timeout(timeout or self._receive_timeout):
-                         msg = await self._reader.read()
-                     self._reset_heartbeat()
-                 finally:
-diff --git a/aiohttp/connector.py b/aiohttp/connector.py
-index 748b22a4..77a4f379 100644
---- a/aiohttp/connector.py
-+++ b/aiohttp/connector.py
-@@ -44,7 +44,14 @@ from .client_exceptions import (
- )
- from .client_proto import ResponseHandler
- from .client_reqrep import ClientRequest, Fingerprint, _merge_ssl_params
--from .helpers import PY_36, CeilTimeout, get_running_loop, is_ip_address, noop, sentinel
-+from .helpers import (
-+    PY_36,
-+    ceil_timeout,
-+    get_running_loop,
-+    is_ip_address,
-+    noop,
-+    sentinel,
-+)
- from .http import RESPONSES
- from .locks import EventResultOrError
- from .resolver import DefaultResolver
-@@ -965,7 +972,7 @@ class TCPConnector(BaseConnector):
-         **kwargs: Any,
-     ) -> Tuple[asyncio.Transport, ResponseHandler]:
-         try:
--            with CeilTimeout(timeout.sock_connect):
-+            async with ceil_timeout(timeout.sock_connect):
-                 return await self._loop.create_connection(*args, **kwargs)  # type: ignore  # noqa
-         except cert_errors as exc:
-             raise ClientConnectorCertificateError(req.connection_key, exc) from exc
-@@ -1189,7 +1196,7 @@ class UnixConnector(BaseConnector):
-         self, req: "ClientRequest", traces: List["Trace"], timeout: "ClientTimeout"
-     ) -> ResponseHandler:
-         try:
--            with CeilTimeout(timeout.sock_connect):
-+            async with ceil_timeout(timeout.sock_connect):
-                 _, proto = await self._loop.create_unix_connection(
-                     self._factory, self._path
-                 )
-@@ -1245,7 +1252,7 @@ class NamedPipeConnector(BaseConnector):
-         self, req: "ClientRequest", traces: List["Trace"], timeout: "ClientTimeout"
-     ) -> ResponseHandler:
-         try:
--            with CeilTimeout(timeout.sock_connect):
-+            async with ceil_timeout(timeout.sock_connect):
-                 _, proto = await self._loop.create_pipe_connection(  # type: ignore
-                     self._factory, self._path
-                 )
-diff --git a/aiohttp/helpers.py b/aiohttp/helpers.py
-index bbf5f129..a6b14025 100644
---- a/aiohttp/helpers.py
-+++ b/aiohttp/helpers.py
-@@ -664,21 +664,16 @@ class TimerContext(BaseTimerContext):
-             self._cancelled = True
- 
- 
--class CeilTimeout(async_timeout.timeout):
--    def __enter__(self) -> async_timeout.timeout:
--        if self._timeout is not None:
--            self._task = current_task(loop=self._loop)
--            if self._task is None:
--                raise RuntimeError(
--                    "Timeout context manager should be used inside a task"
--                )
--            now = self._loop.time()
--            delay = self._timeout
--            when = now + delay
--            if delay > 5:
--                when = ceil(when)
--            self._cancel_handler = self._loop.call_at(when, self._cancel_task)
--        return self
-+def ceil_timeout(delay: Optional[float]) -> async_timeout.Timeout:
-+    if delay is None:
-+        return async_timeout.timeout(None)
-+    else:
-+        loop = get_running_loop()
-+        now = loop.time()
-+        when = now + delay
-+        if delay > 5:
-+            when = ceil(when)
-+        return async_timeout.timeout_at(when)
- 
- 
- class HeadersMixin:
-diff --git a/aiohttp/web_protocol.py b/aiohttp/web_protocol.py
-index 8e02bc4a..16f4d4ef 100644
---- a/aiohttp/web_protocol.py
-+++ b/aiohttp/web_protocol.py
-@@ -13,7 +13,7 @@ import yarl
- 
- from .abc import AbstractAccessLogger, AbstractStreamWriter
- from .base_protocol import BaseProtocol
--from .helpers import CeilTimeout, current_task
-+from .helpers import ceil_timeout, current_task
- from .http import (
-     HttpProcessingError,
-     HttpRequestParser,
-@@ -228,7 +228,7 @@ class RequestHandler(BaseProtocol):
- 
-         # wait for handlers
-         with suppress(asyncio.CancelledError, asyncio.TimeoutError):
--            with CeilTimeout(timeout, loop=self._loop):
-+            async with ceil_timeout(timeout):
-                 if self._error_handler is not None and not self._error_handler.done():
-                     await self._error_handler
- 
-@@ -517,7 +517,7 @@ class RequestHandler(BaseProtocol):
- 
-                         with suppress(asyncio.TimeoutError, asyncio.CancelledError):
-                             while not payload.is_eof() and now < end_t:
--                                with CeilTimeout(end_t - now, loop=loop):
-+                                async with ceil_timeout(end_t - now):
-                                     # read and ignore
-                                     await payload.readany()
-                                 now = loop.time()
-diff --git a/aiohttp/web_ws.py b/aiohttp/web_ws.py
-index da7ce6df..5f3cce56 100644
---- a/aiohttp/web_ws.py
-+++ b/aiohttp/web_ws.py
-@@ -359,7 +359,7 @@ class WebSocketResponse(StreamResponse):
-             reader = self._reader
-             assert reader is not None
-             try:
--                with async_timeout.timeout(self._timeout, loop=self._loop):
-+                async with async_timeout.timeout(self._timeout):
-                     msg = await reader.read()
-             except asyncio.CancelledError:
-                 self._close_code = 1006
-@@ -400,9 +400,7 @@ class WebSocketResponse(StreamResponse):
-             try:
-                 self._waiting = loop.create_future()
-                 try:
--                    with async_timeout.timeout(
--                        timeout or self._receive_timeout, loop=self._loop
--                    ):
-+                    async with async_timeout.timeout(timeout or self._receive_timeout):
-                         msg = await self._reader.read()
-                     self._reset_heartbeat()
-                 finally:
-diff --git a/setup.py b/setup.py
-index 54462ba7..c262de1e 100644
---- a/setup.py
-+++ b/setup.py
-@@ -68,7 +68,7 @@ install_requires = [
-     "attrs>=17.3.0",
-     "chardet>=2.0,<5.0",
-     "multidict>=4.5,<7.0",
--    "async_timeout>=3.0,<4.0",
-+    "async_timeout>=4.0.0a3,<5.0",
-     "yarl>=1.0,<2.0",
-     'idna-ssl>=1.0; python_version<"3.7"',
-     "typing_extensions>=3.6.5",
-diff --git a/tests/test_client_ws_functional.py b/tests/test_client_ws_functional.py
-index e423765a..76ef0525 100644
---- a/tests/test_client_ws_functional.py
-+++ b/tests/test_client_ws_functional.py
-@@ -461,7 +461,7 @@ async def test_recv_timeout(aiohttp_client) -> None:
-     await resp.send_str("ask")
- 
-     with pytest.raises(asyncio.TimeoutError):
--        with async_timeout.timeout(0.01):
-+        async with async_timeout.timeout(0.01):
-             await resp.receive()
- 
-     await resp.close()
-diff --git a/tests/test_helpers.py b/tests/test_helpers.py
-index 3367c24b..d36c7e4c 100644
---- a/tests/test_helpers.py
-+++ b/tests/test_helpers.py
-@@ -3,7 +3,6 @@ import base64
- import gc
- import os
- import platform
--import sys
- import tempfile
- from math import isclose, modf
- from unittest import mock
-@@ -391,48 +390,22 @@ async def test_weakref_handle_weak(loop) -> None:
-     await asyncio.sleep(0.1)
- 
- 
--def test_ceil_call_later() -> None:
--    cb = mock.Mock()
--    loop = mock.Mock()
--    loop.time.return_value = 10.1
--    helpers.call_later(cb, 10.1, loop)
--    loop.call_at.assert_called_with(21.0, cb)
--
--
--def test_ceil_call_later_no_timeout() -> None:
--    cb = mock.Mock()
--    loop = mock.Mock()
--    helpers.call_later(cb, 0, loop)
--    assert not loop.call_at.called
--
--
--async def test_ceil_timeout(loop) -> None:
--    with helpers.CeilTimeout(None, loop=loop) as timeout:
--        assert timeout._timeout is None
--        assert timeout._cancel_handler is None
-+async def test_ceil_timeout() -> None:
-+    async with helpers.ceil_timeout(None) as timeout:
-+        assert timeout.deadline is None
- 
- 
--def test_ceil_timeout_no_task(loop) -> None:
--    with pytest.raises(RuntimeError):
--        with helpers.CeilTimeout(10, loop=loop):
--            pass
--
--
--@pytest.mark.skipif(
--    sys.version_info < (3, 7), reason="TimerHandle.when() doesn't exist"
--)
--async def test_ceil_timeout_round(loop) -> None:
--    with helpers.CeilTimeout(7.5, loop=loop) as cm:
--        frac, integer = modf(cm._cancel_handler.when())
-+async def test_ceil_timeout_round() -> None:
-+    async with helpers.ceil_timeout(7.5) as cm:
-+        assert cm.deadline is not None
-+        frac, integer = modf(cm.deadline)
-         assert frac == 0
- 
- 
--@pytest.mark.skipif(
--    sys.version_info < (3, 7), reason="TimerHandle.when() doesn't exist"
--)
--async def test_ceil_timeout_small(loop) -> None:
--    with helpers.CeilTimeout(1.1, loop=loop) as cm:
--        frac, integer = modf(cm._cancel_handler.when())
-+async def test_ceil_timeout_small() -> None:
-+    async with helpers.ceil_timeout(1.1) as cm:
-+        assert cm.deadline is not None
-+        frac, integer = modf(cm.deadline)
-         # a chance for exact integer with zero fraction is negligible
-         assert frac != 0
- 
--- 
-2.25.1
-
diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index bdcb72a695..90dbd75994 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  7052a8e9877921d73da98d2b18c9a145  aiohttp-3.7.4.post0.tar.gz
-sha256  493d3299ebe5f5a7c66b9819eacdcfbbaaf1a8e84911ddffcdc48888497afecf  aiohttp-3.7.4.post0.tar.gz
+md5  4743950052dbaf5ce5c3622754ebceae  aiohttp-3.8.0.tar.gz
+sha256  d3b19d8d183bcfd68b25beebab8dc3308282fe2ca3d6ea3cb4cd101b3c279f8d  aiohttp-3.8.0.tar.gz
 # Locally computed sha256 checksums
-sha256  96627bed0ad08e9b2efa9f4e04e80837cd0550e7694a0fec33b1dab2550282ab  LICENSE.txt
+sha256  383c70c090b60ae81e035fe4fafed689b45c4421cd3bc355f1bd41ac208ccf3f  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index ef0ce8b635..03501a7527 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.7.4.post0
+PYTHON_AIOHTTP_VERSION = 3.8.0
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/99/f5/90ede947a3ce2d6de1614799f5fea4e93c19b6520a59dc5d2f64123b032f
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/48/1a/ba9542a545aed4b0b6ef128561f68dd3c2812ff5abfa9ed5b96547a728ea
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
