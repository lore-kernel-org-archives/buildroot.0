Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DBAC6FA86
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 12:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8E7A40C07;
	Thu, 22 Sep 2022 12:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8E7A40C07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u2G8G4A_8cm8; Thu, 22 Sep 2022 12:50:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8165F40481;
	Thu, 22 Sep 2022 12:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8165F40481
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 154581BF2CE
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 12:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E48CE8276E
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 12:50:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E48CE8276E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pMRCiEaANx4F for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 12:50:38 +0000 (UTC)
X-Greylist: delayed 00:05:18 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B64C824C1
Received: from smtprelay07.ispgateway.de (smtprelay07.ispgateway.de
 [134.119.228.97])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B64C824C1
 for <buildroot@busybox.net>; Thu, 22 Sep 2022 12:50:38 +0000 (UTC)
Received: from [91.21.124.120] (helo=exchange.go-sys.de)
 by smtprelay07.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (Exim 4.94.2)
 (envelope-from <mf@go-sys.de>)
 id 1obLZm-0002XF-Sp; Thu, 22 Sep 2022 14:45:10 +0200
Received: from exchange.go-sys.local (192.168.1.17) by exchange.go-sys.local
 (192.168.1.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.2507.12; Thu, 22
 Sep 2022 14:45:15 +0200
Received: from go-sys.de (192.168.1.100) by exchange.go-sys.de (192.168.1.17)
 with Microsoft SMTP Server id 15.1.2507.12 via Frontend Transport;
 Thu, 22 Sep 2022 14:45:15 +0200
From: Michael Fischer <mf@go-sys.de>
To: <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Sep 2022 14:40:10 +0200
Message-ID: <20220922124010.26034-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220921222934.07100d0c@windsurf>
References: <20220921222934.07100d0c@windsurf>
MIME-Version: 1.0
X-C2ProcessedOrg: 77b28032-c882-4527-ad15-de6c89cb71cd
X-CrossPremisesHeadersFilteredBySendConnector: exchange.go-sys.local
X-OrganizationHeadersPreserved: exchange.go-sys.local
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
Subject: [Buildroot] [PATCH v2 1/1] package/{glibc,
 localedef}: bump to version
 glibc-2.36-44-g2628500f5dff1dd99c49a09b418b3b1ea3a6b5d3
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
Cc: buildroot@busybox.net, Michael Fischer <mf@go-sys.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

patch 0002: already applied upstream

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 ...ot-posix-conformant-on-microblaze-wi.patch | 37 -------------------
 package/glibc/glibc.hash                      |  2 +-
 package/glibc/glibc.mk                        |  2 +-
 package/localedef/localedef.mk                |  2 +-
 4 files changed, 3 insertions(+), 40 deletions(-)
 delete mode 100644 package/glibc/0002-struct-stat-is-not-posix-conformant-on-microblaze-wi.patch

diff --git a/package/glibc/0002-struct-stat-is-not-posix-conformant-on-microblaze-wi.patch b/package/glibc/0002-struct-stat-is-not-posix-conformant-on-microblaze-wi.patch
deleted file mode 100644
index 9797f3a935..0000000000
--- a/package/glibc/0002-struct-stat-is-not-posix-conformant-on-microblaze-wi.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 87d415cc133ff493ccd02464c061cb171d11ef2f Mon Sep 17 00:00:00 2001
-From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
-Date: Mon, 25 Jul 2022 11:25:15 +0200
-Subject: [PATCH] struct stat is not posix conformant on microblaze with
- __USE_FILE_OFFSET64
-
-Commit a06b40cdf5ba0d2ab4f9b4c77d21e45ff284fac7 updated stat.h to use
-__USE_XOPEN2K8 instead of __USE_MISC to add the st_atim, st_mtim and
-st_ctim members to struct stat. However, for microblaze, there are two
-definitions of struct stat, depending on the __USE_FILE_OFFSET64 macro.
-The second one was not updated.
-
-Change __USE_MISC to __USE_XOPEN2K8 in the __USE_FILE_OFFSET64 version
-of struct stat for microblaze.
-
-Upstream: https://sourceware.org/bugzilla/show_bug.cgi?id=29403
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- sysdeps/unix/sysv/linux/microblaze/bits/struct_stat.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sysdeps/unix/sysv/linux/microblaze/bits/struct_stat.h b/sysdeps/unix/sysv/linux/microblaze/bits/struct_stat.h
-index a2787e88343..850697f4fa6 100644
---- a/sysdeps/unix/sysv/linux/microblaze/bits/struct_stat.h
-+++ b/sysdeps/unix/sysv/linux/microblaze/bits/struct_stat.h
-@@ -89,7 +89,7 @@ struct stat
-         __blksize_t             st_blksize; /* Optimal block size for I/O.  */
-         int                     __pad3;
-         __blkcnt64_t            st_blocks;  /* Number 512-byte blocks allocated.  */
--# ifdef __USE_MISC
-+# ifdef __USE_XOPEN2K8
-         /* Nanosecond resolution timestamps are stored in a format
-          * equivalent to 'struct timespec'. This is the type used
-          * whenever possible but the Unix namespace rules do not allow the
--- 
-2.35.3
-
diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 016467cd81..f5c0f1b175 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  f339586a104a8e12ff44d38fb24574d2abe694ddba322404f8bc1a50f4343228  glibc-2.35-134-gb6aade18a7e5719c942aa2da6cf3157aca993fa4.tar.gz
+sha256  596bee874d76bc6c5f62af142c9dd40bcb3625ea26975bbc52e552d40e864e54  glibc-2.36-44-g2628500f5dff1dd99c49a09b418b3b1ea3a6b5d3.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 5af539ca62..84122db91f 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.35-134-gb6aade18a7e5719c942aa2da6cf3157aca993fa4
+GLIBC_VERSION = 2.36-44-g2628500f5dff1dd99c49a09b418b3b1ea3a6b5d3
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index ae4cc55f30..987f7e8c65 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.35-134-gb6aade18a7e5719c942aa2da6cf3157aca993fa4
+LOCALEDEF_VERSION = 2.36-44-g2628500f5dff1dd99c49a09b418b3b1ea3a6b5d3
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
