Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34207CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C725685691;
	Tue,  9 Jun 2026 13:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fYZU1xBuahDZ; Tue,  9 Jun 2026 13:03:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B199E85B13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010238;
	bh=CoFiCD+157dxo8doUv0/PhQYefKDEIeiWNRN1SJexKA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cBchC9B2ezN0E2LB6JkUesXHkzEu4Lc+CYl9CUlMnxOixVTaki92qnEJ8kOKB3mqP
	 CJ2AaHBFxtroxKql89h16bwKw9bGFK2vnnL+nyG6mtTR/ytmfVLODzl/Z6f3+rWSwG
	 PLfSW+FietHiIExfmL8T2xcIPXetBswiZydK1wvPKy0MZySA4OIaVhUxUssMM8qGoY
	 Njava05Y8BDpxjUung9mMPZFlzOM8N77GD23OcoLBn61Tdb5z+EB0EiLF6ts5qFq41
	 h9LSJht4eOBFjawVStFu15uXmB0yIOQhFw41P0bblA5IUIQFn9pIPfG+UEX1rCU6Fa
	 ncPPrqgM44X1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B199E85B13;
	Tue,  9 Jun 2026 13:03:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 384EB2EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33EEE423C1
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQLPVEQIv_Mh for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 012A3426E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 012A3426E0
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A9F887E68; Tue,  9 Jun 2026 13:01:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 10:19:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: abcaada9fd31abf697253d37e645485cd220cadb
X-Git-Newrev: 87aa6af2411b4623d8c01f2259091f1917ee9ae4
X-Patchwork-Hint: ignore
Message-Id: <20260609130121.3A9F887E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdbus-cpp: bump to version 2.3.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/87aa6af2411b4623d8c01f2259091f1917ee9ae4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
 * https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v2.3.0

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/sdbus-cpp/sdbus-cpp.hash | 2 +-
 package/sdbus-cpp/sdbus-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
index a610b17140..db1c5d5fee 100644
--- a/package/sdbus-cpp/sdbus-cpp.hash
+++ b/package/sdbus-cpp/sdbus-cpp.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  da69a0104beb6e51415a59f1571a47beb1eacc65cc6027b250eb1cf13ff4f802  sdbus-cpp-2.2.1.tar.gz
+sha256  8c01d28fa7b1a973d7a9cfdfd65480e733a52172506eaa1fea225b681590fe3c  sdbus-cpp-2.3.0.tar.gz
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
 sha256  a1c9e75e25d8f2ce18017c88978edab2f0dbc7814ad0697d4ff2e5e59959f657  COPYING-LGPL-Exception
diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
index abe12c05b9..d8743c66b3 100644
--- a/package/sdbus-cpp/sdbus-cpp.mk
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDBUS_CPP_VERSION = 2.2.1
+SDBUS_CPP_VERSION = 2.3.0
 SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
 SDBUS_CPP_INSTALL_STAGING = YES
 SDBUS_CPP_DEPENDENCIES = host-pkgconf systemd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
