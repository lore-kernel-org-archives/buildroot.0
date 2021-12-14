Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92DFC433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 22:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7876560D66;
	Tue, 14 Dec 2021 22:27:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q3bDzqyewSrx; Tue, 14 Dec 2021 22:27:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB7AF60D63;
	Tue, 14 Dec 2021 22:26:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B9591BF681
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 22:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67554405AC
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 22:26:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kqSmHpxLrNbz for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 22:26:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88580401DD
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 22:26:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4DDF581E43; Tue, 14 Dec 2021 22:21:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 23:22:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2dc1ca3c75fdda87a68b836a83f05f23446f2d5
X-Git-Newrev: b2b95a3d4d1dddccaa0e299158ec08aa6f0ccae9
X-Patchwork-Hint: ignore
Message-Id: <20211214222117.4DDF581E43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2021.02.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=b2b95a3d4d1dddccaa0e299158ec08aa6f0ccae9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 170f42eb6b891e06fd500483c92a5e00f77d1dc6)
[Peter: drop Makefile/Vagrantfile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/CHANGES b/CHANGES
index 6ccae45845..b49afd1075 100644
--- a/CHANGES
+++ b/CHANGES
@@ -588,6 +588,31 @@
 	#13751: libopenssl (static): huge drop in performance in newer ..
 	#13771: package htop has undeclared dependency on host python
 
+2021.02.8, released December 14th, 2021
+
+	Important / security related fixes.
+
+	Defconfigs: Various fixes for building with gcc >= 10 host or
+	target compilers.
+
+	Updated/fixed packages: alsa-lib, apparmor, apr, asterisk,
+	binutils, bluez5_utils, busybox, coreutils, e2fsprogs, ell,
+	exfat, freeswitch, gdb, glmark2, glog, glorytun, gmp,
+	gpu-amd-bin-mx51, gst1-interpipe, gstreamer1, guile, gupnp,
+	hackrf, heimdal, hiawatha, hplip, icu, imx-vpuwrap, isl, iwd,
+	janus-gateway, libatomic_ops, libbson, libdnet, libffi,
+	libgdiplus, libgee, libhtp, libmodsecurity, libnspr, libnss,
+	libunwind, linux, lynx, meson, micropython, mkpasswd, mksh,
+	mosquitto, motion, mxml, netdata, nfs-utils, oracle-mysql,
+	pcre, pkcs11-helper, postgresql, pure-ftpd, python-cycler,
+	qdecoder, rcw-smarc-sal28, samba4, smack, speex, stress-ng,
+	suricata, syslinux, uboot, unixodbc, unrar, vim, websocketpp,
+	wireshark
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14346: BR2_PACKAGE_NFS_UTILS_RPC_NFSD does not patch CONFIG_NFSD..
+
 2021.02.7, released November 10th, 2021
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
