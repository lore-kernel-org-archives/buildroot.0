Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF881C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 22:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 522F181314;
	Tue, 14 Dec 2021 22:26:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uerU3LCeEflt; Tue, 14 Dec 2021 22:26:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD81A812D5;
	Tue, 14 Dec 2021 22:26:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F36D1BF681
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 22:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E803812D4
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 22:26:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gJP0t41M9Bwi for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 22:26:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72DDF812D0
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 22:26:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 35BCE81E43; Tue, 14 Dec 2021 22:21:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 23:01:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5af47e96c42e677541a573e8896cb96ab2603733
X-Git-Newrev: ae48261ff493674a5d71d5a203e60cb38e409889
X-Patchwork-Hint: ignore
Message-Id: <20211214222117.35BCE81E43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2021.08.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae48261ff493674a5d71d5a203e60cb38e409889
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a5f7844cbe67e6dc8dc1aa4405fee1420d75ea5f)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/CHANGES b/CHANGES
index 698d5d72a6..6ccae45845 100644
--- a/CHANGES
+++ b/CHANGES
@@ -124,6 +124,31 @@
 	        with mkfs.ext4: No such file or directory while trying
 	        to determine filesystem size
 
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
