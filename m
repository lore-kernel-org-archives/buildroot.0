Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D51CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF20141D64;
	Fri, 15 May 2026 17:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KvzlZB7p2A1E; Fri, 15 May 2026 17:47:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A07B641DAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867221;
	bh=ocpwJjUyge+wGftEb6p0AmodDwfcqcGBSHPD9Dcrhjc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VbM0S2gdnArCXxwxPTNObPxmQoMbK4bkbR4fTQGkybxsn0SRY6D1Se+z/rCDeWrKO
	 kn7ffgwcQQpBpXEbQuBZHou8X4Q9AS3PSJG2foRmmJZICWxl0nm0sK7lsEaeASST6X
	 M/7IxrYGbL5Md5gIzBA37oQCI6KZSyYvaqCH8bNVZgu4XNBfF1DvVolMPs+iqT1qzK
	 96ZA8VPd6nu0qYC/COMIkK3BwvJHQM6zTeu3NKz2ExiZqMpn94QrSis2NHHXpn9Avh
	 ViyQYFfLBbFpxMUMPSCl9i9PjegcIxiBcxudjlfODQUnmW3hRbKyQIrEcLijqyRTa4
	 7pwai8Of4LuMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A07B641DAB;
	Fri, 15 May 2026 17:47:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DD5C49B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F82C84552
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AqwekudWKk-c for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B9C48465C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B9C48465C
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BA5C86334; Fri, 15 May 2026 17:46:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:16:31 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 5b6a0d9c6be3b99ea82663e154c59f84a4b61916
X-Git-Newrev: 2748583c0438b5d4f31be20fd6a5adf5ae42fa28
X-Patchwork-Hint: ignore
Message-Id: <20260515174639.7BA5C86334@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/haproxy: bump
 version to 6.2.27
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2748583c0438b5d4f31be20fd6a5adf5ae42fa28
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Bugfix release with large number of (security) fixes.

For 6.2.26:

- a severe issue was found in the compression library (slz) where
    specially crafted patterns with tune.bufsize above 17408 or
    tune.maxrewrite below 964 (both non-default) could cause output
    buffer overflows due to the overhead exceeding the promised
    worst-case growth bound of 5 bytes and reach up to 1/16 of the
    input contents. Given that the compression output is hardly
    controllable, and the canaries at the end of the pools will catch
    this at release time, the risk of exploitation by a hostile server
    is close to zero, however it will cause repeated crashes if such a
    crafted file is present on a server and regularly downloaded. A
    workaround consists in keeping tune.maxrewrite at least 1/16 of
    tune.bufsize or just not changing them since the defaults are safe.
    A CVE was requested two weeks ago for this one, I'll mention it when
    it arrives.

  - HTTP/2 incomplete transfer detection was missing for HEADERS frames
    carrying END_STREAM. When relayed to an HTTP/1.1 server that
    responds before the end of the transfer, this can result in bytes
    of the next request over the same connection to be ignored. Most of
    the time it will cause the connection to be dropped due to an
    unparsable request, but when combined with "http-reuse never", or
    on totally idle servers, the client could expect the second request
    to reuse the same connection and perform a content smuggling attack
    that would allow to pass an unverified request to a server. For
    those who can't upgrade, a temporary workaround is to disable
    HTTP/2 by specifying "alpn http/1.1" on bind lines and adding
    "disable-h2-upgrade" in HTTP frontends. A CVE will be requested for
    this one.

  - HTTP/1.1 bodyless messages announcing a non-null Content-Length did
    not force close mode on the backend, potentially causing
    desynchronisation between HAProxy and the server in conjunction
    with other bugs.

  - FCGI record length truncation with large bufsize (>=65544) could
    enable request smuggling into PHP-FPM since the 16-bit
    content_length field silently truncated to 65535 bytes.

  - an unvalidated SNI name_len field in ClientHello could cause OOB
    heap reads of up to 65KB via XXH3, smp_dup(), and log-format leaks
    on any TCP frontend using req.ssl_sni, possibly causing crashes when
    used.

  - ECDSA JWT signatures with ES256/384/512 could cause a heap overflow
    of ~14 bytes in the DER conversion before verification.

  - Lua's httpclient headers conversion accepted more than 101 headers
    without bound checking, causing a stack buffer overflow reachable
    from any Lua action/task/service.

  - peers dictionary cache updates accepted an unvalidated entry id as
    array index, allowing OOB heap writes at attacker-controlled
    offsets.

  - Lua had a use-after-free of HTTP reason strings managed by Lua's GC
    between set_status() and start_response(), potentially leaking
    adjacent information from memory.

  - the regsub sample function could leak ~9-50KB of stale heap data
    when back-reference expansion overflowed the output buffer.

  - SPOE decode_varint() had no iteration cap, allowing pointer
    arithmetic to wrap and dereference memory ~64KB before the
    allocation, causing SIGSEGV or parser confusion.

  - in sample expressions, less common HTTP methods (PATCH etc.) are
    represented by both an enum and a string. The string part was not
    handled correctly in sample duplication functions, resulting in
    their contents appearing empty when trying to fetch the method.

  - QPACK varint decoding is now also limited to 62-bit, and had a risk
    of 1-byte OOB reads on truncated streams, which could cause
    incorrect header decoding.

  - config: a few argument parsing errors in conditional expressions
    used in ".if" could be misreported and even cause a crash during
    the parsing. Also, a few keywords relying on warnif_misplaced_*
    didn't check the return value and didn't count emitted warnings as
    warnings.

For more details, see the announcement:
https://www.mail-archive.com/haproxy@formilux.org/msg47016.html

For 6.2.27:

A major issue were fixed by this release. It was related to the scheme-based
normalization. The presence of commas in Host header and authority was permitted
and would be used to compare the values, which then would differ when read via
hdr(host) which splits them on commas, and under certain circumstances, trigger
crashes (at least it did in the OSS-Fuzz environment when injecting the values
directly at the HTX layer). The issue was fixed.  Remains the case of the comma
characters in authorities. Even though the spec permits commas in authorities
(not in domain names), there is currently no use case for this and it causes an
ambiguity with the historical use of hdr(host), so we preferred to just deny
them. The change was performed on the 3.4-dev10 and postponed for the next 3.3
release. It will probably be backported to lower versions too.

An issue in the FCGI multiplexer was fixed. The function responsible to emit
FCGI_PARAM records was not handling cases of full buffer in a consistent
way. The issue was quite limited, but the "http-send-name-header" option could
be silently ignored. The issue was fixed by reworking this function.

The scheme-based normalization was fixed to properly handle case of OPTIONS
requests. As stated in RFC9110#4.2.3, when the scheme-based normalization is
performed, an empty path must be normalized to "/", except for OPTIONS request.

Finally, a memory leak on error path (tools) and other minor issues were also
fixed.

For more details, see the announcement:
https://www.mail-archive.com/haproxy@formilux.org/msg47059.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 22f1e90d6ba61e9e6306d98461adad29debd6c7b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 5c644356a6..6bb5dda804 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.25.tar.gz.sha256
-sha256  d861cacbe2ed51ae8ad5fa9ee5165b4e5e2bccaa5b9e04324711761d7d946be9  haproxy-2.6.25.tar.gz
+# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.27.tar.gz.sha256
+sha256  ccdaf08e8653f9651992212b51af0b5513c2e2cf0cd822ca67c94cffe10386a6  haproxy-2.6.27.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 805cf4c4d9..a61c66d01f 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.6
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).25
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).27
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
