Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B94CFB440
	for <buildroot@archiver.kernel.org>; Mon,  7 Oct 2024 06:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75A4780E55;
	Mon,  7 Oct 2024 06:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gpiUyj70nV_u; Mon,  7 Oct 2024 06:06:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0819280E38
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0819280E38;
	Mon,  7 Oct 2024 06:06:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4BCE31BF471
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 06:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3205B402BA
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 06:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LEd6qXXM270F for <buildroot@lists.busybox.net>;
 Mon,  7 Oct 2024 06:06:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3DFE402CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3DFE402CD
 for <buildroot@buildroot.org>; Mon,  7 Oct 2024 06:06:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF73485730; Mon,  7 Oct 2024 06:06:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Oct 2024 08:05:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf938d93c9156f10763824e9e50d519c3bfc09af
X-Git-Newrev: 8e419a1472008c82ab09160ca7cbe6bbc4ec1c9f
X-Patchwork-Hint: ignore
Message-Id: <20241007060625.BF73485730@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lvm2: bump to version 2.03.27
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

commit: https://git.buildroot.net/buildroot/commit/?id=8e419a1472008c82ab09160ca7cbe6bbc4ec1c9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes since 2.03.23, see:
https://gitlab.com/lvmteam/lvm2/-/blob/v2_03_27/WHATS_NEW

This commit also rebased the package patches on this new version.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-cmdline-use-freopen-to-reopen-standard-streams.patch | 14 ++++++++------
 .../0002-log-use-freopen-to-reopen-standard-streams.patch  | 10 ++++++----
 package/lvm2/lvm2.hash                                     |  2 +-
 package/lvm2/lvm2.mk                                       |  2 +-
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
