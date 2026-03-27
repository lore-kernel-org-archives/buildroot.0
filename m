Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EFD10ED64F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 09:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97C33612F8;
	Fri, 27 Mar 2026 09:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dUjvKQiyoa6i; Fri, 27 Mar 2026 09:59:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C7A0612F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605570;
	bh=r3lo0k2dPYBfm46cixnLRKtX5HRZ3c1YITFwrCwleTI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C2FBJUrGtMdc6+Hjucnu/rRAd1n2DPxJTDuxmWRiAWRMFsN0QkV7cPdykUQzYzlP4
	 JxCc3WVL6qhTXIJZtCFHhTaNW7w3xRzyNFPaXBObG79wphfoQVb2y3kw2d5Dc0Yc2l
	 /HwE+65XrhOkZ3Mb1DMO5j0xni1FRdrMmwdOPmwk59EKYlF69aaYTpPIG0lpYLMRY0
	 9nxQINMZDZBFrA7LHmdV5oXyostWwSAwifAruQjkYRDMdgBnUNv4nDQuUCKbiZcGax
	 +OOXWjQxw8Crj8ZQTn2Dtn/PbCJ/HXFZKYivth4X40BUaa9KyzaB9hXK59g6e011h1
	 cl2wssHTMJOKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C7A0612F1;
	Fri, 27 Mar 2026 09:59:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D11E1D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 888BA612A0
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6mQFQr7GzrLi for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 09:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 278E1612A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 278E1612A1
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 09:59:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DBFE7FBBE; Fri, 27 Mar 2026 09:59:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 10:57:17 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 470edc2923f285669e34a57cd223fd37ef25d9a2
X-Git-Newrev: 9a4cee3b339dbe741232e88ee12ec29bb7a710f0
X-Patchwork-Hint: ignore
Message-Id: <20260327095916.6DBFE7FBBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-tornado:
 patch CVE-2025-67724, CVE-2025-67725, CVE-2025-67726
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
Content-Type: multipart/mixed; boundary="===============6731103376618278045=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6731103376618278045==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9a4cee3b339dbe741232e88ee12ec29bb7a710f0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following vulnerabilities:

- CVE-2025-67724:
    Tornado is a Python web framework and asynchronous networking library.
    In versions 6.5.2 and below, the supplied reason phrase is used
    unescaped in HTTP headers (where it could be used for header
    injection) or in HTML in the default error page (where it could be
    used for XSS) and can be exploited by passing untrusted or malicious
    data into the reason argument. Used by both RequestHandler.set_status
    and tornado.web.HTTPError, the argument is designed to allow
    applications to pass custom "reason" phrases (the "Not Found" in
    HTTP/1.1 404 Not Found) to the HTTP status line (mainly for non-
    standard status codes). This issue is fixed in version 6.5.3.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2025-67724
 - https://github.com/tornadoweb/tornado/commit/9c163aebeaad9e6e7d28bac1f33580eb00b0e421

- CVE-2025-67725:
    Tornado is a Python web framework and asynchronous networking library.
    In versions 6.5.2 and below, a single maliciously crafted HTTP request
    can block the server's event loop for an extended period, caused by
    the HTTPHeaders.add method. The function accumulates values using
    string concatenation when the same header name is repeated, causing a
    Denial of Service (DoS).  Due to Python string immutability, each
    concatenation copies the entire string, resulting in O(n²) time
    complexity. The severity can vary from high if max_header_size has
    been increased from its default, to low if it has its default value of
    64KB. This issue is fixed in version 6.5.3.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-67725
  - https://github.com/tornadoweb/tornado/commit/771472cfdaeebc0d89a9cc46e249f8891a6b29cd

- CVE-2025-67726:
    Tornado is a Python web framework and asynchronous networking library.
    Versions 6.5.2 and below use an inefficient algorithm when parsing
    parameters for HTTP header values, potentially causing a DoS. The
    _parseparam function in httputil.py is used to parse specific HTTP
    header values, such as those in multipart/form-data and repeatedly
    calls string.count() within a nested loop while processing quoted
    semicolons. If an attacker sends a request with a large number of
    maliciously crafted parameters in a Content-Disposition header, the
    server's CPU usage increases quadratically (O(n²)) during parsing. Due
    to Tornado's single event loop architecture, a single malicious
    request can cause the entire server to become unresponsive for an
    extended period. This issue is fixed in version 6.5.3.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-67726
  - https://github.com/tornadoweb/tornado/commit/771472cfdaeebc0d89a9cc46e249f8891a6b29cd

