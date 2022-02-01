Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D85FC433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 18:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08AC440361;
	Tue,  1 Feb 2022 18:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ppu_2QACwZwP; Tue,  1 Feb 2022 18:34:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB0D840641;
	Tue,  1 Feb 2022 18:34:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A1531BF989
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14C8A60EE9
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:33:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t9ZBcs1Iv72B for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 18:33:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4016F600CA
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 18:33:35 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Exy8nuBUiroAhExy9nYlGb; Tue, 01 Feb 2022 19:33:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643740414; bh=KRC5gkuSzBRjtdWNpnX2/sfyVKAPFyCw7VfvwvPA6tk=;
 h=From:To:Subject:Date:MIME-Version;
 b=iYWoT5TolkH1Jz5SSDS1NtgNtqxJfZMCI/ABP9W+KgoTqdd2vRTnfXgILfz/iiUNG
 H/zYdxHf9a/An7wrSTyB5UyhBWRvAkO8V7WBAKqmb2evC2f9eRnTIb+qdjcDxJxrdL
 ujPXimVymE+ld6IqVVSjJciTAAdifhRO547SEsDYNWTQ1mEv70AujrnnEprNmYFH66
 c/BcWEMK4QPIyQ5R+UH+y89o3SUGNCUi94iG3igjSQXifC7syYDo7iolZ99TRrWijv
 UAb21zNhf7yv7dAfuncbzV1xD6iTGiZTAtZAcfOI1W0sRKJlMy4/NXZKKcIM4WtiNU
 Pj1mcXiD9a3MA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 19:33:27 +0100
Message-Id: <20220201183331.4009320-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201183331.4009320-1-giulio.benetti@benettiengineering.com>
References: <20220201183331.4009320-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfC/FFKJlHXGVwhg9dFfDiK8o605a8j5bt/124Gh8sBDuc1BIbVtiYjrSjHUbmasK8PculABdkOlQVTSBJQC0DX1679x7/99dWydiw+avr3n2SdLCRNvh
 c6tveytfvKIm2Y0FRM+s5p1hOJOj9SuLMAhfbDcdqXZhq0ZE5toPmZ7XtPVzIdet3vamd954eNhApmgmnTM6OAXHieAqNMJiCiIj5hwkQKtDTrPqF0h7uoxG
 484TEuQWiXiuzguyjOt9p0bujdzsFkkk/W0QK2lv8iLdOU/HR1LJZCffLVlaBL+H65bZO2iSTYI49zoTCsN1udyqMis+tU/yTofR6hkvzgjbxWB8mmdBc+q6
 64BrK+y0BRTq9KTTp8T6htFz1KH61tLZxexmdfynXKWb8GBRberAwmNAocKG59QZyG9XfYam/7WiNB8d3u9RobY+PPbv4A==
Subject: [Buildroot] [PATCH 2/6] configs/beaglev_defconfig: linux needs host
 openssl
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
Cc: Eugen Hristev <eugen.hristev@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Lothar Felten <lothar.felten@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://gitlab.com/ymorin/buildroot/-/jobs/2035820979

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/beaglev_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beaglev_defconfig b/configs/beaglev_defconfig
index 70459bf3e8..79af8c2ece 100644
--- a/configs/beaglev_defconfig
+++ b/configs/beaglev_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="starlight"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7100-beaglev-starlight"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
