Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33116CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0A1461520;
	Fri, 15 May 2026 13:28:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZD6pGAKm7Oa; Fri, 15 May 2026 13:28:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FCC561572
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851732;
	bh=MAfk81ZVqp0wn929E7v6dTw5EuwTmOq1MrufC28A02I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Yxb5mH213UM5u18QSrTFxWokiYWgjH1Yj7yyp/ujdSy4gAfVyndaY4RJvreXgjT7X
	 VHnvYo9HzPF8jOFCsg5WPPM6Q1en0XyWFsGjmvNEn+uyyfQUg+AVPMc4RSWk9Rxfyq
	 lZlr9Sm0++GiUJ8T/9LARZavQ9te9aop+pS0uETC7FCM6dtYKaK6nC43Zjavv/QM7G
	 mSvPJ4ePVEvKyQawle4dMPw4GkfgCHV7PrW46y0XgZUvUIoRVONB0WMxQS43d/Py9u
	 RswQpfz34bGWih14vByMHG/dbOae7jtnnSqNfzIsd/TBQUsDAyKofYutGzQBEn/hNF
	 IgseJmFGGReuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FCC561572;
	Fri, 15 May 2026 13:28:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E80C36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0056061565
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XDL553hmSZCC for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:28:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A7F26155E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A7F26155E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D2848634F; Fri, 15 May 2026 13:28:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 14:01:15 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0fd2b111a2d05debace18b069b231436d828a6d5
X-Git-Newrev: 5541178b129fde3e89d0c5bb7004928547dbe316
X-Patchwork-Hint: ignore
Message-Id: <20260515132816.8D2848634F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-cbor2:
 patch CVE-2025-6{4076, 8131} CVE-2026-26209
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
Content-Type: multipart/mixed; boundary="===============5939561070183719168=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5939561070183719168==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5541178b129fde3e89d0c5bb7004928547dbe316
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Thanks to OpenEmbedded Community for providing the patches:

https://github.com/openembedded/meta-openembedded/blob/scarthgap/meta-python/recipes-devtools/python/python3-cbor2/

- CVE-2025-64076:
    Multiple vulnerabilities exist in cbor2 through version 5.7.0 in the
    decode_definite_long_string() function of the C extension decoder
    (source/decoder.c): (1) Integer Underflow Leading to Out-of-Bounds
    Read (CWE-191, CWE-125): An incorrect variable reference and missing
    state reset in the chunk processing loop causes buffer_length to not
    be reset to zero after UTF-8 character consumption. This results in
    subsequent chunk_length calculations producing negative values (e.g.,
    chunk_length = 65536 - buffer_length), which are passed as signed
    integers to the read() method, potentially triggering unlimited read
    operations and resource exhaustion. (2) Memory Leak via Missing
    Reference Count Release (CWE-401): The main processing loop fails to
    release Python object references (Py_DECREF) for chunk objects
    allocated in each iteration. For CBOR strings longer than 65536 bytes,
    this causes cumulative memory leaks proportional to the payload size,
    enabling memory exhaustion attacks through repeated processing of
    large CBOR payloads. Both vulnerabilities can be exploited remotely
    without authentication by sending specially-crafted CBOR data
    containing definite-length text strings with multi-byte UTF-8
    characters positioned at 65536-byte chunk boundaries. Successful
    exploitation results in denial of service through process crashes
    (CBORDecodeEOF exceptions) or memory exhaustion. The vulnerabilities
    affect all applications using cbor2's C extension to process untrusted
    CBOR data, including web APIs, IoT data collectors, and message queue
    processors. Fixed in commit 851473490281f82d82560b2368284ef33cf6e8f9
    pushed with released version 5.7.1.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2025-64076

- CVE-2025-68131:
    cbor2 provides encoding and decoding for the Concise Binary Object
    Representation (CBOR) serialization format. Starting in version 3.0.0
    and prior to version 5.8.0, whhen a CBORDecoder instance is reused
    across multiple decode operations, values marked with the shareable
    tag (28) persist in memory and can be accessed by subsequent CBOR
    messages using the sharedref tag (29). This allows an attacker-
    controlled message to read data from previously decoded messages if
    the decoder is reused across trust boundaries. Version 5.8.0 patches
    the issue.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2025-68131

- CVE-2026-26209:
    cbor2 provides encoding and decoding for the Concise Binary Object
    Representation (CBOR) serialization format. Versions prior to 5.9.0
    are vulnerable to a Denial of Service (DoS) attack caused by
    uncontrolled recursion when decoding deeply nested CBOR structures.
    This vulnerability affects both the pure Python implementation and the
    C extension `_cbor2`. The C extension relies on Python's internal
    recursion limits `Py_EnterRecursiveCall` rather than a data-driven
    depth limit, meaning it still raises `RecursionError` and crashes the
    worker process when the limit is hit. While the library handles
    moderate nesting levels, it lacks a hard depth limit. An attacker can
    supply a crafted CBOR payload containing approximately 100,000 nested
    arrays `0x81`. When `cbor2.loads()` attempts to parse this, it hits
    the Python interpreter's maximum recursion depth or exhausts the
    stack, causing the process to crash with a `RecursionError`. Because
    the library does not enforce its own limits, it allows an external
    attacker to exhaust the host application's stack resource. In many web
    application servers (e.g., Gunicorn, Uvicorn) or task queues (Celery),
    an unhandled `RecursionError` terminates the worker process
    immediately. By sending a stream of these small (<100KB) malicious
    packets, an attacker can repeatedly crash worker processes, resulting
    in a complete Denial of Service for the application. Version 5.9.0
    patches the issue.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-26209

(cherry picked from commit b676a4f51b99ac9faf437eecc637293914809d88)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-cbor2/0001-CVE-2025-64076.patch |  41 +++
 package/python-cbor2/0002-CVE-2025-68131.patch | 366 ++++++++++++++++++++++++
 package/python-cbor2/0003-CVE-2026-26209.patch | 374 +++++++++++++++++++++++++
 package/python-cbor2/0004-CVE-2026-26209.patch | 368 ++++++++++++++++++++++++
 package/python-cbor2/python-cbor2.mk           |   9 +
 5 files changed, 1158 insertions(+)

