Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D17C5B572
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4450F40CC2;
	Fri, 14 Aug 2026 13:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JO3AhcJKSZ4Y; Fri, 14 Aug 2026 13:20:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FA0D40CE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713604;
	bh=JSeg6hDbyphm3Ib5njc7ZEtNy14b+TkiZrUB/22AVXw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W1cPkFl1V7FxhI9ullJVmxnPy9uSOzyCsoLpsF4uw2h271GaZQX6WRy9+Y3ZD8P8X
	 vPWVWR/PSplOicNJwW/JTboGL7D8Amt7Aqwe9FNpw+XWwhmdyM4vIYm79xfOkc0KS+
	 YIW4CnfYKOLrpTmvxu5WuAZWwORhU3WXAgQ1D+y3BkZYkrcYBdDRO+LLYw09E5Wgxg
	 KqagIoju2mVFhb8ka122ydbnsd4YArhPQjyvb6x67Dw1+SRhU4pw/AtIwTKYJxbosN
	 y6gQJpz3yG+0T6ggOlWZxmZZiPymcMmruVM3NE7G76V2MwLUY7LILtr9O/PNhpR1i2
	 6T5t2SbARu5kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FA0D40CE6;
	Fri, 14 Aug 2026 13:20:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 57806139B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4835980E3E
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r1Qqs4UI5NLB for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6149281011
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6149281011
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65F078D667; Fri, 14 Aug 2026 13:18:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Aug 2026 14:42:02 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7ec90ca53a1a6a52488aa685a70058125b7e7a3d
X-Git-Newrev: fcb6a725efc57141d4adfcb87cf5d3a6c9a44087
X-Patchwork-Hint: ignore
Message-Id: <20260814131856.65F078D667@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/syslog-ng: bump
 version to 4.11.0
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fcb6a725efc57141d4adfcb87cf5d3a6c9a44087
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/syslog-ng/syslog-ng/blob/syslog-ng-4.11.0/NEWS.md

Added sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 51ab6d2290f169f4bb96b8dbbab2d8fb4656766d)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/syslog-ng/syslog-ng.conf | 2 +-
 package/syslog-ng/syslog-ng.hash | 3 ++-
 package/syslog-ng/syslog-ng.mk   | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index f6d0e83433..c4b0cbe54a 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
-@version: 4.8
+@version: 4.11
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index 04f33926d5..a276e85385 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,6 @@
+# From https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.11.0
+sha256  37ea0d4588533316de122df4e1b249867b0a0575f646c7478d0cc4d747462943  syslog-ng-4.11.0.tar.gz
 # Locally computed
-sha256  f82732a8e639373037d2b69c0e6d5d6594290f0350350f7a146af4cd8ab9e2c7  syslog-ng-4.8.3.tar.gz
 sha256  d7d51f8d0f6ee9757a371080e7f5fa19ac73afbef14db6e981705cf1ec813d6b  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 7bf77da205..2faf2cebe5 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 4.8.3
+SYSLOG_NG_VERSION = 4.11.0
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
