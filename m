Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 079DCC433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 20:05:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E9D5610A8
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 20:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E9D5610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58B8D81CBA;
	Thu, 11 Nov 2021 20:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kZfG5mfC-fJz; Thu, 11 Nov 2021 20:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 768DE81BF5;
	Thu, 11 Nov 2021 20:05:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9BF7C1BF44A
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 20:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7C2D40226
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 20:04:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xx2PWOhZZS24 for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 20:04:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0761B401FE
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 20:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636661080;
 bh=0KX2rtPQvjz+CmysgCS8vyIGX+6jijd8ciT5htH0TZ0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=DaRaWwkMm7zeSnG5I6znVAdmQop6ZpcwApG6FPsSiHttMUNLdnKjIfOBDjpstDwYG
 Q8Cm3lf9pLcp2v4bWNkxExnzXSK5XB+wvCobz4OC98Y3F2ehOwjQ7I+1VeYCeK+KhW
 VWB6jqyUYVYImLa0aUPAMfgL/4+yHL4pwPmM8Cos=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.16]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJE27-1n0s9c3sdP-00Kcgu; Thu, 11
 Nov 2021 21:04:40 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 11 Nov 2021 21:04:33 +0100
Message-Id: <20211111200439.15379-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:wkIeZO4EsnC/6olzo8pdQRTeBcxh2EIlAObDUgmM3ACpv4Ve72G
 El48EUFvSiR3tC0bxvhxQMEZPFR2GBObj3iUFdAIZ1bZBYQBJUg/8rGMWmWYc9MIuzqozNp
 6lT1NsHMqoqH2D6nkccFxLBGP+fotETJEswiWdEFCtkbZHgYG3+cVexpIvTqJA/eoAyNyWX
 n6CMRAXfpmyS8d4a83U5w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TiGTdFQ+Zt0=:neekMBCNs4mK6C2XfHrnjc
 uT0Wj0mDPY0nr4yOY7U5dkFMzUXVG/5TY92qVI/0XUqbDgit7sT4BhdyB4VcD/HcMvoiqxx9C
 EKrOTPrd+1gRTrfa0ZWP9ztJo8+Z/x1HuiCynTH7tvTMsu5PZOMDsjZHpvrbU/70G19SzWQNg
 dIaD0QEx5pgZIM7lqU12LpzYKcYMQ7WIg9pOs6SaL1JZIU6t2coITmb4HzboYswzeDDufcMDy
 7K0kxFFdxMsH+oIhNiEpgUVYdL0cVnho8OaPiGDyvtTfsohY1ujRHp+NflmSIXckSHBt68U3L
 YDD4jXdpPj/cBfG+NE54M4ckQ8Mdc3FDGPsomtrVidpcqGL9m7qsieSFAgNPR7xPndaMjRmnS
 zdk+rrQwtrwvM7VtVf7SW73IMaaceviar13ZIlHojTis7bZMcMJcKCrlkt7+lNRYgHhIjW7EY
 /hw9pqo8+27nhn5a0OS+MNIE09natX+U8lDX9cCoCulDB/kRKvmo9zBwU85c4w9eR2vSV0U6Y
 A1ob7vpZAZyFb0Ff9JM2cWaYszz9LARh+Kg7eVnwhPD4oFKHtiif7/v05XVY7lVHoDerHjS0G
 rBbAP/91FFiEQZYN4HwnLvvKdSFgLAgw7yiztVrIQBwS/c4Kin9/87iRVx9fFdT0igZ0yajUO
 TV7n7RP/H3/t55wSENz4OBkk1n36WVOpt52DWh9JFq0mcT4axqIEgZuzXXoztP7/PI7Tqg6NH
 4KxS5WnnsA0QP3delq1Gbg1ALJ/q5fyydbDJVnRpjfsUdgeGW6UqgUyTW5F1tq1+U/a47aRuw
 aaBxM3wMRJXscUQQcxJFHbT8WtnxwQaFYE8RZeFauYOVDAfdlt5IrKko1FiEioEpF6OVN0MVI
 jJ3bS0cc1ZuA8Q+HbHteqo9Ha0t/eFrP09aQgNkOp663FOAK1klgPW7nfNaNSBFZK7kmoTBoy
 yUyNRyYTjwyqDgYlHfjps8CNi8lk7iQ1zwROoxZnD+i2LYGWu3Owy5lbh4eMknY8CRUb8fo82
 toccbl3sqxVmJIPdk9MFmLBfH+AEMMGn+kvNOCaWxv93obDpvpkmmIY/t3mchVnmMWkX4Nvfg
 9mOobNXaYfMCDQ=
