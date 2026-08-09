Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CEAC5AD4E
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 15:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD8314054E;
	Sun,  9 Aug 2026 15:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oAhPHoaCFm4W; Sun,  9 Aug 2026 15:22:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66FFC40539
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786288962;
	bh=iHQtE8l2GpPkHCnrpw6sUOWqk78IYQp/zeJBU8MFhjc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Mo8FkuYS3BggwsDPA011WQCXWdxMElOqbNN/R8m3eQmssjI37PkhFT1A77Zkhpd4h
	 trV5eQVpESscAxBAI5hpqThKrprtxrc1eoSPUlIpk21+SCbKkk9RK6ovc6C5Ey2jxk
	 9YHQ8H9+uEqHhZixtffpkd7dfHIMJ+hLlFmaVWYCbn53zGoFywIL0ehCn6fUN0WcqD
	 MREBopAMmCUMbm+UxDsvdhMfXzYcbIPABY3NUGcp+6nSrTsSnHK9ZwwOVTSvkDVIoE
	 A2syGFmKEUrNiX7qYWs0e4JBMyDOxkgZvuiAxaAibJPGtVPAVtXFjhlhTlbgHgcefi
	 gg205eE2Pjmmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66FFC40539;
	Sun,  9 Aug 2026 15:22:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DD995198
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF8096062B
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RywMcLN-43oR for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 15:22:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95ED9605FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95ED9605FF
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 15:22:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 043A08D243; Sun,  9 Aug 2026 15:21:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Aug 2026 17:10:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54f66d88295cbbd09d51139f8c2a2c80ca03fb26
X-Git-Newrev: 732a933e348440dee758c6fe90b384c8e3f7b052
X-Patchwork-Hint: ignore
Message-Id: <20260809152151.043A08D243@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/syslog-ng: security bump version
 to 4.12.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/732a933e348440dee758c6fe90b384c8e3f7b052
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/syslog-ng/syslog-ng/blob/syslog-ng-4.12.0/NEWS.md

Fixes CVE-2026-39879.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/syslog-ng/syslog-ng.conf | 2 +-
 package/syslog-ng/syslog-ng.hash | 4 ++--
 package/syslog-ng/syslog-ng.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index c4b0cbe54a..ae6f190c92 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
-@version: 4.11
+@version: 4.12
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index a276e85385..95621bde26 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
-# From https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.11.0
-sha256  37ea0d4588533316de122df4e1b249867b0a0575f646c7478d0cc4d747462943  syslog-ng-4.11.0.tar.gz
+# From https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.12.0
+sha256  03a03d19ac203dca53c7ec79a7005c8a850665a95ff4cd0f1e7bb4c497c64d46  syslog-ng-4.12.0.tar.gz
 # Locally computed
 sha256  d7d51f8d0f6ee9757a371080e7f5fa19ac73afbef14db6e981705cf1ec813d6b  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 2faf2cebe5..12c305b9cd 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 4.11.0
+SYSLOG_NG_VERSION = 4.12.0
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
