Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506D8606A31C
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 14:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jexoh+EX
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29CB36074D;
	Mon,  9 Nov 2026 14:28:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wWjRChFcD7mz; Mon,  9 Nov 2026 14:28:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0914A607B1
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794234499;
	b=Q3dPXiB4m+uGtz7zzNdEhGdOhFdERL6IffxPbWCXzwKDirHNq5yAkLtxM3P7GtidBEKb
	 S4GQ7kFMdYqcro51inBUFTrHwmRkJ7nCy4nw+8m7CBPcN7fjSBByT8+m6MrTfR4KXGTS6
	 Fopj4pVkzYhA4CerqT31uXyx5xbhMjLYKDIA2EisUyu34yoPXPYoCPkpgld/YkZ+mo8Rv
	 cuEGPjYiHUMQq4gTTwe3xEAp24ln/8J/hPle2Ei0d/alSQxyHEdZwGFAU3gYtZAmId1lo
	 PT5L/sLO6ErZ+5BdPw48fVeDilubmSLj1efxU1Kxc8CfRX1dcc4PPVnK3LoEh/gw7HA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794234499;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DS4X78/3SfNB+eqCKoL3jE5Xlk2vHvFgSWLtwnNlG4g=;
	b=kapybQqUV+0q03zBJna2gQ15Y8KK5eiC5Qi9z2QG3Ltc6xCsIEWKKvp0Q55/n/g1Qhn5
	 70vYa22ZT9Qj6zokLbsN6xF7QejZeTvNyotsnim+J0CsBTjs/RepL6AlMctHnXD+O3bDh
	 j3yV5IQ+KueKN6zQeYIn76AKsfG7dY0gzycdcb68iGRCRUTsr5jp5Vfy1id8U88hgAEmP
	 SD2MwQuHsi3gm0NKHlZaHiu+P0kFh3vuJomJ+yGqE3ihv71ZFN92pLtTNPxl/6G0Dg77k
	 l1v43LagCpnqJ1LXXBX5+GgnUIQc5Ou3hZCC3MRS+H+otLlCoGpd4fm1ZfLQQAopFrg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794234499;
	bh=DS4X78/3SfNB+eqCKoL3jE5Xlk2vHvFgSWLtwnNlG4g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=jexoh+EXKSitK489QbGNQwWEB2Nrf4igX5fpDp3FMe8YCr6dc/nygBdmuajpCfIPL
	 6ySnj3jr4h4esmyoAz4qiUR59zlWtXUte/cDzEXPhv7Kiso9MBncMmsNudaUgkh9oi
	 p4pWyqgBUqHSlCostJlvknq3+3ZlWTLxtKIoiu4pc+9PB3E1KkEjTE2pVUDiNRRy42
	 e3mHnIT913KcXBhdfTkyu/yq2W31IfFSygjgXgy8Hzhzmh0USeUwCT4RWOCcWWlE2t
	 2+AbxQ2d3gFGj3UxxIUdoT3EbHGwqeV7xzmQ465BC2qySxQh2SrmIm0f04e2cymJEe
	 t7SL65fFtMc1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0914A607B1;
	Mon,  9 Nov 2026 14:28:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 15910932
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 14:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12AEB607B3
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 14:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9OwJ3dZUY-J for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 14:28:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AA0AF6074D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA0AF6074D
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 14:28:14 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso6393635e9.2
 for <buildroot@buildroot.org>; Mon, 09 Nov 2026 06:28:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794234492; x=1794839292;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+PkbSRs03XWzgaksuxpPMWtZPq5PPNDK8Pbky9MQ9W8=;
 b=QHSMHp5GIIZ/kBo38BwrXLoKb7NFFwrsb4sPJ8QL+YC7c5xXeONDN64HUbEZCMKDAN
 QENZrmdQJbpnvbY3d5/6L6JIpTcfWBD6CEKkOBCZNbC7HHVRrWArIPFpGW2i0fHfFfeb
 lDCTff6ptpURBcw2cZUm7KeeFFPYRtxK3Amzy9JSWRafM8qE5ruKruOETdgbaf5BLuMc
 s8uvAlytCxzFrVNwYTgblOMMIrJSOrR915O6fMOZmLUZboKGQHjGsNZpEqzIur9ZTLqU
 D/0wSeVmIbeX08TXldfeGO5nCtX+gv9mUsqQWRO0cLvY1CT/iriYGSXSyrV3/ILTNEhj
 o1fQ==
