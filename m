Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015ECC77B7C
	for <buildroot@archiver.kernel.org>; Wed, 10 May 2023 20:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FB0760FA7;
	Wed, 10 May 2023 20:24:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FB0760FA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jZu6ZrfDPCJB; Wed, 10 May 2023 20:24:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 722CF60E74;
	Wed, 10 May 2023 20:24:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 722CF60E74
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A7E81BF349
 for <buildroot@lists.busybox.net>; Wed, 10 May 2023 20:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03FE2403A2
 for <buildroot@lists.busybox.net>; Wed, 10 May 2023 20:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03FE2403A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vjzJpEebRjE1 for <buildroot@lists.busybox.net>;
 Wed, 10 May 2023 20:24:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64854402D0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64854402D0
 for <buildroot@buildroot.org>; Wed, 10 May 2023 20:24:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.128]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MCsPy-1q5bnv1f6G-008udQ; Wed, 10 May 2023 22:24:35 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 10 May 2023 22:24:34 +0200
Message-Id: <20230510202434.13975-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:h3ouI4cZYlWELz/WBoGA4c71/dwt1YzG13kvLFD3yhy6rOFAsiZ
 XElv31mYe43ribN/DAZitUIAdnt204UpqHBrH+wNc5n2SUqaYgEz+Icxr5YZSMfez10hCRe
 QKLLxTlciG8Y79n7z+WvVtd+I0dK9Z6Ur8xm6CMnvs9hlM1VYTx+MJBnfnjcLaxkWYrH/3M
 scflNs6B+fakX/93OVD6Q==
UI-OutboundReport: notjunk:1;M01:P0:A9/qCgBlChw=;b0Nv+cvRjxRVAumLomNGKP3trMM
 rETlVaSHajl6LbDI76lS2o/8qQICeqZa14ogoAkk1j69rsUFBjtuY/Er0TFaA84dS9ay4fHp8
 5Ru4OuczM6YDs3fbt6xmPaBtlMr5F9BGuubHb9NDFr+TqIHX+odhuP8mglG5vtr2mbAQRr8kv
 /a/Ge1PNVaQ1elZqbOVOD96xsmZsddIGS7Qz2w9BjTomgkJ2IWrwQCUexIoLIjOjmmVIsYYsU
 js0b0xBWJ0Lft7GG9uDVf4fdsXHHdzaCUjQH6iFqiYjHql5rYKmtGF0RDlRsaKGntnX9BkjxN
 eHh/0r4iB7gHfGVQXnuYDfrHry+Nj9Gv/cmls9MWnwUmEpFiTvmbL1F5qRrIOZN3aM4vG7103
 DUqgJIwqwif0waV/dB/xj5AHHE9ClLKJIRf+YtYeBHMtXltxfOi5uLZ5zAvX5pmey16cChN7u
 UINJkkyhqVkIbv5drgwrP000VA/lQ1OEx5nuoJBEZmWiDS5iRcv98D+RGzJnomkRikxhOItlY
 MrsVarmVphVk532CpvPALnhNhJPxQ8TAWibBnDFd1EiqeeilHGgMYt1S7TqDwoSeAEHKyKxKT
 MkzU845IW2Gz2zyQcTwgo58QIWKLN//N+10ijkjrxLYisrES35Cxs0gp3V5bFrZQl+IsVp+mx
 KpvJ75LJi8zShqZfIZUAfFg1V0QEiFhrAxnej5k9RSUMm1I4fkEpnrkIehjg61vDeQtnLmYkd
 NMuI7UwvSwwipd7l1eSSenE1P3YWyeLamBjoOnA8PKbUeBMCrDNlbrc62In41TbIa+btvNKog
 phHmDH27GZc9OLNXYPVOitqa6Qo9do5K5F97Hu4qFc59fvy/3BJ1BNrzMGvkAGwe4VpeqOpxn
 /eHH/2/PVgTo0Ax/8pxQgA9zJya6lbq+bym6E0JL2Wq8G1gVCfv+3/hEns7Xlf1QVrtgkbfm9
 3ny28IIFBilM1zQekT8kiaAvUsg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1683750275; i=ps.report@gmx.net;
 bh=TB+4lC8vRocL0+ci97FRW/pMULySC3VERHPgKfs6Q2M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=KSYS+6/TA0t9FiBsZReWmTnjJpNwzgRcfnXXJ9Xd34GebkR0qwbFAgFrjSOWAJ9Tw
 Qw2swa2Ta1OmvcWNoYls10G1AWBxOJKjKmBnTdn9XxNdWbhkWhBH1yN7YFQsPAtSB9
 LJfp6co8UpaKwxg8BjIEFO0YeT/dqN2pOSA478jLPqAIQMFcrAgsPqleipUR2IECCz
 v4aodmUTTY5UbspzI5jYxd5F/7eZwwvINHgNrqzdsKQQ17t2JMvFhcwuAYzX6vAMrA
 +dr1JgbD3CDKv2GRIaPajiU5XxWVyX+gDXYkWeEnxskIcFkPdg6mHwwvV5Ct+vGCpx
 vW7yMbRoJfS1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=KSYS+6/T
