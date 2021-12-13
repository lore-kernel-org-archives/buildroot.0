Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3E1C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 22:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6455C81363;
	Mon, 13 Dec 2021 22:44:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QmcQI3Ys7wfv; Mon, 13 Dec 2021 22:44:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B941481351;
	Mon, 13 Dec 2021 22:43:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4EC141BF395
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 22:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CEB660B54
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 22:43:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pyr89CREX_Ke for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 22:43:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62EB660B1E
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 22:43:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 641178123A; Mon, 13 Dec 2021 22:38:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Dec 2021 23:43:31 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: cc68ad88762c1b69e71dc85d4c072fae525724fe
X-Git-Newrev: a5f7844cbe67e6dc8dc1aa4405fee1420d75ea5f
X-Patchwork-Hint: ignore
Message-Id: <20211213223843.641178123A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] Update for 2021.08.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=a5f7844cbe67e6dc8dc1aa4405fee1420d75ea5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 25 +++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4ac1774541..39f449027f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,28 @@
+2021.08.3, released December 13th, 2021
+
+	Important / security related fixes.
+
+	Defconfigs: Various fixes for building with gcc >= 10 host or
+	target compilers.
+
+	Updated/fixed packages: alsa-lib, apparmor, apr, asterisk,
+	binutils, bluez5_utils, coreutils, e2fsprogs, exfat,
+	freeswitch, gdb, glmark2, glog, glorytun, gmp,
+	gpu-amd-bin-mx51, gst1-interpipe, gstreamer1, guile, gupnp,
+	hackrf, heimdal, hiawatha, hplip, icu, imx-vpuwrap, isl,
+	janus-gateway, libatomic_ops, libbson, libdnet, libffi,
+	libgdiplus, libgee, libglib2, libhtp, libmodsecurity, libnspr,
+	libnss, libosmium, libunwind, linux, lynx, meson, micropython,
+	mkpasswd, mksh, mosquitto, motion, mupdf, mxml, netdata,
+	nfs-utils, opencv4, oracle-mysql, pcre, php, postgresql,
+	pure-ftpd, python-cycler, qdecoder, rcw-smarc-sal28, samba4,
+	smack, speex, stress-ng, suricata, syslinux, uboot, unixodbc,
+	unrar, vim, websocketpp, wireshark
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14346: BR2_PACKAGE_NFS_UTILS_RPC_NFSD does not patch CONFIG_NFSD..
+
 2021.08.2, released November 10th, 2021
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index abbeaa9fe6..9f27de60ed 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.08.2
+export BR2_VERSION := 2021.08.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1636546000
+BR2_VERSION_EPOCH = 1639435000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
