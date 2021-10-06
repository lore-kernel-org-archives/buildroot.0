Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8E1C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 21:37:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBFCA611C6
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 21:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EBFCA611C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FFF084153;
	Wed,  6 Oct 2021 21:37:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uYXud7XN0rzS; Wed,  6 Oct 2021 21:37:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB8388418F;
	Wed,  6 Oct 2021 21:37:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 444711BF2A1
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 21:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FEF860F53
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 21:37:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TPFvvKWBxWlM for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 21:37:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 848C3606A5
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 21:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633556249;
 bh=8SonxDq9GNLXa4mbWNumA0tcoqgFZ44Gm7ZmkWn53V4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=eDm9s2m4I6cDeT/rFAGfyLAAde2ZrPlpZDA2sBJBB6lxVbGDc1DtQnw7dQ69U8frp
 iiMXDS0yyrAHrphjC1zx5WpUjx4tYwp4moklQ4Roi1CP7jSOY/shP9uHBPuYq9JiDl
 a6l2enc2hvSBtTG48MkMN0TmN6EkPT4R6D4kG6qk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.251]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M6Ue3-1mRts81Jmr-006shd; Wed, 06 Oct 2021 23:37:29 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 23:37:24 +0200
Message-Id: <20211006213728.1069-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:oLtSDWPiJ6R/QbGEDUDSupzaT4wuhNM4xVRDHfILVom2ehalOgE
 GUukXMdl4yVPvexf6rxB9WNngn2Q/D3LvikXvvesWBy/m00B843mhcKGSXJv1cAMv/QWx+G
 YXqB5CfzflpUNi/oxuRGFuAvhGuvvs0CWD+XImR3ywU7Mtm5tL6b6bje3wRtGP+4G6ByR+b
 4eRPpQeuJSo/jIeM+1bEw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8gbvjNd19/E=:Wmbo3mkhavzCF/gLTVNYhp
 Ke+2SuMPvo3V1zbgOBYbzoQg28j/AhS/tOCfIYiDhDaZhoBpn/R8HTDhfOaHUQYF+6KEb8r/N
 J7EogaAG/y08tLXCDVP2ZQ/Ri58vISd7Zn1oJADUbV/QCRkL4PadYhhwPJzpjLpUK/A5Jn41C
 gMv9MtJgE9i5qS68ku81em2nouBoxlyY7P+KXxIsohPJUNO78bLtoFS5klgNXyzadMCThE6BS
 HZOERAopo8QBkIoWZWpDqCHIzk4oamdCG173yCGpqS/8GtqCLY/KLNeybbkSlO7QiUzu42ED1
 xyKFJsJunj/a765jqpjrnzCxuOGw9WwtOh8GQHg1JUNTixB2jHi3JraYCB3w6PsDE6OIo4XDn
 jfS/qyohLq7HmK4yFejyoxTapE6EVPifyKXqDBCdYgVC5i5uMO+hUm8jybpJoTlLAJOBa097s
 trY8MSQhHnMKnxq/5UKiwFpjsLUnWlZ1VvBHVwmXwzy31lq0wsAT7yWXrsAphMKwbn/0ggKRE
 V9zSZmvQEq8Dn8pDphLgNlGmhnAuzdR/JMs75y69P//o75z/fQEzZ6REzJ2uAxt0+DLvps+37
 L8YnfM1uWrklPjljY3EA33JeA7ppt53h9aOLfTJWdNzqMfhGw3WayN/qCvXRg6sDnh2Sv/a0O
 vDjDhtFAtSbUA/m6pq647tknW+NWFPRCH41QfiA8LxO4bbaabG7Vh47uw9qdH4gx3ZiNdRIoI
 dOLgcpR6lUXnsc0Hlq1TjrxEVDLiFLErRutqYOykgiGX51QoiXWPkJqEuInWeyr9PaUM+IQch
 MPZd6p1xkA03EvKmwzjRjFFcCBF12Zj4PXPOvp5ukYRaVWEa2MTqslQBZknzLa2Nag+PtOgJ6
 Gz2uv/TKJNaHtLhxx6enRs3ID/ZOtHhunxoAe7xhUNQqM7t+Ahq24xT+xiheWT87bORA2mt6a
 s57S5S9dnVqJGHeCE8fQchh31z9zvNqtFVebDqmstzA0Oa+cuJIsyHB6p0edShyBxS9vye3/J
 k4JYnX1pLoKUT4mjmNobIntr6vSk22ryt+gVo/y7pTG7wJrsJIsLk4e6k3OBQeIiYzzUGMfi1
 wtZIPKgmXgWe1k=
