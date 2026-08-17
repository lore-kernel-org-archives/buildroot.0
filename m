Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D59BC5B572
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 17:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A562140562;
	Mon, 17 Aug 2026 17:16:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wf6FYNilIBoP; Mon, 17 Aug 2026 17:16:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59D2B40566
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786987005;
	bh=dq/rFSDqg4Jgka/YxopWyEKiFao+V9eB6b73AXUKywY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qgWwPAfjV4q6zDRLPj9Ap5LSingsLFrMAGt2yKbKYccCJvNqNnPz40OTYb7XAtTez
	 yxDdX2h7B+8jU0wleZSXqI7Qr/VA2tih/ZPT0bdP2kO9nTYUgZ788L8yBzV4V+chBH
	 bX+MEa46WuUQI/hJ/1tZKEdOYERoc6VA1VJjMlasTw/AorB6uV9CeU5ZmuSBElVPqg
	 Ai5CQzs5BvTUMwHGEK/zcB6Ml1q05wmEvy4+qO/jjAxRdtxYkJ3A+BTay8/VeeWvWU
	 Ptx5zlyRARH6PqKpVyu4RDwO8NDZ17vIOkIx+jpwCSwvMFW/wEF14Tpgdm6DEYEdjn
	 mXJNYEzQO56Ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59D2B40566;
	Mon, 17 Aug 2026 17:16:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 432592EF
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28DA440204
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VY_2jq9pnJmH for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 17:16:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A7054020A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A7054020A
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:16:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F1998CACE; Mon, 17 Aug 2026 17:15:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 17 Aug 2026 19:12:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83f79dd82cab6d103f515a155baf18e9f4125c33
X-Git-Newrev: d2d757b1df003e135e4a431ac19f8750dcd4ab64
X-Patchwork-Hint: ignore
Message-Id: <20260817171550.6F1998CACE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: bump version to
 20260810
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2d757b1df003e135e4a431ac19f8750dcd4ab64
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Mass-update of license file paths due to upstream commit
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=1221848f23764faab10ff63bc5d9ea5d5b39a506
"Move firmware licenses to a LICENSES/ directory"

Updated the hash of the WHENCE file, due to firmware additions and
firmware changes, but no changes to the redistribution/licensing
conditions.

Removed mts_mt9234mu.fw & mts_mt9234zba.fw from the
BR2_PACKAGE_LINUX_FIRMWARE_USB_SERIAL_TI option due to their upstream
removal:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=1e6faaf837aea079582214c9c1382e5476175576

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-firmware/linux-firmware.hash |  98 +++++------
 package/linux-firmware/linux-firmware.mk   | 271 +++++++++++++++--------------
 2 files changed, 185 insertions(+), 184 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index e707583e7e..103f4ecf7b 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,57 +1,57 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  b14e7197a290a7e5569f5ef790cde289bddc47e32126f2eb262a8e677fc39727  linux-firmware-20260519.tar.xz
+sha256  ac17c34fe73756926a961fbafadf8d8f07a3bd2dd2f4ea31a0fb5d50c714a49a  linux-firmware-20260810.tar.xz
 
 # Hash for license files
-sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
-sha256  ad548ca0ffb91ec655de0f28e13089ef1cd4e0deabb2f15a9289194990e62252  LICENSE.airoha
-sha256  2103bd999f77522c5ab5fd35df0579ed00e2a6b885f6f8ebd444e97ffa482991  LICENSE.amd-ucode
-sha256  572872598565dc3513470de971a32bf9db301f47afeef3636345eadae33b2eee  LICENSE.amdgpu
-sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
-sha256  802b7014b26c606cf6248ae8b0ab1ce6d2d1b0db236d38dd269e676cd70710f2  LICENCE.atheros_firmware
+sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENSES/LICENCE.Abilis
+sha256  ad548ca0ffb91ec655de0f28e13089ef1cd4e0deabb2f15a9289194990e62252  LICENSES/LICENSE.airoha
+sha256  2103bd999f77522c5ab5fd35df0579ed00e2a6b885f6f8ebd444e97ffa482991  LICENSES/LICENSE.amd-ucode
+sha256  572872598565dc3513470de971a32bf9db301f47afeef3636345eadae33b2eee  LICENSES/LICENSE.amdgpu
+sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENSES/LICENCE.Marvell
+sha256  802b7014b26c606cf6248ae8b0ab1ce6d2d1b0db236d38dd269e676cd70710f2  LICENSES/LICENCE.atheros_firmware
 sha256  3b5eb392b2d9d8c46d6aae26d06c187e5ea3029b12d13bc2b8deb8b3ce6bfa53  ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt
 sha256  631065703055d11b099477c508508f20a80b202aad548a7726564bfa59a96c91  ath10k/QCA6174/hw2.1/notice_ath10k_firmware-5.txt
 sha256  8ce5c6ea0542bf4aac31fc3ae16a39792ad22d0eae4543063fac56fb3380f021  ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt
 sha256  097ceeb6f03dad7e74a2de0f217b1dad149989e550681e8726908ef477c9d58f  ath12k/QCN9274/hw2.0/Notice.txt
 sha256  515bf4c9d620a87458e4447fe01a0e9bc384d1c3e0037cc4c3d2037b1ff25525  ath12k/WCN7850/hw2.0/Notice.txt
