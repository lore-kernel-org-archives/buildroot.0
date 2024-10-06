Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08E6CFB43F
	for <buildroot@archiver.kernel.org>; Sun,  6 Oct 2024 20:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96264605E4;
	Sun,  6 Oct 2024 20:39:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id df4fo7kLZLvH; Sun,  6 Oct 2024 20:39:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC098606F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC098606F5;
	Sun,  6 Oct 2024 20:39:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B48511BF279
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 20:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF9AB403A1
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 20:39:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3U9cu0Sr64m for <buildroot@lists.busybox.net>;
 Sun,  6 Oct 2024 20:39:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 15B7540398
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15B7540398
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15B7540398
 for <buildroot@buildroot.org>; Sun,  6 Oct 2024 20:39:06 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 964C5B00579;
 Sun,  6 Oct 2024 22:39:02 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  6 Oct 2024 22:38:54 +0200
Message-ID: <20241006203854.674166-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1728247143;
 bh=ZLY8IroHC4nL9rXOukhVLrCX4uXThLFhRI3gZLKB6RQ=;
 h=From:To:Cc:Subject:Date:From;
 b=qKJt8ZixeTo+ma4uHlSmwTXJYhsj9iLtEV85p8OmGHCmfshuyYTRRF9Mfgzg01rWg
 Jn3BiBGAG5WuQyZ5naAh9W+bkBjnPaJg3sqvqJBgjHosGWEkpnyD8kRpGyF1EHKITh
 k0STZ/FpRgUnMW4BL4ZghOJolw1kHESqzEMmpemRvzrTZ0HASfcPNODTRlX+ovVp45
 N6EmtupoADS70wIx5jzHF80z4eLzjLvmy7sA0fPWbJqcOKl09Q/ZxcmIq/v9Pr+z2X
 LSWodBLNEK8ugFIXEwdsPabHh25Jv8K7O1ozTf6fwrq4k/glVHusyWxhDYz5Wo+OaG
 43Xlz6voXXMow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qKJt8Zix
Subject: [Buildroot] [PATCH 1/1] package/lvm2: bump to version 2.03.27
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release notes since 2.03.23, see:
https://gitlab.com/lvmteam/lvm2/-/blob/v2_03_27/WHATS_NEW

This commit also rebased the package patches on this new version.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8005134618
---
 ...ne-use-freopen-to-reopen-standard-streams.patch | 14 ++++++++------
 ...og-use-freopen-to-reopen-standard-streams.patch | 10 ++++++----
 package/lvm2/lvm2.hash                             |  2 +-
 package/lvm2/lvm2.mk                               |  2 +-
 4 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/package/lvm2/0001-cmdline-use-freopen-to-reopen-standard-streams.patch b/package/lvm2/0001-cmdline-use-freopen-to-reopen-standard-streams.patch
index 8d0be40320..aef6fb8e1d 100644
--- a/package/lvm2/0001-cmdline-use-freopen-to-reopen-standard-streams.patch
+++ b/package/lvm2/0001-cmdline-use-freopen-to-reopen-standard-streams.patch
@@ -1,4 +1,4 @@
-From 7c74ad9c349e381decc84c218112ea8e7bcc0b9c Mon Sep 17 00:00:00 2001
+From 1c35333cd7836c3cc9b39cf6c5599d2221268e94 Mon Sep 17 00:00:00 2001
 From: Simon Rowe <simon.rowe@nutanix.com>
 Date: Thu, 23 Mar 2023 09:57:59 +0000
 Subject: [PATCH] cmdline: use freopen() to reopen standard streams
@@ -19,15 +19,17 @@ with
 
 Taken from: https://github.com/gentoo/gentoo/blob/master/sys-fs/lvm2/files/lvm2-2.03.14-r1-fopen-to-freopen.patch
 Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
+[Julien: rebased patch on v2.03.27]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
  tools/lvmcmdline.c | 12 ++++++++++++
  1 file changed, 12 insertions(+)
 
 diff --git a/tools/lvmcmdline.c b/tools/lvmcmdline.c
-index 1e12bedca..534368575 100644
+index 7209ebd9b..3c0c957b1 100644
 --- a/tools/lvmcmdline.c
 +++ b/tools/lvmcmdline.c
