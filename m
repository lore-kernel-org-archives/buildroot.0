Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030E9606A31C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Los360E9
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D13FC40851;
	Mon, 16 Nov 2026 15:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ElzHGLA4Wx1A; Mon, 16 Nov 2026 15:40:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A56AE4084A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843643;
	b=K60NJ48sQl9aRnMMcbNaF0vxL9YwZeZjCeYNQcGt8pGYoMQg0s0gmj74xhkzYfdci594
	 ab6p0JewvpLIh9VbrOS1wGahkNujA32JI0LE/GWVNOVPdAqcxoRj250ZyZXiKWkZForn6
	 VGZvVYnY/nr3pzhubn9zrLigJJzxxlqeyvVIH13EIr2P2NDtafrMrPKLBJEsjmD1Sq0sz
	 7G1BzMYuZXDHsTwkvlGrXb+Sin9d6dW1yhd2j8vqJJvMFkqr1+EqqwRMzt6UIP33zr/j4
	 Np5l9zypfJg+atrPd3Ymn7pJqYv+CRrUmeZqNyTBTtr4Va7WAOg3rRVK3mzmewkwE5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843643;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZrrTHhU11GNH7jFkbtxcBO/u49r2sKCVwf6rfO4Hx0A=;
	b=aH8u3CelOZLBnWwy7+ge56/zRHRRHHMIGVHfe/qN+Om4Hu89TtZKP+6zN8cgvxhFpagO
	 w2Cvnj5a3sKSCVUT6hATOf3VSkYNfI2TsrwuqqVB6ZEO4MuFM6jM1bb+607VAm/aD8Cms
	 dgiMiL7mxh1eb70JS4m9KK9de3AioB5Ln8XefJdwO3IL3BNbXNffffjLpzgIEfSks/Ypr
	 1TkklSmlQ0kSlA/76wMoEXWhOOFS8LLiW2yejtFvOFfvg6UYetdE1lSpxC08EyBAXUztg
	 vNUSJTj87VFuaXy0ITXksNXJMcs7zbZj6nViRAy/mium5nToKI5aw0CwxOBiwViZY8A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843643;
	bh=ZrrTHhU11GNH7jFkbtxcBO/u49r2sKCVwf6rfO4Hx0A=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Los360E9SmIFhvMwUBZBs7sT5PmGQZ7iroVtpfTxEGIiew6h4jMbqL/j3i6SjIqSu
	 TAAVOwoBodWOEZM/XL43iYv6UKZH4vyUWuVne5pYjIdcChxkhEyuqndCNlr6ZG3fSo
	 kzQKYesEQVuETdNBpeHkQ/MuiOTVDXjMaQz3TaYTad4t3b+l+vr14NL4z89ViZmc17
	 cUVgsaXKrFGqJSmQjXd8za103tZcz1BcKFk/mhTzsp2k0nMnb1EXgaxbtOZGlbriyD
	 es2+k9c1mbPF3qm4tVJ+6JTS8lY5CtU1Iaasks+SC7Qy6Oxk3DZUSDHAwDYvtc898Q
	 82gNKuFhe8Mcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A56AE4084A;
	Mon, 16 Nov 2026 15:40:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CA3D2FE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A61B80F19
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eBScVxFWd6K7 for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:40:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B2D1280ED8
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2D1280ED8
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:40 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4bb64ef5a14so17639785e9.1
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:40:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843638; x=1795448438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8BtMu4dwOJEGCKVtRWs+QV7hIZHzhIqscEwxun+L1+M=;
 b=Vkec/iTNCcoOOLBU1OlLbE1gMUEmpns0RvRo0ny6qpcJCWwPwJelP9cKN3oTJY3rMS
 WRy/arbDfqpe5B7s09pEBYDuqP/hf1svawjlYqql8cWl9C2Ax0kptwkCCV0t3jE14pU4
 GQq8vb2tP5raF6QQqPXtnMWIkwph1bTtipwGbChaAmq1jop7fEAsPBJBcjFavfYOUVaD
 rw10U4dPJGBrTZD1gWD/mZRqlyeIh0Do1t9otBG2/1TkGbQXugCkjOm20yOx4uZOSt7l
 buXRFQgXlc28k6qvnt1gRe7w6oe1jjjC/3B4mZIsKn1fxXVov7CJqQ8tweyfhxEd0re9
 hQuA==