Subject: [Buildroot] [PATCH/next v1 1/7] configs/raspberrypi*: bump kernel
 version to 9878a11 (5.10.78)
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now based on 5.10.78 (from 5.10.76).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 configs/raspberrypi0_defconfig        | 2 +-
 configs/raspberrypi0w_defconfig       | 2 +-
 configs/raspberrypi2_defconfig        | 2 +-
 configs/raspberrypi3_64_defconfig     | 2 +-
 configs/raspberrypi3_defconfig        | 2 +-
 configs/raspberrypi3_qt5we_defconfig  | 2 +-
 configs/raspberrypi4_64_defconfig     | 2 +-
 configs/raspberrypi4_defconfig        | 2 +-
 configs/raspberrypi_defconfig         | 2 +-
 configs/raspberrypicm4io_64_defconfig | 2 +-
 configs/raspberrypicm4io_defconfig    | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index e49be1af7a..64f7a93377 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,581049d718caf95f5feb00607ac748d5841cf27c)/linux-581049d718caf95f5feb00607ac748d5841cf27c.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B from the kernel sources: the zero is the same
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index 6be7401f6c..f3e7c453ab 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,581049d718caf95f5feb00607ac748d5841cf27c)/linux-581049d718caf95f5feb00607ac748d5841cf27c.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero-w"
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index c59ee064b9..7befbf07e6 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,581049d718caf95f5feb00607ac748d5841cf27c)/linux-581049d718caf95f5feb00607ac748d5841cf27c.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 7d863c1731..ebb6e2252b 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,581049d718caf95f5feb00607ac748d5841cf27c)/linux-581049d718caf95f5feb00607ac748d5841cf27c.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index f923a3028b..6a9c4e0d02 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,581049d718caf95f5feb00607ac748d5841cf27c)/linux-581049d718caf95f5feb00607ac748d5841cf27c.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index dea5060590..7d06b0bb5e 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,581049d718caf95f5feb00607ac748d5841cf27c)/linux-581049d718caf95f5feb00607ac748d5841cf27c.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index 436ea57f13..2b5446d8f1 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,581049d718caf95f5feb00607ac748d5841cf27c)/linux-581049d718caf95f5feb00607ac748d5841cf27c.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index ca506b38df..ac555ddd5e 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,581049d718caf95f5feb00607ac748d5841cf27c)/linux-581049d718caf95f5feb00607ac748d5841cf27c.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index f6fa92fb34..257e59536e 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -11,7 +11,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,581049d718caf95f5feb00607ac748d5841cf27c)/linux-581049d718caf95f5feb00607ac748d5841cf27c.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypicm4io_64_defconfig
index f29e4c492a..1ab379c557 100644
--- a/configs/raspberrypicm4io_64_defconfig
+++ b/configs/raspberrypicm4io_64_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,581049d718caf95f5feb00607ac748d5841cf27c)/linux-581049d718caf95f5feb00607ac748d5841cf27c.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
index fac706c4d2..9941754e25 100644
--- a/configs/raspberrypicm4io_defconfig
+++ b/configs/raspberrypicm4io_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,581049d718caf95f5feb00607ac748d5841cf27c)/linux-581049d718caf95f5feb00607ac748d5841cf27c.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
