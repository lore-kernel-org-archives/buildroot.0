Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5DFC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D42F060A8C;
	Mon,  8 Jul 2024 20:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6DHCpE7Kk9LH; Mon,  8 Jul 2024 20:20:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 807E260A9D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 807E260A9D;
	Mon,  8 Jul 2024 20:20:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D9DA1BF275
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46DD980FAD
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d9jr8lFG-T4u for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 742288101F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 742288101F
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 615C17FCE7; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 22:14:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7ea606b47935a85f1c8c1599e42bb6169bd8127
X-Git-Newrev: a1f2e09e042b2db32750bec9537a516d6e40bd76
X-Patchwork-Hint: ignore
Message-Id: <20240708202013.615C17FCE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snort: update the patches to be
 applied with fuzz 0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1f2e09e042b2db32750bec9537a516d6e40bd76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, snort fails to build with output:

    Applying 0005-fix-sparc.patch using patch:
    patching file configure.in
    Hunk #1 FAILED at 942.
    Hunk #2 succeeded at 915 (offset -42 lines).
    1 out of 2 hunks FAILED -- saving rejects to file configure.in.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/snort/0005-fix-sparc.patch | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/snort/0005-fix-sparc.patch b/package/snort/0005-fix-sparc.patch
index 14792d2c59..56a294976c 100644
--- a/package/snort/0005-fix-sparc.patch
+++ b/package/snort/0005-fix-sparc.patch
@@ -4,20 +4,22 @@ like "let's see if this v9 instruction exists when I force the compiler
 to think I'm using v9", which is non-sensical.
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 diff -Naurp ./snort-2.9.11.1-orig/configure.in snort-2.9.11.1/configure.in
 --- ./snort-2.9.11.1-orig/configure.in	2018-05-10 12:20:19.253510678 +0200
 +++ snort-2.9.11.1/configure.in	2018-05-10 12:40:18.547584998 +0200
-@@ -942,8 +942,6 @@ fi
+@@ -900,8 +900,6 @@
  
  # check for sparc %time register
  if eval "echo $host_cpu|grep -i sparc >/dev/null"; then
 -    OLD_CFLAGS="$CFLAGS"
 -    CFLAGS="$CFLAGS -mcpu=v9 "
      AC_MSG_CHECKING([for sparc %time register])
-     AC_RUN_IFELSE(
+     AC_COMPILE_IFELSE(
      [AC_LANG_PROGRAM(
-@@ -957,8 +955,6 @@ if eval "echo $host_cpu|grep -i sparc >/
+@@ -915,8 +913,6 @@
      AC_MSG_RESULT($sparcv9)
      if test "x$sparcv9" = "xyes"; then
          AC_DEFINE([SPARCV9],[1],[For sparc v9 with %time register])
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
