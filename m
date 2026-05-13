Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F033ECD4F49
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C72D76111C;
	Fri, 15 May 2026 13:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMOR2ww-t7gc; Fri, 15 May 2026 13:28:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79BE761592
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851735;
	bh=LjWzIBWeB4sy2JyXM5bD0faSCXm3u8St5h+dLb8Txq4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EDUdirDwhtKvqecBNQtvRnH7LCDhltJjjoEIM2sTUtvBMVMp9fQtJ4CloA0bFfPxo
	 WGla/u0BjRWXzh7uYAKmODkUuXf5HQMfe2RQEIEgHssls9YV1Dfv57yYwzJQ1PcKaC
	 96/aL9aHIiUXNUL00Uzs+8U7DMCYf6MaDtmaP6+OFkccoBaU8NjvMPe588r4KwvmdO
	 ndbgETFJNPNnlE4wQR7NcHksZ0RXumXOtF+RXNarmAzRt6iCvgkQHiVKvRO3trtp50
	 6mA0YV1d/+kun2tvhzbMVg25k2vu/Rgomo7QsDD2ySKHydkVildVC5xnzF99rfEdjf
	 lIH1Dx7pi/86w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79BE761592;
	Fri, 15 May 2026 13:28:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10F4C36F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51C3161567
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6WsPknRz_7K for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:28:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A60B61562
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A60B61562
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD48A8634F; Fri, 15 May 2026 13:28:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 15:18:03 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d0f4287127c7d75e0bd06b1f140463ace3d6701e
X-Git-Newrev: aebe1b2054f1f470f32bb8028b1fe44caf28fc31
X-Patchwork-Hint: ignore
Message-Id: <20260515132816.BD48A8634F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-pyopenssl:
 patch CVE-2026-274{48, 59}
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aebe1b2054f1f470f32bb8028b1fe44caf28fc31
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- CVE-2026-27448:
    pyOpenSSL is a Python wrapper around the OpenSSL library. Starting in
    version 0.14.0 and prior to version 26.0.0, if a user provided
    callback to `set_tlsext_servername_callback` raised an unhandled
    exception, this would result in a connection being accepted. If a user
    was relying on this callback for any security-sensitive behavior, this
    could allow bypassing it. Starting in version 26.0.0, unhandled
    exceptions now result in rejecting the connection.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-27448
 - https://github.com/pyca/pyopenssl/commit/d41a814759a9fb49584ca8ab3f7295de49a85aa0

- CVE-2026-27459:
    pyOpenSSL is a Python wrapper around the OpenSSL library. Starting in
    version 22.0.0 and prior to version 26.0.0, if a user provided
    callback to `set_cookie_generate_callback` returned a cookie value
    greater than 256 bytes, pyOpenSSL would overflow an OpenSSL provided
    buffer. Starting in version 26.0.0, cookie values that are too long
    are now rejected.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-27459
 - https://github.com/pyca/pyopenssl/commit/57f09bb4bb051d3bc2a1abd36e9525313d5cd408

