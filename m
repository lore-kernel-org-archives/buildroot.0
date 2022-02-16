Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D12BC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 13:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4DBD4051B;
	Wed,  9 Mar 2022 13:32:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aYB-PHtSVLiU; Wed,  9 Mar 2022 13:32:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85E8C40185;
	Wed,  9 Mar 2022 13:32:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 541BC1BF9C2
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 13:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49EBA60BE5
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 13:30:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bICq_LCr9hWh for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 13:30:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC7AB60BEB
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 13:30:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 613B483916; Wed,  9 Mar 2022 13:21:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 20:49:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6aca97d6e51a006187bcd3319cb7ff1a92380c66
X-Git-Newrev: 9a2beaf778d3649ab395c2a931a3935f69191585
X-Patchwork-Hint: ignore
Message-Id: <20220309132156.613B483916@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/barebox: bump version to 2022.01.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a2beaf778d3649ab395c2a931a3935f69191585
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/barebox/Config.in    | 4 ++--
 boot/barebox/barebox.hash | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 23f8a5ac8a..c16fea3cea 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2021.12.0"
+	bool "2022.01.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2021.12.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2022.01.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index 0a853866b5..3d52d40beb 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,8 +1,8 @@
 # From https://www.barebox.org/download/barebox-2021.12.0.tar.bz2.md5
-md5  199b6d7ff3441cec2062ab18a52454dc  barebox-2021.12.0.tar.bz2
+md5  753ba533ced54f4113f9e97846c13fc1  barebox-2022.01.0.tar.bz2
 
 # Locally calculated
-sha256  555569fe9e71524e0bf927eaa2c1aa2e81ee2c34dd71e39fe21620db6ccc8aa6  barebox-2021.12.0.tar.bz2
+sha256  ddf7898075bec05e4865ce0f7a2ac19c2b1efaaa0d066eba1939494e25711d28  barebox-2022.01.0.tar.bz2
 
 # License files, locally computed
 sha256  ab1122aa9f9073ad1ec824edcd970b16a6a7881a34a18fd56c080debb2dca5d4  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
