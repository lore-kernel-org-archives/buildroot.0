Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2323D10BF9
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 13:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 990C440797;
	Sat, 26 Oct 2024 13:24:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Vm_mnPEKSTp; Sat, 26 Oct 2024 13:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D95A940768
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D95A940768;
	Sat, 26 Oct 2024 13:24:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 081495C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8D7C4065C
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DcccD9xi3rzx for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 13:24:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98862405E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98862405E6
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:24:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8161283AD5; Sat, 26 Oct 2024 13:24:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 15:22:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b18c67f2651ac64e865a1dbd46de60ce8390959
X-Git-Newrev: 5440d6c4464d8dd25c9315e49e97cd91884ccde2
X-Patchwork-Hint: ignore
Message-Id: <20241026132401.8161283AD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liblinear: change homepage url to
 use https
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5440d6c4464d8dd25c9315e49e97cd91884ccde2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package homepage http url redirects to https. This commit updates
this url to directly use https.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/liblinear/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/liblinear/Config.in b/package/liblinear/Config.in
index cabcba05ad..8c112678cc 100644
--- a/package/liblinear/Config.in
+++ b/package/liblinear/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBLINEAR
 	  liblinear is a linear classifier for data with millions of
 	  instances and features.
 
-	  http://www.csie.ntu.edu.tw/~cjlin/liblinear/
+	  https://www.csie.ntu.edu.tw/~cjlin/liblinear/
 
 comment "liblinear needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
