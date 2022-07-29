Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2431C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 10:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BFA440C96;
	Fri, 29 Jul 2022 10:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BFA440C96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r5fR1kKOaXEK; Fri, 29 Jul 2022 10:04:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DF9340CE5;
	Fri, 29 Jul 2022 10:04:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DF9340CE5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 07F051BF36C
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 10:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E40EC81B70
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 10:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E40EC81B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AxIT13rjaQlv for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 10:04:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 284A681B60
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 10:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 284A681B60
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B6681868CC; Fri, 29 Jul 2022 09:50:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 12:00:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a2388f9dd11fee0a2b18a6ddec72cd23cd03177
X-Git-Newrev: 2bc14528ec2c3f763cd910e386a3a0b9d615fa84
X-Patchwork-Hint: ignore
Message-Id: <20220729095026.B6681868CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.02.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=2bc14528ec2c3f763cd910e386a3a0b9d615fa84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9dd3bb1963bc906c72146d9872462bf493d512ac)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/CHANGES b/CHANGES
index de57f62e4a..94b787e672 100644
--- a/CHANGES
+++ b/CHANGES
@@ -121,6 +121,38 @@
 	#14731: BR2_PACKAGE_IOSTAT
 	#14751: LVM2 Outdated Link
 
+2022.02.4, released July 28th, 2022
+
+	Important / security related fixes.
+
+	Disable big endian no-mmu on ARM as it is not supported by
+	elf2flt.
+
+	Tighten dependencies for external Bootlin toolchains to ensure
+	they can only be selected in compatible configurations.
+
+	Support external toolchains without gdbserver.
+
+	Updated/fixed packages: apache, avahi, bdwgc, bind, bpftool,
+	cups, darkhttpd, dmalloc, ecryptfs-utils, fxload, ghostscript,
+	gnutls, gst-omx, gst1-devtools, gst1-libav, gst1-plugins-base,
+	gst1-plugins-bad, gst1-plugins-good, gst1-plugins-ugly,
+	gst1-python, gst1-rtsp-server, gst1-vaapi, gstreamer1,
+	gstreamer1-editing-services, gtest, iptables, keyutils, lcms2,
+	libabseil-cpp, libcamera, libcurl, libeastl, libgpgme,
+	libgtk3, libmdbx, libmediaart, libmodsecurity, libnetconf2,
+	libopenssl, libpjsip, libsamplerate, libsndfile, libtalloc,
+	logrotate, luajit, nginx, noip, paxtest, php, postgresql,
+	procrank_linux, pure-ftpd, python-pillow, qdecoder,
+	rabbitmq-server, rpi-userland, rustc, sofia-sip, systemd,
+	tcpreplay, tinyproxy, tor, uacme, uboot-tools, vim, watchdogd,
+	webkitgtk, wireguard-linux-compat, wpa_supplicant, wpewebkit,
+	zstd
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14881: Watchdogd Package missing INSTALL_STAGING
+
 2022.02.3, released June 19th, 2022
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
