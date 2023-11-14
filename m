Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C094C46CCA
	for <buildroot@archiver.kernel.org>; Tue, 14 Nov 2023 20:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B3D44168C;
	Tue, 14 Nov 2023 20:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B3D44168C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DJ7XiKmb7onc; Tue, 14 Nov 2023 20:35:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EECAE416E5;
	Tue, 14 Nov 2023 20:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EECAE416E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A78A61BF2CD
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 20:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D61761451
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 20:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D61761451
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U53rFdZUnrWE for <buildroot@lists.busybox.net>;
 Tue, 14 Nov 2023 20:35:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0B256143B
 for <buildroot@buildroot.org>; Tue, 14 Nov 2023 20:35:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0B256143B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82FF486EAE; Tue, 14 Nov 2023 20:35:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Nov 2023 21:31:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef0e5f834503dd934c14978201d8ae0848e7a027
X-Git-Newrev: c9e1bbf29a9bb14d4bb294e2c9ca7aac51fb17a2
X-Patchwork-Hint: ignore
Message-Id: <20231114203533.82FF486EAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.02.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9e1bbf29a9bb14d4bb294e2c9ca7aac51fb17a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 50d5f8974e57b6e72015d877f3bd56d7d84acb22)
[Peter: drop Makefile / Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/CHANGES b/CHANGES
index 49b8dba4a9..a045779c31 100644
--- a/CHANGES
+++ b/CHANGES
@@ -459,6 +459,51 @@
 	#15376: Libiconv config
 	#15461: QtVirtualKeyboard segfaults
 
+2023.02.7, released November 14th, 2023
+
+	Important / security related fixes.
+
+	Per-package builds: Unbreak SDK relocation logic. Only drop
+	the hard links for the final host / target directory, fixing a
+	build time / size regression in 2023.02.6.
+
+	Packages where a free-form version/site can be specified
+	(E.G. Linux, U-Boot, ..) can now have the corresponding
+	tarballs of these custom downloads checked by the download
+	infrastructure based on .hash files in the global patch
+	directory. These hashes are optional unless
+	BR2_DOWNLOAD_FORCE_CHECK_HASHES is enabled.
+
+	A utils/add-custom-hashes helper script has been added to
+	assist in managing such hash files.
+
+	Defconfigs: stm32mp157a-dk1, stm32mp157c-dk2: Unbreak TF-A
+	build, stm32mp157c-odessey: Use a fixed TF-A version for
+	reproducibility
+
+	Updated/fixed packages: apache, arm-trusted-firmware, aufs,
+	aufs-util, azure-iot-sdk, cjson, cups-filters, clamav, dhcpcd,
+	freeradius-server, go, htop, ksmbd-tools, kvmtool, libgdiplus,
+	libopenssl, libosmium, libtommath, libupnp, libzlib, lxc,
+	mender, minizip-zlib, mpd, mxsldr, nano, nettle,
+	network-manager, nghttp2, nodejs, opencv4, opencv4-contrib,
+	openjdk-bin, openvpn, opusfile, paho-mqtt-c,
+	perl-lwp-protocol-https, php, python-django, python-urllib3,
+	python-web2py, rabbitmq-c, redis, riscv64-elf-toolchain,
+	suricata, tar, tiff, tor, traceroute, vim, websocketpp,
+	wireshark, wolfssl, xdg-dbus-proxy, xen, xlib_libX11,
+	xlib_libXpm, zabbix, zchunk
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14741: e2fsck is failing during cronjob build where fail...
+	#15772: lz4 failed to compile with gcc 10.4.0
+	#15787: atmel_sama5d3_xplained_mmc_defconfig: Missing...
+	#15790: at91sam9x5ek_dev_defconfig: Missing...
+	#15820: make linux-menuconfig does not modify correct .config..
+	#15823: Installing nodejs modules with native extensions ...
+	#15835: Incompatibility between network-manager and libcurl 8.4
+
 2023.02.6, released October 16th, 2023
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
