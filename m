Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10187C52D7B
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 11:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A85A94012B;
	Wed, 14 Aug 2024 11:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kgm4ezFzQT92; Wed, 14 Aug 2024 11:47:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D142401FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D142401FE;
	Wed, 14 Aug 2024 11:47:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 056581BF616
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 11:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3DB06077D
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 11:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xE1OcPLYlcA3 for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 11:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C65960622
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C65960622
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 11:47:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 073E585C3B; Wed, 14 Aug 2024 11:47:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 13:45:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9f371e2c08d2bded89257fd9e0423770115fa1c
X-Git-Newrev: 865744154a456dd2b8f602ec783d5506ca8a796f
X-Patchwork-Hint: ignore
Message-Id: <20240814114747.073E585C3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.02.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=865744154a456dd2b8f602ec783d5506ca8a796f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6c084947ab46aa8064947b85ea6168b12d550265)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/CHANGES b/CHANGES
index 67844910ee..84245655eb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -247,6 +247,28 @@
         #16036: android-tools version is too old
         #16075: Cannot use linux kernel extensions from external tree..
 
+2024.02.5, released August 14th, 2024
+
+	Important / security related fixes.
+
+	Various minor improvements to utils/check-package
+
+	Defconfigs: Add download hashes for chromebook-elm,
+	chromebook-snow and stm32mp157a_dk1
+
+	Updated/fixed packages: bitcoin, boost, btrfs-progs, c-ares,
+	cdrkit, check, containerd, directfb, ed, exim, fwts, gcc, gdb,
+	go, kexec, libarchive, libgeos, libressl, mupdf, nodejs,
+	ntpsec, octave, openssh, pppd, python-mupdf,
+	python-ruamel-yaml, qt5webkit, rauc-hawkbit-updater, snappy,
+	squid, sunxi-tools, syslinux, systemd, tcf-agent, ubus,
+	util-linux, uvw, webkitgtk, wolfssl, wpewebkit, x265,
+	xlib_libxshmfence, xvisor
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15231: gcc --help -v doesn't work correctly with gcc>=10 and..
+
 2024.02.4, released July 13th, 2024
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
