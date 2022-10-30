Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEA0C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 21:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37F3D812C8;
	Sun, 30 Oct 2022 21:32:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37F3D812C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E1Wp-cVsP6wt; Sun, 30 Oct 2022 21:32:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C7FE812C3;
	Sun, 30 Oct 2022 21:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C7FE812C3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A53A61BF956
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 819FA812C3
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 819FA812C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fhW9FCjUqR2Z for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 21:32:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A914F8129A
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 21:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A914F8129A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97D43876B3; Sun, 30 Oct 2022 21:32:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 22:31:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fada6de8b0798f896626723c3cc6a7aea4521d48
X-Git-Newrev: 6ad33ff4d77eee483f54add9ed9e2100d558120f
X-Patchwork-Hint: ignore
Message-Id: <20221030213223.97D43876B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolftpm: move Config.in comment
 near the option it is related to
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6ad33ff4d77eee483f54add9ed9e2100d558120f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wolftpm/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wolftpm/Config.in b/package/wolftpm/Config.in
index 4e712d0afb..4ed1853bde 100644
--- a/package/wolftpm/Config.in
+++ b/package/wolftpm/Config.in
@@ -23,6 +23,9 @@ config BR2_PACKAGE_WOLFTPM_WOLFCRYPT
 	  encryption. Disabling this option is not recommended as it
 	  could create a security breach in most environments.
 
+comment "wolfCrypt hooks need a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
 config BR2_PACKAGE_WOLFTPM_ST33
 	bool "ST33 extra functionality"
 	help
@@ -40,7 +43,4 @@ config BR2_PACKAGE_WOLFTPM_DEBUG
 	help
 	  Enable debug messages in wolfTPM.
 
-comment "wolfCrypt hooks need a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