X-Gm-Message-State: APuU4Z+vc7C3isSmfcqpeZXyMFPsD3PFSU1nKyMrMCKAFzIR4ZaqG2TS
 FQPMmcqRd6wr2TNtJTXc+m/R6iPMNb09ewtXvPAP9S/WU6O/4B1XV+QslmEAyyaVbBsK297228k
 yVPPc
X-Gm-Gg: AYBFou20cuXmJWJ6EZoh/3/JVFGfN+TNDhuFZa9FxuR34dHW1rAkpRdbMZj1XUgMzfo
 rBV8UzEqKVo+g823Pm6j53BeZikMCZsxhq7amb+AplLRHASS+/4VgnpDzgTbH+T+f5jfOBzl6oE
 my4A2LO7GAWovWBVcbmiqOaah0X2+fE2afrXglHGdEeqWQowJDAJXMmy/cqrhw0/xQeoa3017FJ
 5PSWI7MsRwxQKsLDkTFZj4obyKg7XJ1p3pXd7yTtOtYOF0sec5Pqc2Le2WrwIDi6a5c29SP5oY2
 EbPSpMKAFvMEZtLvhRJxDdWHMqjVG8O1bfxrtkhL5O0REIfICNpw9ong6gvUrlAHUI3ZXrxZT1i
 vdHjJBkCSl8ebLO0LIfN6bsE4OEdzG6SfSVMCRYkzYdkkh1HSrSyh2G7lbRz0DpMPG7bnDfj2MN
 J6wGVV0rlVh5ccChKe3Zy1PsWjFaeZ6WfJSp8cEIiffToH6+3lP4sO0xR0xoNp/301YlvlHDlIn
 /eemGM2qmLpwziUr2yw80WXbN5ijWr5PLPtCzMJGjw2vquiNJgMYSh0iOiIDPEMFKUcjQWxuxub
 RM8iMxJr5b/OK9jKZ3hhPQ==
X-Received: by 2002:a05:600c:8b78:b0:4a2:967:dfb8 with SMTP id
 5b1f17b1804b1-4b963c6be16mr75949575e9.20.1794234492311; 
 Mon, 09 Nov 2026 06:28:12 -0800 (PST)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b9f93c04afsm86425065e9.3.2026.11.09.06.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 06:28:12 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon,  9 Nov 2026 15:28:11 +0100
Message-ID: <20261109142811.424062-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x] package/python-autobahn: backport fix
 for GHSA-2gqc-mwv3-66rp
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This fixes the following vulnerability:

Autobahn parses the WebSocket opening handshake by decoding it as
ISO-8859-1 and calling Python str.splitlines(). str.splitlines() breaks
a string not only on CRLF but also on the bytes VT (0x0b), FF (0x0c), FS
(0x1c), GS (0x1d), RS (0x1e) and NEL (0x85), so a single header value
that contains one of those bytes is parsed as two separate,
application-visible headers. A reverse proxy that forwards an ordinary
header such as User-Agent without rejecting those bytes lets an
unauthenticated attacker smuggle a second header of their choosing into
the value, for example User-Agent: abc\x85X-Authenticated-User: admin.
When the application behind the proxy derives identity or authorization
from a proxy-injected header, the attacker forges that header and
bypasses the proxy's identity boundary.

For more information, see:
  - https://github.com/crossbario/autobahn-python/security/advisories/GHSA-2gqc-mwv3-66rp
  - https://github.com/crossbario/autobahn-python/commit/364b6d6dbad127f6aed8a51494755027bf968fc3

The backport is essentially the same as the upstream one but adapt to
the coding style in place for the version 24.4.2.

Tested with `./support/testing/run-tests -d dl -j9 -o output_folder tests.package.test_python_autobahn`.

