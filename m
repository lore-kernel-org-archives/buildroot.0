Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E32AC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 18:10:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 463B760F35
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 18:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 463B760F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 183F2401D2;
	Wed,  4 Aug 2021 18:10:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id do_RlL4dtK-8; Wed,  4 Aug 2021 18:10:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14F02404FF;
	Wed,  4 Aug 2021 18:10:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10E1B1BF381
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 18:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60E4083B2B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 18:06:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id paBDJP0GQ6mK for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 18:06:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB3E183B81
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 18:06:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E921C8B616; Wed,  4 Aug 2021 18:06:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 19:51:23 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 553d09b967c60afaf260accaec9bfbbcc082d909
X-Git-Newrev: 7b67d493c92da83a92efa10a7bd0bd61b106cad2
X-Patchwork-Hint: ignore
Message-Id: <20210804180635.E921C8B616@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/nbd: bump to
 version 3.21
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=7b67d493c92da83a92efa10a7bd0bd61b106cad2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

- Drop patch (already in version)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2016df2ed258f1d88cc9dfdb97fcc67ea3dc119a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...lose-the-file-descriptor-before-returning.patch | 25 ----------------------
 package/nbd/nbd.hash                               | 10 ++++-----
 package/nbd/nbd.mk                                 |  2 +-
 3 files changed, 6 insertions(+), 31 deletions(-)

diff --git a/package/nbd/0001-Also-close-the-file-descriptor-before-returning.patch b/package/nbd/0001-Also-close-the-file-descriptor-before-returning.patch
deleted file mode 100644
index 70330c8e91..0000000000
--- a/package/nbd/0001-Also-close-the-file-descriptor-before-returning.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From d2480de925e83c8bf60faa96141f4198bdf7f619 Mon Sep 17 00:00:00 2001
-From: Wouter Verhelst <w@uter.be>
-Date: Fri, 2 Aug 2019 10:33:00 +0200
-Subject: [PATCH] Also close the file descriptor before returning
-
-Coverity CID#1162721
-[Retrieved from:
-https://github.com/NetworkBlockDevice/nbd/commit/d2480de925e83c8bf60faa96141f4198bdf7f619]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- nbd-client.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/nbd-client.c b/nbd-client.c
-index e9ec0a86..94035886 100644
---- a/nbd-client.c
-+++ b/nbd-client.c
-@@ -930,6 +930,7 @@ void disconnect(char* device) {
- 	if (ioctl(nbd, NBD_CLEAR_SOCK)<0)
- 		err("Ioctl failed: %m\n");
- 	printf("done\n");
-+	close(nbd);
- }
- 
- #if HAVE_NETLINK
diff --git a/package/nbd/nbd.hash b/package/nbd/nbd.hash
index d856953c22..f0df35bc27 100644
--- a/package/nbd/nbd.hash
+++ b/package/nbd/nbd.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/nbd/files/nbd/3.20/
-md5	910fe6c152f8c30ad8608388e6a4ce89	nbd-3.20.tar.xz
-sha1	9240430266ff4bfb2316ef6d880056a9974a59fd	nbd-3.20.tar.xz
+# From http://sourceforge.net/projects/nbd/files/nbd/3.21/
+md5  c51c4c500fe1ed84c3d5d5dd2ca71d23  nbd-3.21.tar.xz
+sha1  88c3296d43d20d7bda97e0f1bab0243a4f6fa880  nbd-3.21.tar.xz
 
 # Locally calculated
-sha256	e0e1b3538ab7ae5accf56180afd1a9887d415b98d21223b8ad42592b4af7d6cd	nbd-3.20.tar.xz
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
+sha256  e7688af39d91733bbcd2db08062c44fe503d004e51528740139c44aff6a6bef9  nbd-3.21.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index 6c77bffdfe..0a7f08b2cf 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NBD_VERSION = 3.20
+NBD_VERSION = 3.21
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
 NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
 NBD_CONF_OPTS = --enable-lfs
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
