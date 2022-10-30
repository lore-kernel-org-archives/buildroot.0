Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB30C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 22:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 451E160A97;
	Sun, 30 Oct 2022 22:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 451E160A97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w28Qonpm4nSe; Sun, 30 Oct 2022 22:01:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7662A60803;
	Sun, 30 Oct 2022 22:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7662A60803
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F3461BF315
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2798860803
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2798860803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TZ9ARpJUwC7q for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 22:01:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 213DE60670
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 22:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 213DE60670
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FB6F876C0; Sun, 30 Oct 2022 22:01:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 23:00:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f7bfc80814e90918b9527cab4cbf6afedd22195
X-Git-Newrev: c8206cdb1cb8efe5046dfd59ad1f468000b0eecb
X-Patchwork-Hint: ignore
Message-Id: <20221030220110.0FB6F876C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mdevd: bump to v0.1.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8206cdb1cb8efe5046dfd59ad1f468000b0eecb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Summary of changes:

 - skalibs dependency bumped to 2.12.0.1.
 - execline optional dependency bumped to 2.9.0.1.
 - New -O nlgroups option to mdevd, rebroadcasting uevents to the netlink
   after handling them.
 - The * and & action directives are now triggered by all action types.

License hash updated due to copyright year change.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mdevd/mdevd.hash | 4 ++--
 package/mdevd/mdevd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mdevd/mdevd.hash b/package/mdevd/mdevd.hash
index 93950304be..dea2f14978 100644
--- a/package/mdevd/mdevd.hash
+++ b/package/mdevd/mdevd.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  ffd3b223b4cf0e51253b4a8f09cb88d70bf22693228ab0818af174a3f099dcd2  mdevd-0.1.4.0.tar.gz
-sha256  31b60c66aba1fa0a7f8847339ac35c28638e25ff96da700d995533ad810e3995  COPYING
+sha256  33cf2b118634538fd24f302b30f52cc8aa28ea68b414916ce482b54a4ee57283  mdevd-0.1.6.0.tar.gz
+sha256  7fe938b5e0fec18848955ca8081c532e24ae77310beb730b301e1f77bad3d390  COPYING
diff --git a/package/mdevd/mdevd.mk b/package/mdevd/mdevd.mk
index a0cd71e76e..9997cb5275 100644
--- a/package/mdevd/mdevd.mk
+++ b/package/mdevd/mdevd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MDEVD_VERSION = 0.1.4.0
+MDEVD_VERSION = 0.1.6.0
 MDEVD_SITE = http://skarnet.org/software/mdevd
 MDEVD_LICENSE = ISC
 MDEVD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
