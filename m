Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF64C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 11:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B64084013A;
	Sat, 15 Jan 2022 11:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wsfE26tD4JaP; Sat, 15 Jan 2022 11:36:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1FDD400C8;
	Sat, 15 Jan 2022 11:36:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 930931BF2E4
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FFE6400C8
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dy590Eavbly7 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 11:36:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E1D040004
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:36:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 71F0382A7D; Sat, 15 Jan 2022 11:29:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 12:34:23 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 310d3d6bef9719ee7e147e59697143e0f1c0e023
X-Git-Newrev: 9087da9922f10513c604d73f8d5d6d86cea91768
X-Patchwork-Hint: ignore
Message-Id: <20220115112945.71F0382A7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/ruby: security
 bump to version 2.7.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=9087da9922f10513c604d73f8d5d6d86cea91768
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes the following security issues:

- CVE-2021-41817: Regular Expression Denial of Service Vulnerability of Date
  Parsing Methods
  https://www.ruby-lang.org/en/news/2021/11/15/date-parsing-method-regexp-dos-cve-2021-41817/

- CVE-2021-41816: Buffer Overrun in CGI.escape_html
  https://www.ruby-lang.org/en/news/2021/11/24/buffer-overrun-in-cgi-escape_html-cve-2021-41816/

- CVE-2021-41819: Cookie Prefix Spoofing in CGI::Cookie.parse
  https://www.ruby-lang.org/en/news/2021/11/24/cookie-prefix-spoofing-in-cgi-cookie-parse-cve-2021-41819/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index cba48418e7..408bd04e43 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2021/07/07/ruby-2-7-4-released/
-sha256  2a80824e0ad6100826b69b9890bf55cfc4cf2b61a1e1330fccbcb30c46cef8d7  ruby-2.7.4.tar.xz
+# https://www.ruby-lang.org/en/news/2021/11/24/ruby-2-7-5-released/
+sha256  d216d95190eaacf3bf165303747b02ff13f10b6cfab67a9031b502a49512b516  ruby-2.7.5.tar.xz
 # License files, Locally calculated
 sha256  b09ca195d2de08f0aacfa8793d0af62d7681c304b3ef714b75813721823295a6  LEGAL
 sha256  967586d538a28955ec2541910cf63c5ac345fcdea94bfb1f1705a1f6eb36bcbb  COPYING
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 24449eac71..d7648efdc6 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 2.7
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).4
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).5
 RUBY_VERSION_EXT = 2.7.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