-@@ -3384,7 +3384,11 @@ static int _check_standard_fds(void)
+@@ -3378,7 +3378,11 @@ static int _check_standard_fds(void)
  	int err = is_valid_fd(STDERR_FILENO);
  
  	if (!is_valid_fd(STDIN_FILENO) &&
@@ -39,7 +41,7 @@ index 1e12bedca..534368575 100644
  		if (err)
  			perror("stdin stream open");
  		else
-@@ -3394,7 +3398,11 @@ static int _check_standard_fds(void)
+@@ -3388,7 +3392,11 @@ static int _check_standard_fds(void)
  	}
  
  	if (!is_valid_fd(STDOUT_FILENO) &&
@@ -51,7 +53,7 @@ index 1e12bedca..534368575 100644
  		if (err)
  			perror("stdout stream open");
  		/* else no stdout */
-@@ -3402,7 +3410,11 @@ static int _check_standard_fds(void)
+@@ -3396,7 +3404,11 @@ static int _check_standard_fds(void)
  	}
  
  	if (!is_valid_fd(STDERR_FILENO) &&
@@ -64,5 +66,5 @@ index 1e12bedca..534368575 100644
  		       strerror(errno));
  		return 0;
 -- 
-2.22.3
+2.46.2
 
diff --git a/package/lvm2/0002-log-use-freopen-to-reopen-standard-streams.patch b/package/lvm2/0002-log-use-freopen-to-reopen-standard-streams.patch
index 0b57fb6fd2..747c3cbc83 100644
--- a/package/lvm2/0002-log-use-freopen-to-reopen-standard-streams.patch
+++ b/package/lvm2/0002-log-use-freopen-to-reopen-standard-streams.patch
@@ -1,4 +1,4 @@
-From 6d6b953cf7d2b8d06e7b0363b1b06cb2e902aa0f Mon Sep 17 00:00:00 2001
+From 760ac03a8d8870ad47776075c1e59b6395d308bf Mon Sep 17 00:00:00 2001
 From: Simon Rowe <simon.rowe@nutanix.com>
 Date: Thu, 23 Mar 2023 10:07:02 +0000
 Subject: [PATCH] log: use freopen() to reopen standard streams
@@ -19,17 +19,19 @@ with
 
 Taken from: https://github.com/gentoo/gentoo/blob/master/sys-fs/lvm2/files/lvm2-2.03.14-freopen_n2.patch
 Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
+[Julien: rebased patch on v2.03.27]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
  lib/log/log.c | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/lib/log/log.c b/lib/log/log.c
-index 7b4d537b3..5f62c048c 100644
+index 3eda7d343..0bcd9552d 100644
 --- a/lib/log/log.c
 +++ b/lib/log/log.c
 @@ -208,7 +208,11 @@ int reopen_standard_stream(FILE **stream, const char *mode)
  
- 	_check_and_replace_standard_log_streams(old_stream, new_stream);
+ 	_check_and_replace_standard_log_streams(*stream, new_stream);
  
 +#ifdef __GLIBC__
  	*stream = new_stream;
@@ -40,5 +42,5 @@ index 7b4d537b3..5f62c048c 100644
  }
  
 -- 
-2.22.3
+2.46.2
 
diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 74c5f4f1bc..1abaeb0497 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,5 +1,5 @@
 # From https://sourceware.org/ftp/lvm2/sha512.sum
-sha512  293430a80c7f599d14e77610456d0f44cac8164e6159cd0e2e287462278a89787e289fdb4d481eb8fd6b5eea07a6535c41cb7fdc3deee83df7fea9bf77dcbdaa  LVM2.2.03.23.tgz
+sha512  02607797f067b2b26d615b9a182ad70017e61d436e3866acf820a04154e503fb59114e9a4540a273d9f570d0337332ca995fb3be83c11eadaca53c1b826eb810  LVM2.2.03.27.tgz
 # Locally computed sha256 checksums
 sha256  e76fbcd2fb97cf202da330301327754d2db5c58b5b4bebd3a8a749393e7603d1  COPYING
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LIB
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 4fcfddb1bb..2fc24be60e 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.03.23
+LVM2_VERSION = 2.03.27
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = https://sourceware.org/ftp/lvm2
 LVM2_INSTALL_STAGING = YES
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
