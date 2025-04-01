Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51C2C36010
	for <buildroot@archiver.kernel.org>; Tue,  1 Apr 2025 19:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 889E0413A9;
	Tue,  1 Apr 2025 19:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dq92IjAJLO-W; Tue,  1 Apr 2025 19:32:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B85C1413A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B85C1413A1;
	Tue,  1 Apr 2025 19:32:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DB2FA137
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 19:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1C37610EC
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 19:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PP4LARCQzcIt for <buildroot@buildroot.org>;
 Tue,  1 Apr 2025 19:32:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC184610CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC184610CF
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 19:32:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E47D7839E1; Tue,  1 Apr 2025 19:32:34 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 1 Apr 2025 21:18:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02f42887c3019fa2347fa90eac0dfeb1be4d40f5
X-Git-Newrev: 2b6b2333cff7f53972bed8c449bd3310f195c0a0
X-Patchwork-Hint: ignore
Message-Id: <20250401193234.E47D7839E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spdlog: bump to version 1.15.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b6b2333cff7f53972bed8c449bd3310f195c0a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release Notes: https://github.com/gabime/spdlog/releases/tag/v1.15.2

- fixes an issue with the %D format flag found by OSS-Fuzz

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/spdlog/spdlog.hash | 2 +-
 package/spdlog/spdlog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spdlog/spdlog.hash b/package/spdlog/spdlog.hash
index 8c6838160b..12fd2e2fd4 100644
--- a/package/spdlog/spdlog.hash
+++ b/package/spdlog/spdlog.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  25c843860f039a1600f232c6eb9e01e6627f7d030a2ae5e232bdd3c9205d26cc  spdlog-1.15.1.tar.gz
+sha256  7a80896357f3e8e920e85e92633b14ba0f229c506e6f978578bdc35ba09e9a5d  spdlog-1.15.2.tar.gz
 sha256  4ccecab18d1ff0b61174fe3d6c430541625d3ddb865b0d5887db296f883c76e7  LICENSE
diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
index 09d432defe..fb9a33c2ca 100644
--- a/package/spdlog/spdlog.mk
+++ b/package/spdlog/spdlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPDLOG_VERSION = 1.15.1
+SPDLOG_VERSION = 1.15.2
 SPDLOG_SITE = $(call github,gabime,spdlog,v$(SPDLOG_VERSION))
 SPDLOG_LICENSE = MIT
 SPDLOG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
