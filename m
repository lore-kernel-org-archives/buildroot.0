Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E503FF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 18:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61DD8821BA;
	Tue, 28 Apr 2026 18:47:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3rIHPDRrYlxm; Tue, 28 Apr 2026 18:47:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CF7F821BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777402049;
	bh=VAiFGuHzwM/u83eWtO/RhhfoQyxwR83F573XIIY++OQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lIWIzI1E5qeVGzBxUPELHVuWO6KoHAqbu9k2yxJsMkJe3xB2sZEOujxRfldT9upja
	 /6lEINROIHCI6/79DJgYSGu/32ZBjp6oaR0sMJBWlzHkRqK4504DaYXKYZKnHKalat
	 9KfkIfPSY0Fu8H5Qj2xlpTSgaP4wd1xVVYP9YavWctpuUNZEcZTP1LULd8/hnixVfE
	 faJta5HH9pK33LDq5vshIiyOrLkvLOg2Aw6h3XxXfGakb9eNtEEXD/Xo6FrO1RKHeE
	 DHBguc8wNakIKNm8E9HukfFEHrZPCogMUu+qEtPrU0M47V+jn/EOnSCebc1cth2sRL
	 TsGTGN23NJ2TA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CF7F821BC;
	Tue, 28 Apr 2026 18:47:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E3F92231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5217821BA
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtFu86HXIRQw for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 18:47:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5AB5821B6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5AB5821B6
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:47:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BAFD8393E; Tue, 28 Apr 2026 18:47:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 20:46:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d3fc6fb9c1f564630a12218580396d230479bf9
X-Git-Newrev: 51ab6d2290f169f4bb96b8dbbab2d8fb4656766d
X-Patchwork-Hint: ignore
Message-Id: <20260428184726.9BAFD8393E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/syslog-ng: bump version to 4.11.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/51ab6d2290f169f4bb96b8dbbab2d8fb4656766d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/syslog-ng/syslog-ng/blob/syslog-ng-4.11.0/NEWS.md

Added sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