(cherry picked from commit e59cc42d2f4b4fd557ceb4fef4b7865da17bf4b7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...arden-against-invalid-HTTP-reason-phrases.patch | 83 ++++++++++++++++++++++
 ...util-Fix-quadratic-behavior-in-parseparam.patch | 65 +++++++++++++++++
 package/python-tornado/python-tornado.mk           |  6 ++
 3 files changed, 154 insertions(+)

diff --git a/package/python-tornado/0002-web-Harden-against-invalid-HTTP-reason-phrases.patch b/package/python-tornado/0002-web-Harden-against-invalid-HTTP-reason-phrases.patch
new file mode 100644
index 0000000000..ac3c9806a2
--- /dev/null
+++ b/package/python-tornado/0002-web-Harden-against-invalid-HTTP-reason-phrases.patch
@@ -0,0 +1,83 @@
+From 9c163aebeaad9e6e7d28bac1f33580eb00b0e421 Mon Sep 17 00:00:00 2001
+From: Ben Darnell <ben@bendarnell.com>
+Date: Wed, 10 Dec 2025 15:15:25 -0500
+Subject: [PATCH] web: Harden against invalid HTTP reason phrases
+
+We allow applications to set custom reason phrases for the HTTP status
+line (to support custom status codes), but if this were exposed to
+untrusted data it could be exploited in various ways. This commit
+guards against invalid reason phrases in both HTTP headers and in
+error pages.
+
+CVE: CVE-2025-67724
+Upstream: https://github.com/tornadoweb/tornado/commit/9c163aebeaad9e6e7d28bac1f33580eb00b0e421
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ tornado/web.py           | 25 +++++++++++++++++++------
+ 1 files changed, 19 insertions(+), 6 deletions(-)
+
+diff --git a/tornado/web.py b/tornado/web.py
+index 2f702d6480..2351afdbe2 100644
+--- a/tornado/web.py
++++ b/tornado/web.py
+@@ -359,8 +359,10 @@ def set_status(self, status_code: int, reason: Optional[str] = None) -> None:
+ 
+         :arg int status_code: Response status code.
+         :arg str reason: Human-readable reason phrase describing the status
+-            code. If ``None``, it will be filled in from
+-            `http.client.responses` or "Unknown".
++            code (for example, the "Not Found" in ``HTTP/1.1 404 Not Found``).
++            Normally determined automatically from `http.client.responses`; this
++            argument should only be used if you need to use a non-standard
++            status code.
+ 
+         .. versionchanged:: 5.0
+ 
+@@ -369,6 +371,14 @@ def set_status(self, status_code: int, reason: Optional[str] = None) -> None:
+         """
+         self._status_code = status_code
+         if reason is not None:
++            if "<" in reason or not httputil._ABNF.reason_phrase.fullmatch(reason):
++                # Logically this would be better as an exception, but this method
++                # is called on error-handling paths that would need some refactoring
++                # to tolerate internal errors cleanly.
++                #
++                # The check for "<" is a defense-in-depth against XSS attacks (we also
++                # escape the reason when rendering error pages).
++                reason = "Unknown"
+             self._reason = escape.native_str(reason)
+         else:
+             self._reason = httputil.responses.get(status_code, "Unknown")
+@@ -1345,7 +1355,8 @@ def send_error(self, status_code: int = 500, **kwargs: Any) -> None:
+                 reason = exception.reason
+         self.set_status(status_code, reason=reason)
+         try:
+-            self.write_error(status_code, **kwargs)
++            if status_code != 304:
++                self.write_error(status_code, **kwargs)
+         except Exception:
+             app_log.error("Uncaught exception in write_error", exc_info=True)
+         if not self._finished:
+@@ -1373,7 +1384,7 @@ def write_error(self, status_code: int, **kwargs: Any) -> None:
+             self.finish(
+                 "<html><title>%(code)d: %(message)s</title>"
+                 "<body>%(code)d: %(message)s</body></html>"
+-                % {"code": status_code, "message": self._reason}
++                % {"code": status_code, "message": escape.xhtml_escape(self._reason)}
+             )
+ 
+     @property
+@@ -2520,9 +2531,11 @@ class HTTPError(Exception):
+         mode).  May contain ``%s``-style placeholders, which will be filled
+         in with remaining positional parameters.
+     :arg str reason: Keyword-only argument.  The HTTP "reason" phrase
+-        to pass in the status line along with ``status_code``.  Normally
++        to pass in the status line along with ``status_code`` (for example,
++        the "Not Found" in ``HTTP/1.1 404 Not Found``).  Normally
+         determined automatically from ``status_code``, but can be used
+-        to use a non-standard numeric code.
++        to use a non-standard numeric code. This is not a general-purpose
++        error message.
+     """
+ 
+     def __init__(
diff --git a/package/python-tornado/0003-httputil-Fix-quadratic-behavior-in-parseparam.patch b/package/python-tornado/0003-httputil-Fix-quadratic-behavior-in-parseparam.patch
new file mode 100644
index 0000000000..f1f4d5adbf
--- /dev/null
+++ b/package/python-tornado/0003-httputil-Fix-quadratic-behavior-in-parseparam.patch
@@ -0,0 +1,65 @@
+From 771472cfdaeebc0d89a9cc46e249f8891a6b29cd Mon Sep 17 00:00:00 2001
+From: Ben Darnell <ben@bendarnell.com>
+Date: Wed, 10 Dec 2025 10:55:02 -0500
+Subject: [PATCH] httputil: Fix quadratic behavior in _parseparam
+
+Prior to this change, _parseparam had O(n^2) behavior when parsing
+certain inputs, which could be a DoS vector. This change adapts
+logic from the equivalent function in the python standard library
+in https://github.com/python/cpython/pull/136072/files
+
+CVE: CVE-2025-67725
+CVE: CVE-2025-67726
+Upstream: https://github.com/tornadoweb/tornado/commit/771472cfdaeebc0d89a9cc46e249f8891a6b29cd
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ tornado/httputil.py           | 29 ++++++++++++++++++++++-------
+ tornado/test/httputil_test.py | 23 +++++++++++++++++++++++
+ 2 files changed, 45 insertions(+), 7 deletions(-)
+
+diff --git a/tornado/httputil.py b/tornado/httputil.py
+index 1c48db414..7fa30975d 100644
+--- a/tornado/httputil.py
++++ b/tornado/httputil.py
+@@ -1094,19 +1094,34 @@ def parse_response_start_line(line: str) -> ResponseStartLine:
+ # It has also been modified to support valueless parameters as seen in
+ # websocket extension negotiations, and to support non-ascii values in
+ # RFC 2231/5987 format.
++#
++# _parseparam has been further modified with the logic from
++# https://github.com/python/cpython/pull/136072/files
++# to avoid quadratic behavior when parsing semicolons in quoted strings.
++#
++# TODO: See if we can switch to email.message.Message for this functionality.
++# This is the suggested replacement for the cgi.py module now that cgi has
++# been removed from recent versions of Python.  We need to verify that
++# the email module is consistent with our existing behavior (and all relevant
++# RFCs for multipart/form-data) before making this change.
+ 
+ 
+ def _parseparam(s: str) -> Generator[str, None, None]:
+-    while s[:1] == ";":
+-        s = s[1:]
+-        end = s.find(";")
+-        while end > 0 and (s.count('"', 0, end) - s.count('\\"', 0, end)) % 2:
+-            end = s.find(";", end + 1)
++    start = 0
++    while s.find(";", start) == start:
++        start += 1
++        end = s.find(";", start)
++        ind, diff = start, 0
++        while end > 0:
++            diff += s.count('"', ind, end) - s.count('\\"', ind, end)
++            if diff % 2 == 0:
++                break
++            end, ind = ind, s.find(";", end + 1)
+         if end < 0:
+             end = len(s)
+-        f = s[:end]
++        f = s[start:end]
+         yield f.strip()
+-        s = s[end:]
++        start = end
+ 
+ 
+ def _parse_header(line: str) -> Tuple[str, Dict[str, str]]:
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index 0a33a57ed4..3e0b79443c 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -16,4 +16,10 @@ PYTHON_TORNADO_SETUP_TYPE = setuptools
 # 0001-httputil-raise-errors-instead-of-logging-in.patch
 PYTHON_TORNADO_IGNORE_CVES += CVE-2025-47287
 
+# 0002-web-Harden-against-invalid-HTTP-reason-phrases.patch
+PYTHON_TORNADO_IGNORE_CVES += CVE-2025-67724
+
+# 0003-httputil-Fix-quadratic-behavior-in-parseparam.patch
+PYTHON_TORNADO_IGNORE_CVES += CVE-2025-67725 CVE-2025-67726
+
 $(eval $(python-package))

--===============6731103376618278045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6731103376618278045==--
