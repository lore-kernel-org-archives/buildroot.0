Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1D1EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B86CA6172A;
	Fri, 13 Feb 2026 19:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AZfF3WuO_nXx; Fri, 13 Feb 2026 19:39:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C19BB61735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011597;
	bh=leNNjN5wLTxF2ZfiiDHLEslKtYxc91Ck5YMY8hDkzmc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OFmHQVYXFdTvw4R10AQu/ZIpxE3tJjBZNH4Uz/jrLuZVyQOowFrPirOE/lDaOfAR1
	 XZsi7/kvzRxXt3fPUgSbLcMAiMZSiKi+Eair+YoU00i5vU0QYLGpvpUS/taAWhp3fc
	 qD0AWOodCBmv8Fi+UIzOTRSSAiRFnhHgLGkwvQgA2BNXjWvQ54TsriEzy6vh3fDzr4
	 7kVDowrt8U1bMACynoRdjP7mPaDEpiY8RyAN3gp0/g6qhsFE+EYBj1gBeLGsCkzylI
	 s8mNSShLgmpQc2fqMXmAxNqMuVs6puGDTBDi8EbhJF9PuVU1LNcJa1ZPLEu65sJfOR
	 xthjYzK6z8g3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C19BB61735;
	Fri, 13 Feb 2026 19:39:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85FF2283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECB9E413DE
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Ahy68OjhP8Q for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 279EE41302
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 279EE41302
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D475807AF; Fri, 13 Feb 2026 19:37:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:34:01 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 51f30ea2a1e234d0720b71d820dac56d4b134ad2
X-Git-Newrev: b12c1e0abf3bdee467b278edca57fd1ed0c60308
X-Patchwork-Hint: ignore
Message-Id: <20260213193706.1D475807AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python3: security
 bump to 3.13.12
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b12c1e0abf3bdee467b278edca57fd1ed0c60308
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

This release fixes the following security related issues:

* gh-144125: BytesGenerator will now refuse to serialize (write) headers that
  are unsafely folded or delimited; see verify_generated_headers.
* gh-143935: Fixed a bug in the folding of comments when flattening an
  email message using a modern email policy. Comments consisting of a
  very long sequence of non-foldable characters could trigger a forced
  line wrap that omitted the required leading space on the continuation
  line, causing the remainder of the comment to be interpreted as a new
  header field. This enabled header injection with carefully crafted
  inputs.
* gh-143925: Reject control characters in data: URL media types.
* gh-143919: Reject control characters in http.cookies.Morsel fields and values.
* gh-143916: Reject C0 control characters within wsgiref.headers.Headers
  fields, values, and parameters.

Full release notes:
https://docs.python.org/release/3.13.12/whatsnew/changelog.html

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python3/python3.hash | 5 ++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index fddfcc1a4d..89282fb41b 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,4 @@
-# From https://www.python.org/downloads/release/python-31311/
-md5  4c3517dd8b1fd76377dcb3e5e8f71ad6  Python-3.13.11.tar.xz
+# From https://www.python.org/downloads/release/python-31312/
+sha256  2a84cd31dd8d8ea8aaff75de66fc1b4b0127dd5799aa50a64ae9a313885b4593  Python-3.13.12.tar.xz
 # Locally computed
-sha256  16ede7bb7cdbfa895d11b0642fa0e523f291e6487194d53cf6d3b338c3a17ea2  Python-3.13.11.tar.xz
 sha256  78b12c3a81360b357002334f0e70ea0e92eebf7a9b358805c03c48484945f3bb  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index d8ee11e8a8..8f7574347b 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.13
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).11
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).12
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
