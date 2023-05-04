Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A825C77B73
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 20:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB5AE4279E;
	Thu,  4 May 2023 20:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB5AE4279E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vk1iNnMLTNbm; Thu,  4 May 2023 20:53:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 821EA42748;
	Thu,  4 May 2023 20:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 821EA42748
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CBCD1BF863
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9FEC41828
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9FEC41828
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mLAxJeoORidp for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 20:53:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4438B4155B
 for <buildroot@buildroot.org>; Thu,  4 May 2023 20:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4438B4155B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E59485DB5; Thu,  4 May 2023 20:53:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 May 2023 22:53:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 689ce0eb80842135c7834434784b89935d93ed8d
X-Git-Newrev: c9a2015b65c555290710c61492f9896980879060
X-Patchwork-Hint: ignore
Message-Id: <20230504205324.2E59485DB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.02.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9a2015b65c555290710c61492f9896980879060
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8e117464920f2aa2ab7bfc288934c6af4e3504bb)
[Peter: drop Makefile / Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/CHANGES b/CHANGES
index e184f3f3be..c4bf9d0ad9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -775,6 +775,18 @@
 	#14731: BR2_PACKAGE_IOSTAT
 	#14751: LVM2 Outdated Link
 
+2022.02.12, released May 5th, 2023
+
+	Important / security related fixes.
+
+	Updated/fixed packages: agentpp, apache, ca-certificates,
+	containerd, coremark, dcron, eudev, ffmpeg, git,
+	intel-microcode, kexec, lcdproc, libmicrohttpd, libosmium,
+	libxml2, linux-tools, matio, osm2pgsql, poppler, postgresql,
+	protozero, python-web2py, runc, s390-tools, samba4, snmppp,
+	sudo, tcpdump, uclibc, vim, webkitgtk, wpewebkit,
+	xserver_xorg-server
+
 2022.02.11, released March 19th, 2023
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
