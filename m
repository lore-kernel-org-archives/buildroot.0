Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3080C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB6BE4FC0D;
	Fri, 28 Feb 2025 17:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4aJFwcXrIQiD; Fri, 28 Feb 2025 17:10:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BC0D50247
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BC0D50247;
	Fri, 28 Feb 2025 17:10:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AEDC1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73BE340535
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMjJfGqY3V8l for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37DD242F41
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37DD242F41
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FDD787A92; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 09:48:56 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 16943849e090fbaca75817ba3563dd2d66bfd51d
X-Git-Newrev: c29f6393ab37d0c8816d70bf21b118ed778f790d
X-Patchwork-Hint: ignore
Message-Id: <20250228163028.2FDD787A92@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/busybox: fix patch
 0009 formatting
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c29f6393ab37d0c8816d70bf21b118ed778f790d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As it is, patch 0009 cannot be applied with "git am", so fix its
format.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...onfig-gcc-failing-saying-ncurses-is-not-found.patch | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch b/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
index 4651d8c2c9..f4a926ae37 100644
--- a/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
+++ b/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
@@ -1,6 +1,6 @@
-From ctxnop@gmail.com  Sun Jul 21 12:10:52 2024
-From: ctxnop@gmail.com (Nop)
-Date: Sun, 21 Jul 2024 14:10:52 +0200
+From 32949508fe566aee8988cb6d8ee101ecc5e49a65 Mon Sep 17 00:00:00 2001
+From: ctxnop <ctxnop@gmail.com>
+Date: Sun, 26 Jan 2025 20:59:20 +0100
 Subject: [PATCH] menuconfig: GCC failing saying ncurses is not found
 
 Newer GCC increased diagnostics levels resulting in considering the
@@ -17,13 +17,12 @@ Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
  scripts/kconfig/lxdialog/check-lxdialog.sh | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh
-b/scripts/kconfig/lxdialog/check-lxdialog.sh
-index 5075ebf2d..c644d1d48 100755
+diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
+index 5075ebf2d..08e4da3de 100755
 --- a/scripts/kconfig/lxdialog/check-lxdialog.sh
 +++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
 @@ -45,9 +45,9 @@ trap "rm -f $tmp" 0 1 2 3 15
-
+ 
  # Check if we can link to ncurses
  check() {
 -        $cc -x c - -o $tmp 2>/dev/null <<'EOF'
@@ -34,5 +33,6 @@ index 5075ebf2d..c644d1d48 100755
  EOF
  	if [ $? != 0 ]; then
  	    echo " *** Unable to find the ncurses libraries or the"       1>&2
---
-2.45.2
+-- 
+2.47.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
