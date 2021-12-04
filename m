Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAC7C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BD4680D80;
	Sat,  4 Dec 2021 22:09:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 711sTqXyCyac; Sat,  4 Dec 2021 22:09:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 800D180D79;
	Sat,  4 Dec 2021 22:09:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7CDC01BF95C
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68DB0408CE
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:09:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vmmKQpSJ4Vp8 for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:09:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A411040647
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:09:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6E5AE935CD; Sat,  4 Dec 2021 22:04:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 23:04:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: eaa442089072ba431e606d4a8332fe414bec4327
X-Git-Newrev: d3904da8ba3d620700f39867f6a1c4c391624b9e
X-Patchwork-Hint: ignore
Message-Id: <20211204220411.6E5AE935CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/barebox: bump version to
 2021.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d3904da8ba3d620700f39867f6a1c4c391624b9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/barebox/Config.in    | 4 ++--
 boot/barebox/barebox.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index dd7985381f..01d66dce70 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2021.10.0"
+	bool "2021.11.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2021.10.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2021.11.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index ebd81cf18d..371bf15029 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,8 +1,8 @@
-# From https://www.barebox.org/download/barebox-2021.10.0.tar.bz2.md5
-md5  7d79102fd8d45bf3756b4f3a569654a8  barebox-2021.10.0.tar.bz2
+# From https://www.barebox.org/download/barebox-2021.11.0.tar.bz2.md5
+md5  e7f7629701e9e8b9566b6799b422de5e  barebox-2021.11.0.tar.bz2
 
 # Locally calculated
-sha256  4bb077b54d03743b3e8c20751d318dcc3ef03b20abe1a64a79c413ea03de3632  barebox-2021.10.0.tar.bz2
+sha256  34fbd33e17d052a7d8d64918183170675008768fe7618c31c16b9f5c92803c6a  barebox-2021.11.0.tar.bz2
 
 # License files, locally computed
 sha256  ab1122aa9f9073ad1ec824edcd970b16a6a7881a34a18fd56c080debb2dca5d4  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
