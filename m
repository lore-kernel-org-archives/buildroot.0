Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91720C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46C7B81E07;
	Mon,  5 Dec 2022 12:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46C7B81E07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fw9ugxIM0Zxc; Mon,  5 Dec 2022 12:02:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60E7A81E29;
	Mon,  5 Dec 2022 12:02:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60E7A81E29
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 90D691BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BEF2405FB
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BEF2405FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HWlEy8dMXpib for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B964640527
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B964640527
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4A5285B9E; Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 23:06:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9bab65a21c1805eab7127aaf557a1e5189386dcf
X-Git-Newrev: df46e3e6f64fc77d2f522c1ac8b643c13ee6a13d
X-Patchwork-Hint: ignore
Message-Id: <20221205112606.B4A5285B9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/quota: bump to version 4.09
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

commit: https://git.buildroot.net/buildroot/commit/?id=df46e3e6f64fc77d2f522c1ac8b643c13ee6a13d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://sourceforge.net/p/linuxquota/code/ci/master/tree/Changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...a-Use-realloc-3-instead-of-reallocarray-3.patch | 34 ----------------------
 package/quota/quota.hash                           |  8 ++---
 package/quota/quota.mk                             |  2 +-
 3 files changed, 5 insertions(+), 39 deletions(-)

diff --git a/package/quota/0001-quota-Use-realloc-3-instead-of-reallocarray-3.patch b/package/quota/0001-quota-Use-realloc-3-instead-of-reallocarray-3.patch
deleted file mode 100644
index 093d7cc821..0000000000
--- a/package/quota/0001-quota-Use-realloc-3-instead-of-reallocarray-3.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 02b222a335527f1031cc9495d8c5ebc1bc5b1d4e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 11 Nov 2020 15:00:47 +0100
-Subject: [PATCH] quota: Use realloc(3) instead of reallocarray(3)
-
-reallocarray(3) has been added to glibc relatively recently (version
-2.26, from 2017) and apparently not all users run new enough glibc. Just
-use realloc(3) for now since in this case there's no real risk of
-overflow.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: Jan Kara <jack@suse.cz>
-[Retrieved from:
-https://sourceforge.net/p/linuxquota/code/ci/02b222a335527f1031cc9495d8c5ebc1bc5b1d4e]
----
- quota.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/quota.c b/quota.c
-index a6ed61f..a60de12 100644
---- a/quota.c
-+++ b/quota.c
-@@ -385,7 +385,7 @@ int main(int argc, char **argv)
- 			  break;
- 		  case 259:
- 			  fscount++;
--			  fsnames = reallocarray(fsnames, fscount, sizeof(char *));
-+			  fsnames = realloc(fsnames, fscount * sizeof(char *));
- 			  if (!fsnames)
- 				die(1, _("Not enough memory for filesystem names"));
- 			  fsnames[fscount - 1] = optarg;
--- 
-2.28.0
-
diff --git a/package/quota/quota.hash b/package/quota/quota.hash
index 354a3e2de4..5b083c911c 100644
--- a/package/quota/quota.hash
+++ b/package/quota/quota.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/linuxquota/files/quota-tools/4.06/ (click on info button)
-md5  aef94648438832b684978d46fdf75110  quota-4.06.tar.gz
-sha1  98288699cc14da42f762301c2b6731ec7c777681  quota-4.06.tar.gz
+# From http://sourceforge.net/projects/linuxquota/files/quota-tools/4.09/ (click on info button)
+md5  f85c2e15d9a735640675ff4977b57bb6  quota-4.09.tar.gz
+sha1  5c215d869626b532be2773f4161bdcc8b9f97126  quota-4.09.tar.gz
 
 # Locally calculated
-sha256  2f3e03039f378d4f0d97acdb49daf581dcaad64d2e1ddf129495fd579fbd268d  quota-4.06.tar.gz
+sha256  9cdaca154bc92afc3117f0e5f5b3208dd5f84583af1cf061c39baa0a2bb142f9  quota-4.09.tar.gz
 sha256  32a5fd41e7a257f7f0373988ea8d45cebdbf376060703c242c11c000751b1203  COPYING
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 0c751d4436..1b6a4b1975 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUOTA_VERSION = 4.06
+QUOTA_VERSION = 4.09
 QUOTA_SITE = http://downloads.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
 QUOTA_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-nfs-utils
 QUOTA_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
