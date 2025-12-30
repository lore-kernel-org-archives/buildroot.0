Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEE7E95A8C
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1097A80F2D;
	Tue, 30 Dec 2025 13:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5cHW7Ro9AIOQ; Tue, 30 Dec 2025 13:18:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3476980F75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767100713;
	bh=hfcZQKMoMtTwEVM2jGzc75UDbh/breNBGkTTafUxp9Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O+XCC8Gk2bYmQuD07TYvdujEk/uLb41mGqjias482NVkaDEo7tKzajF2Md0X7EhwJ
	 XTyI5Asnkw/SLsZ8w6jlYFJqnRhkmXMmXf1EcPFt1vJvzTHS/+u7ZVd56mi/F7mZT6
	 n49NGso+R3cFlZ//vsVt4eXt16ON7oOO0ouafRBsiIyiKa/l79hTsND/9IWBybOvPO
	 sMN7TwgN+QRW6R6M+TDEuLcnXqosQi0O2FFWdHsR1G9H4jIsRhYjps6oeyYWecH1AP
	 987kE3rwuYKsLyE90UrcAIUuzygAHM/XedaxHoGAPfvSSuo6IVRz8UO4myrS9fWAHg
	 n3ysN8KXCWZhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3476980F75;
	Tue, 30 Dec 2025 13:18:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA2F7D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCA2480FB0
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRWaRIFnHxrX for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:18:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 075C380F2D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 075C380F2D
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:18:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0227A87C2E; Tue, 30 Dec 2025 13:18:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 14:17:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b11c90e1457e3a453e6c911a91a22f00dba5334a
X-Git-Newrev: 3862abb010f0ab923a9d870411dc38cc5d5e5f22
X-Patchwork-Hint: ignore
Message-Id: <20251230131831.0227A87C2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apache: fix checkpackage warnings
 in init script
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3862abb010f0ab923a9d870411dc38cc5d5e5f22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore      |  1 -
 package/apache/S50apache | 22 +++++++++++-----------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b1d350bc52..3099dbc576 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -201,7 +201,6 @@ package/android-tools/0009-Fix-makefiles-for-out-of-tree-ext4_utils-build.patch
 package/android-tools/0010-adb-added-patch-for-openssl-1.1.0-compatibility.patch lib_patch.Upstream
 package/aoetools/0001-Change-shell-script-interpreter-from-bin-bash-to-bin.patch lib_patch.Upstream
 package/apache/0001-cross-compile.patch lib_patch.Upstream
-package/apache/S50apache Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/apr-util/0001-remove-checkapr.patch lib_patch.Upstream
 package/apr/0001-sys-param-h.patch lib_patch.Upstream
 package/apr/0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch lib_patch.Upstream
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
