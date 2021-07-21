Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E48DCC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:18:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89E596105A
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89E596105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B32540674;
	Tue,  3 Aug 2021 22:18:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BZqowvfrN2Kw; Tue,  3 Aug 2021 22:18:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1CD940647;
	Tue,  3 Aug 2021 22:18:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F3B871BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7A4140583
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gENQQ3WswyDx for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5843140535
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A29EF81469; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 21:07:44 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c7fd40c7d8975df91f311309fc1bed897c571e1c
X-Git-Newrev: 2016df2ed258f1d88cc9dfdb97fcc67ea3dc119a
X-Patchwork-Hint: ignore
Message-Id: <20210803211013.A29EF81469@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nbd: bump to version
 3.21
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

commit: https://git.buildroot.net/buildroot/commit/?id=2016df2ed258f1d88cc9dfdb97fcc67ea3dc119a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Drop patch (already in version)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
