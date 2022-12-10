Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0612C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 14:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D27C60AFC;
	Sat, 10 Dec 2022 14:09:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D27C60AFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TLXe5WxUKTCa; Sat, 10 Dec 2022 14:09:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D6E160A99;
	Sat, 10 Dec 2022 14:09:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D6E160A99
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 736981BF3C3
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 14:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DE424026E
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 14:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DE424026E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i-WQyn1444nh for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 14:09:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2439B4026C
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 14:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2439B4026C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0EDC485EEF; Sat, 10 Dec 2022 14:09:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 15:09:22 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: a2272be318cddda16cb802bcefcc4fba0af1db48
X-Git-Newrev: 1fad7a933d28a17ce4064898e49e2ad4d6ba8bd3
X-Patchwork-Hint: ignore
Message-Id: <20221210140946.0EDC485EEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] Update for 2022.08.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=1fad7a933d28a17ce4064898e49e2ad4d6ba8bd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 16 ++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 61605da4e3..b5dfc5ba85 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,19 @@
+2022.08.3, released December 10th, 2022
+
+	Important / security related fixes.
+
+	Updated/fixed packages: asterisk, dash, dovecot, edk2,
+	edk2-platforms, elf2flt, exim, freerdp, gcc, gdb, git, gnupg2,
+	heimdal, iwd, kodi, libarchive, libkrb5, libksba, libmdbx,
+	libopenssl, matchbox-keyboard, memcached, netsnmp, nginx,
+	nodejs, openpgm, optee-client, python-scipy, python3, rsync,
+	rtl8723bu, samba4, sdl, sdl2, swupdate, sysstat, systemd,
+	uboot, vim, vlc, wilc-driver, xen, xterm
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	15131: Target GDB uses internal zlib
+
 2022.08.2, released November 16th, 2022
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 699879fca6..e5bf820757 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.08.2
+export BR2_VERSION := 2022.08.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1668618000
+BR2_VERSION_EPOCH = 1670681000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 40c7c4e1ce..64a4794c65 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.08.2'
+RELEASE='2022.08.3'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
