Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE977CD37AC
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 10:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DFA841455;
	Mon, 11 May 2026 10:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KW3tPEpWYC0p; Mon, 11 May 2026 10:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97E7A415D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778493747;
	bh=NfZA0l/U8bJmMA9lnWeCZAmsFwCig15+b6YW5kr/XFc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KaeeD54IcDczI5OVVI/A7HeIMq8amnvU640WuUuCnxWiYRHE0hJVtncxHRqp/+ByU
	 2CIi3U3iFJ+5AG/PMuZoTmWyVGg2tgKL1eK0SNjlrX9ziPktWFNQS1E3pc3qvxk5MB
	 NXxYErdUnNJ4Nia6LD5XilyQ7DlrN+LugZT3gMr7MzutbwbP65hUkkz3zD/CK49sE1
	 GI9Wt31G0VQ87yR+r8GcKrHxvT1Lj8RDIepuag+6JZ+UvcdQmqSE1FT4xeGFoY4xAp
	 kL8EuTXz8SANNw9Ndx5kdeqO9gIyvoGnMBVW3G1EdN8seolCj0G5NugLQwF4Wk0Pms
	 6Sy6yWkrBgnLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97E7A415D6;
	Mon, 11 May 2026 10:02:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8143D223
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FEF4402A8
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-04ZrFbRYIU for <buildroot@buildroot.org>;
 Mon, 11 May 2026 10:02:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B2204021E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B2204021E
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:02:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D725F85DA8; Mon, 11 May 2026 10:02:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 May 2026 12:00:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4254d4fd82c1929f034150b280f92b3264bc5847
X-Git-Newrev: ced8d46573c50443f0fc815050b3c69ce2857db5
X-Patchwork-Hint: ignore
Message-Id: <20260511100219.D725F85DA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: security bump version to
 3.14.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ced8d46573c50443f0fc815050b3c69ce2857db5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.python.org/downloads/release/python-3145/
https://docs.python.org/release/3.14.5/whatsnew/changelog.html

This release includes various security fixes:

gh-148178: Hardened _remote_debugging by validating remote debug offset
 tables before using them to size memory reads or interpret remote
 layouts.
gh-149254: Update Android and iOS installer to use OpenSSL 3.0.20.
gh-149017: Update bundled libexpat to version 2.8.0.
gh-90309: Base64-encode values when embedding cookies to JavaScript
 using the http.cookies.BaseCookie.js_output() method to avoid injection
 and escaping.
gh-148395: Fix a dangling input pointer in lzma.LZMADecompressor,
 bz2.BZ2Decompressor, and internal zlib._ZlibDecompressor when memory
 allocation fails with MemoryError, which could let a subsequent
 decompress() call read or write through a stale pointer to the already-
released caller buffer.
gh-148169: A bypass in webbrowser allowed URLs prefixed with %action to
 pass the dash-prefix safety check.
gh-146333: Fix quadratic backtracking in configparser.RawConfigParser
 option parsing regexes (OPTCRE and OPTCRE_NV). A crafted configuration
 line with many whitespace characters could cause excessive CPU usage.
gh-146211: Reject CR/LF characters in tunnel request headers for the
 HTTPConnection.set_tunnel() method.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 4 ++--
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 13e2b94336..2217f688d3 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-3144/
-sha256  d923c51303e38e249136fc1bdf3568d56ecb03214efdef48516176d3d7faaef8  Python-3.14.4.tar.xz
+# From https://www.python.org/downloads/release/python-3145/
+sha256  7e32597b99e5d9a39abed35de4693fa169df3e5850d4c334337ffd6a19a36db6  Python-3.14.5.tar.xz
 # Locally computed
 sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index c71cb0b05b..eeeb1c7e2a 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.14
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).4
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
