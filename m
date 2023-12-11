Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B37C4167B
	for <buildroot@archiver.kernel.org>; Mon, 11 Dec 2023 08:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D52D2414FA;
	Mon, 11 Dec 2023 08:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D52D2414FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H6j5EAYapMKF; Mon, 11 Dec 2023 08:17:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25320414D6;
	Mon, 11 Dec 2023 08:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25320414D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6DF031BF3A4
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 08:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 464738214B
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 08:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 464738214B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sNRLdBuF-78i for <buildroot@lists.busybox.net>;
 Mon, 11 Dec 2023 08:17:40 +0000 (UTC)
X-Greylist: delayed 344 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 11 Dec 2023 08:17:40 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26B3982149
Received: from 4.mo552.mail-out.ovh.net (4.mo552.mail-out.ovh.net
 [178.33.43.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26B3982149
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 08:17:40 +0000 (UTC)
Received: from mxplan7.mail.ovh.net (unknown [10.109.138.188])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 17DF52A61E
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 08:17:38 +0000 (UTC)
Received: from logilin.fr (37.59.142.96) by DAG4EX2.mxp7.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 11 Dec
 2023 09:17:37 +0100
X-OVh-ClientIp: 82.64.11.165
From: Christophe Blaess <christophe.blaess@logilin.fr>
To: <buildroot@buildroot.org>
Date: Mon, 11 Dec 2023 09:17:28 +0100
Message-ID: <20231211081730.1406640-1-christophe.blaess@logilin.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG6EX2.mxp7.local (172.16.2.52) To DAG4EX2.mxp7.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 4051551e-fa2e-40e1-b622-faf451a9bce0
X-Ovh-Tracer-Id: 14240663499299837207
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeluddguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgggfgtihesthekredtredttdenucfhrhhomhepvehhrhhishhtohhphhgvuceulhgrvghsshcuoegthhhrihhsthhophhhvgdrsghlrggvshhssehlohhgihhlihhnrdhfrheqnecuggftrfgrthhtvghrnhepudduffduudehheeuudfgteffgfdtvefhgedtfedulefhjeejteehgfduffeiuddtnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdeliedpkedvrdeigedruddurdduieehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghhrhhishhtohhphhgvrdgslhgrvghssheslhhoghhilhhinhdrfhhrqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001aedb6e02-2637-4f74-b922-40ed59939ffe,
 9AF3198B505034A765FD1E5F33C94A984CDD90C4)
 smtp.auth=christophe.blaess@logilin.fr
Subject: [Buildroot] [PATCH 1/3] configs: add support for the Raspberry Pi 5
 board.
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
Cc: Christophe Blaess <christophe.blaess@logilin.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Raspberry Pi 5 defconfig is mostly inspired by the Raspberry
Pi 4 64-bits defconfig.


(sorry for possible double post, I had some issues with the email I
used for subscribing to the mailing list).

Signed-off-by: Christophe Blaess <christophe.blaess@logilin.fr>
---
 configs/raspberrypi5_defconfig | 45 ++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 configs/raspberrypi5_defconfig

diff --git a/configs/raspberrypi5_defconfig b/configs/raspberrypi5_defconfig
new file mode 100644
index 0000000000..031f24a977
--- /dev/null
+++ b/configs/raspberrypi5_defconfig
@@ -0,0 +1,45 @@
+BR2_aarch64=y
+BR2_cortex_a76=y
+BR2_ARM_FPU_VFPV4=y
+
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+BR2_SYSTEM_DHCP="eth0"
+
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2712"
+
+# Build the DTB from the kernel sources
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2712-rpi-5-b"
+
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi5/config_5.txt"
+
+# Required tools to create the SD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi5/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi5/post-image.sh"
+
+# Enable compressed kernel module support
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_KMOD_TOOLS=y
+BR2_PACKAGE_XZ=y
+BR2_PACKAGE_KMOD=y
+BR2_PACKAGE_HOST_KMOD_XZ=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
