Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F2AD2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C852F83E1E;
	Tue, 13 Jan 2026 19:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cNkn83Oj8RPg; Tue, 13 Jan 2026 19:40:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C72783E16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333259;
	bh=TZDw91pnPPF0WKIudavGB50HVdksu3S6EZu1kMiv20M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pb/k0tM2bK5VKEDzqSeECxzvQomJ+PXhWAtW0Dy+0C9aOS+73NiwnTNvdTBCLB8Tm
	 AGf8XyyYazQk6lg70WYxICBUD7gPgGGmcZ6ARIG8SR4z8FDrTvy6i5pk2Iau9trjDh
	 2UyI3FOm0sZJ+mT9kVpgpn9cMSZi6PJqc1lnk66sHPo4hR+KD9LvQPvQj29/MmRvK8
	 gNXzSmswY0yvpn0+w+VTPI+MTpk7sUU3eIiGggHrChcRqwrED608mo2y7CgrVXBZJa
	 2HPQRsSaQ9pV48g7rDseqMJGZzniRdpcFE/w2VG105ishPxHAJfWRsWUD3E5GrOyAF
	 woQE1E10TEToQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C72783E16;
	Tue, 13 Jan 2026 19:40:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DEA11C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD85182FA2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3iSct8ahsNXr for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC74E82A56
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC74E82A56
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA66A8256D; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:12:16 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: fb3e4e1d2de95d0b3c1151029885c5850126bfad
X-Git-Newrev: 7244ac044279407ca4488f688fb325ddf74d1945
X-Patchwork-Hint: ignore
Message-Id: <20260113194032.DA66A8256D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/apache: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=7244ac044279407ca4488f688fb325ddf74d1945
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3862abb010f0ab923a9d870411dc38cc5d5e5f22)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore      |  1 -
 package/apache/S50apache | 22 +++++++++++-----------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index dd8218d987..44f4e069ea 100644
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
