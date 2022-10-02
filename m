Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8360EC433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 21:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A3C1400AB;
	Sun,  2 Oct 2022 21:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A3C1400AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hF7dS9wX5NTB; Sun,  2 Oct 2022 21:23:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AFC6400DA;
	Sun,  2 Oct 2022 21:23:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AFC6400DA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BEF3A1BF3E9
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 21:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A44B60808
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 21:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A44B60808
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Stf6O7d0bon7 for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 21:23:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A35DA605E3
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 21:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A35DA605E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CE65867CF; Sun,  2 Oct 2022 21:23:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 2 Oct 2022 23:21:57 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 40a94c9dc21e260744a0bfc92a39270c276dbb18
X-Git-Newrev: 25d865996d1d9753fe7d4dfe39cf18c7e9f91224
X-Patchwork-Hint: ignore
Message-Id: <20221002212350.8CE65867CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] Update for 2022.08.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=25d865996d1d9753fe7d4dfe39cf18c7e9f91224
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 18 ++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 03c859ceb6..11b33a1351 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,21 @@
+2022.08.1, released October 2nd, 2022
+
+	Important / security related fixes.
+
+	Updated/fixed packages: botan, busybox, docker-cli,
+	docker-engine, expat, git, haproxy, heirloom-mailx, icu,
+	imx-gpu-viv, libconfuse, libmdbx, libupnp, libxml2,
+	ltp-testsuite, m4, makedevs, mariadb, mesa3d, meson,
+	mosquitto, ncurses, openssh, pango, python3, qlibc,
+	qt5xmlpatterns, rtl8189es, rtl8723bu, rt8723ds,
+	rtl8812au-aircrack-ng, runc, sox, tinyproxy, uacme, unbound,
+	unzip, vim, xtables-addons
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14796: 64 bit time and seccomp conflict (OpenSSH server crash)
+	#14921: wpewebkit build fails because of internal build order
+
 2022.08, released September 10th, 2022
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 03488dc6ba..36896684b1 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.08
+export BR2_VERSION := 2022.08.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1662822000
+BR2_VERSION_EPOCH = 1664745600
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index fb0f48215c..f558e52ca6 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.08'
+RELEASE='2022.08.1'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
