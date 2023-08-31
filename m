Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAC5C83F37
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 19:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0B7F61324;
	Thu, 31 Aug 2023 19:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0B7F61324
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c4N3gTU-Hfvj; Thu, 31 Aug 2023 19:31:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3194D6132A;
	Thu, 31 Aug 2023 19:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3194D6132A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA0FA1BF3AF
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 19:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFADC8399E
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 19:31:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFADC8399E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d6Y5fiKI_2M9 for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 19:31:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00AAD8329D
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 19:31:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00AAD8329D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCB47867A0; Thu, 31 Aug 2023 19:31:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 21:28:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f137a03ea7698bc7cfc463494d96319fe2ff52d
X-Git-Newrev: d283473ae40498432c42c1bcf1ad815749aa4c8c
X-Patchwork-Hint: ignore
Message-Id: <20230831193124.DCB47867A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.02.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=d283473ae40498432c42c1bcf1ad815749aa4c8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3b8e5b19ad9117c0ebcace9cde2e075108462c98)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/CHANGES b/CHANGES
index e623d8b439..b17193a12c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -217,6 +217,35 @@
 	#15376: Libiconv config
 	#15461: QtVirtualKeyboard segfaults
 
+2023.02.4, released August 31th, 2023
+
+	Important / security related fixes.
+
+	Toolchains: Correctly mark Bootlin external toolchains as
+	having OpenMP support.
+
+	Arch: Mark Alderlake x86 variants as having no AVX512 support.
+
+	Utils: Ensure utils/docker-run correctly supports git
+	worktrees.
+
+	Defconfigs: Beaglebone qt5: Enable support for green wireless
+	variant.
+
+	Updated/fixed packages: arm-trusted-firmware, bind, cairo,
+	cmocka, containerd, crudini, dmidecode, ffmpeg, freescale-imx,
+	gcc, gdb, ghostscript, gkrellm, gnuradio, go, heimdall,
+	iperf3, libcurl, libmodsecurity, libopenssl, libssh,
+	libubootenv, libuhttpd, linux-tools, ntp, openssh, php,
+	pipewire, python-iniparse, python-iptables, python-pysmb,
+	rtl8189fs, sam-ba, samba4, seatd, speex, supertuxkart, sysdig,
+	tor, tpm2-tss, uboot, unzip, webkitgtk, wireless-regdb,
+	wolfssl, wpebackend-fdo wpewebkit, xenomai, yaml-cpp, yavta
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15634: fluidsynths refers to missing libgomp.so.1
+
 2023.02.3, released July 17th, 2023
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