-sha256  bf1cb89140fe7e138fec229b26fa45d2fb46f416ab559916c6e56c0224df2e8e  LICENCE.bnx2
-sha256  691f2b5e3e94e06aa89450c99ff08c83336c77fe4ad64a609b1cddea4bf98727  LICENCE.bnx2x
-sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
-sha256  5b97965d9a820a747fa1ab6339290cea0e6ce86b001e6620c4de4c0df532ed2f  LICENCE.cadence
-sha256  a5777f9e80aca0603b0648454de996168b1c530322550ccda94d6d78bcf6c061  LICENCE.chelsio_firmware
-sha256  88236d5ae45b7abc96c2ab4c6952af88758e24b17412dd173746ee1c559b3c6f  LICENCE.cnm
-sha256  ae0db6cc4db33941148df0f67de53e76a77b1b5a46b3165edb7040aa2750015f  LICENCE.cypress
-sha256  60fbc9cccb455e1a3306c97db942d6f24fa93664be61d54c497637e6d0e2ae83  LICENCE.fw_sst_0f28
-sha256  5181b0b51efc79d5acb2c9bb92042878fdbad97a92114d4ab5e32e2b5b52fce4  LICENCE.ibt_firmware
-sha256  8c45a83562a69f7ac4207e4cb5c0063af2e545791b3947bc81dc82305481c15c  LICENSE.ice_enhanced
-sha256  0e0c11073ba3c832097da38e0905da36b8a3526f219407977b13b71c6675be7d  LICENCE.it913x
-sha256  646957007887aed50d56c1f4fd9c6ef760d5b96d0a03577bda3492206dba1d05  LICENSE.ivsc
-sha256  16d5040c7cf851fc693b7542e20870935b99802533ea1bfd231c377a2305e5c5  LICENCE.iwlwifi_firmware
-sha256  ebedc86d1767186a66dcb59ce8dcb97c5fd9ac10de2adaacad226714e4712f6d  LICENCE.mali_csffw
-sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
-sha256  a90d3f66704d85889945fec5525ea77622549da83aced1aac99828383f8f1805  LICENCE.mediatek
-sha256  0fc67bd715b3395f3f2af464781910e9e69c4ba23da304352229b42dc9e986c3  LICENCE.microchip
-sha256  59ae206c89108905ebdc9ad4c9336526bd2c0d50fbf988c21e8c2a82719d42a4  LICENCE.moxa
-sha256  1c9aa6bd6703a7ce1cdb879542fa1d8aca115a327bd819b193c971de9c53f402  LICENSE.powervr
-sha256  0bd9f7cae3cf72b12a63359a725ccbb76ddbd6831372695a9162144329800dd0  LICENCE.qat_firmware
-sha256  4071a11d878dbc0ac6d9e71203d03b151638f9d7a8bc47a54c3cb964100d5822  LICENCE.qla2xxx
-sha256  d7bec70668ddd4aae8fb4aa32870e54b49fcdb0b9b007aa9f54b53a1ac7461bd  LICENCE.ralink-firmware.txt
-sha256  8568352b57f3574f9d5b2753cdb7c6e5eb2b79e82fbb9c9ba6566947467ef508  LICENCE.ralink_a_mediatek_company_firmware
-sha256  a61351665b4f264f6c631364f85b907d8f8f41f8b369533ef4021765f9f3b62e  LICENCE.rtlwifi_firmware.txt
-sha256  190fdf103278cd69f489dc0d1d4da81d9a36af8b5baea336567fcb1df51a1973  LICENCE.ti-connectivity
-sha256  a255d4a90c457bbc840a839d009fe57765ed85223965a2e4e5ecb83b348e5ec8  LICENCE.tigon
-sha256  8ea9f4aee5f53ad877041ff089e8c95d34d615ce19a3111e5e1ea70d990ed7ff  LICENCE.xc4000
-sha256  30ec8a66503dc73f83937564ae70ca23aa03259e64727ff4195b5b6f695e782f  LICENCE.xc5000
-sha256  f8822049f32fef2e90a197bd8cf259f476db75d549456bdca8567616a9c07ace  LICENCE.xc5000c
-sha256  a064cbf83e10d72579d236a1e36032681adb8e442943ff75b57020a82992a5ed  LICENSE.QualcommAtheros_ar3k
-sha256  337a55102138d7baa143ee4a4c6c91693e0113fece35d380b2a12109e8c23b3f  LICENSE.QualcommAtheros_ath10k
-sha256  8c4f2bd742da678336ca582ac46ee203d75d77ce928797caed032ee0e3a2c7dd  LICENSE.amlogic
-sha256  630fd46c95d3ac6544590c2265ba7348fbc930fb386261a1c04dcd9f403645b8  LICENSE.dib0700
-sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENSE.i915
-sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
-sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
-sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  93a059ebbd333245a587778663c17d3df09421da30ae6b3e2d18ac2741f506c0  WHENCE
-sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
-sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
-sha256  26b3c946f1f378ff25bb3bb7c365d108a2bc0bf08619e5e08bc0e4f9aaa6ee1e  LICENSE.xe
-sha256  4a10165191a9ab82daf1539cab4242ac266eeaa1ad1d158d5d9699546966c139  LICENSE.intel_vpu
+sha256  bf1cb89140fe7e138fec229b26fa45d2fb46f416ab559916c6e56c0224df2e8e  LICENSES/LICENCE.bnx2
+sha256  691f2b5e3e94e06aa89450c99ff08c83336c77fe4ad64a609b1cddea4bf98727  LICENSES/LICENCE.bnx2x
+sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENSES/LICENCE.broadcom_bcm43xx
+sha256  5b97965d9a820a747fa1ab6339290cea0e6ce86b001e6620c4de4c0df532ed2f  LICENSES/LICENCE.cadence
+sha256  a5777f9e80aca0603b0648454de996168b1c530322550ccda94d6d78bcf6c061  LICENSES/LICENCE.chelsio_firmware
+sha256  88236d5ae45b7abc96c2ab4c6952af88758e24b17412dd173746ee1c559b3c6f  LICENSES/LICENCE.cnm
+sha256  ae0db6cc4db33941148df0f67de53e76a77b1b5a46b3165edb7040aa2750015f  LICENSES/LICENCE.cypress
+sha256  60fbc9cccb455e1a3306c97db942d6f24fa93664be61d54c497637e6d0e2ae83  LICENSES/LICENCE.fw_sst_0f28
+sha256  5181b0b51efc79d5acb2c9bb92042878fdbad97a92114d4ab5e32e2b5b52fce4  LICENSES/LICENCE.ibt_firmware
+sha256  8c45a83562a69f7ac4207e4cb5c0063af2e545791b3947bc81dc82305481c15c  LICENSES/LICENSE.ice_enhanced
+sha256  0e0c11073ba3c832097da38e0905da36b8a3526f219407977b13b71c6675be7d  LICENSES/LICENCE.it913x
+sha256  646957007887aed50d56c1f4fd9c6ef760d5b96d0a03577bda3492206dba1d05  LICENSES/LICENSE.ivsc
+sha256  16d5040c7cf851fc693b7542e20870935b99802533ea1bfd231c377a2305e5c5  LICENSES/LICENCE.iwlwifi_firmware
+sha256  ebedc86d1767186a66dcb59ce8dcb97c5fd9ac10de2adaacad226714e4712f6d  LICENSES/LICENCE.mali_csffw
+sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENSES/LICENCE.Marvell
+sha256  a90d3f66704d85889945fec5525ea77622549da83aced1aac99828383f8f1805  LICENSES/LICENCE.mediatek
+sha256  0fc67bd715b3395f3f2af464781910e9e69c4ba23da304352229b42dc9e986c3  LICENSES/LICENCE.microchip
+sha256  59ae206c89108905ebdc9ad4c9336526bd2c0d50fbf988c21e8c2a82719d42a4  LICENSES/LICENCE.moxa
+sha256  1c9aa6bd6703a7ce1cdb879542fa1d8aca115a327bd819b193c971de9c53f402  LICENSES/LICENSE.powervr
+sha256  0bd9f7cae3cf72b12a63359a725ccbb76ddbd6831372695a9162144329800dd0  LICENSES/LICENCE.qat_firmware
+sha256  4071a11d878dbc0ac6d9e71203d03b151638f9d7a8bc47a54c3cb964100d5822  LICENSES/LICENCE.qla2xxx
+sha256  d7bec70668ddd4aae8fb4aa32870e54b49fcdb0b9b007aa9f54b53a1ac7461bd  LICENSES/LICENCE.ralink-firmware.txt
+sha256  8568352b57f3574f9d5b2753cdb7c6e5eb2b79e82fbb9c9ba6566947467ef508  LICENSES/LICENCE.ralink_a_mediatek_company_firmware
+sha256  a61351665b4f264f6c631364f85b907d8f8f41f8b369533ef4021765f9f3b62e  LICENSES/LICENCE.rtlwifi_firmware.txt
+sha256  190fdf103278cd69f489dc0d1d4da81d9a36af8b5baea336567fcb1df51a1973  LICENSES/LICENCE.ti-connectivity
+sha256  a255d4a90c457bbc840a839d009fe57765ed85223965a2e4e5ecb83b348e5ec8  LICENSES/LICENCE.tigon
+sha256  8ea9f4aee5f53ad877041ff089e8c95d34d615ce19a3111e5e1ea70d990ed7ff  LICENSES/LICENCE.xc4000
+sha256  30ec8a66503dc73f83937564ae70ca23aa03259e64727ff4195b5b6f695e782f  LICENSES/LICENCE.xc5000
+sha256  f8822049f32fef2e90a197bd8cf259f476db75d549456bdca8567616a9c07ace  LICENSES/LICENCE.xc5000c
+sha256  a064cbf83e10d72579d236a1e36032681adb8e442943ff75b57020a82992a5ed  LICENSES/LICENSE.QualcommAtheros_ar3k
+sha256  337a55102138d7baa143ee4a4c6c91693e0113fece35d380b2a12109e8c23b3f  LICENSES/LICENSE.QualcommAtheros_ath10k
+sha256  8c4f2bd742da678336ca582ac46ee203d75d77ce928797caed032ee0e3a2c7dd  LICENSES/LICENSE.amlogic
+sha256  630fd46c95d3ac6544590c2265ba7348fbc930fb386261a1c04dcd9f403645b8  LICENSES/LICENSE.dib0700
+sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENSES/LICENSE.i915
+sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSES/LICENSE.qcom
+sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSES/LICENSE.radeon
+sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSES/LICENSE.sdma_firmware
+sha256  7b828cc147af7a6cd397a9cd33c23eb95f7725b6bf96fa428261198eb93bbd75  WHENCE
+sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  LICENSES/NOTICE.qcom
+sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENSES/LICENCE.e100
+sha256  26b3c946f1f378ff25bb3bb7c365d108a2bc0bf08619e5e08bc0e4f9aaa6ee1e  LICENSES/LICENSE.xe
+sha256  4a10165191a9ab82daf1539cab4242ac266eeaa1ad1d158d5d9699546966c139  LICENSES/LICENSE.intel_vpu
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 3761c5c09b..6025436c84 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20260519
+LINUX_FIRMWARE_VERSION = 20260810
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
@@ -12,47 +12,47 @@ LINUX_FIRMWARE_INSTALL_IMAGES = YES
 # Intel SST DSP
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_SST_DSP),y)
 LINUX_FIRMWARE_FILES += intel/fw_sst_0f28.bin-48kHz_i2s_master
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.fw_sst_0f28
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.fw_sst_0f28
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AMD_UCODE),y)
 LINUX_FIRMWARE_DIRS += amd-ucode
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.amd-ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.amd-ucode
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AMDGPU),y)
 LINUX_FIRMWARE_DIRS += amdgpu
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.amdgpu
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.amdgpu
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CNM_WAVE521C_K3_CODEC),y)
 LINUX_FIRMWARE_FILES += cnm/wave521c_k3_codec_fw.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.cnm
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.cnm
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_I915),y)
 LINUX_FIRMWARE_DIRS += i915
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.i915
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.i915
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_XE),y)
 LINUX_FIRMWARE_DIRS += xe
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.xe
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.xe
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RADEON),y)
 LINUX_FIRMWARE_DIRS += radeon
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.radeon
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.radeon
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QCOM_VENUS),y)
 LINUX_FIRMWARE_DIRS += qcom/venus-1.8 qcom/venus-4.2
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qcom qcom/NOTICE.txt
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.qcom LICENSES/NOTICE.qcom
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QCOM_ADRENO),y)
 LINUX_FIRMWARE_FILES += qcom/a*
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qcom qcom/NOTICE.txt
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.qcom LICENSES/NOTICE.qcom
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MFC_V8),y)
@@ -69,25 +69,25 @@ endif
 # Amlogic SoC Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AMLOGIC),y)
 LINUX_FIRMWARE_FILES += amlogic/*.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.amlogic
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.amlogic
 endif
 
 # Intel Wireless Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IBT),y)
 LINUX_FIRMWARE_FILES += intel/ibt-*
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ibt_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.ibt_firmware
 endif
 
 # Qualcomm Atheros Rome 6174A Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174A_BT),y)
 LINUX_FIRMWARE_FILES += qca/rampatch_usb_00000302.bin qca/nvm_usb_00000302.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qcom
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.qcom
 endif
 
 # Qualcomm Atheros QCA9377 Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_9377_BT),y)
 LINUX_FIRMWARE_FILES += qca/rampatch_00230302.bin qca/nvm_00230302.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qcom
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.qcom
 endif
 
 # Realtek 87xx Bluetooth
@@ -98,32 +98,32 @@ LINUX_FIRMWARE_FILES += \
 	rtl_bt/rtl8723d_fw.bin rtl_bt/rtl8761a_fw.bin \
 	rtl_bt/rtl8761b_fw.bin rtl_bt/rtl8761b_config.bin \
 	rtl_bt/rtl8761bu_fw.bin rtl_bt/rtl8761bu_config.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.rtlwifi_firmware.txt
 endif
 
 # Realtek 88xx Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX_BT),y)
 LINUX_FIRMWARE_FILES += \
 	rtl_bt/rtl88*.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.rtlwifi_firmware.txt
 endif
 
 # rt2501/rt61
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61),y)
 LINUX_FIRMWARE_FILES += rt2561.bin rt2561s.bin rt2661.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink-firmware.txt
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.ralink-firmware.txt
 endif
 
 # rt73
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73),y)
 LINUX_FIRMWARE_FILES += rt73.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink-firmware.txt
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.ralink-firmware.txt
 endif
 
 # rt2xx
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX),y)
 LINUX_FIRMWARE_FILES += rt2860.bin rt2870.bin rt3071.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink-firmware.txt
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.ralink-firmware.txt
 endif
 
 # rtl81xx
@@ -144,7 +144,7 @@ LINUX_FIRMWARE_FILES += \
 	rtlwifi/rtl8192eu_ap_wowlan.bin \
 	rtlwifi/rtl8192eu_nic.bin \
 	rtlwifi/rtl8192eu_wowlan.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.rtlwifi_firmware.txt
 endif
 
 # rtl87xx
@@ -162,7 +162,7 @@ LINUX_FIRMWARE_FILES += \
 	rtlwifi/rtl8723bu_ap_wowlan.bin \
 	rtlwifi/rtl8723bu_nic.bin \
 	rtlwifi/rtl8723bu_wowlan.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.rtlwifi_firmware.txt
 endif
 
 # rtl88xx
@@ -171,27 +171,27 @@ LINUX_FIRMWARE_FILES += \
 	rtlwifi/rtl8821aefw.bin \
 	rtlwifi/rtl8821aefw_wowlan.bin \
 	rtlwifi/rtl8821aefw_29.bin rtlwifi/rtl8822befw.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.rtlwifi_firmware.txt
 endif
 
 # rtw88
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_RTW88),y)
 LINUX_FIRMWARE_FILES += \
 	rtw88/rtw*.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.rtlwifi_firmware.txt
 endif
 
 # rtw89
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_RTW89),y)
 LINUX_FIRMWARE_FILES += \
 	rtw89/rtw*.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.rtlwifi_firmware.txt
 endif
 
 # ar3011
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AR3011),y)
 LINUX_FIRMWARE_FILES += ath3k-1.fw
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.atheros_firmware
 endif
 
 # ar3012
@@ -216,43 +216,44 @@ LINUX_FIRMWARE_FILES += \
 	ar3k/ramps_0x31010100_40.dfu \
 	ar3k/AthrBT_0x01020201.dfu
 LINUX_FIRMWARE_ALL_LICENSE_FILES += \
-	LICENCE.atheros_firmware LICENSE.QualcommAtheros_ar3k
+	LICENSES/LICENCE.atheros_firmware \
+	LICENSES/LICENSE.QualcommAtheros_ar3k
 endif
 
 # ar6002
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_6002),y)
 LINUX_FIRMWARE_FILES += ath6k/AR6002
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.atheros_firmware
 endif
 
 # ar6003
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_6003),y)
 LINUX_FIRMWARE_FILES += ath6k/AR6003
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.atheros_firmware
 endif
 
 # ar6004
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_6004),y)
 LINUX_FIRMWARE_FILES += ath6k/AR6004
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.atheros_firmware
 endif
 
 # ar7010
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010),y)
 LINUX_FIRMWARE_FILES += ar7010.fw ar7010_1_1.fw htc_7010.fw ath9k_htc/htc_7010-1.4.0.fw
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.atheros_firmware
 endif
 
 # ar9170
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170),y)
 LINUX_FIRMWARE_FILES += ar9170-1.fw ar9170-2.fw carl9170-1.fw
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.atheros_firmware
 endif
 
 # ar9271
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271),y)
 LINUX_FIRMWARE_FILES += ar9271.fw htc_9271.fw ath9k_htc/htc_9271-1.4.0.fw
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.atheros_firmware
 endif
 
 # ath10k
@@ -262,140 +263,140 @@ LINUX_FIRMWARE_FILES += ath10k/QCA9377/hw1.0/board-2.bin \
 			ath10k/QCA9377/hw1.0/firmware-5.bin \
 			ath10k/QCA9377/hw1.0/firmware-6.bin \
 			ath10k/QCA9377/hw1.0/firmware-sdio-5.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.QualcommAtheros_ath10k
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA998X),y)
 LINUX_FIRMWARE_FILES += ath10k/QCA988X/hw2.0/board.bin \
 			ath10k/QCA988X/hw2.0/firmware-4.bin \
 			ath10k/QCA988X/hw2.0/firmware-5.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.QualcommAtheros_ath10k
 endif
 
 # ath11k
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_11K_WCN6855),y)
 LINUX_FIRMWARE_DIRS += ath11k/WCN6855/hw2.0
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.QualcommAtheros_ath10k
 endif
 
 # sd8686 v8
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8),y)
 LINUX_FIRMWARE_FILES += libertas/sd8686_v8.bin libertas/sd8686_v8_helper.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.Marvell
 endif
 
 # sd8686 v9
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V9),y)
 LINUX_FIRMWARE_FILES += libertas/sd8686_v9.bin libertas/sd8686_v9_helper.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.Marvell
 endif
 
 # sd8688
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8688),y)
 LINUX_FIRMWARE_FILES += mrvl/sd8688.bin mrvl/sd8688_helper.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.Marvell
 endif
 
 # usb8388 v9
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_USB8388_V9),y)
 LINUX_FIRMWARE_FILES += libertas/usb8388_v9.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.Marvell
 endif
 
 # usb8388 olpc
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_USB8388_OLPC),y)
 LINUX_FIRMWARE_FILES += libertas/usb8388_olpc.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.Marvell
 endif
 
 # lbtf usb
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_USB_THINFIRM),y)
 LINUX_FIRMWARE_FILES += lbtf_usb.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.Marvell
 endif
 
 # sd8787
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8787),y)
 LINUX_FIRMWARE_FILES += mrvl/sd8787_uapsta.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.Marvell
 endif
 
 # sd8797
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8797),y)
 LINUX_FIRMWARE_FILES += mrvl/sd8797_uapsta.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.Marvell
 endif
 
 # usb8797
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_USB8797),y)
 LINUX_FIRMWARE_FILES += mrvl/usb8797_uapsta.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.Marvell
 endif
 
 # usb8801
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_USB8801),y)
 LINUX_FIRMWARE_FILES += mrvl/usb8801_uapsta.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.Marvell
 endif
 
 # sd8887
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8887),y)
 LINUX_FIRMWARE_FILES += mrvl/sd8887_uapsta.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.Marvell
 endif
 
 # sd8897
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8897),y)
 LINUX_FIRMWARE_FILES += mrvl/sd8897_uapsta.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.Marvell
 endif
 
 # usb8897
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_USB8897),y)
 LINUX_FIRMWARE_FILES += mrvl/usb8897_uapsta.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.Marvell
 endif
 
 # pcie8897
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_PCIE8897),y)
 LINUX_FIRMWARE_FILES += mrvl/pcie8897_uapsta.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.Marvell
 endif
 
 # pcieuart8997
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_PCIEUART8997),y)
 LINUX_FIRMWARE_FILES += mrvl/pcieuart8997_combo_v4.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.Marvell
 endif
 
 # pcieusb8997
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_PCIEUSB8997),y)
 LINUX_FIRMWARE_FILES += mrvl/pcieusb8997_combo_v4.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.Marvell
 endif
 
 # MT7601
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7601U),y)
 LINUX_FIRMWARE_FILES += mediatek/mt7601u.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.ralink_a_mediatek_company_firmware
 endif
 
 # MT7610
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7610E),y)
 LINUX_FIRMWARE_FILES += mediatek/mt7610e.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.ralink_a_mediatek_company_firmware
 endif
 
 # MT7650
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7650),y)
 LINUX_FIRMWARE_FILES += mediatek/mt7650.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.ralink_a_mediatek_company_firmware
 endif
 
 # MT76x2e
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT76X2E),y)
 LINUX_FIRMWARE_FILES += mediatek/mt7662.bin mediatek/mt7662_rom_patch.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.ralink_a_mediatek_company_firmware
 endif
 
 # MT7916
@@ -404,46 +405,46 @@ LINUX_FIRMWARE_FILES += mediatek/mt7916_eeprom.bin \
 	mediatek/mt7916_rom_patch.bin \
 	mediatek/mt7916_wa.bin \
 	mediatek/mt7916_wm.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.mediatek
 endif
 
 # MT7920
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7920),y)
 LINUX_FIRMWARE_FILES += mediatek/WIFI_MT7961_patch_mcu_1a_2_hdr.bin \
 	mediatek/WIFI_RAM_CODE_MT7961_1a.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.mediatek
 endif
 
 # Mediatek MT7920 Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7920_BT),y)
 LINUX_FIRMWARE_FILES += mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.mediatek
 endif
 
 # MT7921
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7921),y)
 LINUX_FIRMWARE_FILES += mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin \
 			mediatek/WIFI_RAM_CODE_MT7961_1.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.mediatek
 endif
 
 # Mediatek MT7921 Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7921_BT),y)
 LINUX_FIRMWARE_FILES += mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.mediatek
 endif
 
 # MT7922
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7922),y)
 LINUX_FIRMWARE_FILES += mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin \
 			mediatek/WIFI_RAM_CODE_MT7922_1.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.mediatek
 endif
 
 # Mediatek MT7922 Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7922_BT),y)
 LINUX_FIRMWARE_FILES += mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.mediatek
 endif
 
 # MT7925
@@ -451,13 +452,13 @@ ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7925),y)
 LINUX_FIRMWARE_FILES += \
 	mediatek/mt7925/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin \
 	mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.mediatek
 endif
 
 # Mediatek MT7925 Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7925_BT),y)
 LINUX_FIRMWARE_FILES += mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.mediatek
 endif
 
 # MT7927
@@ -465,7 +466,7 @@ ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7927),y)
 LINUX_FIRMWARE_FILES += \
 	mediatek/mt7927/WIFI_MT6639_PATCH_MCU_2_1_hdr.bin \
 	mediatek/mt7927/WIFI_RAM_CODE_MT6639_2_1.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.mediatek
 endif
 
 # Mediatek MT7986 SoC WiFi
@@ -482,14 +483,14 @@ LINUX_FIRMWARE_FILES += \
 	mediatek/mt7986_wm_mt7975.bin \
 	mediatek/mt7986_wo_0.bin \
 	mediatek/mt7986_wo_1.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.mediatek
 endif
 
 # qca6174
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174),y)
 LINUX_FIRMWARE_FILES += ath10k/QCA6174
 LINUX_FIRMWARE_ALL_LICENSE_FILES += \
-	LICENSE.QualcommAtheros_ath10k \
+	LICENSES/LICENSE.QualcommAtheros_ath10k \
 	ath10k/QCA6174/hw2.1/notice_ath10k_firmware-5.txt \
 	ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt \
 	ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt
@@ -501,7 +502,7 @@ LINUX_FIRMWARE_FILES += \
 	ath12k/WCN7850/hw2.0/amss.bin \
 	ath12k/WCN7850/hw2.0/m3.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += \
-	LICENSE.QualcommAtheros_ath10k \
+	LICENSES/LICENSE.QualcommAtheros_ath10k \
 	ath12k/WCN7850/hw2.0/Notice.txt
 endif
 
@@ -510,7 +511,7 @@ LINUX_FIRMWARE_FILES += \
 	ath12k/QCN9274/hw2.0/board-2.bin \
 	ath12k/QCN9274/hw2.0/firmware-2.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += \
-	LICENSE.QualcommAtheros_ath10k \
+	LICENSES/LICENSE.QualcommAtheros_ath10k \
 	ath12k/QCN9274/hw2.0/Notice.txt
 endif
 
@@ -519,7 +520,7 @@ ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_CC2560),y)
 LINUX_FIRMWARE_FILES += \
 	ti-connectivity/TIInit_6.2.31.bts \
 	ti-connectivity/TIInit_6.6.15.bts
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.ti-connectivity
 endif
 
 # wl127x
@@ -538,7 +539,7 @@ LINUX_FIRMWARE_FILES += \
 	ti-connectivity/wl127x-fw-5-plt.bin \
 	ti-connectivity/wl127x-fw-5-sr.bin \
 	ti-connectivity/TIInit_7.2.31.bts
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.ti-connectivity
 endif
 
 # wl128x
@@ -557,7 +558,7 @@ LINUX_FIRMWARE_FILES += \
 	ti-connectivity/wl128x-fw-5-plt.bin \
 	ti-connectivity/wl128x-fw-5-sr.bin \
 	ti-connectivity/TIInit_7.2.31.bts
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.ti-connectivity
 endif
 
 # wl18xx
@@ -569,7 +570,7 @@ LINUX_FIRMWARE_FILES += \
 	ti-connectivity/wl18xx-fw-4.bin \
 	ti-connectivity/wl127x-nvs.bin \
 	ti-connectivity/TIInit_7.2.31.bts
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.ti-connectivity
 endif
 
 # cc33xx
@@ -578,72 +579,72 @@ LINUX_FIRMWARE_FILES += \
 	ti-connectivity/cc33xx_2nd_loader.bin \
 	ti-connectivity/cc33xx_fw.bin \
 	ti-connectivity/cc33xx-conf.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.ti-connectivity
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_WIL6210),y)
 LINUX_FIRMWARE_FILES += wil6210.*
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.QualcommAtheros_ath10k
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_100),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-100-*.ucode
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_105),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-105-*.ucode
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_135),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-135-*.ucode
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_1000),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-1000-*.ucode
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_2000),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-2000-*.ucode
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_2030),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-2030-*.ucode
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-QuZ-*.ucode intel/iwlwifi/iwlwifi-Qu-*.ucode
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22260),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-cc-a0-*.ucode
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-3160-*.ucode
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-3168-*.ucode
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3945),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-3945-2.ucode
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_4965),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-4965-2.ucode
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 # iwlwifi 5000. Multiple files are available (iwlwifi-5000-1.ucode,
@@ -652,113 +653,113 @@ endif
 # most recent one.
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-5000-5.ucode
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-6000g2a-6.ucode
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2B),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-6000g2b-6.ucode
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-7260-*.ucode
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-7265-*.ucode
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-7265D-*.ucode
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8000C),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-8000C-*.ucode
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8265),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-8265-*.ucode
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_9XXX),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-9???-*.ucode
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-so-a0-jf-b0*.ucode
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-{so,ty}-a0-gf-a0*.{ucode,pnvm}
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-gl-c0-fm-c0*.{ucode,pnvm}
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_QUZ),y)
 LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-QuZ-*.ucode
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AIROHA_EN8811H),y)
 LINUX_FIRMWARE_FILES += airoha/EthMD32.dm.bin airoha/EthMD32.DSP.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.airoha
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.airoha
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BROADCOM_TIGON3),y)
 LINUX_FIRMWARE_FILES += tigon/*
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.tigon
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.tigon
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2),y)
 LINUX_FIRMWARE_FILES += bnx2/*
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.bnx2
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.bnx2
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2X),y)
 LINUX_FIRMWARE_FILES += bnx2x/*
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.bnx2x
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.bnx2x
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T4),y)
 LINUX_FIRMWARE_FILES += cxgb4/t4fw*.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.chelsio_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T5),y)
 LINUX_FIRMWARE_FILES += cxgb4/t5fw*.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.chelsio_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T6),y)
 LINUX_FIRMWARE_FILES += cxgb4/t6fw*.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.chelsio_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_E100),y)
 LINUX_FIRMWARE_FILES += e100/*.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.e100
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.e100
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_ICE),y)
 LINUX_FIRMWARE_FILES += intel/ice/ddp/*.pkg
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.ice_enhanced
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.ice_enhanced
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MICROCHIP_VSC85XX_PHY),y)
 LINUX_FIRMWARE_FILES += microchip/mscc_vsc85*.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.microchip
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.microchip
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_4X),y)
@@ -778,7 +779,7 @@ LINUX_FIRMWARE_FILES += \
 	rtl_nic/rtl8153c-1.fw \
 	rtl_nic/rtl8156a-2.fw \
 	rtl_nic/rtl8156b-2.fw
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.rtlwifi_firmware.txt
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169),y)
@@ -812,7 +813,7 @@ endif
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MARVELL_PRESTERA),y)
 LINUX_FIRMWARE_FILES += \
 	mrvl/prestera/mvsw_prestera_fw*.img
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.Marvell
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_XCx000),y)
@@ -821,24 +822,24 @@ LINUX_FIRMWARE_FILES += \
 	dvb-fe-xc5000-1.6.114.fw \
 	dvb-fe-xc5000c-4.1.30.7.fw
 LINUX_FIRMWARE_ALL_LICENSE_FILES += \
-	LICENCE.xc4000 \
-	LICENCE.xc5000 \
-	LICENCE.xc5000c
+	LICENSES/LICENCE.xc4000 \
+	LICENSES/LICENCE.xc5000 \
+	LICENSES/LICENCE.xc5000c
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AS102),y)
 LINUX_FIRMWARE_FILES += as102_data1_st.hex as102_data2_st.hex
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Abilis
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.Abilis
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_DIB0700),y)
 LINUX_FIRMWARE_FILES += dvb-usb-dib0700-1.20.fw
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.dib0700
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.dib0700
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ITETECH_IT9135),y)
 LINUX_FIRMWARE_FILES += dvb-usb-it9135-01.fw dvb-usb-it9135-02.fw
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.it913x
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.it913x
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_H5_DRXK),y)
@@ -863,7 +864,7 @@ LINUX_FIRMWARE_FILES += \
 	brcm/brcmfmac4330-sdio.Prowise-PT301.txt \
 	brcm/brcmfmac4356-pcie.gpd-win-pocket.txt \
 	brcm/brcmfmac4356-sdio.AP6356S.txt
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.broadcom_bcm43xx
 endif
 
 # brcm43xxx
@@ -892,19 +893,19 @@ LINUX_FIRMWARE_FILES += \
 	brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt \
 	brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt \
 	brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.broadcom_bcm43xx
 endif
 
 # brcm4366b1
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM4366B1),y)
 LINUX_FIRMWARE_FILES += brcm/brcmfmac4366b-pcie.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.broadcom_bcm43xx
 endif
 
 # brcm4366c0
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM4366C0),y)
 LINUX_FIRMWARE_FILES += brcm/brcmfmac4366c-pcie.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.broadcom_bcm43xx
 endif
 
 # cyfmac43xx
@@ -919,7 +920,7 @@ LINUX_FIRMWARE_FILES += \
 	cypress/cyfmac4356-sdio.clm_blob \
 	cypress/cyfmac4373-sdio.bin \
 	cypress/cyfmac4373-sdio.clm_blob
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.cypress
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.cypress
 endif
 
 # cyfmac43xxx
@@ -935,7 +936,7 @@ LINUX_FIRMWARE_FILES += \
 	cypress/cyfmac43455-sdio.clm_blob \
 	cypress/cyfmac43570-pcie.bin \
 	cypress/cyfmac43570-pcie.clm_blob
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.cypress
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.cypress
 endif
 
 # cyfmac54xxx
@@ -943,7 +944,7 @@ ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CYPRESS_CYW54XXX),y)
 LINUX_FIRMWARE_FILES += \
 	cypress/cyfmac54591-pcie.bin \
 	cypress/cyfmac54591-pcie.clm_blob
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.cypress
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.cypress
 endif
 
 # ql2xxx
@@ -951,7 +952,7 @@ ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_2XXX),y)
 LINUX_FIRMWARE_FILES += \
 	ql2100_fw.bin ql2200_fw.bin ql2300_fw.bin ql2322_fw.bin \
 	ql2400_fw.bin ql2500_fw.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qla2xxx
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.qla2xxx
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_REDPINE_RS9113),y)
@@ -973,32 +974,32 @@ endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QAT_DH895XCC),y)
 LINUX_FIRMWARE_FILES += intel/qat/qat_895xcc.bin intel/qat/qat_895xcc_mmp.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qat_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.qat_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QAT_C3XXX),y)
 LINUX_FIRMWARE_FILES += intel/qat/qat_c3xxx.bin intel/qat/qat_c3xxx_mmp.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qat_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.qat_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QAT_C62X),y)
 LINUX_FIRMWARE_FILES += intel/qat/qat_c62x.bin intel/qat/qat_c62x_mmp.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qat_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.qat_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_USB_SERIAL_TI),y)
 LINUX_FIRMWARE_FILES += ti_3410.fw ti_5052.fw \
-	mts_cdma.fw mts_gsm.fw mts_edge.fw mts_mt9234mu.fw mts_mt9234zba.fw \
+	mts_cdma.fw mts_gsm.fw mts_edge.fw \
 	moxa/moxa-1110.fw moxa/moxa-1130.fw moxa/moxa-1131.fw \
 	moxa/moxa-1150.fw moxa/moxa-1151.fw
 # Some firmware's license is in the file WHENCE
 # which is installed unconditionally
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.moxa
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.moxa
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CDNS_MHDP8546),y)
 LINUX_FIRMWARE_FILES += cadence/mhdp8546.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.cadence
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.cadence
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CX231XX),y)
@@ -1016,17 +1017,17 @@ endif
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_ATOMISP),y)
 LINUX_FIRMWARE_FILES += intel/ipu/shisp_2400b0_v21.bin
 LINUX_FIRMWARE_FILES += intel/ipu/shisp_2401a0_v21.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.ivsc
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.ivsc
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ARM_MALI_CSF),y)
 LINUX_FIRMWARE_FILES += arm/mali/arch*/mali_csffw.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mali_csffw
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.mali_csffw
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_POWERVR_ROGUE),y)
 LINUX_FIRMWARE_DIRS += powervr
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.powervr
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.powervr
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RP2),y)
@@ -1035,7 +1036,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_NPU),y)
 LINUX_FIRMWARE_FILES += intel/vpu/vpu_*.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.intel_vpu
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENSE.intel_vpu
 endif
 
 ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