Subject: [Buildroot] [PATCH v2 1/5] configs/raspberrypi*: bump kernel
 version to 24c8b05 (5.10.63)
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
Cc: Vincent Fazio <vfazio@xes-inc.com>,
 Arthur Courtel <arthur.courtel@smile.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now based on 5.10.63 (from 5.10.46).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - update from 3e1698e to 24c8b05 (still 5.10.63)
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
index c17fe99c45..ffe4037db0 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4afd064509b23882268922824edc5b391a1ea55d)/linux-4afd064509b23882268922824edc5b391a1ea55d.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,24c8b0546a820222a1ebcfe606dfacb0e228c466)/linux-24c8b0546a820222a1ebcfe606dfacb0e228c466.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B from the kernel sources: the zero is the same
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index 3a5e306299..1413c275b1 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4afd064509b23882268922824edc5b391a1ea55d)/linux-4afd064509b23882268922824edc5b391a1ea55d.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,24c8b0546a820222a1ebcfe606dfacb0e228c466)/linux-24c8b0546a820222a1ebcfe606dfacb0e228c466.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero-w"
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 1eee3ae37e..180dc84c41 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4afd064509b23882268922824edc5b391a1ea55d)/linux-4afd064509b23882268922824edc5b391a1ea55d.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,24c8b0546a820222a1ebcfe606dfacb0e228c466)/linux-24c8b0546a820222a1ebcfe606dfacb0e228c466.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 859d95314c..da43f2416e 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4afd064509b23882268922824edc5b391a1ea55d)/linux-4afd064509b23882268922824edc5b391a1ea55d.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,24c8b0546a820222a1ebcfe606dfacb0e228c466)/linux-24c8b0546a820222a1ebcfe606dfacb0e228c466.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 67ce0d5314..48db2e4941 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4afd064509b23882268922824edc5b391a1ea55d)/linux-4afd064509b23882268922824edc5b391a1ea55d.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,24c8b0546a820222a1ebcfe606dfacb0e228c466)/linux-24c8b0546a820222a1ebcfe606dfacb0e228c466.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index d9538dc648..051b384314 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4afd064509b23882268922824edc5b391a1ea55d)/linux-4afd064509b23882268922824edc5b391a1ea55d.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,24c8b0546a820222a1ebcfe606dfacb0e228c466)/linux-24c8b0546a820222a1ebcfe606dfacb0e228c466.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index 312ec64471..d8d330ac25 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4afd064509b23882268922824edc5b391a1ea55d)/linux-4afd064509b23882268922824edc5b391a1ea55d.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,24c8b0546a820222a1ebcfe606dfacb0e228c466)/linux-24c8b0546a820222a1ebcfe606dfacb0e228c466.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index 3ae2d253fb..04d13ef7db 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4afd064509b23882268922824edc5b391a1ea55d)/linux-4afd064509b23882268922824edc5b391a1ea55d.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,24c8b0546a820222a1ebcfe606dfacb0e228c466)/linux-24c8b0546a820222a1ebcfe606dfacb0e228c466.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 75e7177974..dd51758912 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -11,7 +11,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4afd064509b23882268922824edc5b391a1ea55d)/linux-4afd064509b23882268922824edc5b391a1ea55d.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,24c8b0546a820222a1ebcfe606dfacb0e228c466)/linux-24c8b0546a820222a1ebcfe606dfacb0e228c466.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypicm4io_64_defconfig
index 304428ec64..7b21bd1294 100644
--- a/configs/raspberrypicm4io_64_defconfig
+++ b/configs/raspberrypicm4io_64_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4afd064509b23882268922824edc5b391a1ea55d)/linux-4afd064509b23882268922824edc5b391a1ea55d.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,24c8b0546a820222a1ebcfe606dfacb0e228c466)/linux-24c8b0546a820222a1ebcfe606dfacb0e228c466.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
index f4ba22dfe5..0480462f41 100644
--- a/configs/raspberrypicm4io_defconfig
+++ b/configs/raspberrypicm4io_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4afd064509b23882268922824edc5b391a1ea55d)/linux-4afd064509b23882268922824edc5b391a1ea55d.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,24c8b0546a820222a1ebcfe606dfacb0e228c466)/linux-24c8b0546a820222a1ebcfe606dfacb0e228c466.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
