Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E3FC433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 15:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8995D4021F;
	Sun,  5 Dec 2021 15:22:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W3gRIDiz6kAx; Sun,  5 Dec 2021 15:22:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88D3940427;
	Sun,  5 Dec 2021 15:22:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C3A831BF57C
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B405140463
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:21:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AYnJObb-nVwG for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 15:21:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 148D8402FC
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 15:21:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3327980073; Sun,  5 Dec 2021 15:17:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Dec 2021 16:21:29 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 22ea19e8f952b290991b977870170f4d6ac0f24b
X-Git-Newrev: ed7321051552366a8145c6486c24452aab6ff450
X-Patchwork-Hint: ignore
Message-Id: <20211205151703.3327980073@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/p7zip: update help
 text of 7za and 7zr
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
