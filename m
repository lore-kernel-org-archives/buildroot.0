Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35127CA0FED
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 19:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE39B84327;
	Tue,  9 Sep 2025 19:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GJZbP3T6_2tK; Tue,  9 Sep 2025 19:51:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E63E68432B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E63E68432B;
	Tue,  9 Sep 2025 19:51:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D2C3711AE
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 19:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D05BE84327
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 19:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3aUlW-7rbD02 for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 19:51:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 064E084328
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 064E084328
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 19:51:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0190283BB0; Tue,  9 Sep 2025 19:51:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Sep 2025 21:49:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7dacd0893af4730a72a1af55bcd420b557955672
X-Git-Newrev: 3524e223582cad361b4bd74af380fd2eba24ea48
X-Patchwork-Hint: ignore
Message-Id: <20250909195116.0190283BB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: update for 2025.02.6
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3524e223582cad361b4bd74af380fd2eba24ea48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Arnout: reorder, summarize infrastructure updates]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit a1175b19ee8f3fedc5926e3b0c1ea070a40a0ca3)
---
 CHANGES | 89 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/CHANGES b/CHANGES
index 8d73b789bf..f98fead21b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -300,6 +300,95 @@
 	- netsnmp: unexpected header length in /proc/net/snmp...
 	  https://gitlab.com/buildroot.org/buildroot/-/issues/110
 
+2025.02.6, released September 09, 2025
+
+	Important / security related fixes:
+
+	- libssh: CVE-2025-4878, CVE-2025-5318, CVE-2025-5351, CVE-2025-5372,
+	    CVE-2025-5449, CVE-2025-5987
+	- glibc: CVE-2025-5702, CVE-2025-5745, CVE-2025-8058
+	- gnutls: CVE-2025-32989, CVE-2025-32988, CVE-2025-32990, CVE-2025-6395
+	- python3: CVE-2025-8194
+	- libhtp: CVE-2025-53537
+	- tiff: CVE-2025-8176, CVE-2025-8177
+	- libglib2: CVE-2025-6052
+	- ofono: CVE-2023-2794, CVE-2024-7537, CVE-2024-7539, CVE-2024-7540,
+	    CVE-2024-7541, CVE-2024-7542
+	- elfutils: CVE-2025-1352, CVE-2025-1365, CVE-2025-1371, CVE-2025-1372,
+	    CVE-2025-1376, CVE-2025-1377
+	- grub2: CVE-2024-45777, CVE-2024-45778, CVE-2024-45779,
+	    CVE-2024-45780, CVE-2024-45782, CVE-2024-56737, CVE-2024-56738,
+	    CVE-2025-0678, CVE-2025-0684, CVE-2025-0685, CVE-2025-0686,
+	    CVE-2025-0689, CVE-2025-1125
+	- openjpeg: CVE-2025-54874
+	- go: CVE-2025-4674, CVE-2025-47907
+	- gst1-plugins-base: CVE-2025-47806, CVE-2025-47807
+	- gst1-plugins-good: CVE-2025-47219, CVE-2025-47183
+	- vorbis-tools: CVE-2023-43361
+	- quickjs: CVE-2025-46688
+	- libde265: CVE-2024-38949, CVE-2024-38950
+	- vim: CVE-2024-41957, CVE-2024-41965, CVE-2024-45306, CVE-2024-47814,
+	    CVE-2025-1215, CVE-2025-22134, CVE-2025-24014, CVE-2025-26603,
+	    CVE-2025-29768, CVE-2025-53905, CVE-2025-53906
+	- ffmpeg: CVE-2023-6602
+	- lighttpd: CVE-2025-8671
+	- python-h2: CPE-2025-57804
+	- cpp-httplib: CVE-2025-46728
+	- iperf3: CVE-2025-54349, CVE-2025-54350
+
+	Removed package: liboauth, thttpd
+
+	Removed defconfig: at91sam9g20dfc, at91sam9g45m10ek,
+	at91sam9rlek, bananapro, beelink_gs1, chromebook_snow, galileo,
+	odroidxu4, orangepi_lite2, orangepi_one_plus, pcengines_apu2,
+	pine64_sopine, riotboard, rock64, rock_pi_n8, socrates_cyclone5,
+	toradex_apalis_imx6, ts7680, engicam_imx6*, kontron_pitx_imx8m, imx6ulz_bsh_smm_m2,
+
+	Test Improvements:
+
+	- test_gstreamer1: raise tesseract-ocr timeout to 15s
+	- test_wine: fix test after bootlin toolchains update
+	- test_numactl: fix test after bootlin toolchains update
+	- test_dpdk: fix test after bootlin toolchains update
+	- test_msr_tools: fix test after bootlin toolchains update
+	- test_dmidecode: fix test after bootlin toolchains update
+	- test_iso9660: use a more recent toolchain
+	- test_gruby: use glibc toolchain
+	- test_wget: replace thttpd by Busybox's httpd server
+	- test_libcurl: replace thttpd by Busybox's httpd server
+	- test_systemd_selinux: fix test after bootlin toolchains update
+
+	Updated / fixed packages: python-propcache, pipewire, apache, xinetd,
+	libssh, glibc, libhtp, libapparmor, php-pecl-dbus, tini, snooze, ngrep,
+	libzenoh-pico, janet, nanocom, rtl8189es, gcc, ofono, python-numpy,
+	elfutils, libtracefs, tinyssh, start-stop-daemon, bcusdk, prboom,
+	setserial, grub2, openjpeg, go, gstreamer1, gst1-plugins-base,
+	gst1-plugins-good, gst1-plugins-bad, gst1-plugins-ugly, gst1-devtools,
+	gst1-libav, gst1-python, gst1-rtsp-server, gst1-vaapi,
+	gstreamer1-editing-services, vorbis-tools, quickjs, libde265, vim,
+	ffmpeg, libv4l, python-yarl, lirc-tools, b43-firmware, tcpreplay,
+	libsvgtiny, libsoxr, lighttpd, uclibc, vde2, libcap-ng, python-h2,
+	squid, ipmitool, ell, proftpd, liblog4c-localtime, wpewebkit, weston,
+	cpp-httplib, ipset, iperf3
+
+	Infrastructure updates/fixes:
+	- Various tweaks to utils/generate-cyclonedx for better SBOM
+	  compatibility and project name/version customization
+	- go: make pre-built compiler provide target support too
+	- test-pkg: add new option -T/--toolchain-name
+	- pkg-utils.mk: include package directory in show-info output
+	- bump-stable-kernel-versions: new tool
+
+	Boards updated / fixed:
+
+	- qemu_sh4*: switch back to disk emulation
+	- acmesystems_acqua_a5_*: update linux
+	- sipeed_licheepi_zero: update linux & uboot
+	- zynqmp: increase vfat partition to 64M
+	- qemu_{arm,aarch64}_{ebbr,sbsa}*: linux needs host python3
+	- canaan_kd233, sipeed*: use BR2_LINUX_KENREL_IMAGE_TARGET_NAME
+	- ci20: U-Boot needs host-openssl
+
 2025.02.5, released August 11, 2025
 
     Important / security related fixes:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
