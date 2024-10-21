Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB859D3C937
	for <buildroot@archiver.kernel.org>; Mon, 21 Oct 2024 07:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 348DF80C7A;
	Mon, 21 Oct 2024 07:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fx_KeLIgJVeZ; Mon, 21 Oct 2024 07:09:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B19FB80C67
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B19FB80C67;
	Mon, 21 Oct 2024 07:09:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 38EA027D7
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 07:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14C7140272
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 07:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2G_3FVFP2rp1 for <buildroot@buildroot.org>;
 Mon, 21 Oct 2024 07:09:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F221C400D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F221C400D7
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 07:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBBD186101; Mon, 21 Oct 2024 07:09:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Oct 2024 09:09:10 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: bff622d02e1e41ad19b8a630cf9499e1794bf493
X-Git-Newrev: 8824652187e4b80ac314b448c2e60e5c6fdebf1b
X-Patchwork-Hint: ignore
Message-Id: <20241021070953.DBBD186101@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] Update for 2024.02.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=8824652187e4b80ac314b448c2e60e5c6fdebf1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 39 +++++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 059c4ba4ee..61fb82fcc2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,42 @@
+2024.02.7, released October 21th, 2024
+
+	Important / security related fixes.
+
+	Per-package-directories fixes for the .gdbinit file and RPATH
+	fixups for SDK.
+
+	utils/check-package: Also check for correct indentation of
+	help lines.
+
+	A large number of typo fixes.
+
+	Updated/fixed packages: aer-inject, armadillo, asterisk,
+	aumix, babeld, bind, botan, cache-calibrator, clamav,
+	comix-cursors, cryptsetup, cups, dovecot, dovecot-pigeonhole,
+	expat, fbset, genpart, glibc, gnu-efi, gnutls, go, grub2,
+	libarchive, libcuefile, libcurl, libglob, libgpg-error,
+	libilbc, libkcapi, libopenssl, libpcap, libuecc, linux-pam,
+	mosquitto, nginx, ntpsec, p910nd, php, postgresql, proftpd,
+	pure-ftpd, python-django, python-huepy, python-sqlparse,
+	python-unittest-xml-reporting, python3, qt6base, qt6svg,
+	rp-pppoe, sofia-sip, strongswan, szip, tllist, unbound,
+	wpebackend-fdo, wpewebkit, x264, xenomai, xserver_xorg-server,
+	zabbix
+
+	New packages: go-bootstrap-stage3
+
+	Issues resolved:
+	- procps-ng: build failure when linking to systemd
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/28
+	- orange pi 2w does not boot
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/36
+	- glibc configure fails on aarch64 with mathvec SVE ACLE error
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/40
+	- Kernel Build from Custom Git Repo fails with hash-error
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/46
+	- package/linux-pam: Remove unneeded flex dependency
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/47
+
 2024.02.6, released September 9th, 2024
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index ae47e178c9..7373f6432f 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.02.6
+export BR2_VERSION := 2024.02.7
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1725892000
+BR2_VERSION_EPOCH = 1729494000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 4017089779..20b22d45e8 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.02.6'
+RELEASE='2024.02.7'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
