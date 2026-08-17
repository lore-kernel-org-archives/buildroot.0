Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA269C5DF66
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 14:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65703606E3;
	Mon, 17 Aug 2026 14:42:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0Xt6at3zr7n; Mon, 17 Aug 2026 14:42:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58F9C6072A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786977724;
	bh=i2eTx3VOuhvkWIl5hVEsMHgCVwTT9PuOnZj/Vxq/21E=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N45FCKH1W9nZjVqTsfozV+2M4y1i8Nh2Q9VPA0DiggoOEA221NOo62DC89jzUX9NA
	 8Onrifw4DCeO4MX/qtjlfOhtOSt3rbd8R2Jwh77M6JyQjH3fMyIsM0LUHzMjndMc71
	 wBAji5+619ahv9SvrkVB2tia8xY/O2u+999obT0VPMAX7xrdI3vySrsqj3y/sV06g8
	 dqYmGBC2gFn96KenBpF9wmYv5f47xkA8VUMHzEwGdoQBupx9MBptgcimRfV+K+Ncrz
	 rB+O3te6bOfXwpCHJroYLyVJN/+8zQBY0AK5K4wYfQVtWJ/N2ruMnSx9vC9h+icfil
	 CNc6cO46T3fOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58F9C6072A;
	Mon, 17 Aug 2026 14:42:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 049E5282
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 14:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF0E1401C7
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 14:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hndvM1PgmzTi for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 14:42:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9589400FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9589400FF
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 14:42:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48FE98B7C7; Mon, 17 Aug 2026 14:41:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Aug 2026 16:35:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bf6549d185aa3c106ed3f86a3314558d77d6745
X-Git-Newrev: 335a57525f28425fa076e1b2098679dc2211f8e4
X-Patchwork-Hint: ignore
Message-Id: <20260817144109.48FE98B7C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] packages/haproxy: security bump to version
 2.6.32
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/335a57525f28425fa076e1b2098679dc2211f8e4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bugfix release with large number of (security) fixes.

HAProxy 2.6.32 was released on 2026/07/29. It added 33 new commits
after version 2.6.31.

As for the 2.8.27, the announce is an expurgated copy-paste of the 3.4.3
announce:

* stats: Two issues about the stats page, reported by Red Hat/AISLE
  Research, were fixed.

  Proxies updated through the stats page while in "stats admin" mode were
  not subject to the "stats scope" filtering, meaning a scope meant to
  restrict which proxies are visible/actionable could be silently bypassed
  on POST requests.
  Separately, POST requests to the stats interface did not validate that the
  Origin (or Referer) header matched the Host, which is now checked to
  mitigate CSRF attacks.

* ssl-gencert: A memory leak on every certificate generation was fixed.

  Two temporary buffers were not freed after generating a certificate on the
  fly, leaking memory each time a new SNI triggered certificate
  generation. This issue was reported by Red Hat/AISLE Research.

* sample/protobuf: buffer overflows after pointer-shift converters, reported
  by Red Hat/AISLE Research and Charles Vosburgh, were fixed.

  Several converters (protobuf/ungrpc field extraction, ltrim())
  move the sample's data pointer forward on success but did not shrink the
  sample's recorded buffer capacity accordingly. A converter chained
  afterwards that relies on that capacity (e.g. padding via memset()) could
  then write past the end of the buffer, leading to heap corruption or a
  worker crash. All the affected converters now adjust the capacity
  together with the pointer.

* protobuf: A nested-path validation bypass reported by Red Hat/AISLE
  Research was fixed.

  The protobuf field lookup used for the protobuf()/ungrpc() converters did
  not strictly enforce hierarchical boundaries, so a flat sibling field
  could incorrectly satisfy a nested-path lookup (e.g. matching a root-level
  field as if it were nested under a parent). The lookup was rewritten as a
  strict, non-recursive path walker that correctly bounds each nesting
  level.
  Separately, a crash because of deprecated protobuf group wire types was
  fixed. These wire types are now explicitly rejected.

* http-fetch: Two crashes reachable from health-check configurations were
  fixed.

  "res.body"/"res.hdr"/... and similar response fetches assumed the
  health-check receive buffer always held an HTX message, which is only true
  for actual HTTP checks; on a plain TCP check, a hostile/misbehaving server
  could craft the first bytes of its reply to be misinterpreted as HTX
  internal fields, causing a wild read and worker crash (or leaking
  arbitrary process memory).
  Separately, "capture.req.hdr"/"capture.res.hdr" only validated the upper
  bound of their index argument, so a negative capture id was accepted at
  boot and dereferenced an out-of-bounds array entry at runtime, crashing
  the worker on the very first request.

* slz: Several issues were fixed in the SLZ library.

  A stream alternating many literals in the 144-255 range with cheap
  back-references could keep inflating indefinitely instead of falling
  back to a stored block, exceeding the library's documented worst-case
  output size by several percent. A new accounting mechanism now bounds
  this overhead. Practical impact on haproxy requires tune.bufsize above
  ~43 kB with the default reserve.
  Five small correctness fixes inherited from upstream libslz were also
  backported: Avoid reading up to a few bytes past the end of very short
  inputs on architectures without fast unaligned access; stop appending an
  extra, misplaced block to an already-finished deflate/gzip/zlib stream
  (which could corrupt the trailing checksum in ~2% of fuzzed streams); fix
  the Adler32 checksum accumulator sign handling on 32-bit systems
  (affecting the zlib format only); avoid an undefined-behaviour signed left
  shift when assembling input words byte by byte; and use the exact bit cost
  when deciding whether to emit the last literals of a block as a stored
  block, avoiding compressed output slightly larger than the documented
  worst case.

* peers: A heap overflow when replicating large stick-table dictionary
  entries was fixed.

  peer_prepare_updatemsg() never verified that a stick-table entry's
  dictionary value (e.g. server_key, up to ~16 kB) actually fit in the
  update message being built. Since the peers protocol is plain-text and
  unauthenticated, a rogue or compromised peer could plant an oversized
  entry that overflows the 16 kB trash buffer as soon as the victim
  replicates ("teaches") it, confirmed as a heap-buffer-overflow write. The
  function now checks the available room before encoding and fails cleanly
  if it doesn't fit. This was reported and fixes by Matt Suiche from Tolmo
  Inc.

And, as usual, the bunch of minor fixes here and there, mainly raised during
AI-assisted code reviews. Most were never noticed:

* HTX API: Some bugs about how the HTX API was used were fixed here and
  there.

* http-act: Double-frees and a couple of state bugs on parsing errors were
  fixed.

* http-fetch/http-ana/http-htx: Few out-of-bounds reads were fixed.

* http-conv: The last input character could be lost when calling url-dec
  converter, when the input buffer was full. This was fixed by failing the
  converter in that case.

* mux-h1: An extra 200ms delay was observed on some H2-to-H1 messages
  because the end of the message was not always properly detected. This
  case is now properly handled.

* sample: An edge case in be2hex() was fixed.

For more details, see the announcement:
https://www.mail-archive.com/haproxy@formilux.org/msg47353.html

Signed-off-by: Fred Lefranc <fred.lefranc.evs@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 6bb5dda804..2575c408d7 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.27.tar.gz.sha256
-sha256  ccdaf08e8653f9651992212b51af0b5513c2e2cf0cd822ca67c94cffe10386a6  haproxy-2.6.27.tar.gz
+# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.32.tar.gz.sha256
+sha256  8791585ee3bd24cde652d1d840ac7b1f73f086d5e9ec41c5e079592703ea52a4  haproxy-2.6.32.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index cf1484243c..970347d3ed 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.6
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).27
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).32
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