(cherry picked from commit 7bcba8498b257f949cecfb466e56f2891dac51d8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-pyopenssl/0001-CVE-2026-27448.patch | 50 ++++++++++++++++++++++
 package/python-pyopenssl/0002-CVE-2026-27459.patch | 46 ++++++++++++++++++++
 package/python-pyopenssl/python-pyopenssl.mk       |  6 +++
 3 files changed, 102 insertions(+)

diff --git a/package/python-pyopenssl/0001-CVE-2026-27448.patch b/package/python-pyopenssl/0001-CVE-2026-27448.patch
new file mode 100644
index 0000000000..e2940fc168
--- /dev/null
+++ b/package/python-pyopenssl/0001-CVE-2026-27448.patch
@@ -0,0 +1,50 @@
+From d41a814759a9fb49584ca8ab3f7295de49a85aa0 Mon Sep 17 00:00:00 2001
+From: Alex Gaynor <alex.gaynor@gmail.com>
+Date: Mon, 16 Feb 2026 21:04:37 -0500
+Subject: [PATCH] Handle exceptions in set_tlsext_servername_callback callbacks
+ (#1478)
+
+When the servername callback raises an exception, call sys.excepthook
+with the exception info and return SSL_TLSEXT_ERR_ALERT_FATAL to abort
+the handshake. Previously, exceptions would propagate uncaught through
+the CFFI callback boundary.
+
+https://claude.ai/code/session_01P7y1XmWkdtC5UcmZwGDvGi
+
+Co-authored-by: Claude <noreply@anthropic.com>
+
+Upstream: https://github.com/pyca/pyopenssl/commit/d41a814759a9fb49584ca8ab3f7295de49a85aa0
+CVE: CVE-2026-27448
+[thomas: backported, stripped tests and changelog]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/OpenSSL/SSL.py |  7 ++++++-
+ 1 files changed, 7 insertions(+)
+ 
+diff --git a/src/OpenSSL/SSL.py b/src/OpenSSL/SSL.py
+index 4db5240..a6263c4 100644
+--- a/src/OpenSSL/SSL.py
++++ b/src/OpenSSL/SSL.py
+@@ -2,6 +2,7 @@
+ 
+ import os
+ import socket
++import sys
+ import typing
+ import warnings
+ from collections.abc import Sequence
+@@ -1686,7 +1687,11 @@ class Context:
+ 
+         @wraps(callback)
+         def wrapper(ssl, alert, arg):  # type: ignore[no-untyped-def]
+-            callback(Connection._reverse_mapping[ssl])
++            try:
++                callback(Connection._reverse_mapping[ssl])
++            except Exception:
++                sys.excepthook(*sys.exc_info())
++                return _lib.SSL_TLSEXT_ERR_ALERT_FATAL
+             return 0
+ 
+         self._tlsext_servername_callback = _ffi.callback(
+-- 
+2.43.0
diff --git a/package/python-pyopenssl/0002-CVE-2026-27459.patch b/package/python-pyopenssl/0002-CVE-2026-27459.patch
new file mode 100644
index 0000000000..586c443093
--- /dev/null
+++ b/package/python-pyopenssl/0002-CVE-2026-27459.patch
@@ -0,0 +1,46 @@
+From 57f09bb4bb051d3bc2a1abd36e9525313d5cd408 Mon Sep 17 00:00:00 2001
+From: Alex Gaynor <alex.gaynor@gmail.com>
+Date: Wed, 18 Feb 2026 07:46:15 -0500
+Subject: [PATCH] Fix buffer overflow in DTLS cookie generation callback
+ (#1479)
+
+The cookie generate callback copied user-returned bytes into a
+fixed-size native buffer without enforcing a maximum length. A
+callback returning more than DTLS1_COOKIE_LENGTH bytes would overflow
+the OpenSSL-provided buffer, corrupting adjacent memory.
+
+Co-authored-by: Claude Opus 4.6 <noreply@anthropic.com>
+
+Upstream: https://github.com/pyca/pyopenssl/commit/57f09bb4bb051d3bc2a1abd36e9525313d5cd408
+CVE: CVE-2026-27459
+[thomas: backported, stripped tests and changelog]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/OpenSSL/SSL.py |  7 +++++++
+ 1 files changed, 7 insertions(+)
+ 
+diff --git a/src/OpenSSL/SSL.py b/src/OpenSSL/SSL.py
+index a6263c4..2e4da78 100644
+--- a/src/OpenSSL/SSL.py
++++ b/src/OpenSSL/SSL.py
+@@ -716,11 +716,18 @@ class _CookieGenerateCallbackHelper(_CallbackExceptionHelper):
+     def __init__(self, callback: _CookieGenerateCallback) -> None:
+         _CallbackExceptionHelper.__init__(self)
+ 
++        max_cookie_len = getattr(_lib, "DTLS1_COOKIE_LENGTH", 255)
++
+         @wraps(callback)
+         def wrapper(ssl, out, outlen):  # type: ignore[no-untyped-def]
+             try:
+                 conn = Connection._reverse_mapping[ssl]
+                 cookie = callback(conn)
++                if len(cookie) > max_cookie_len:
++                    raise ValueError(
++                        f"Cookie too long (got {len(cookie)} bytes, "
++                        f"max {max_cookie_len})"
++                    )
+                 out[0 : len(cookie)] = cookie
+                 outlen[0] = len(cookie)
+                 return 1
+-- 
+2.43.0
diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
index 33884f8d6c..2e1e93cb7e 100644
--- a/package/python-pyopenssl/python-pyopenssl.mk
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -13,4 +13,10 @@ PYTHON_PYOPENSSL_CPE_ID_VENDOR = pyopenssl
 PYTHON_PYOPENSSL_CPE_ID_PRODUCT = pyopenssl
 PYTHON_PYOPENSSL_SETUP_TYPE = setuptools
 
+# 0001-CVE-2026-27448.patch
+PYTHON_PYOPENSSL_IGNORE_CVES += CVE-2026-27448
+
+# 0002-CVE-2026-27459.patch
+PYTHON_PYOPENSSL_IGNORE_CVES += CVE-2026-27459
+
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
