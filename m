Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A6AD0E6C3
	for <buildroot@archiver.kernel.org>; Mon, 21 Oct 2024 07:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 735A5402E6;
	Mon, 21 Oct 2024 07:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZ4drQneUq_P; Mon, 21 Oct 2024 07:54:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 102BE40335
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 102BE40335;
	Mon, 21 Oct 2024 07:54:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 39CE9AF2
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 07:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A3EF80C2E
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 07:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NfzlSad0noTR for <buildroot@buildroot.org>;
 Mon, 21 Oct 2024 07:54:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DCFB80C2D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DCFB80C2D
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 07:54:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00EF78611B; Mon, 21 Oct 2024 07:53:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Oct 2024 09:50:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b71467930a73815d5f1c5cf539203616352a712
X-Git-Newrev: 933af5280a4e0c7dc6dd9e375966df806ebe4380
X-Patchwork-Hint: ignore
Message-Id: <20241021075400.00EF78611B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.02.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=933af5280a4e0c7dc6dd9e375966df806ebe4380
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8824652187e4b80ac314b448c2e60e5c6fdebf1b)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/CHANGES b/CHANGES
index 9903666a51..40cc866bc3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -376,6 +376,45 @@
         #16036: android-tools version is too old
         #16075: Cannot use linux kernel extensions from external tree..
 
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
+	mosquitto, nginx, ntpsec, p910nd, php, postgresql, procps-ng,
+	proftpd, pure-ftpd, python-django, python-huepy,
+	python-sqlparse, python-unittest-xml-reporting, python3,
+	qt6base, qt6svg, rp-pppoe, sofia-sip, strongswan, szip,
+	tllist, unbound, wpebackend-fdo, wpewebkit, x264, xenomai,
+	xserver_xorg-server, zabbix
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
