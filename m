Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC05DCDB465
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 09:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CA0E415C4;
	Mon, 16 Oct 2023 09:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CA0E415C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aWepRCmgIn43; Mon, 16 Oct 2023 09:41:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26164415C1;
	Mon, 16 Oct 2023 09:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26164415C1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04C931BF5A5
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 09:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC72D81FC1
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 09:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC72D81FC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LAXpXWSorPy4 for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 09:41:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEC4E81F51
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 09:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEC4E81F51
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99A7485C8F; Mon, 16 Oct 2023 09:41:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Oct 2023 11:34:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6480774c430227688119cac3935f23b624608824
X-Git-Newrev: cc31a8057a98454b4ed3bfca2e3b2bfee49c70f2
X-Patchwork-Hint: ignore
Message-Id: <20231016094106.99A7485C8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.08.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc31a8057a98454b4ed3bfca2e3b2bfee49c70f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fe50c054bce7fb9b2e073b9c1bc78dd8a187289a)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 39 +++++++++++++++++++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 4164bd81f3..81bc209b92 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,42 @@
+2023.08.2, released October 15th, 2023
+
+	Important / security related fixes.
+
+	Defconfigs: Freescale ARM: Add ATF patch to fix build issue
+	with binutils 2.39+.  QEMU Aarch64-virt: Enable ACPI support
+	for EDK2. Visionfive2: Bump kernel to fix build issue with GCC
+	13.
+
+	Per-package builds: Do not use hard links for host / target
+	dirs, fixing issues with package rebuilds or post-build
+	scripts modifications.
+
+	Infrastructure: Explicitly disable shuffle mode for Make >=
+	4.4 where needed.
+
+	Urandom-scripts: Move seedrng init script to S01 for earlier
+	random number entrophy initialization.
+
+	Updated/fixed packages: at91bootstrap, batman-adv, bind, cups,
+	efl, enlightenment, exim, gcc, glibc, gnu-efi, go, gptfdisk,
+	grub2, gst-omx, gst1-devtools, gst1-libav, gst1-plugins-bad,
+	gst1-plugins-base, gst1-plugins-good, gst1-plugins-ugly,
+	gst1-python, gst1-rstp-server, gst1-rtsp-vaapi, gstreamer1,
+	gstreamer1-editing-services, gtkmm3, libcue, libcurl,
+	libfastjson, libhtp, libmodplug, librsvg, libvpx, libyang,
+	linux-pam, linux-tools, mbedtls, mosquitto, mutt, neon,
+	netsnmp, nmap, nodejs, olsr, openblas, opkg-utils, php, pound,
+	powertop, python-mako, python3, rauc, rockchip-mali, samba4,
+	sslh, stress-ng, suricata, syslog-ng, systemd, tar, unifdef,
+	urandom-scripts, usbguard, webkitgtk, wilc-driver,
+	wireless-regdb, wpewebkit
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15628: Missing dependencies in BR2_PACKAGE_PYTHON_MAKO
+	#15808: connman is not supported on musl
+	#15814: C++ not supported by bootlin toolchain
+
 2023.08.1, released September 27th, 2023
 
 	Important / security related fixes.
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index a7e3b7456c..1d42a647ac 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.08.1'
+RELEASE='2023.08.2'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