Assisted-by: LLM
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...arse-handshake-HTTP-headers-strictly.patch | 167 ++++++++++++++++++
 1 file changed, 167 insertions(+)
 create mode 100644 package/python-autobahn/0001-parse-handshake-HTTP-headers-strictly.patch

diff --git a/package/python-autobahn/0001-parse-handshake-HTTP-headers-strictly.patch b/package/python-autobahn/0001-parse-handshake-HTTP-headers-strictly.patch
new file mode 100644
index 0000000000..40c25c1ccc
--- /dev/null
+++ b/package/python-autobahn/0001-parse-handshake-HTTP-headers-strictly.patch
@@ -0,0 +1,167 @@
+From eb679b75ec34d92bfc0f169cf4af71163a7b128a Mon Sep 17 00:00:00 2001
+From: Tobias Oberstein <tobias.oberstein@gmail.com>
+Date: Tue, 3 Nov 2026 21:12:11 +0100
+Subject: [PATCH] #2034: GREEN - parse handshake HTTP headers strictly
+
+parseHttpHeader no longer uses str.splitlines(), which also split on VT,
+FF, FS, GS, RS, NEL and on a bare CR or LF, so a peer could make autobahn
+see header lines (e.g. X-Forwarded-For) that a front proxy treats as part
+of a header value.
+
+Now (RFC 9112 / RFC 9110), with the whole header block rejected
+(ValueError) otherwise:
+
+- lines are separated by CRLF only; a bare CR or LF is invalid;
+- a bare LF is rejected deliberately, although RFC 9112 2.2 allows
+  accepting it as a line end (a front proxy may not split on it);
+- no obs-fold; field name is a token, directly followed by the colon;
+- field values: VCHAR, obs-text, SP, HTAB only; trimmed of SP/HTAB only
+  (str.strip() also stripped NEL/NBSP);
+- no control characters in the status line;
+- a header line without a colon is rejected (was skipped silently).
+
+The client handshake and the proxy CONNECT now catch parse errors and fail
+the handshake / the proxy connect, like the server already did (HTTP 400).
+
+Tests: bare-LF comment, plus 2 tests (line without colon, empty name).
+Changelog: 26.11.1 entry (behaviour change).
+
+Local: twisted cpy311 417 OK / 28 skipped, pypy311 416 OK / 29 skipped;
+asyncio cpy311 383 passed, pypy311 382 passed (baseline + 47 new tests);
+ruff + ty 0.0.89 clean.
+
+Expected CI result: GREEN.
+
+Note: This work was completed with AI assistance (Claude Code).
+
+CVE: GHSA-2gqc-mwv3-66rp
+Upstream: https://github.com/crossbario/autobahn-python/commit/364b6d6dbad127f6aed8a51494755027bf968fc3
+[thomas: 
+  - remove tests and changelog
+  - 24.4.2 has not type annotation and uses string with single-quote: `'`
+]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ autobahn/websocket/protocol.py | 76 ++++++++++++++++++++++++++--------
+ 1 file changed, 58 insertions(+), 18 deletions(-)
+
+diff --git a/autobahn/websocket/protocol.py b/autobahn/websocket/protocol.py
+index c4ef43f8..02ff926c 100755
+--- a/autobahn/websocket/protocol.py
++++ b/autobahn/websocket/protocol.py
+@@ -31,6 +31,7 @@ import struct
+ import random
+ import os
+ import pickle
++import re
+ import copy
+ import json
+ import time
+@@ -252,6 +253,18 @@ class FrameHeader(object):
+         self.mask = mask
+ 
+ 
++# RFC 9110 section 5.1: field-name = token
++_HTTP_FIELD_NAME = re.compile(r"[!#$%&'*+\-.^_`|~0-9A-Za-z]+")
++
++# RFC 9110 section 5.5: a field value is made of VCHAR, obs-text (0x80-0xFF), SP
++# and HTAB. This matches any other character, i.e. CR, LF, NUL and all other
++# controls (CTL) and DEL.
++_HTTP_FIELD_VALUE_INVALID = re.compile(r"[\x00-\x08\x0a-\x1f\x7f]")
++
++# any control character (including HTAB) and DEL, not allowed in the start line
++_HTTP_START_LINE_INVALID = re.compile(r"[\x00-\x1f\x7f]")
++
++
+ def parseHttpHeader(data):
+     """
+     Parses the beginning of a HTTP request header (the data up to the \n\n line) into a pair
+@@ -273,27 +286,48 @@ def parseHttpHeader(data):
+     #   - http://tools.ietf.org/html/rfc5987
+     #   - https://github.com/crossbario/autobahn-python/issues/533
+     #
+-    raw = data.decode('iso-8859-1').splitlines()
+-    http_status_line = raw[0].strip()
++    text = data.decode('iso-8859-1')
++
++    # strip the terminating empty line; do NOT use str.splitlines(), which also
++    # splits on VT, FF, FS, GS, RS, NEL and on a bare CR or LF (#2034)
++    if text.endswith('\r\n\r\n'):
++        text = text[:-4]
++    elif text.endswith('\r\n'):
++        text = text[:-2]
++    raw = text.split('\r\n')
++
++    http_status_line = raw[0]
++    if _HTTP_START_LINE_INVALID.search(http_status_line):
++        raise ValueError('invalid character in HTTP status line')
++    http_status_line = http_status_line.strip(' ')
++
+     http_headers = {}
+     http_headers_cnt = {}
+     for h in raw[1:]:
++        if h[:1] in (' ', '\t'):
++            raise ValueError('obsolete line folding in HTTP header')
+         i = h.find(":")
+-        if i > 0:
+-            # HTTP header keys are case-insensitive
+-            key = h[:i].strip().lower()
+-            value = h[i + 1:].strip()
+-
+-            # handle HTTP headers split across multiple lines
+-            if key in http_headers:
+-                http_headers[key] += ', {}'.format(value)
+-                http_headers_cnt[key] += 1
+-            else:
+-                http_headers[key] = value
+-                http_headers_cnt[key] = 1
++        if i < 0:
++            raise ValueError('HTTP header line without colon')
++        name = h[:i]
++        if not _HTTP_FIELD_NAME.fullmatch(name):
++            raise ValueError('invalid HTTP header field name')
++        # strip optional whitespace (OWS = SP / HTAB) only: str.strip() would
++        # also strip obs-text such as NEL or NBSP
++        value = h[i + 1:].strip(' \t')
++        if _HTTP_FIELD_VALUE_INVALID.search(value):
++            raise ValueError('invalid character in HTTP header field value')
++
++        # HTTP header keys are case-insensitive
++        key = name.lower()
++
++        # handle HTTP headers split across multiple lines
++        if key in http_headers:
++            http_headers[key] += ', {}'.format(value)
++            http_headers_cnt[key] += 1
+         else:
+-            # skip bad HTTP header
+-            pass
++            http_headers[key] = value
++            http_headers_cnt[key] = 1
+     return http_status_line, http_headers, http_headers_cnt
+ 
+ 
+@@ -3521,7 +3555,10 @@ class WebSocketClientProtocol(WebSocketProtocol):
+ 
+             # extract HTTP status line and headers
+             #
+-            (http_status_line, http_headers, http_headers_cnt) = parseHttpHeader(http_response_data)
++            try:
++                (http_status_line, http_headers, http_headers_cnt) = parseHttpHeader(http_response_data)
++            except Exception as e:
++                return self.failProxyConnect("Error during parsing of HTTP status line / response headers : {0}".format(e))
+ 
+             # validate proxy connect response
+             #
+@@ -3726,7 +3763,10 @@ class WebSocketClientProtocol(WebSocketProtocol):
+ 
+             # extract HTTP status line and headers
+             #
+-            (self.http_status_line, self.http_headers, http_headers_cnt) = parseHttpHeader(self.http_response_data)
++            try:
++                (self.http_status_line, self.http_headers, http_headers_cnt) = parseHttpHeader(self.http_response_data)
++            except Exception as e:
++                return self.failHandshake("Error during parsing of HTTP status line / response headers : {0}".format(e))
+ 
+             # validate WebSocket opening handshake server response
+             #
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
