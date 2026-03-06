Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7B7FCC051
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 18:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05426822EC;
	Fri,  6 Mar 2026 18:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XV-UKSik5JxU; Fri,  6 Mar 2026 18:07:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3061E82208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772820446;
	bh=nuEaI6XvqhLRoJ8EnFYOxX07ueTbS9qk6bF0ndKMAp8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XY79MCjGYRr+vIzbullp2QWi4lniq7PDef37nSCfcpnrtuVMabuNmHuK1JiPYJPN/
	 Yjhsro/nhpOP/vClkm/K6k9QrzeFVSjFuz5XKiJKnQJ1LctNIUMLhfT8wk/GfRZdxD
	 /j7tHpdiHr5tEpGaKFAnGHsoSacdgit3e+e9ypLf7gpyiEvkxKsPTNASkivnXsoAeY
	 fWwVUKA/IiUtbfDSIRZTxgQO3E5b0qcUpQ9mDwHouZv3p2JRDbJ4X5cuV0i+eBNU2Y
	 8keLDpx3yjV8lumM7bkyJJRosA03BdusAluZRJiKmbOAVAXzHVi0vsgHMz6Iu1b2aR
	 p49/jrWp7QL7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3061E82208;
	Fri,  6 Mar 2026 18:07:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B83725B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D16D611DF
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n93gc8bYg6h0 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 18:07:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FF1B611A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FF1B611A0
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:07:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41D8B84707; Fri,  6 Mar 2026 18:07:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 19:05:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa461fd35379784b08042633c1f70a381d45a4e3
X-Git-Newrev: b483b6eac4653f586ef694c9593a4459065a9902
X-Patchwork-Hint: ignore
Message-Id: <20260306180724.41D8B84707@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mali-driver: bump to version
 2026-03-04
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b483b6eac4653f586ef694c9593a4459065a9902
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This version extends the Linux version we can build with from 5.11.0
back to version 5.10.220.

Fixes:
https://autobuild.buildroot.org/results/fa0c3acfcfc94b0600842ace6d8b09ba2c6c593f/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mali-driver/mali-driver.hash | 2 +-
 package/mali-driver/mali-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mali-driver/mali-driver.hash b/package/mali-driver/mali-driver.hash
index 0c0de10dac..9929788a4d 100644
--- a/package/mali-driver/mali-driver.hash
+++ b/package/mali-driver/mali-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cafcf9af1c8ce5045dc0f077c51b87d204ddad6cf7e5db22bbf6a3d4356be972  mali-driver-5c13ca89d83dec3e51ed1880dff726838bfdecd3.tar.gz
+sha256  438bf34c19974a4e53f60cd95c38e5f6d94089284df7d60e773e7e4e9372a716  mali-driver-5731d558a34b82290eaad22a579a1bd8588d26e8.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mali-driver/mali-driver.mk b/package/mali-driver/mali-driver.mk
index 77ef8963a5..90aeb9384a 100644
--- a/package/mali-driver/mali-driver.mk
+++ b/package/mali-driver/mali-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MALI_DRIVER_VERSION = 5c13ca89d83dec3e51ed1880dff726838bfdecd3
+MALI_DRIVER_VERSION = 5731d558a34b82290eaad22a579a1bd8588d26e8
 MALI_DRIVER_SITE = $(call github,bootlin,mali-driver,$(MALI_DRIVER_VERSION))
 MALI_DRIVER_DEPENDENCIES = linux
 MALI_DRIVER_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
