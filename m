Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC97C678D4
	for <buildroot@archiver.kernel.org>; Tue,  7 Mar 2023 09:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F109C6105D;
	Tue,  7 Mar 2023 09:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F109C6105D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bhbAEvdwEEE5; Tue,  7 Mar 2023 09:36:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E999D61051;
	Tue,  7 Mar 2023 09:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E999D61051
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D2691BF255
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 09:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70F4A60797
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 09:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70F4A60797
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yAvGuC4bPiUK for <buildroot@lists.busybox.net>;
 Tue,  7 Mar 2023 09:35:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1A6160BF0
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1A6160BF0
 for <buildroot@buildroot.org>; Tue,  7 Mar 2023 09:35:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.98,240,1673884800"; d="scan'208";a="223280796"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Mar 2023 17:35:20 +0800
IronPort-SDR: fZIEOMNLrZRJryuz1by81rXxJ5m7j+jeWTj7ddmSnSkctdHRueVq3SU24pVbJfXufjSHpL9cvu
 iJBskezTL+lRG1XtuR6ZEEpyfVPDdlt1+Mswm/Y+lwide5WukZ3Q1PxvdbGZOAAX+UOgUI1NlD
 hafofl93c9etCD/4aZRgFYySH2nXr28iCx7+K4Za7sQlRfePYNqE/JmigbmTh4aG2DK+0lVKH3
 6c8dpV2niMtJjbR6i73hLDg4WWm23lxhN4lcKiyx/fPUX/pEzTV6bLHhqPGiaqrjgpIdVx8ogN
 2gU=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Mar 2023 00:46:18 -0800
IronPort-SDR: DDByLMiLFDW91G2GDMkUPrqdKMHSZT+aBOexW0NhB1ttfGeEEd3CIhZOopkjFC7nJKZh10dfFa
 Bwfht9qiqoEofBiq5eJPqdJAqHkPqt5FnACgPExGxlc+yv+FAHT0MiLWPEBS+a/b96vWn3OT02
 iIN/zcJ4pt3LpJsPGMVdXKZN3MVW48uh25dpDnBV7W7UTYgu+v/MmbcA4GbQLfJFo/U2bmDDy3
 +gWOfkH9O3uS52adotXK/gwOX9mykEgPGJRN9ehKy8X5eyMSA82lzm16QE4cfEIzjHQuHGIs3e
 jRg=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.wdc.com) ([10.225.164.41])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Mar 2023 01:35:19 -0800
To: buildroot@buildroot.org
Date: Tue,  7 Mar 2023 10:35:04 +0100
Message-Id: <20230307093504.3611941-4-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307093504.3611941-1-niklas.cassel@wdc.com>
References: <20230307093504.3611941-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1678181720; x=1709717720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4k14twHXTnAjtXBNxSzCPGCZzujp1dF1P7K8dMPJjXQ=;
 b=rC68BYbHXLRs2ko8jmcnG2MQXOhSzCL5ext4SXwFaPMGV+5w7wtZDGWa
 Ci8WWSaQi+2IVgWSYlLE/rIbO7jbCun1qDiPGmYqnERwQdv0o1fsBjCzO
 VXztIwFHk+LSCSO9qLWr4urSBLlJ3jFjbWxJSy3QKtzPnjqYs0v4/1lH7
 aFgkhMGnGwhu7LbljAw1cyJA/1HZHCNYUTG33UMtH3W18uAr3YxJ9BDfM
 2alBn3Fms07/PYDWydBFos2YZYj19KAvZoqgyD8xirTLB2BVR+nweUNA9
 EIsSwNhbIHscRJKNO9VktA4JuxjiuC6NFwog35Sm8iFXTjsHlYIA9zThw
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=rC68BYbH
Subject: [Buildroot] [PATCH v3 3/3] support/testing: move the kernel config
 only used by test_edk2.py
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The kernel config board/qemu/aarch64-sbsa/linux.config has never been in
use by qemu_aarch64_sbsa_defconfig, neither via
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE, nor via
BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES.

test_edk2.py is using the kernel config
board/qemu/aarch64-sbsa/linux.config. However, storing a kernel config
that is not used by qemu_aarch64_sbsa_defconfig, in a directory that is
"owned" by qemu_aarch64_sbsa_defconfig, is bound to cause confusion.

Therefore, move the config file to a new subdirectory:
support/testing/tests/boot/test_edk2/

This is similar to how e.g. test_grub.py has a subdirectory:
support/testing/tests/boot/test_grub/
where it keeps the kernel config that is only used by test_grub.py.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 support/testing/tests/boot/test_edk2.py                         | 2 +-
 .../testing/tests/boot/test_edk2}/linux.config                  | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename {board/qemu/aarch64-sbsa => support/testing/tests/boot/test_edk2}/linux.config (100%)

diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
index c1be8fad95..623e77e992 100644
--- a/support/testing/tests/boot/test_edk2.py
+++ b/support/testing/tests/boot/test_edk2.py
@@ -18,7 +18,7 @@ class TestEdk2(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.34"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-sbsa/linux.config"
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="support/testing/tests/boot/test_edk2/linux.config"
         BR2_TARGET_EDK2=y
         BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA=y
         BR2_TARGET_GRUB2=y
diff --git a/board/qemu/aarch64-sbsa/linux.config b/support/testing/tests/boot/test_edk2/linux.config
similarity index 100%
rename from board/qemu/aarch64-sbsa/linux.config
rename to support/testing/tests/boot/test_edk2/linux.config
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