diff --git a/package/python-cbor2/0001-CVE-2025-64076.patch b/package/python-cbor2/0001-CVE-2025-64076.patch
new file mode 100644
index 0000000000..a1cdff4c39
--- /dev/null
+++ b/package/python-cbor2/0001-CVE-2025-64076.patch
@@ -0,0 +1,41 @@
+From 2349197bea8ebd1bf57a68f4a6549d8fd7585e66 Mon Sep 17 00:00:00 2001
+From: Chenhao <24435007+tylzh97@users.noreply.github.com>
+Date: Wed, 22 Oct 2025 20:39:31 +0800
+Subject: [PATCH] Fix: bug in `decode_definite_long_string()` that causes
+ incorrect chunk length calculation (#265)
+
+Upstream: https://github.com/agronholm/cbor2/commit/2349197bea8ebd1bf57a68f4a6549d8fd7585e66
+CVE: CVE-2025-64076
+[thomas: stripped tests and changelog]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ source/decoder.c        |  8 +++++++-
+ 1 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/source/decoder.c b/source/decoder.c
+index 043210b3..8b6b842c 100644
+--- a/source/decoder.c
++++ b/source/decoder.c
+@@ -758,7 +758,7 @@ decode_definite_long_string(CBORDecoderObject *self, Py_ssize_t length)
+     char *buffer = NULL;
+     while (left) {
+         // Read up to 65536 bytes of data from the stream
+-        Py_ssize_t chunk_length = 65536 - buffer_size;
++        Py_ssize_t chunk_length = 65536 - buffer_length;
+         if (left < chunk_length)
+             chunk_length = left;
+ 
+@@ -828,7 +828,13 @@ decode_definite_long_string(CBORDecoderObject *self, Py_ssize_t length)
+                 memcpy(buffer, bytes_buffer + consumed, unconsumed);
+             }
+             buffer_length = unconsumed;
++        } else {
++            // All bytes consumed, reset buffer_length
++            buffer_length = 0;
+         }
++
++        Py_DECREF(chunk);
++        chunk = NULL;
+     }
+ 
+     if (ret && string_namespace_add(self, ret, length) == -1)
diff --git a/package/python-cbor2/0002-CVE-2025-68131.patch b/package/python-cbor2/0002-CVE-2025-68131.patch
new file mode 100644
index 0000000000..08977c9fcc
--- /dev/null
+++ b/package/python-cbor2/0002-CVE-2025-68131.patch
@@ -0,0 +1,366 @@
+From f1d701cd2c411ee40bb1fe383afe7f365f35abf0 Mon Sep 17 00:00:00 2001
+From: Andreas Eriksen <andreer@vespa.ai>
+Date: Thu, 18 Dec 2025 16:48:26 +0100
+Subject: [PATCH] Merge commit from fork
+
+* track depth of recursive encode/decode, clear shared refs on start
+
+* test that shared refs are cleared on start
+
+* add fix-shared-state-reset to version history
+
+* clear shared state _after_ encode/decode
+
+* use PY_SSIZE_T_MAX to clear shareables list
+
+* use context manager for python decoder depth tracking
+
+* use context manager for python encoder depth tracking
+
+CVE: CVE-2025-68131
+Upstream: https://github.com/agronholm/cbor2/commit/f1d701cd2c411ee40bb1fe383afe7f365f35abf0
+[thomas: backport, stripped tests and changelog]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ cbor2/_decoder.py       | 38 +++++++++++++++++-----
+ cbor2/_encoder.py       | 44 +++++++++++++++++++++-----
+ source/decoder.c        | 28 ++++++++++++++++-
+ source/decoder.h        |  1 +
+ source/encoder.c        | 23 ++++++++++++--
+ source/encoder.h        |  1 +
+ 6 files changed, 255 insertions(+), 17 deletions(-)
+
+diff --git a/cbor2/_decoder.py b/cbor2/_decoder.py
+index 42a97400..b5524920 100644
+--- a/cbor2/_decoder.py
++++ b/cbor2/_decoder.py
+@@ -5,6 +5,7 @@
+ import sys
+ from codecs import getincrementaldecoder
+ from collections.abc import Callable, Mapping, Sequence
++from contextlib import contextmanager
+ from datetime import date, datetime, timedelta, timezone
+ from io import BytesIO
+ from typing import IO, TYPE_CHECKING, Any, TypeVar, cast, overload
+@@ -59,6 +60,7 @@ class CBORDecoder:
+         "_immutable",
+         "_str_errors",
+         "_stringref_namespace",
++        "_decode_depth",
+     )
+ 
+     _fp: IO[bytes]
+@@ -100,6 +102,7 @@ def __init__(
+         self._shareables: list[object] = []
+         self._stringref_namespace: list[str | bytes] | None = None
+         self._immutable = False
++        self._decode_depth = 0
+ 
+     @property
+     def immutable(self) -> bool:
+@@ -225,13 +228,33 @@ def _decode(self, immutable: bool = False, unshared: bool = False) -> Any:
+             if unshared:
+                 self._share_index = old_index
+ 
++    @contextmanager
++    def _decoding_context(self):
++        """
++        Context manager for tracking decode depth and clearing shared state.
++
++        Shared state is cleared at the end of each top-level decode to prevent
++        shared references from leaking between independent decode operations.
++        Nested calls (from hooks) must preserve the state.
++        """
++        self._decode_depth += 1
++        try:
++            yield
++        finally:
++            self._decode_depth -= 1
++            assert self._decode_depth >= 0
++            if self._decode_depth == 0:
++                self._shareables.clear()
++                self._share_index = None
++
+     def decode(self) -> object:
+         """
+         Decode the next value from the stream.
+ 
+         :raises CBORDecodeError: if there is any problem decoding the stream
+         """
+-        return self._decode()
++        with self._decoding_context():
++            return self._decode()
+ 
+     def decode_from_bytes(self, buf: bytes) -> object:
+         """
+@@ -242,12 +265,13 @@ def decode_from_bytes(self, buf: bytes) -> object:
+         object needs to be decoded separately from the rest but while still
+         taking advantage of the shared value registry.
+         """
+-        with BytesIO(buf) as fp:
+-            old_fp = self.fp
+-            self.fp = fp
+-            retval = self._decode()
+-            self.fp = old_fp
+-            return retval
++        with self._decoding_context():
++            with BytesIO(buf) as fp:
++                old_fp = self.fp
++                self.fp = fp
++                retval = self._decode()
++                self.fp = old_fp
++                return retval
+ 
+     @overload
+     def _decode_length(self, subtype: int) -> int: ...
+diff --git a/cbor2/_encoder.py b/cbor2/_encoder.py
+index fe65763d..5b9609c7 100644
+--- a/cbor2/_encoder.py
++++ b/cbor2/_encoder.py
+@@ -123,6 +123,7 @@ class CBOREncoder:
+         "string_referencing",
+         "string_namespacing",
+         "_string_references",
++        "_encode_depth",
+     )
+ 
+     _fp: IO[bytes]
+@@ -183,6 +184,7 @@ def __init__(
+             int, tuple[object, int | None]
+         ] = {}  # indexes used for value sharing
+         self._string_references: dict[str | bytes, int] = {}  # indexes used for string references
++        self._encode_depth = 0
+         self._encoders = default_encoders.copy()
+         if canonical:
+             self._encoders.update(canonical_encoders)
+@@ -298,6 +300,24 @@ def write(self, data: bytes) -> None:
+         """
+         self._fp_write(data)
+ 
++    @contextmanager
++    def _encoding_context(self):
++        """
++        Context manager for tracking encode depth and clearing shared state.
++
++        Shared state is cleared at the end of each top-level encode to prevent
++        shared references from leaking between independent encode operations.
++        Nested calls (from hooks) must preserve the state.
++        """
++        self._encode_depth += 1
++        try:
++            yield
++        finally:
++            self._encode_depth -= 1
++            if self._encode_depth == 0:
++                self._shared_containers.clear()
++                self._string_references.clear()
++
+     def encode(self, obj: Any) -> None:
+         """
+         Encode the given object using CBOR.
+@@ -305,6 +325,16 @@ def encode(self, obj: Any) -> None:
+         :param obj:
+             the object to encode
+         """
++        with self._encoding_context():
++            self._encode_value(obj)
++
++    def _encode_value(self, obj: Any) -> None:
++        """
++        Internal fast path for encoding - used by built-in encoders.
++
++        External code should use encode() instead, which properly manages
++        shared state between independent encode operations.
++        """
+         obj_type = obj.__class__
+         encoder = self._encoders.get(obj_type) or self._find_encoder(obj_type) or self._default
+         if not encoder:
+@@ -448,7 +478,7 @@ def encode_string(self, value: str) -> None:
+     def encode_array(self, value: Sequence[Any]) -> None:
+         self.encode_length(4, len(value))
+         for item in value:
+-            self.encode(item)
++            self._encode_value(item)
+ 
+     @container_encoder
+     def encode_map(self, value: Mapping[Any, Any]) -> None:
+@@ -454,8 +484,8 @@ def encode_array(self, value: Sequence[Any]) -> None:
+     def encode_map(self, value: Mapping[Any, Any]) -> None:
+         self.encode_length(5, len(value))
+         for key, val in value.items():
+-            self.encode(key)
+-            self.encode(val)
++            self._encode_value(key)
++            self._encode_value(val)
+ 
+     def encode_sortable_key(self, value: Any) -> tuple[int, bytes]:
+         """
+@@ -477,10 +507,10 @@ def encode_canonical_map(self, value: Mapping[Any, Any]) -> None:
+                 # String referencing requires that the order encoded is
+                 # the same as the order emitted so string references are
+                 # generated after an order is determined
+-                self.encode(realkey)
++                self._encode_value(realkey)
+             else:
+                 self._fp_write(sortkey[1])
+-            self.encode(value)
++            self._encode_value(value)
+ 
+     def encode_semantic(self, value: CBORTag) -> None:
+         # Nested string reference domains are distinct
+@@ -491,7 +521,7 @@ def encode_semantic(self, value: CBORTag) -> None:
+             self._string_references = {}
+ 
+         self.encode_length(6, value.tag)
+-        self.encode(value.value)
++        self._encode_value(value.value)
+ 
+         self.string_referencing = old_string_referencing
+         self._string_references = old_string_references
+@@ -554,7 +584,7 @@ def encode_decimal(self, value: Decimal) -> None:
+     def encode_stringref(self, value: str | bytes) -> None:
+         # Semantic tag 25
+         if not self._stringref(value):
+-            self.encode(value)
++            self._encode_value(value)
+ 
+     def encode_rational(self, value: Fraction) -> None:
+         # Semantic tag 30
+diff --git a/source/decoder.c b/source/decoder.c
+index 8b6b842c..b0bdb9a2 100644
+--- a/source/decoder.c
++++ b/source/decoder.c
+@@ -142,6 +142,7 @@ CBORDecoder_new(PyTypeObject *type, PyObject *args, PyObject *kwargs)
+         self->str_errors = PyBytes_FromString("strict");
+         self->immutable = false;
+         self->shared_index = -1;
++        self->decode_depth = 0;
+     }
+     return (PyObject *) self;
+ error:
+@@ -2058,11 +2059,30 @@ decode(CBORDecoderObject *self, DecodeOptions options)
+ }
+ 
+ 
++// Reset shared state at the end of each top-level decode to prevent
++// shared references from leaking between independent decode operations.
++// Nested calls (from hooks) must preserve the state.
++static inline void
++clear_shareable_state(CBORDecoderObject *self)
++{
++    PyList_SetSlice(self->shareables, 0, PY_SSIZE_T_MAX, NULL);
++    self->shared_index = -1;
++}
++
++
+ // CBORDecoder.decode(self) -> obj
+ PyObject *
+ CBORDecoder_decode(CBORDecoderObject *self)
+ {
+-    return decode(self, DECODE_NORMAL);
++    PyObject *ret;
++    self->decode_depth++;
++    ret = decode(self, DECODE_NORMAL);
++    self->decode_depth--;
++    assert(self->decode_depth >= 0);
++    if (self->decode_depth == 0) {
++        clear_shareable_state(self);
++    }
++    return ret;
+ }
+ 
+ 
+@@ -2075,6 +2095,7 @@ CBORDecoder_decode_from_bytes(CBORDecoderObject *self, PyObject *data)
+     if (!_CBOR2_BytesIO && _CBOR2_init_BytesIO() == -1)
+         return NULL;
+ 
++    self->decode_depth++;
+     save_read = self->read;
+     buf = PyObject_CallFunctionObjArgs(_CBOR2_BytesIO, data, NULL);
+     if (buf) {
+@@ -2086,6 +2107,11 @@ CBORDecoder_decode_from_bytes(CBORDecoderObject *self, PyObject *data)
+         Py_DECREF(buf);
+     }
+     self->read = save_read;
++    self->decode_depth--;
++    assert(self->decode_depth >= 0);
++    if (self->decode_depth == 0) {
++        clear_shareable_state(self);
++    }
+     return ret;
+ }
+ 
+diff --git a/source/decoder.h b/source/decoder.h
+index 6bb6d52f..a2f1bcbe 100644
+--- a/source/decoder.h
++++ b/source/decoder.h
+@@ -13,6 +13,7 @@ typedef struct {
+     PyObject *str_errors;
+     bool immutable;
+     Py_ssize_t shared_index;
++    Py_ssize_t decode_depth;
+ } CBORDecoderObject;
+ 
+ extern PyTypeObject CBORDecoderType;
+diff --git a/source/encoder.c b/source/encoder.c
+index 4dc3c6b3..e87670d6 100644
+--- a/source/encoder.c
++++ b/source/encoder.c
+@@ -113,6 +113,7 @@ CBOREncoder_new(PyTypeObject *type, PyObject *args, PyObject *kwargs)
+         self->shared_handler = NULL;
+         self->string_referencing = false;
+         self->string_namespacing = false;
++        self->encode_depth = 0;
+     }
+     return (PyObject *) self;
+ }
+@@ -2027,17 +2028,35 @@ encode(CBOREncoderObject *self, PyObject *value)
+ }
+ 
+ 
++// Reset shared state at the end of each top-level encode to prevent
++// shared references from leaking between independent encode operations.
++// Nested calls (from hooks or recursive encoding) must preserve the state.
++static inline void
++clear_shared_state(CBOREncoderObject *self)
++{
++    PyDict_Clear(self->shared);
++    PyDict_Clear(self->string_references);
++}
++
++
+ // CBOREncoder.encode(self, value)
+ PyObject *
+ CBOREncoder_encode(CBOREncoderObject *self, PyObject *value)
+ {
+     PyObject *ret;
+ 
+-    // TODO reset shared dict?
+-    if (Py_EnterRecursiveCall(" in CBOREncoder.encode"))
++    self->encode_depth++;
++    if (Py_EnterRecursiveCall(" in CBOREncoder.encode")) {
++        self->encode_depth--;
+         return NULL;
++    }
+     ret = encode(self, value);
+     Py_LeaveRecursiveCall();
++    self->encode_depth--;
++    assert(self->encode_depth >= 0);
++    if (self->encode_depth == 0) {
++        clear_shared_state(self);
++    }
+     return ret;
+ }
+ 
+diff --git a/source/encoder.h b/source/encoder.h
+index abc6560d..915f1f21 100644
+--- a/source/encoder.h
++++ b/source/encoder.h
+@@ -24,6 +24,7 @@ typedef struct {
+     bool value_sharing;
+     bool string_referencing;
+     bool string_namespacing;
++    Py_ssize_t encode_depth;
+ } CBOREncoderObject;
+ 
+ extern PyTypeObject CBOREncoderType;
diff --git a/package/python-cbor2/0003-CVE-2026-26209.patch b/package/python-cbor2/0003-CVE-2026-26209.patch
new file mode 100644
index 0000000000..652f38190a
--- /dev/null
+++ b/package/python-cbor2/0003-CVE-2026-26209.patch
@@ -0,0 +1,374 @@
+From fb4ee1612a8a1ac0dbd8cf2f2f6f931a4e06d824 Mon Sep 17 00:00:00 2001
+From: Andreas Eriksen <andreer@vespa.ai>
+Date: Mon, 29 Dec 2025 14:01:52 +0100
+Subject: [PATCH] Added a read-ahead buffer to the C decoder (#268)
+
+Upstream: https://github.com/agronholm/cbor2/commit/fb4ee1612a8a1ac0dbd8cf2f2f6f931a4e06d824.patch
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+Upstream: https://github.com/openembedded/meta-openembedded/blob/scarthgap/meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209-pre1.patch
+CVE: CVE-2026-26209
+[thomas: backport, stripped tests and changelog]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ source/decoder.c        | 225 ++++++++++++++++++++++++++++++++--------
+ source/decoder.h        |   9 ++
+2 files changed, 281 insertions(+), 44 deletions(-)
+
+diff --git a/source/decoder.c b/source/decoder.c
+index 4f7ee5d..9cd1596 100644
+--- a/source/decoder.c
++++ b/source/decoder.c
+@@ -42,6 +42,7 @@ enum DecodeOption {
+ typedef uint8_t DecodeOptions;
+ 
+ static int _CBORDecoder_set_fp(CBORDecoderObject *, PyObject *, void *);
++static int _CBORDecoder_set_fp_with_read_size(CBORDecoderObject *, PyObject *, Py_ssize_t);
+ static int _CBORDecoder_set_tag_hook(CBORDecoderObject *, PyObject *, void *);
+ static int _CBORDecoder_set_object_hook(CBORDecoderObject *, PyObject *, void *);
+ static int _CBORDecoder_set_str_errors(CBORDecoderObject *, PyObject *, void *);
+@@ -101,6 +102,13 @@ CBORDecoder_clear(CBORDecoderObject *self)
+     Py_CLEAR(self->shareables);
+     Py_CLEAR(self->stringref_namespace);
+     Py_CLEAR(self->str_errors);
++    if (self->readahead) {
++        PyMem_Free(self->readahead);
++        self->readahead = NULL;
++        self->readahead_size = 0;
++    }
++    self->read_pos = 0;
++    self->read_len = 0;
+     return 0;
+ }
+ 
+@@ -143,6 +151,10 @@ CBORDecoder_new(PyTypeObject *type, PyObject *args, PyObject *kwargs)
+         self->immutable = false;
+         self->shared_index = -1;
+         self->decode_depth = 0;
++        self->readahead = NULL;
++        self->readahead_size = 0;
++        self->read_pos = 0;
++        self->read_len = 0;
+     }
+     return (PyObject *) self;
+ error:
+@@ -152,21 +164,27 @@ error:
+ 
+ 
+ // CBORDecoder.__init__(self, fp=None, tag_hook=None, object_hook=None,
+-//                      str_errors='strict')
++//                      str_errors='strict', read_size=4096)
+ int
+ CBORDecoder_init(CBORDecoderObject *self, PyObject *args, PyObject *kwargs)
+ {
+     static char *keywords[] = {
+-        "fp", "tag_hook", "object_hook", "str_errors", NULL
++        "fp", "tag_hook", "object_hook", "str_errors", "read_size", NULL
+     };
+     PyObject *fp = NULL, *tag_hook = NULL, *object_hook = NULL,
+              *str_errors = NULL;
++    Py_ssize_t read_size = CBOR2_DEFAULT_READ_SIZE;
+ 
+-    if (!PyArg_ParseTupleAndKeywords(args, kwargs, "O|OOO", keywords,
+-                &fp, &tag_hook, &object_hook, &str_errors))
++    if (!PyArg_ParseTupleAndKeywords(args, kwargs, "O|OOOn", keywords,
++                &fp, &tag_hook, &object_hook, &str_errors, &read_size))
+         return -1;
+ 
+-    if (_CBORDecoder_set_fp(self, fp, NULL) == -1)
++    if (read_size < 1) {
++        PyErr_SetString(PyExc_ValueError, "read_size must be at least 1");
++        return -1;
++    }
++
++    if (_CBORDecoder_set_fp_with_read_size(self, fp, read_size) == -1)
+         return -1;
+     if (tag_hook && _CBORDecoder_set_tag_hook(self, tag_hook, NULL) == -1)
+         return -1;
+@@ -197,11 +215,12 @@ _CBORDecoder_get_fp(CBORDecoderObject *self, void *closure)
+ }
+ 
+ 
+-// CBORDecoder._set_fp(self, value)
++// Internal: set fp with configurable read size
+ static int
+-_CBORDecoder_set_fp(CBORDecoderObject *self, PyObject *value, void *closure)
++_CBORDecoder_set_fp_with_read_size(CBORDecoderObject *self, PyObject *value, Py_ssize_t read_size)
+ {
+     PyObject *tmp, *read;
++    char *new_buffer = NULL;
+ 
+     if (!value) {
+         PyErr_SetString(PyExc_AttributeError, "cannot delete fp attribute");
+@@ -214,13 +233,43 @@ _CBORDecoder_set_fp(CBORDecoderObject *self, PyObject *value, void *closure)
+         return -1;
+     }
+ 
++    if (self->readahead == NULL || self->readahead_size != read_size) {
++        new_buffer = (char *)PyMem_Malloc(read_size);
++        if (!new_buffer) {
++            Py_DECREF(read);
++            PyErr_NoMemory();
++            return -1;
++        }
++    }
++
+     // See notes in encoder.c / _CBOREncoder_set_fp
+     tmp = self->read;
+     self->read = read;
+     Py_DECREF(tmp);
++
++    self->read_pos = 0;
++    self->read_len = 0;
++
++    // Replace buffer (size changed or was NULL)
++    if (new_buffer) {
++        PyMem_Free(self->readahead);
++        self->readahead = new_buffer;
++        self->readahead_size = read_size;
++    }
++
+     return 0;
+ }
+ 
++// CBORDecoder._set_fp(self, value) - property setter uses default read size
++static int
++_CBORDecoder_set_fp(CBORDecoderObject *self, PyObject *value, void *closure)
++{
++    // Use existing readahead_size if already allocated, otherwise use default
++    Py_ssize_t read_size = (self->readahead_size > 0) ?
++                           self->readahead_size : CBOR2_DEFAULT_READ_SIZE;
++    return _CBORDecoder_set_fp_with_read_size(self, value, read_size);
++}
++
+ 
+ // CBORDecoder._get_tag_hook(self)
+ static PyObject *
+@@ -376,45 +425,93 @@ raise_from(PyObject *new_exc_type, const char *message) {
+     }
+ }
+ 
+-static PyObject *
+-fp_read_object(CBORDecoderObject *self, const Py_ssize_t size)
++// Read directly into caller's buffer (bypassing readahead buffer)
++static Py_ssize_t
++fp_read_bytes(CBORDecoderObject *self, char *buf, Py_ssize_t size)
+ {
+-    PyObject *ret = NULL;
+-    PyObject *obj, *size_obj;
+-    size_obj = PyLong_FromSsize_t(size);
+-    if (size_obj) {
+-        obj = PyObject_CallFunctionObjArgs(self->read, size_obj, NULL);
+-        Py_DECREF(size_obj);
+-        if (obj) {
+-            assert(PyBytes_CheckExact(obj));
+-            if (PyBytes_GET_SIZE(obj) == (Py_ssize_t) size) {
+-                ret = obj;
++    PyObject *size_obj = PyLong_FromSsize_t(size);
++    if (!size_obj)
++        return -1;
++
++    PyObject *obj = PyObject_CallFunctionObjArgs(self->read, size_obj, NULL);
++    Py_DECREF(size_obj);
++    if (!obj)
++        return -1;
++
++    assert(PyBytes_CheckExact(obj));
++    Py_ssize_t bytes_read = PyBytes_GET_SIZE(obj);
++    if (bytes_read > 0)
++        memcpy(buf, PyBytes_AS_STRING(obj), bytes_read);
++
++    Py_DECREF(obj);
++    return bytes_read;
++}
++
++// Read into caller's buffer using the readahead buffer
++static int
++fp_read(CBORDecoderObject *self, char *buf, const Py_ssize_t size)
++{
++    Py_ssize_t available, to_copy, remaining, total_copied;
++
++    remaining = size;
++    total_copied = 0;
++
++    while (remaining > 0) {
++        available = self->read_len - self->read_pos;
++
++        if (available > 0) {
++            // Copy from buffer
++            to_copy = (available < remaining) ? available : remaining;
++            memcpy(buf + total_copied, self->readahead + self->read_pos, to_copy);
++            self->read_pos += to_copy;
++            total_copied += to_copy;
++            remaining -= to_copy;
++        } else {
++            Py_ssize_t bytes_read;
++
++            if (remaining >= self->readahead_size) {
++                // Large remaining: read directly into destination, bypass buffer
++                bytes_read = fp_read_bytes(self, buf + total_copied, remaining);
++                if (bytes_read > 0) {
++                    total_copied += bytes_read;
++                    remaining -= bytes_read;
++                }
+             } else {
+-                PyErr_Format(
+-                    _CBOR2_CBORDecodeEOF,
+-                    "premature end of stream (expected to read %zd bytes, "
+-                    "got %zd instead)", size, PyBytes_GET_SIZE(obj));
+-                Py_DECREF(obj);
++                // Small remaining: refill buffer
++                self->read_pos = 0;
++                self->read_len = 0;
++                bytes_read = fp_read_bytes(self, self->readahead, self->readahead_size);
++                if (bytes_read > 0)
++                    self->read_len = bytes_read;
++            }
++
++            if (bytes_read <= 0) {
++                if (bytes_read == 0)
++                    PyErr_Format(
++                        _CBOR2_CBORDecodeEOF,
++                        "premature end of stream (expected to read %zd bytes, "
++                        "got %zd instead)", size, total_copied);
++                return -1;
+             }
+         }
+     }
+-    return ret;
+-}
+ 
++    return 0;
++}
+ 
+-static int
+-fp_read(CBORDecoderObject *self, char *buf, const Py_ssize_t size)
++// Read and return as PyBytes object
++static PyObject *
++fp_read_object(CBORDecoderObject *self, const Py_ssize_t size)
+ {
+-    int ret = -1;
+-    PyObject *obj = fp_read_object(self, size);
+-    if (obj) {
+-        char *data = PyBytes_AS_STRING(obj);
+-        if (data) {
+-            memcpy(buf, data, size);
+-            ret = 0;
+-        }
+-        Py_DECREF(obj);
++    PyObject *ret = PyBytes_FromStringAndSize(NULL, size);
++    if (!ret)
++        return NULL;
++
++    if (fp_read(self, PyBytes_AS_STRING(ret), size) == -1) {
++        Py_DECREF(ret);
++        return NULL;
+     }
++
+     return ret;
+ }
+ 
+@@ -2091,23 +2188,55 @@ static PyObject *
+ CBORDecoder_decode_from_bytes(CBORDecoderObject *self, PyObject *data)
+ {
+     PyObject *save_read, *buf, *ret = NULL;
++    bool is_nested = (self->decode_depth > 0);
++    Py_ssize_t save_read_pos = 0, save_read_len = 0;
++    char *save_buffer = NULL;
+ 
+     if (!_CBOR2_BytesIO && _CBOR2_init_BytesIO() == -1)
+         return NULL;
+ 
++    buf = PyObject_CallFunctionObjArgs(_CBOR2_BytesIO, data, NULL);
++    if (!buf)
++        return NULL;
++
+     self->decode_depth++;
+     save_read = self->read;
+-    buf = PyObject_CallFunctionObjArgs(_CBOR2_BytesIO, data, NULL);
+-    if (buf) {
+-        self->read = PyObject_GetAttr(buf, _CBOR2_str_read);
+-        if (self->read) {
+-            ret = decode(self, DECODE_NORMAL);
+-            Py_DECREF(self->read);
++    Py_INCREF(save_read);  // Keep alive while we use a different read method
++    save_read_pos = self->read_pos;
++    save_read_len = self->read_len;
++
++    // Save buffer pointer if nested
++    if (is_nested) {
++        save_buffer = self->readahead;
++        self->readahead = NULL;  // Prevent setter from freeing saved buffer
++    }
++
++    // Set up BytesIO decoder - setter handles buffer allocation
++    if (_CBORDecoder_set_fp_with_read_size(self, buf, self->readahead_size) == -1) {
++        if (is_nested) {
++            PyMem_Free(self->readahead);
++            self->readahead = save_buffer;
+         }
++        Py_DECREF(save_read);
+         Py_DECREF(buf);
++        self->decode_depth--;
++        return NULL;
+     }
+-    self->read = save_read;
++
++    ret = decode(self, DECODE_NORMAL);
++
++    Py_XDECREF(self->read);  // Decrement BytesIO read method
++    self->read = save_read;  // Restore saved read (already has correct refcount)
++    Py_DECREF(buf);
+     self->decode_depth--;
++
++    if (is_nested) {
++        PyMem_Free(self->readahead);
++        self->readahead = save_buffer;
++    }
++    self->read_pos = save_read_pos;
++    self->read_len = save_read_len;
++
+     assert(self->decode_depth >= 0);
+     if (self->decode_depth == 0) {
+         clear_shareable_state(self);
+@@ -2257,6 +2386,14 @@ PyDoc_STRVAR(CBORDecoder__doc__,
+ "    dictionary. This callback is invoked for each deserialized\n"
+ "    :class:`dict` object. The return value is substituted for the dict\n"
+ "    in the deserialized output.\n"
++":param read_size:\n"
++"    the size of the read buffer (default 4096). The decoder reads from\n"
++"    the stream in chunks of this size for performance. This means the\n"
++"    stream position may advance beyond the bytes actually decoded. For\n"
++"    large values (bytestrings, text strings), reads may be larger than\n"
++"    ``read_size``. Code that needs to read from the stream after\n"
++"    decoding should use :meth:`decode_from_bytes` instead, or set\n"
++"    ``read_size=1`` to disable buffering (at a performance cost).\n"
+ "\n"
+ ".. _CBOR: https://cbor.io/\n"
+ );
+diff --git a/source/decoder.h b/source/decoder.h
+index a2f1bcb..a2f4bf1 100644
+--- a/source/decoder.h
++++ b/source/decoder.h
+@@ -3,6 +3,9 @@
+ #include <stdbool.h>
+ #include <stdint.h>
+ 
++// Default readahead buffer size for streaming reads
++#define CBOR2_DEFAULT_READ_SIZE 4096
++
+ typedef struct {
+     PyObject_HEAD
+     PyObject *read;    // cached read() method of fp
+@@ -14,6 +17,12 @@ typedef struct {
+     bool immutable;
+     Py_ssize_t shared_index;
+     Py_ssize_t decode_depth;
++
++    // Readahead buffer for streaming
++    char *readahead;            // allocated buffer
++    Py_ssize_t readahead_size;  // size of allocated buffer
++    Py_ssize_t read_pos;        // current position in buffer
++    Py_ssize_t read_len;        // valid bytes in buffer
+ } CBORDecoderObject;
+ 
+ extern PyTypeObject CBORDecoderType;
diff --git a/package/python-cbor2/0004-CVE-2026-26209.patch b/package/python-cbor2/0004-CVE-2026-26209.patch
new file mode 100644
index 0000000000..423e4ecb24
--- /dev/null
+++ b/package/python-cbor2/0004-CVE-2026-26209.patch
@@ -0,0 +1,368 @@
+From e61a5f365ba610d5907a0ae1bc72769bba34294b Mon Sep 17 00:00:00 2001
+From: Andreas Eriksen <andreer@vespa.ai>
+Date: Sat, 28 Feb 2026 22:21:06 +0100
+Subject: [PATCH] Set default read_size to 1 for backwards compatibility (#275)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The buffered reads introduced in 5.8.0 could cause issues when code needs to access the stream position after decoding. This changes the default back to 1 (matching 5.7.1 behavior) while allowing users to opt-in to faster decoding by passing read_size=4096.
+
+Implementation details:
+- Use function pointer dispatch to eliminate runtime checks for read_size=1
+- Skip buffer allocation entirely for unbuffered path
+- Add read_size parameter to load() and loads() for API completeness
+
+Co-authored-by: Alex Grönholm <alex.gronholm@nextday.fi>
+
+Upstream: https://github.com/agronholm/cbor2/commit/e61a5f365ba610d5907a0ae1bc72769bba34294b.patch
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+Upstream: https://github.com/openembedded/meta-openembedded/blob/scarthgap/meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209.patch
+CVE: CVE-2026-26209
+[thomas: backport, stripped tests and changelog]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ cbor2/_decoder.py       | 33 +++++++++++++++--
+ source/decoder.c        | 78 ++++++++++++++++++++++++++++-------------
+ source/decoder.h        | 16 +++++++--
+ tests/test_decoder.py   | 15 ++++++++
+ 6 files changed, 130 insertions(+), 30 deletions(-)
+
+diff --git a/cbor2/_decoder.py b/cbor2/_decoder.py
+index f3b6849d..605340e0 100644
+--- a/cbor2/_decoder.py
++++ b/cbor2/_decoder.py
+@@ -72,6 +72,7 @@ def __init__(
+         tag_hook: Callable[[CBORDecoder, CBORTag], Any] | None = None,
+         object_hook: Callable[[CBORDecoder, dict[Any, Any]], Any] | None = None,
+         str_errors: Literal["strict", "error", "replace"] = "strict",
++        read_size: int = 1,
+     ):
+         """
+         :param fp:
+@@ -90,6 +91,13 @@ def __init__(
+         :param str_errors:
+             determines how to handle unicode decoding errors (see the `Error Handlers`_
+             section in the standard library documentation for details)
++        :param read_size:
++            the minimum number of bytes to read at a time.
++            Setting this to a higher value like 4096 improves performance,
++            but is likely to read past the end of the CBOR value, advancing the stream
++            position beyond the decoded data. This only matters if you need to reuse the
++            stream after decoding.
++            Ignored in the pure Python implementation, but included for API compatibility.
+ 
+         .. _Error Handlers: https://docs.python.org/3/library/codecs.html#error-handlers
+ 
+@@ -813,6 +821,7 @@ def loads(
+     tag_hook: Callable[[CBORDecoder, CBORTag], Any] | None = None,
+     object_hook: Callable[[CBORDecoder, dict[Any, Any]], Any] | None = None,
+     str_errors: Literal["strict", "error", "replace"] = "strict",
++    read_size: int = 1,
+ ) -> Any:
+     """
+     Deserialize an object from a bytestring.
+@@ -831,6 +840,10 @@ def loads(
+     :param str_errors:
+         determines how to handle unicode decoding errors (see the `Error Handlers`_
+         section in the standard library documentation for details)
++    :param read_size:
++        the minimum number of bytes to read at a time.
++        Setting this to a higher value like 4096 improves performance.
++        Ignored in the pure Python implementation, but included for API compatibility.
+     :return:
+         the deserialized object
+ 
+@@ -839,7 +852,11 @@ def loads(
+     """
+     with BytesIO(s) as fp:
+         return CBORDecoder(
+-            fp, tag_hook=tag_hook, object_hook=object_hook, str_errors=str_errors
++            fp,
++            tag_hook=tag_hook,
++            object_hook=object_hook,
++            str_errors=str_errors,
++            read_size=read_size,
+         ).decode()
+ 
+ 
+@@ -848,6 +865,7 @@ def load(
+     tag_hook: Callable[[CBORDecoder, CBORTag], Any] | None = None,
+     object_hook: Callable[[CBORDecoder, dict[Any, Any]], Any] | None = None,
+     str_errors: Literal["strict", "error", "replace"] = "strict",
++    read_size: int = 1,
+ ) -> Any:
+     """
+     Deserialize an object from an open file.
+@@ -866,6 +884,13 @@ def load(
+     :param str_errors:
+         determines how to handle unicode decoding errors (see the `Error Handlers`_
+         section in the standard library documentation for details)
++    :param read_size:
++        the minimum number of bytes to read at a time.
++        Setting this to a higher value like 4096 improves performance,
++        but is likely to read past the end of the CBOR value, advancing the stream
++        position beyond the decoded data. This only matters if you need to reuse the
++        stream after decoding.
++        Ignored in the pure Python implementation, but included for API compatibility.
+     :return:
+         the deserialized object
+ 
+@@ -873,5 +898,9 @@ def load(
+ 
+     """
+     return CBORDecoder(
+-        fp, tag_hook=tag_hook, object_hook=object_hook, str_errors=str_errors
++        fp,
++        tag_hook=tag_hook,
++        object_hook=object_hook,
++        str_errors=str_errors,
++        read_size=read_size,
+     ).decode()
+diff --git a/source/decoder.c b/source/decoder.c
+index 6db81460..20b8a7d7 100644
+--- a/source/decoder.c
++++ b/source/decoder.c
+@@ -47,6 +47,10 @@ static int _CBORDecoder_set_tag_hook(CBORDecoderObject *, PyObject *, void *);
+ static int _CBORDecoder_set_object_hook(CBORDecoderObject *, PyObject *, void *);
+ static int _CBORDecoder_set_str_errors(CBORDecoderObject *, PyObject *, void *);
+ 
++// Forward declarations for read dispatch functions
++static int fp_read_unbuffered(CBORDecoderObject *, char *, Py_ssize_t);
++static int fp_read_buffered(CBORDecoderObject *, char *, Py_ssize_t);
++
+ static PyObject * decode(CBORDecoderObject *, DecodeOptions);
+ static PyObject * decode_bytestring(CBORDecoderObject *, uint8_t);
+ static PyObject * decode_string(CBORDecoderObject *, uint8_t);
+@@ -155,6 +159,7 @@ CBORDecoder_new(PyTypeObject *type, PyObject *args, PyObject *kwargs)
+         self->readahead_size = 0;
+         self->read_pos = 0;
+         self->read_len = 0;
++        self->fp_read = fp_read_unbuffered;  // default, will be set properly in init
+     }
+     return (PyObject *) self;
+ error:
+@@ -164,7 +169,7 @@ CBORDecoder_new(PyTypeObject *type, PyObject *args, PyObject *kwargs)
+ 
+ 
+ // CBORDecoder.__init__(self, fp=None, tag_hook=None, object_hook=None,
+-//                      str_errors='strict', read_size=4096)
++//                      str_errors='strict', read_size=1)
+ int
+ CBORDecoder_init(CBORDecoderObject *self, PyObject *args, PyObject *kwargs)
+ {
+@@ -233,7 +238,8 @@ _CBORDecoder_set_fp_with_read_size(CBORDecoderObject *self, PyObject *value, Py_
+         return -1;
+     }
+ 
+-    if (self->readahead == NULL || self->readahead_size != read_size) {
++    // Skip buffer allocation for read_size=1 (direct read path doesn't use buffer)
++    if (read_size > 1 && (self->readahead == NULL || self->readahead_size != read_size)) {
+         new_buffer = (char *)PyMem_Malloc(read_size);
+         if (!new_buffer) {
+             Py_DECREF(read);
+@@ -254,8 +260,15 @@ _CBORDecoder_set_fp_with_read_size(CBORDecoderObject *self, PyObject *value, Py_
+     if (new_buffer) {
+         PyMem_Free(self->readahead);
+         self->readahead = new_buffer;
+-        self->readahead_size = read_size;
++    } else if (read_size == 1 && self->readahead != NULL) {
++        // Free existing buffer when switching to direct read path (read_size=1)
++        PyMem_Free(self->readahead);
++        self->readahead = NULL;
+     }
++    self->readahead_size = read_size;
++
++    // Set read dispatch function - eliminates runtime check on every read
++    self->fp_read = (read_size == 1) ? fp_read_unbuffered : fp_read_buffered;
+ 
+     return 0;
+ }
+@@ -447,9 +460,25 @@ fp_read_bytes(CBORDecoderObject *self, char *buf, Py_ssize_t size)
+     return bytes_read;
+ }
+ 
+-// Read into caller's buffer using the readahead buffer
++// Unbuffered read - used when read_size=1 (backwards compatible mode)
++// This matches the 5.7.1 behavior with no runtime overhead
++static int
++fp_read_unbuffered(CBORDecoderObject *self, char *buf, Py_ssize_t size)
++{
++    Py_ssize_t bytes_read = fp_read_bytes(self, buf, size);
++    if (bytes_read == size)
++        return 0;
++    if (bytes_read >= 0)
++        PyErr_Format(
++            _CBOR2_CBORDecodeEOF,
++            "premature end of stream (expected to read %zd bytes, "
++            "got %zd instead)", size, bytes_read);
++    return -1;
++}
++
++// Buffered read - used when read_size > 1 for improved performance
+ static int
+-fp_read(CBORDecoderObject *self, char *buf, const Py_ssize_t size)
++fp_read_buffered(CBORDecoderObject *self, char *buf, Py_ssize_t size)
+ {
+     Py_ssize_t available, to_copy, remaining, total_copied;
+ 
+@@ -507,7 +536,7 @@ fp_read_object(CBORDecoderObject *self, const Py_ssize_t size)
+     if (!ret)
+         return NULL;
+ 
+-    if (fp_read(self, PyBytes_AS_STRING(ret), size) == -1) {
++    if (self->fp_read(self, PyBytes_AS_STRING(ret), size) == -1) {
+         Py_DECREF(ret);
+         return NULL;
+     }
+@@ -528,7 +557,7 @@ CBORDecoder_read(CBORDecoderObject *self, PyObject *length)
+         return NULL;
+     ret = PyBytes_FromStringAndSize(NULL, len);
+     if (ret) {
+-        if (fp_read(self, PyBytes_AS_STRING(ret), len) == -1) {
++        if (self->fp_read(self, PyBytes_AS_STRING(ret), len) == -1) {
+             Py_DECREF(ret);
+             ret = NULL;
+         }
+@@ -576,19 +605,19 @@ decode_length(CBORDecoderObject *self, uint8_t subtype,
+         if (subtype < 24) {
+             *length = subtype;
+         } else if (subtype == 24) {
+-            if (fp_read(self, value.u8.buf, sizeof(uint8_t)) == -1)
++            if (self->fp_read(self, value.u8.buf, sizeof(uint8_t)) == -1)
+                 return -1;
+             *length = value.u8.value;
+         } else if (subtype == 25) {
+-            if (fp_read(self, value.u16.buf, sizeof(uint16_t)) == -1)
++            if (self->fp_read(self, value.u16.buf, sizeof(uint16_t)) == -1)
+                 return -1;
+             *length = be16toh(value.u16.value);
+         } else if (subtype == 26) {
+-            if (fp_read(self, value.u32.buf, sizeof(uint32_t)) == -1)
++            if (self->fp_read(self, value.u32.buf, sizeof(uint32_t)) == -1)
+                 return -1;
+             *length = be32toh(value.u32.value);
+         } else {
+-            if (fp_read(self, value.u64.buf, sizeof(uint64_t)) == -1)
++            if (self->fp_read(self, value.u64.buf, sizeof(uint64_t)) == -1)
+                 return -1;
+             *length = be64toh(value.u64.value);
+         }
+@@ -752,7 +781,7 @@ decode_indefinite_bytestrings(CBORDecoderObject *self)
+     list = PyList_New(0);
+     if (list) {
+         while (1) {
+-            if (fp_read(self, &lead.byte, 1) == -1)
++            if (self->fp_read(self, &lead.byte, 1) == -1)
+                 break;
+             if (lead.major == 2 && lead.subtype != 31) {
+                 ret = decode_bytestring(self, lead.subtype);
+@@ -959,7 +988,7 @@ decode_indefinite_strings(CBORDecoderObject *self)
+     list = PyList_New(0);
+     if (list) {
+         while (1) {
+-            if (fp_read(self, &lead.byte, 1) == -1)
++            if (self->fp_read(self, &lead.byte, 1) == -1)
+                 break;
+             if (lead.major == 3 && lead.subtype != 31) {
+                 ret = decode_string(self, lead.subtype);
+@@ -2040,7 +2069,7 @@ CBORDecoder_decode_simple_value(CBORDecoderObject *self)
+     PyObject *tag, *ret = NULL;
+     uint8_t buf;
+ 
+-    if (fp_read(self, (char*)&buf, sizeof(uint8_t)) == 0) {
++    if (self->fp_read(self, (char*)&buf, sizeof(uint8_t)) == 0) {
+         tag = PyStructSequence_New(&CBORSimpleValueType);
+         if (tag) {
+             PyStructSequence_SET_ITEM(tag, 0, PyLong_FromLong(buf));
+@@ -2066,7 +2095,7 @@ CBORDecoder_decode_float16(CBORDecoderObject *self)
+         char buf[sizeof(uint16_t)];
+     } u;
+ 
+-    if (fp_read(self, u.buf, sizeof(uint16_t)) == 0)
++    if (self->fp_read(self, u.buf, sizeof(uint16_t)) == 0)
+         ret = PyFloat_FromDouble(unpack_float16(u.i));
+     set_shareable(self, ret);
+     return ret;
+@@ -2084,7 +2113,7 @@ CBORDecoder_decode_float32(CBORDecoderObject *self)
+         char buf[sizeof(float)];
+     } u;
+ 
+-    if (fp_read(self, u.buf, sizeof(float)) == 0) {
++    if (self->fp_read(self, u.buf, sizeof(float)) == 0) {
+         u.i = be32toh(u.i);
+         ret = PyFloat_FromDouble(u.f);
+     }
+@@ -2104,7 +2133,7 @@ CBORDecoder_decode_float64(CBORDecoderObject *self)
+         char buf[sizeof(double)];
+     } u;
+ 
+-    if (fp_read(self, u.buf, sizeof(double)) == 0) {
++    if (self->fp_read(self, u.buf, sizeof(double)) == 0) {
+         u.i = be64toh(u.i);
+         ret = PyFloat_FromDouble(u.f);
+     }
+@@ -2133,7 +2162,7 @@ decode(CBORDecoderObject *self, DecodeOptions options)
+     if (Py_EnterRecursiveCall(" in CBORDecoder.decode"))
+         return NULL;
+ 
+-    if (fp_read(self, &lead.byte, 1) == 0) {
++    if (self->fp_read(self, &lead.byte, 1) == 0) {
+         switch (lead.major) {
+             case 0: ret = decode_uint(self, lead.subtype);       break;
+             case 1: ret = decode_negint(self, lead.subtype);     break;
+@@ -2387,13 +2416,12 @@ PyDoc_STRVAR(CBORDecoder__doc__,
+ "    :class:`dict` object. The return value is substituted for the dict\n"
+ "    in the deserialized output.\n"
+ ":param read_size:\n"
+-"    the size of the read buffer (default 4096). The decoder reads from\n"
+-"    the stream in chunks of this size for performance. This means the\n"
+-"    stream position may advance beyond the bytes actually decoded. For\n"
+-"    large values (bytestrings, text strings), reads may be larger than\n"
+-"    ``read_size``. Code that needs to read from the stream after\n"
+-"    decoding should use :meth:`decode_from_bytes` instead, or set\n"
+-"    ``read_size=1`` to disable buffering (at a performance cost).\n"
++"    the minimum number of bytes to read at a time.\n"
++"    Setting this to a higher value like 4096 improves performance,\n"
++"    but is likely to read past the end of the CBOR value, advancing the stream\n"
++"    position beyond the decoded data. This only matters if you need to reuse the\n"
++"    stream after decoding.\n"
++"    Ignored in the pure Python implementation, but included for API compatibility.\n"
+ "\n"
+ ".. _CBOR: https://cbor.io/\n"
+ );
+diff --git a/source/decoder.h b/source/decoder.h
+index a2f4bf18..3efff8bb 100644
+--- a/source/decoder.h
++++ b/source/decoder.h
+@@ -3,10 +3,17 @@
+ #include <stdbool.h>
+ #include <stdint.h>
+ 
+-// Default readahead buffer size for streaming reads
+-#define CBOR2_DEFAULT_READ_SIZE 4096
++// Default readahead buffer size for streaming reads.
++// Set to 1 for backwards compatibility (no buffering).
++#define CBOR2_DEFAULT_READ_SIZE 1
+ 
+-typedef struct {
++// Forward declaration for function pointer typedef
++struct CBORDecoderObject_;
++
++// Function pointer type for read dispatch (eliminates runtime check)
++typedef int (*fp_read_fn)(struct CBORDecoderObject_ *, char *, Py_ssize_t);
++
++typedef struct CBORDecoderObject_ {
+     PyObject_HEAD
+     PyObject *read;    // cached read() method of fp
+     PyObject *tag_hook;
+@@ -23,6 +30,9 @@ typedef struct {
+     Py_ssize_t readahead_size;  // size of allocated buffer
+     Py_ssize_t read_pos;        // current position in buffer
+     Py_ssize_t read_len;        // valid bytes in buffer
++
++    // Read dispatch - points to unbuffered or buffered implementation
++    fp_read_fn fp_read;
+ } CBORDecoderObject;
+ 
+ extern PyTypeObject CBORDecoderType;
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 9e410376fb..bbeffaae32 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -15,5 +15,14 @@ PYTHON_CBOR2_ENV = CBOR2_BUILD_C_EXTENSION=1
 HOST_PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
 HOST_PYTHON_CBOR2_ENV = CBOR2_BUILD_C_EXTENSION=0
 
+# 0001-CVE-2025-64076.patch
+PYTHON_CBOR2_IGNORE_CVES += CVE-2025-64076
+
+# 0002-CVE-2025-68131.patch
+PYTHON_CBOR2_IGNORE_CVES += CVE-2025-68131
+
+# 0003-CVE-2026-26209.patch 0004-CVE-2026-26209.patch
+PYTHON_CBOR2_IGNORE_CVES += CVE-2026-26209
+
 $(eval $(python-package))
 $(eval $(host-python-package))

--===============5939561070183719168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5939561070183719168==--
