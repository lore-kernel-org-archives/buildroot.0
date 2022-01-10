Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1E3C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 21:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7484540998;
	Mon, 10 Jan 2022 21:44:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PCdkPEXiZJUU; Mon, 10 Jan 2022 21:44:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D080F40956;
	Mon, 10 Jan 2022 21:44:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1AA761BF2B3
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 21:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05BA440962
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 21:44:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wjykpDFAzoaL for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 21:44:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFEE340956
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 21:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1641851037;
 bh=25iYhP+BbkWRW1uWGyepvLCUxRNpVNGCdZ5YE7kGnoQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=PzmRGqFGhLmo7V8tozOb7vOXahm6Z9mhPylRzYpTZsa+ErJmz0yM//OYN5WxkYcHL
 6E9Bs2Ay952E9LrAQsrn84xd4y7kTyl1c+1HaFDxT+hUn0k/Qj3rXVOntWCRujThJ1
 WhFzSwj1/7t3J29oWR6nZF08QtGCmrawlrn8ruWg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.151]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MBlxM-1nCV2f0oMG-00CDlG; Mon, 10 Jan 2022 22:43:57 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 22:43:56 +0100
Message-Id: <20220110214356.14562-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:og6MMqXFkdlB7IHaSeKMOG0dKhUi3Uuu3FQOseQX2bMsmxLNU3e
 5W0tpSFmIrRru0T31HQggagUzWlymPVPJMBTic17YfUK6QDJAA0GE0+iY6ekl3bYzH+Ladx
 o1EoFKziQPFe9VYg0pZNICUrfU2b+KxKJ8/8oWi5igxJwnYVbNeeXG4t68LRBjoVYXkxcxg
 UFY3tc4dPWv67QL4XlXVA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S7bXFmiSIB8=:tnVfDbuqX6avfCaXLjHjOF
 rBtlYFqlv1jptUBZR13RZzG8zgPbXPrT2eKq5PPSBVH2NDVGyw3oLEyna6uoImLVGvTxCbZ6E
 3+Z7bkUiCKD2UncGBODWbj0BSrbisPXaQP5G3deqATfKfFQq6cfCZs4HdhvfXhgKYm/Oux/Gv
 xE3bRi3cavRDaACZWTnlml7VJpsrhsoe8DH3GEDO8ebgH5L/yBlBF4RxSEY2UkkJSOcf73VTw
 motF5gROtOkDe2h9WT2jBd4ff9Kux0563AOtpRKyCS9DUuTvr38b0+LStPmu7mAhRsX+iE6ya
 sAcnlr/FVW/AtPlTGB888+N9Uziz6K8FjSOXWwUGpIWgIj3WY6TRpeRnFcoJrw9nzfwsBO5fx
 zEgN65GsUUoBSEBh4RYC1RnwDR/qTyd+V4jLV0UUXjxEHNlO0TkHsJq0oP+cCaUnnc8jfOgSZ
 Ez6YD5hFEXLc8H1UDePbqCLmfFbfIk5HdwRzOKARg8nqubLxJLKgpdcLa8upapjrAzFDuYsjP
 dT4263PbdwOjaugwvnZ1bGRRdwpKe9JJe9hqyW+P/O73iiLz/LYaWfwqup17+KJQj/FXBOhb1
 RSuZAAPSUvTEHiOtMMDW4R9Iplv4zD3dKG9amJrpXc6LhQFkyzNY4OL9niBv6kOUyT8zLy5Ds
 ndUGKK8+q3J6B9HhdoWZNgA7hrQPBquEgds2wVi4FHN7O2BadZopEdu3u/oeYmR6qBura2Tok
 yWTOlFAadBZjfd3yCN/TC5MT29wPCz4mARARQziGcI+9q2yQTirA4FMBCP0V1kAd7Kdmg7LbT
 E5YsQjNYgT2YCFknJR8rlXFgjqwr2/bC1rH2gT3e1jlIH1hTL+JGgXQwItgAim9hQ301ef8ta
 YKFaFaLso5bu0vW0kd/GEy286NTVifYdu1mIaXlGNysCtCnfOZnIxSWSUplRtBXh4KYy25ehW
 5BuCFfkG+ugdoCEahk5WElqv439CDoIFaVAd4dKp5aguOA3OS4hxom/kSKhGqw+GcuEO0Sikq
 HSnOGnPw66O0Y7BN7diNSM2Ahp1InUBKQryrbYKMzOLz1DvwSrsHd2O+Odpa5kn67nFH+iLXI
 +HtgBIvox4Q6VQ=
Subject: [Buildroot] [PATCH v1] package/linux-firmware: bump version to
 20211216
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- update hash of WHENCE file

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/linux-firmware/linux-firmware.hash | 4 ++--
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 4c73374138..83275ec6d7 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  2fb22a5d7d23bf1f5800ab8152b39a00a445fbf4923de5a01b59d3f6253f0a9f  linux-firmware-20210919.tar.xz
+sha256  eeddb4e6bef31fd1a3757f12ccc324929bbad97855c0b9ec5ed780f74de1837d  linux-firmware-20211216.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
@@ -33,6 +33,6 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  a06edfd3649df6b0cbac8304d6d53f661963381f1231fd02da259806763d4162  WHENCE
+sha256  dfb98c5474d6264a6554322b3936e305e9d73cc7b683932e3f17550dc7d2d29b  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index ac45bc8282..2d103df05c 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20210919
+LINUX_FIRMWARE_VERSION = 20211216
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