Subject: [Buildroot] [RFC v1] package/coreutils: needs toolchain headers >=
 5.6 (32-bit system with 64-bit time_t)
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add coreutils dependency on toolchain headers >= 5.6 for 32-bit system to
gain access to 64-bit time_t.

Fixes:

  http://autobuild.buildroot.net/results/a5bac0aaadea43fcedf3a51b070e605e3906c237

  checking for .../host/bin/arm-none-linux-gnueabi-gcc -std=gnu11 option to enable timestamps after Jan 2038... support not detected
  configure: error: in '.../build/coreutils-9.3':
  configure: error: support for timestamps after Jan 2038 is required

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - Config.in comment section for package/glslsandbox-player and
    package/opkg-utils missing
  - Not sure if this is sufficient (e.g. possible libc system and/or
    version dependency), other possible solution would be something
    like introducing BR2_TOOLCHAIN_HAS_64_BIT_TIME_T
---
 package/coreutils/Config.in          | 6 ++++--
 package/glslsandbox-player/Config.in | 1 +
 package/opkg-utils/Config.in         | 2 ++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
index 705013bae0..968c7a97cd 100644
--- a/package/coreutils/Config.in
+++ b/package/coreutils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_COREUTILS
 	bool "coreutils"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6 || BR2_ARCH_IS_64
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
@@ -33,7 +34,8 @@ comment "coreutils individual binaries need a toolchain w/ dynamic library"
 
 endif
 
-comment "coreutils needs a toolchain w/ wchar"
+comment "coreutils needs a toolchain w/ headers >= 5.6 (32-bit only), wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6 && !BR2_ARCH_IS_64 || \
+		!BR2_USE_WCHAR
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index 530c158fc3..78d6dd9a6f 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -32,6 +32,7 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS
 	bool "Install scripts"
 	depends on !BR2_STATIC_LIBS # python3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6 || BR2_ARCH_IS_64 # coreutls
 	depends on BR2_USE_MMU # bash, python3
 	depends on BR2_USE_WCHAR # python3
 	select BR2_PACKAGE_BASH # runtime
diff --git a/package/opkg-utils/Config.in b/package/opkg-utils/Config.in
index 2973055baf..cdefa193b7 100644
--- a/package/opkg-utils/Config.in
+++ b/package/opkg-utils/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_OPKG_UTILS
 	depends on !BR2_nios2 || BR2_PACKAGE_BUSYBOX # binutils
 	depends on BR2_USE_MMU # bash, python3
 	depends on BR2_USE_WCHAR # python3
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6 || BR2_ARCH_IS_64 || \
+		BR2_PACKAGE_BUSYBOX # coreutils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python3 <- libffi
 	depends on !BR2_STATIC_LIBS # python3
 	select BR2_PACKAGE_BINUTILS if !BR2_PACKAGE_BUSYBOX # runtime
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
