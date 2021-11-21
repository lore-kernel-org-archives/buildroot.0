Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F068C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9BD484BB9;
	Mon,  6 Dec 2021 18:37:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id es0S0FIamJsP; Mon,  6 Dec 2021 18:37:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38E2784BAF;
	Mon,  6 Dec 2021 18:37:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 244291BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C839341C6A
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7wqd1fz2TgmP for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40F7141C50
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DD33481504; Mon,  6 Dec 2021 18:07:40 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 21:46:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed63b18caf588ad0fed68cd65bca9db58b24e1f0
X-Git-Newrev: bbc52f3ff382e4c50baea2e1876a3f6ebf77a851
X-Patchwork-Hint: ignore
Message-Id: <20211206180740.DD33481504@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/makedumpfile: bump to version 1.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=bbc52f3ff382e4c50baea2e1876a3f6ebf77a851
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
- https://release-monitoring.org/project/131396/

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/makedumpfile/makedumpfile.hash | 2 +-
 package/makedumpfile/makedumpfile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/makedumpfile/makedumpfile.hash b/package/makedumpfile/makedumpfile.hash
index f85f334cbf..5eeb6387fa 100644
--- a/package/makedumpfile/makedumpfile.hash
+++ b/package/makedumpfile/makedumpfile.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  393ea8f22393c059ad21de9b1c3f45d9d0d8dbeb0ccb1417815b835d03f7c350  makedumpfile-1.6.9.tar.gz
+sha256  8985f8df249087ea68c6051dec6dac3ef0703fe2aa87d0266f3951f93aa8da5e  makedumpfile-1.7.0.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
index 16271e2246..8399e4d063 100644
--- a/package/makedumpfile/makedumpfile.mk
+++ b/package/makedumpfile/makedumpfile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MAKEDUMPFILE_VERSION = 1.6.9
+MAKEDUMPFILE_VERSION = 1.7.0
 MAKEDUMPFILE_SITE = $(call github,makedumpfile,makedumpfile,$(MAKEDUMPFILE_VERSION))
 MAKEDUMPFILE_DEPENDENCIES = bzip2 elfutils xz zlib
 MAKEDUMPFILE_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
