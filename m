Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A99FD2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D114082B94;
	Tue, 13 Jan 2026 19:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EWgxw8bJLLi6; Tue, 13 Jan 2026 19:36:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D888582FD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768332995;
	bh=++OB14WTE1PeHGikWOrVzqsRmSApw0YchiCA5d8BrjA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R02xqfuMtqj2NL9HtX1oUlmA5iZFx/cCF0KcsV+7eqjyHOFYsOSz5ymrs5g+D0xH7
	 5xVC3GiprbmN2S9CSjwYmfw+fgJxpa9/MTw1jrcYQbHvmCGk5tfcpBO/nZTs5r81AI
	 uOwu9Bmr4yQaiL5Q72bFQu+tUTDvOhrOm78pljuU41T/of19vhaeYqFwKWOodA3gWo
	 5nF0rGEMhD+b3ewBRERNfzrqyxbVq0bnZxhlQS++QvFifgFHVbgDQLf2cxN3w49Vf1
	 ylSXm4+7VNzPwdybOiO/qM+TFuqkNmWGzomkBn7z38s/3u/XkLypAWR1ILAu+vFC0z
	 AJOCg10acPEzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D888582FD5;
	Tue, 13 Jan 2026 19:36:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 069151C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2847282CAC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aUFMdI9jypyi for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31E6282B97
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31E6282B97
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D5328123D; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:11:55 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 55ce2b60c3603c0174a5a3fe6eb4eed002aa6065
X-Git-Newrev: 3eac10574c6e96d10998d1675e75ba73456620db
X-Patchwork-Hint: ignore
Message-Id: <20260113193618.2D5328123D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/apache: fix
 checkpackage warnings in init script
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3eac10574c6e96d10998d1675e75ba73456620db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3862abb010f0ab923a9d870411dc38cc5d5e5f22)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore      |  1 -
 package/apache/S50apache | 22 +++++++++++-----------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index abf8af59fd..3fa9fee9a2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -213,7 +213,6 @@ package/android-tools/0009-Fix-makefiles-for-out-of-tree-ext4_utils-build.patch
 package/android-tools/0010-adb-added-patch-for-openssl-1.1.0-compatibility.patch lib_patch.Upstream
 package/aoetools/0001-Change-shell-script-interpreter-from-bin-bash-to-bin.patch lib_patch.Upstream
 package/apache/0001-cross-compile.patch lib_patch.Upstream
-package/apache/S50apache Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/apitrace/0001-thirdparty-libbacktrace-backtrace-h-include-config.h.patch lib_patch.Upstream
 package/apitrace/0002-gltrace-Avoid-__libc_dlsym-and-__libc_dlopen_mode-on-GLIBC-2-34.patch lib_patch.Upstream
 package/apr-util/0001-remove-checkapr.patch lib_patch.Upstream
diff --git a/package/apache/S50apache b/package/apache/S50apache
index b687419055..71e8837bae 100644
--- a/package/apache/S50apache
+++ b/package/apache/S50apache
@@ -1,15 +1,15 @@
 #!/bin/sh
+# shellcheck disable=SC2034 # checkpackage-required variable
+DAEMON="apache"
 
 case "$1" in
-  start|restart|graceful|graceful-stop|stop)
-	apachectl -k $1
-	;;
-  reload)
-	apachectl -k restart
-	;;
-  *)
-	echo "Usage: $0 {start|restart|reload|graceful|graceful-stop|stop}"
-	exit 1
+	start|restart|graceful|graceful-stop|stop)
+		apachectl -k "$1"
+		;;
+	reload)
+		apachectl -k restart
+		;;
+	*)
+		echo "Usage: $0 {start|restart|reload|graceful|graceful-stop|stop}"
+		exit 1
 esac
-
-exit $?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
