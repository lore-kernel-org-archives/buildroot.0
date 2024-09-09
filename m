Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BCDECE57A
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 15:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 104464070F;
	Mon,  9 Sep 2024 15:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X8Z49EQoR2os; Mon,  9 Sep 2024 15:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E78F6405FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E78F6405FD;
	Mon,  9 Sep 2024 15:20:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F30841BF362
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 15:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAEC2607DF
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 15:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id We8eWLPqM4Wf for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 15:20:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 013B4607D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 013B4607D9
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 15:20:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF28B86DB2; Mon,  9 Sep 2024 15:20:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 9 Sep 2024 17:16:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba7e9d49de9e537a3310e8a9e1a3bfe0d356506a
X-Git-Newrev: 6416b1d17f60e80b5b2ef75607f6914f21861ef1
X-Patchwork-Hint: ignore
Message-Id: <20240909152020.DF28B86DB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.02.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=6416b1d17f60e80b5b2ef75607f6914f21861ef1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d9b046e634f4b4390e2d36f7224b30851ee1e46c)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/CHANGES b/CHANGES
index 39f62d5603..4f668a2365 100644
--- a/CHANGES
+++ b/CHANGES
@@ -338,6 +338,36 @@
         #16036: android-tools version is too old
         #16075: Cannot use linux kernel extensions from external tree..
 
+2024.02.6, released September 9th, 2024
+
+	Important / security related fixes.
+
+        Added a large number of additional runtime tests.
+
+        Infrastructure:
+        - Be more robust against text files (for package hashes and
+          users) incorrectly missing a terminating newline.
+
+        - Fix various issues with the pkg-kconfig infrastructure and
+          per-package-directories builds
+          (BR2_PER_PACKAGE_DIRECTORIES).
+
+	Updated/fixed packages: aer-inject, am335x-pru-package,
+	apache, apr, apr-util, attr, boost, btrfs-progs, busybox,
+	cryptsetup, dropbear, elfutils, fetchmail, ffmpeg, fluidsynth,
+	freerdp, gcc, gdb, gnutls, gpsd, hiawatha, hostapd, htop,
+	intel-microcode, iperf3, ksmbd-tools, libcoap, libcurl,
+	libest, libgtk3, libpwquality, libressl, libupnp, libxml2,
+	libxslt, lrzsz, mdio-tools, micropython, mjpg-streamer, mpir,
+	ncftp, nginx, nodejs, open-iscsi, openldap, openvpn, pistache,
+	procps-ng, python-django, ruby, speex, swaybg, tinyssh,
+	uclibc, uclibc-ng-test, unbound, uuu, wpewebkit, zfs
+
+        Issues resolved:
+	- Toolchain (host-gcc-final-14.1.0) build failure with
+	  y2038/BR2_TIME_BITS_64 enabled
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/16
+
 2024.02.5, released August 14th, 2024
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
