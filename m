Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EDECFA441
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 22:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F61C826C1;
	Thu, 20 Nov 2025 22:13:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wu5NcgmGykYl; Thu, 20 Nov 2025 22:13:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0778828DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0778828DF;
	Thu, 20 Nov 2025 22:13:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EB43D122
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC9BE6F588
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:13:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIj5zZwNarfQ for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 22:13:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ADAB6F586
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0ADAB6F586
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:13:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E87A185CBC; Thu, 20 Nov 2025 22:13:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Nov 2025 22:51:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36a2dc7f5e3d049e8f43435e1d1959b00fadf76c
X-Git-Newrev: 4e8d8abbcf9de2ed3d540f46fb4c29f600c03a1b
X-Patchwork-Hint: ignore
Message-Id: <20251120221347.E87A185CBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: update for 2025.02.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e8d8abbcf9de2ed3d540f46fb4c29f600c03a1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 20e8a0826409343b8e0ed71f49ec36e372c256ce)
---
 CHANGES | 63 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/CHANGES b/CHANGES
index 0a1869c8ec..aa06bfc113 100644
--- a/CHANGES
+++ b/CHANGES
@@ -546,6 +546,69 @@
 	- netsnmp: unexpected header length in /proc/net/snmp...
 	  https://gitlab.com/buildroot.org/buildroot/-/issues/110
 
+2025.02.8, released November 20, 2025
+
+    Important / security related fixes:
+
+	- bind: CVE-2025-8677, CVE-2025-40778, CVE-2025-40780
+	- dante: CVE-2024-54662
+	- erlang: CVE-2024-53846, CVE-2025-4748, CVE-2025-26618, CVE-2025-30211,
+	          CVE-2025-32433, CVE-2025-46712, CVE-2025-48038,
+	          CVE-2025-48039, CVE-2025-48040, CVE-2025-48041
+	- hostapd: CVE-2025-24912
+	- imagemagick: CVE-2025-62171
+	- iptraf-ng: CVE-2024-52949
+	- libarchive: CVE-2025-25724
+	- libglib2: CVE-2024-54662
+	- libvips: CVE-2025-29769, CVE-2025-59933
+	- libvpx: CVE-2025-5283
+	- libxslt: CVE-2025-24855, CVE-2024-55549
+	- mbedtls: CVE-2025-54764, CVE-2025-59438
+	- modsecurity2: CVE-2025-52891, CVE-2025-54571
+	- netdata: CVE-2023-22496, CVE-2023-22497
+	- poppler: CVE-2024-6239, CVE-2024-56378, CVE-2025-32364,
+	           CVE-2025-32365, CVE-2025-43903, CVE-2025-50420,
+	           CVE-2025-52886
+	- python3: gh-139312, gh-139700, gh-139400, gh-135661, gh-135661,
+	           gh-102555, gh-135462, gh-118350, gh-86155
+	- python-webpy: CVE-2025-3818
+	- redis: CVE-2025-46817, CVE-2025-46818, CVE-2025-46819, CVE-2025-49844
+	- samba: CVE-2025-3818, CVE-2025-10230
+	- shairport-sync: Upstream security fixes without CVE
+	- squid: CVE-2025-59362
+	- suricata: CVE-2024-37151, CVE-2024-38535
+	- tpm2-tss: CVE-2024-29040
+	- xerces: CVE-2024-23807
+	- zabbix: CVE-2025-27231, CVE-2025-27236, CVE-2025-27238, CVE-2025-49641
+	- zip: CVE-2018-13410
+
+	Infrastructure updates/fixes:
+
+	- Improved matching of CPE ID with NVD database, resulting in more
+	  accurate identification of CVEs.
+	- brmake: avoid garbled output with top-level parallel build
+
+	Updated / fixed packages: 4th, audit, bind, cmake, crun, dante,
+	ebtables, erlang, freeradius-server, gpsd, gstd, hostapd, imagemagick,
+	iptraf-ng, iozone, ledmon, libarchive, libcurl, libdbi-drivers,
+	libdisplay-info, libglib2, libgphoto2, libgtk3, libheif, libsemanage,
+	libshout, libsolv, libtpms, libvips, libvpx, libwpe, libxslt, linux,
+	linux-headers, live555, mbedtls, micropython, mjpg-streamer,
+	modsecurity2, netdata, netsnmp, poppler, python3, python-flask-cors,
+	python-webpy, quota, qt6multimedia, redis, refpolicy, samba4,
+	selinux-python, sexpect, shairport-sync, siproxd, sqlite, squid,
+	suricata, tor, tpm2-tss, waffle, webkitgtk, wireless-regdb, wpewebkit,
+	xerces, zabbix, zip
+
+	Removed package: ramspeed
+
+	Boards updated / fixed: beagleboneai, cubieboard1, cubieboard2,
+	stm32f429_disco_xip, stm32f746_disco_sd, stm32f769_disco_sd,
+
+	Test Improvements:
+
+	- Capture output of failing commands on host.
+
 2025.02.7, released October 11, 2025
 
     Important / security related fixes:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
