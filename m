Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE4D0C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 13:57:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8974D60EC0
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 13:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8974D60EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B5E040467;
	Sun,  5 Sep 2021 13:57:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QMr_fNpC52Tb; Sun,  5 Sep 2021 13:57:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A29CB40462;
	Sun,  5 Sep 2021 13:57:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CAB981BF968
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 13:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C79E480EFC
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 13:57:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VEbKH7ZrY3wD for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 13:57:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1553580F25
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 13:57:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E172488596; Sun,  5 Sep 2021 13:56:17 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 5 Sep 2021 15:56:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 966d33676fd8671af7318f3d5520214ae23422d3
X-Git-Newrev: 6a89a3b830e75d1e8d686f02cd33a3914d4dd33a
X-Patchwork-Hint: ignore
Message-Id: <20210905135617.E172488596@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vsftpd: bump to 3.0.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6a89a3b830e75d1e8d686f02cd33a3914d4dd33a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vsftpd/0002-fix-CVE-2015-1419.patch               | 4 ++--
 package/vsftpd/0003-Prevent-hang-in-SIGCHLD-handler.patch | 4 ++--
 package/vsftpd/vsftpd.hash                                | 2 +-
 package/vsftpd/vsftpd.mk                                  | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/vsftpd/0002-fix-CVE-2015-1419.patch b/package/vsftpd/0002-fix-CVE-2015-1419.patch
index 95ad017a1c..657af289cb 100644
--- a/package/vsftpd/0002-fix-CVE-2015-1419.patch
+++ b/package/vsftpd/0002-fix-CVE-2015-1419.patch
@@ -73,7 +73,7 @@ Index: vsftpd-3.0.2/str.c
 ===================================================================
 --- vsftpd-3.0.2.orig/str.c
 +++ vsftpd-3.0.2/str.c
-@@ -770,3 +770,14 @@ str_replace_unprintable(struct mystr* p_
+@@ -711,3 +711,14 @@ str_replace_unprintable(struct mystr* p_
    }
  }
  
@@ -92,7 +92,7 @@ Index: vsftpd-3.0.2/str.h
 ===================================================================
 --- vsftpd-3.0.2.orig/str.h
 +++ vsftpd-3.0.2/str.h
-@@ -101,6 +101,7 @@ void str_replace_unprintable(struct myst
+@@ -100,6 +100,7 @@ void str_replace_unprintable(struct myst
  int str_atoi(const struct mystr* p_str);
  filesize_t str_a_to_filesize_t(const struct mystr* p_str);
  unsigned int str_octal_to_uint(const struct mystr* p_str);
diff --git a/package/vsftpd/0003-Prevent-hang-in-SIGCHLD-handler.patch b/package/vsftpd/0003-Prevent-hang-in-SIGCHLD-handler.patch
index 0732c5f632..6056193779 100644
--- a/package/vsftpd/0003-Prevent-hang-in-SIGCHLD-handler.patch
+++ b/package/vsftpd/0003-Prevent-hang-in-SIGCHLD-handler.patch
@@ -21,7 +21,7 @@ diff --git a/sysutil.c b/sysutil.c
 index 6d7cb3f..099748f 100644
 --- a/sysutil.c
 +++ b/sysutil.c
-@@ -608,13 +608,13 @@ vsf_sysutil_exit(int exit_code)
+@@ -592,13 +592,13 @@ vsf_sysutil_exit(int exit_code)
  }
  
  struct vsf_sysutil_wait_retval
@@ -41,7 +41,7 @@ diff --git a/sysutil.h b/sysutil.h
 index c145bdf..13153cd 100644
 --- a/sysutil.h
 +++ b/sysutil.h
-@@ -177,7 +177,7 @@ struct vsf_sysutil_wait_retval
+@@ -175,7 +175,7 @@ struct vsf_sysutil_wait_retval
    int PRIVATE_HANDS_OFF_syscall_retval;
    int PRIVATE_HANDS_OFF_exit_status;
  };
diff --git a/package/vsftpd/vsftpd.hash b/package/vsftpd/vsftpd.hash
index 751faf61ca..485e5ba2f0 100644
--- a/package/vsftpd/vsftpd.hash
+++ b/package/vsftpd/vsftpd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  6b9421bd27e8a6cdeed5b31154f294a20b003a11a26c09500715a0a6b1b86a26  vsftpd-3.0.4.tar.gz
+sha256  26b602ae454b0ba6d99ef44a09b6b9e0dfa7f67228106736df1f278c70bc91d3  vsftpd-3.0.5.tar.gz
 # Locally computed
 sha256  c9cf119e2f9dbcf187fb805ba5aded105db26a693803636fb7228c98460ffbf2  COPYING
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 8daf07c62a..3e7b233e48 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VSFTPD_VERSION = 3.0.4
+VSFTPD_VERSION = 3.0.5
 VSFTPD_SITE = https://security.appspot.com/downloads
 VSFTPD_LIBS = -lcrypt
 VSFTPD_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