X-Gm-Message-State: APuU4Z/HqHevsiAUIh28NExUSEjAzUR+7gqboshNwRFHNnczEDXsUS+M
 jt/uhzWpHILl9Kleqg5ycCXkwF8ospOofOmEnnwRpYEZW0uxT4YLU3w3pFtSPtHmNB/XJImUes6
 +Cja0UNY=
X-Gm-Gg: AYBFou0y/8Pat3EVDckSxk8bz5oXntikcL9k3BCx8kTvRYQ0kFNC6912+N5+qi/NvaN
 dSZd1VjJwuoVELMImq+m/hc7pKpqrIQi6GULCV3cxKU6rpjqWNzt+mLn1B/xPq1c8Jq360hJIkj
 hz9CudnAdtiByF8cviLAq4SUzsi8g6zY4O32pZ4v7WHC7pQO5S1VwEcynVcjJYv2Krr4mFa5Wl6
 sfNjioMeZjc6uUls6yL6ntbO6wSEzUNUxJRnRSDu6u7HdEDGxFZMdvdwaUmCw800LDOHgjo04V2
 Y1MX6wk5lDB8/YAvMZG9WgADY+h5ww0gSh63sSi8urypS3X2Gc62WFVj9ms8H9ErqImEZhYORJd
 goMglRHeN1BaqYyRBRJcKXxnXCa2ySfzUChzDph60kxNzpGb1YqCxekyy1Nk73QHMupDWRng9FZ
 m5OilNLb+hTLEEom7oNH1raan2cCI/3RqYwfzM5Zj5jbgZxthDgn4jMQwGzpAp3Yk+e5MK6IwNV
 JQmWVbYh3QALvZ0KbqyDwAoV5asn5QpTgPMPG4ED3NaTb+OMP00mB813s790/uE2wOF5/bOtIFr
 XXTjevqvwFNgfLA47K9d6krEmGJf0/o=
X-Received: by 2002:a05:600c:a313:b0:4a2:397:73fd with SMTP id
 5b1f17b1804b1-4bb55a50c90mr177798445e9.12.1794843638348; 
 Mon, 16 Nov 2026 07:40:38 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c605e4a2asm22260634f8f.39.2026.11.16.07.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:40:37 -0800 (PST)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:40:35 +0100
