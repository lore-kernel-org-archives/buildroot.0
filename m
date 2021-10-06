Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64332C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:33:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32DF761184
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 32DF761184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0993F60672;
	Wed,  6 Oct 2021 19:33:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R0zAIOO5tTLb; Wed,  6 Oct 2021 19:33:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5813D606F9;
	Wed,  6 Oct 2021 19:33:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB1991BF350
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73E1740111
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:30:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dO9OU94w8S7X for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:30:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75EC3407A1
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:30:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F002C93466; Wed,  6 Oct 2021 19:28:13 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 21:11:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e822fcadf409c3eb4e721ad6780117ef77f45d7
X-Git-Newrev: b55e4d9fd93c371254f10031b3f8a0f3412394be
X-Patchwork-Hint: ignore
Message-Id: <20211006192813.F002C93466@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sam-ba: bump version to 3.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=b55e4d9fd93c371254f10031b3f8a0f3412394be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sadly the most recent version of Microchip's SAM-BA programming tool is no longer hosted
on GitHub. Therefore the package is downloaded from Microchip directly.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/sam-ba/Config.in.host | 1 +
 package/sam-ba/sam-ba.hash    | 2 +-
 package/sam-ba/sam-ba.mk      | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/sam-ba/Config.in.host b/package/sam-ba/Config.in.host
index 2236b5f48a..b96e377e79 100644
--- a/package/sam-ba/Config.in.host
+++ b/package/sam-ba/Config.in.host
@@ -8,3 +8,4 @@ config BR2_PACKAGE_HOST_SAM_BA
 	  microcontrollers.
 
 	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SoftwareTools
+	  https://www.microchip.com/en-us/development-tool/SAM-BA-IN-SYSTEM-PROGRAMMER
diff --git a/package/sam-ba/sam-ba.hash b/package/sam-ba/sam-ba.hash
index 1bc14f3fd7..10b95c9c0e 100644
--- a/package/sam-ba/sam-ba.hash
+++ b/package/sam-ba/sam-ba.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  dc32c49688bbfab5aa687042caae5f611fe3d9e722098a561f8f5d2fbc57249d  sam-ba_3.3.1-linux_x86_64.tar.gz
+sha256  f66e431f0401b197e80599156ea93aa3aab050bc4d16523c95fae1107ef9101c  sam-ba_3.5-linux_x86_64.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.txt
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 3082d49192..10bea8ef70 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SAM_BA_VERSION = 3.3.1
-SAM_BA_SITE = https://github.com/atmelcorp/sam-ba/releases/download/v$(SAM_BA_VERSION)
+SAM_BA_VERSION = 3.5
+SAM_BA_SITE = https://www.microchip.com/content/dam/mchp/documents/MPU32/ProductDocuments/SoftwareTools
 SAM_BA_SOURCE = sam-ba_$(SAM_BA_VERSION)-linux_x86_64.tar.gz
 SAM_BA_LICENSE = GPLv2
 SAM_BA_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
