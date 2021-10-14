Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B83C1C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:09:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76A9161040
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76A9161040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50508605AC;
	Thu, 14 Oct 2021 21:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k8TFEr0wsu4I; Thu, 14 Oct 2021 21:09:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5F59605A2;
	Thu, 14 Oct 2021 21:09:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 263941BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A78AF83AC7
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:08:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W40ap6nGxVJG for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:08:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE30883AC5
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:08:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A1D4D94EAD; Thu, 14 Oct 2021 21:05:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 22:43:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12e87224328bf10a2852ac753b178c1de8f70cd7
X-Git-Newrev: 31117b212a14799d33e88b08f44c7ac34ca38d51
X-Patchwork-Hint: ignore
Message-Id: <20211014210541.A1D4D94EAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: bump version to
 20210919
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

commit: https://git.buildroot.net/buildroot/commit/?id=31117b212a14799d33e88b08f44c7ac34ca38d51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- update hash of WHENCE file

- update hash of LICENCE.iwlwifi_firmware (copyrigth year update, see [1])

- update RTL_81XX entries (remove rtlwifi/rtl8192eefw.bin see [2]) and
  convert to one entry per line format (easier to parse and update)

- update RTL_87XX entries (remove rtlwifi/rtl8723bs_ap_wowlan.bin,
  rtlwifi/rtl8723bs_nic.bin and rtlwifi/rtl8723bs_wowlan.bin see [3]) and
  convert to one entry per line format (easier to parse and update)

[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=5de082d4d0f2db7722c9e6f5c9cff1fefd8073be
[2] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=b986edd80647b68af068ebaaa1323d2b046c5435
[3] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=0ba5d686a93830c236d6a682560cd6b47b3e30fa

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/linux-firmware/linux-firmware.hash |  6 ++---
 package/linux-firmware/linux-firmware.mk   | 40 +++++++++++++++++++-----------
 2 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 41a17b021e..d8edb37628 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  2aa6ae8b9808408f9811ac38f00c188e53e984a2b3990254f6c9c02c1ab13417  linux-firmware-20210511.tar.xz
+sha256  2fb22a5d7d23bf1f5800ab8152b39a00a445fbf4923de5a01b59d3f6253f0a9f  linux-firmware-20210919.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
@@ -14,7 +14,7 @@ sha256  a5777f9e80aca0603b0648454de996168b1c530322550ccda94d6d78bcf6c061  LICENC
 sha256  60fbc9cccb455e1a3306c97db942d6f24fa93664be61d54c497637e6d0e2ae83  LICENCE.fw_sst_0f28
 sha256  5181b0b51efc79d5acb2c9bb92042878fdbad97a92114d4ab5e32e2b5b52fce4  LICENCE.ibt_firmware
 sha256  0e0c11073ba3c832097da38e0905da36b8a3526f219407977b13b71c6675be7d  LICENCE.it913x
-sha256  e295020afd7597dc1b3bbe50a84a7e432d9cb92bc053c1c5e657b50d2517627b  LICENCE.iwlwifi_firmware
+sha256  16d5040c7cf851fc693b7542e20870935b99802533ea1bfd231c377a2305e5c5  LICENCE.iwlwifi_firmware
 sha256  0fc67bd715b3395f3f2af464781910e9e69c4ba23da304352229b42dc9e986c3  LICENCE.microchip
 sha256  2051d5bf0755a0668f8c3d9a0d1c41d4b8cc411aba70f720fda71ae9e3b4d25c  LICENCE.qat_firmware
 sha256  4071a11d878dbc0ac6d9e71203d03b151638f9d7a8bc47a54c3cb964100d5822  LICENCE.qla2xxx
@@ -32,6 +32,6 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  dcc87a24f18d46a73985e68c378ec6d7e7fd4083eb4d4f3130a34fe3f75aff6f  WHENCE
+sha256  a06edfd3649df6b0cbac8304d6d53f661963381f1231fd02da259806763d4162  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index f29d9cf65d..ff793c9218 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20210511
+LINUX_FIRMWARE_VERSION = 20210919
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
@@ -107,27 +107,37 @@ endif
 # rtl81xx
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX),y)
 LINUX_FIRMWARE_FILES += \
-	rtlwifi/rtl8192cfw.bin rtlwifi/rtl8192cfwU.bin \
-	rtlwifi/rtl8192cfwU_B.bin rtlwifi/rtl8192cufw.bin \
-	rtlwifi/rtl8192defw.bin rtlwifi/rtl8192sefw.bin \
-	rtlwifi/rtl8188efw.bin rtlwifi/rtl8188eufw.bin \
+	rtlwifi/rtl8192cfw.bin \
+	rtlwifi/rtl8192cfwU.bin \
+	rtlwifi/rtl8192cfwU_B.bin \
+	rtlwifi/rtl8192cufw.bin \
+	rtlwifi/rtl8192defw.bin \
+	rtlwifi/rtl8192sefw.bin \
+	rtlwifi/rtl8188efw.bin \
+	rtlwifi/rtl8188eufw.bin \
 	rtlwifi/rtl8192cufw_A.bin \
-	rtlwifi/rtl8192cufw_B.bin rtlwifi/rtl8192cufw_TMSC.bin \
-	rtlwifi/rtl8192eefw.bin rtlwifi/rtl8192eu_ap_wowlan.bin \
-	rtlwifi/rtl8192eu_nic.bin rtlwifi/rtl8192eu_wowlan.bin
+	rtlwifi/rtl8192cufw_B.bin \
+	rtlwifi/rtl8192cufw_TMSC.bin \
+	rtlwifi/rtl8192eu_ap_wowlan.bin \
+	rtlwifi/rtl8192eu_nic.bin \
+	rtlwifi/rtl8192eu_wowlan.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
 
 # rtl87xx
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX),y)
 LINUX_FIRMWARE_FILES += \
-	rtlwifi/rtl8712u.bin rtlwifi/rtl8723fw.bin \
-	rtlwifi/rtl8723fw_B.bin rtlwifi/rtl8723befw.bin \
-	rtlwifi/rtl8723aufw_A.bin rtlwifi/rtl8723aufw_B.bin \
-	rtlwifi/rtl8723aufw_B_NoBT.bin rtlwifi/rtl8723befw.bin \
-	rtlwifi/rtl8723bs_ap_wowlan.bin rtlwifi/rtl8723bs_bt.bin \
-	rtlwifi/rtl8723bs_nic.bin rtlwifi/rtl8723bs_wowlan.bin \
-	rtlwifi/rtl8723bu_ap_wowlan.bin rtlwifi/rtl8723bu_nic.bin \
+	rtlwifi/rtl8712u.bin \
+	rtlwifi/rtl8723fw.bin \
+	rtlwifi/rtl8723fw_B.bin \
+	rtlwifi/rtl8723befw.bin \
+	rtlwifi/rtl8723aufw_A.bin \
+	rtlwifi/rtl8723aufw_B.bin \
+	rtlwifi/rtl8723aufw_B_NoBT.bin \
+	rtlwifi/rtl8723befw.bin \
+	rtlwifi/rtl8723bs_bt.bin \
+	rtlwifi/rtl8723bu_ap_wowlan.bin \
+	rtlwifi/rtl8723bu_nic.bin \
 	rtlwifi/rtl8723bu_wowlan.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
