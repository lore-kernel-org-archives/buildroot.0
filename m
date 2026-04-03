Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C74E7E366
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE873608AF;
	Fri,  3 Apr 2026 10:27:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F0lUP64EsIGP; Fri,  3 Apr 2026 10:27:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21B38608B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212029;
	bh=+TPdUf86vRPB5zyHjv5FxzzIGNzAtrTKuSMSc57CI1E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ho1X88Xze4njxADtsCnldg2Q7kyOe4ZdPxxPyhskOI1KwOyNQjANyeqHfL3huzrUn
	 mXY9owrg541onFO2w6sVJ+DoTdo60tQZzI82vUX8+HtKut6G0rSXlsfWJYGOkWRYel
	 o3RErXEVnT/zimsdCt8QTdyX3jgCUr/kUwJJWOINdrdum/6AAKx7QxqFNqKpMCoHBb
	 /hBc2X294oX+ZKWppMT9yvON9xWqREDwWkBBlsNAJUUD2nohpbDVGetK76m91TUAO6
	 VU4nzSUPODOJa158uOT2JA9PoPWgF7CuAUgUUmeqUeWFGXs3dfZkvjkGG8QFnTmPbB
	 cf6qV9CLAhtbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21B38608B2;
	Fri,  3 Apr 2026 10:27:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 573B42CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C48F40238
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PcqqfBWntfZh for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:26:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54B864020D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54B864020D
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C720B7FFA9; Fri,  3 Apr 2026 10:26:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 12:21:33 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 317fa104f15501227b22bad2dfb5925c0ef7f1b1
X-Git-Newrev: 6b208dd1d21e9b2d3a2663c1bb1b2c9c62408073
X-Patchwork-Hint: ignore
Message-Id: <20260403102656.C720B7FFA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ruby: security
 bump to v3.4.9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6b208dd1d21e9b2d3a2663c1bb1b2c9c62408073
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Read the announcements:

- https://www.ruby-lang.org/en/news/2025/10/07/ruby-3-4-7-released/
- https://www.ruby-lang.org/en/news/2025/12/17/ruby-3-4-8-released/
- https://www.ruby-lang.org/en/news/2026/03/11/ruby-3-4-9-released/

This fixes a few vulnerabilities in bundled gems (ruby libraires):

- CVE-2025-27221:
    In the URI gem before 1.0.3 for Ruby, the URI handling methods
    (URI.join, URI#merge, URI#+) have an inadvertent leakage of
    authentication credentials because userinfo is retained even after
    changing the host.
    https://www.cve.org/CVERecord?id=CVE-2025-27221

- CVE-2025-58767:
    REXML is an XML toolkit for Ruby. The REXML gems from 3.3.3 to 3.4.1
    has a DoS vulnerability when parsing XML containing multiple XML
    declarations. If you need to parse untrusted XMLs, you may be impacted
    to these vulnerabilities. The REXML gem 3.4.2 or later include the
    patches to fix these vulnerabilities.
    https://www.cve.org/CVERecord?id=CVE-2025-58767

- CVE-2025-61594:
    URI is a module providing classes to handle Uniform Resource
    Identifiers. In versions prior to 0.12.5, 0.13.3, and 1.0.4, a bypass
    exists for the fix to CVE-2025-27221 that can expose user credentials.
    When using the `+` operator to combine URIs, sensitive information
    like passwords from the original URI can be leaked, violating RFC3986
    and making applications vulnerable to credential exposure. Versions
    0.12.5, 0.13.3, and 1.0.4 fix the issue.
    https://www.cve.org/CVERecord?id=CVE-2025-61594

- CVE-2026-27820:
	The zstream_buffer_ungets function prepends caller-provided bytes
	ahead of previously produced output but fails to guarantee the backing
	Ruby string has enough capacity before the memmove shifts the existing
	data. This can lead to memory corruption when the buffer length exceeds
	capacity.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 90faed4c32..e8bf51ea43 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2025/09/16/ruby-3-4-6-released/
-sha512  29000b3396ab95fc2dc13d2d78441ff5c34258e5421115181c54b1b4d55d5c0d4f3d0c3cec6b32b9a1bb8de5c51b383fcad4369ec3fb244fd0ce182afbe79ba4  ruby-3.4.6.tar.xz
+# https://www.ruby-lang.org/en/news/2026/03/11/ruby-3-4-9-released/
+sha512  356fb47cc56f2d25198cb95253fc20ff7d9a6fd1fa53bc475e5c440012aebe27562537c399d271357235114ade263fd625029b66cb0f9b526f9c04f169fb9580  ruby-3.4.9.tar.xz
 
 # License files, Locally calculated
 sha256  a2021e52d5d6adf7e3f45aab9d2b860ce03cdf6153776853e11d5668193eecfd  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index ffe42968b5..c56d2510be 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 3.4
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).6
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).9
 RUBY_VERSION_EXT = 3.4.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
