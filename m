Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DDBC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F318B81AF3;
	Mon,  6 Dec 2021 18:34:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uo0BLxGy2giO; Mon,  6 Dec 2021 18:34:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AB8580D34;
	Mon,  6 Dec 2021 18:34:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E6B0A1BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 544A460D6B
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w5JWSC_DAXRx for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B55360D90
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CC1DE81504; Mon,  6 Dec 2021 18:07:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Dec 2021 16:21:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22ea19e8f952b290991b977870170f4d6ac0f24b
X-Git-Newrev: ed7321051552366a8145c6486c24452aab6ff450
X-Patchwork-Hint: ignore
Message-Id: <20211206180743.CC1DE81504@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/p7zip: update help text of 7za and
 7zr
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed7321051552366a8145c6486c24452aab6ff450
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update help text of 7za and 7zr options (added in commit
c1723424b8189730087006fc879fdae0cc123ca1) as suggested by Peter
Korsgaard in
https://patchwork.ozlabs.org/project/buildroot/patch/20211025215520.3712974-1-fontaine.fabrice@gmail.com/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/p7zip/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/p7zip/Config.in b/package/p7zip/Config.in
index 3b30fd71cc..be2206eb76 100644
--- a/package/p7zip/Config.in
+++ b/package/p7zip/Config.in
@@ -21,14 +21,14 @@ choice
 config BR2_PACKAGE_P7ZIP_7ZA
 	bool "7za"
 	help
-	  Stand-alone executable that handles fewer archive formats
-	  than 7z
+	  Full 7za archiver. The program supports 7z, ZIP, CAB, ARJ,
+	  GZIP, BZIP2, TAR, CPIO, RPM and DEB formats
 
 config BR2_PACKAGE_P7ZIP_7ZR
 	bool "7zr"
 	help
-	  Stand-alone executable which is a "light-version" of 7za that
-	  only handles 7z archives and cannot handle encrypted archives
+	  Lightweight 7zr archiver. The program only handles 7z archives
+	  and cannot handle encrypted archives
 
 endchoice
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