Message-ID: <20261116154036.726036-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109142811.424062-1-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/python-autobahn: backport
 fix for GHSA-2gqc-mwv3-66rp
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> This fixes the following vulnerability:
> 
> Autobahn parses the WebSocket opening handshake by decoding it as
> ISO-8859-1 and calling Python str.splitlines(). str.splitlines() breaks
> a string not only on CRLF but also on the bytes VT (0x0b), FF (0x0c), FS
> (0x1c), GS (0x1d), RS (0x1e) and NEL (0x85), so a single header value
> that contains one of those bytes is parsed as two separate,
> application-visible headers. A reverse proxy that forwards an ordinary
> header such as User-Agent without rejecting those bytes lets an
> unauthenticated attacker smuggle a second header of their choosing into
> the value, for example User-Agent: abc\x85X-Authenticated-User: admin.
> When the application behind the proxy derives identity or authorization
> from a proxy-injected header, the attacker forges that header and
> bypasses the proxy's identity boundary.
> 
> For more information, see:
>   - https://github.com/crossbario/autobahn-python/security/advisories/GHSA-2gqc-mwv3-66rp
>   - https://github.com/crossbario/autobahn-python/commit/364b6d6dbad127f6aed8a51494755027bf968fc3
> 
> The backport is essentially the same as the upstream one but adapt to
> the coding style in place for the version 24.4.2.
> 
> Tested with `./support/testing/run-tests -d dl -j9 -o output_folder tests.package.test_python_autobahn`.
> 
> Assisted-by: LLM
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  ...arse-handshake-HTTP-headers-strictly.patch | 167 ++++++++++++++++++
>  1 file changed, 167 insertions(+)
>  create mode 100644 package/python-autobahn/0001-parse-handshake-HTTP-headers-strictly.patch
> 
> diff --git a/package/python-autobahn/0001-parse-handshake-HTTP-headers-strictly.patch b/package/python-autobahn/0001-parse-handshake-HTTP-headers-strictly.patch
> new file mode 100644
> index 0000000000..40c25c1ccc
> --- /dev/null
> +++ b/package/python-autobahn/0001-parse-handshake-HTTP-headers-strictly.patch
> @@ -0,0 +1,167 @@
> +From eb679b75ec34d92bfc0f169cf4af71163a7b128a Mon Sep 17 00:00:00 2001
> +From: Tobias Oberstein <tobias.oberstein@gmail.com>
> +Date: Tue, 3 Nov 2026 21:12:11 +0100
> +Subject: [PATCH] #2034: GREEN - parse handshake HTTP headers strictly
> +
> +parseHttpHeader no longer uses str.splitlines(), which also split on VT,
> +FF, FS, GS, RS, NEL and on a bare CR or LF, so a peer could make autobahn
> +see header lines (e.g. X-Forwarded-For) that a front proxy treats as part
> +of a header value.
> +
> +Now (RFC 9112 / RFC 9110), with the whole header block rejected
> +(ValueError) otherwise:
> +
> +- lines are separated by CRLF only; a bare CR or LF is invalid;
> +- a bare LF is rejected deliberately, although RFC 9112 2.2 allows
> +  accepting it as a line end (a front proxy may not split on it);
> +- no obs-fold; field name is a token, directly followed by the colon;
> +- field values: VCHAR, obs-text, SP, HTAB only; trimmed of SP/HTAB only
> +  (str.strip() also stripped NEL/NBSP);
> +- no control characters in the status line;
> +- a header line without a colon is rejected (was skipped silently).
> +
> +The client handshake and the proxy CONNECT now catch parse errors and fail
> +the handshake / the proxy connect, like the server already did (HTTP 400).
> +
> +Tests: bare-LF comment, plus 2 tests (line without colon, empty name).
> +Changelog: 26.11.1 entry (behaviour change).
> +
> +Local: twisted cpy311 417 OK / 28 skipped, pypy311 416 OK / 29 skipped;
> +asyncio cpy311 383 passed, pypy311 382 passed (baseline + 47 new tests);
> +ruff + ty 0.0.89 clean.
> +
> +Expected CI result: GREEN.
> +
> +Note: This work was completed with AI assistance (Claude Code).
> +
> +CVE: GHSA-2gqc-mwv3-66rp
> +Upstream: https://github.com/crossbario/autobahn-python/commit/364b6d6dbad127f6aed8a51494755027bf968fc3
> +[thomas: 
> +  - remove tests and changelog
> +  - 24.4.2 has not type annotation and uses string with single-quote: `'`
> +]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + autobahn/websocket/protocol.py | 76 ++++++++++++++++++++++++++--------
> + 1 file changed, 58 insertions(+), 18 deletions(-)
> +
> +diff --git a/autobahn/websocket/protocol.py b/autobahn/websocket/protocol.py
> +index c4ef43f8..02ff926c 100755
> +--- a/autobahn/websocket/protocol.py
> ++++ b/autobahn/websocket/protocol.py
> +@@ -31,6 +31,7 @@ import struct
> + import random
> + import os
> + import pickle
> ++import re
> + import copy
> + import json
> + import time
> +@@ -252,6 +253,18 @@ class FrameHeader(object):
> +         self.mask = mask
> + 
> + 
> ++# RFC 9110 section 5.1: field-name = token
> ++_HTTP_FIELD_NAME = re.compile(r"[!#$%&'*+\-.^_`|~0-9A-Za-z]+")
> ++
> ++# RFC 9110 section 5.5: a field value is made of VCHAR, obs-text (0x80-0xFF), SP
> ++# and HTAB. This matches any other character, i.e. CR, LF, NUL and all other
> ++# controls (CTL) and DEL.
> ++_HTTP_FIELD_VALUE_INVALID = re.compile(r"[\x00-\x08\x0a-\x1f\x7f]")
> ++
> ++# any control character (including HTAB) and DEL, not allowed in the start line
> ++_HTTP_START_LINE_INVALID = re.compile(r"[\x00-\x1f\x7f]")
> ++
> ++
> + def parseHttpHeader(data):
> +     """
> +     Parses the beginning of a HTTP request header (the data up to the \n\n line) into a pair
> +@@ -273,27 +286,48 @@ def parseHttpHeader(data):
> +     #   - http://tools.ietf.org/html/rfc5987
> +     #   - https://github.com/crossbario/autobahn-python/issues/533
> +     #
> +-    raw = data.decode('iso-8859-1').splitlines()
> +-    http_status_line = raw[0].strip()
> ++    text = data.decode('iso-8859-1')
> ++
> ++    # strip the terminating empty line; do NOT use str.splitlines(), which also
> ++    # splits on VT, FF, FS, GS, RS, NEL and on a bare CR or LF (#2034)
> ++    if text.endswith('\r\n\r\n'):
> ++        text = text[:-4]
> ++    elif text.endswith('\r\n'):
> ++        text = text[:-2]
> ++    raw = text.split('\r\n')
> ++
> ++    http_status_line = raw[0]
> ++    if _HTTP_START_LINE_INVALID.search(http_status_line):
> ++        raise ValueError('invalid character in HTTP status line')
> ++    http_status_line = http_status_line.strip(' ')
> ++
> +     http_headers = {}
> +     http_headers_cnt = {}
> +     for h in raw[1:]:
> ++        if h[:1] in (' ', '\t'):
> ++            raise ValueError('obsolete line folding in HTTP header')
> +         i = h.find(":")
> +-        if i > 0:
> +-            # HTTP header keys are case-insensitive
> +-            key = h[:i].strip().lower()
> +-            value = h[i + 1:].strip()
> +-
> +-            # handle HTTP headers split across multiple lines
> +-            if key in http_headers:
> +-                http_headers[key] += ', {}'.format(value)
> +-                http_headers_cnt[key] += 1
> +-            else:
> +-                http_headers[key] = value
> +-                http_headers_cnt[key] = 1
> ++        if i < 0:
> ++            raise ValueError('HTTP header line without colon')
> ++        name = h[:i]
> ++        if not _HTTP_FIELD_NAME.fullmatch(name):
> ++            raise ValueError('invalid HTTP header field name')
> ++        # strip optional whitespace (OWS = SP / HTAB) only: str.strip() would
> ++        # also strip obs-text such as NEL or NBSP
> ++        value = h[i + 1:].strip(' \t')
> ++        if _HTTP_FIELD_VALUE_INVALID.search(value):
> ++            raise ValueError('invalid character in HTTP header field value')
> ++
> ++        # HTTP header keys are case-insensitive
> ++        key = name.lower()
> ++
> ++        # handle HTTP headers split across multiple lines
> ++        if key in http_headers:
> ++            http_headers[key] += ', {}'.format(value)
> ++            http_headers_cnt[key] += 1
> +         else:
> +-            # skip bad HTTP header
> +-            pass
> ++            http_headers[key] = value
> ++            http_headers_cnt[key] = 1
> +     return http_status_line, http_headers, http_headers_cnt
> + 
> + 
> +@@ -3521,7 +3555,10 @@ class WebSocketClientProtocol(WebSocketProtocol):
> + 
> +             # extract HTTP status line and headers
> +             #
> +-            (http_status_line, http_headers, http_headers_cnt) = parseHttpHeader(http_response_data)
> ++            try:
> ++                (http_status_line, http_headers, http_headers_cnt) = parseHttpHeader(http_response_data)
> ++            except Exception as e:
> ++                return self.failProxyConnect("Error during parsing of HTTP status line / response headers : {0}".format(e))
> + 
> +             # validate proxy connect response
> +             #
> +@@ -3726,7 +3763,10 @@ class WebSocketClientProtocol(WebSocketProtocol):
> + 
> +             # extract HTTP status line and headers
> +             #
> +-            (self.http_status_line, self.http_headers, http_headers_cnt) = parseHttpHeader(self.http_response_data)
> ++            try:
> ++                (self.http_status_line, self.http_headers, http_headers_cnt) = parseHttpHeader(self.http_response_data)
> ++            except Exception as e:
> ++                return self.failHandshake("Error during parsing of HTTP status line / response headers : {0}".format(e))
> + 
> +             # validate WebSocket opening handshake server response
> +             #
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
