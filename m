Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98258C433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 614C380B6E;
	Tue, 18 Jan 2022 10:53:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sjGbg5mWf32j; Tue, 18 Jan 2022 10:53:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 860DD80B78;
	Tue, 18 Jan 2022 10:53:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 780DA1BF28D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B3F960DCB
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w2tkrXF90A3F for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:52:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87C8F60DED
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:52:06 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9lyjna4K8; Tue, 18 Jan 2022 11:45:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502702; bh=a7otC8+Y6gfkE3qXT5f1G2G6rw1P4EH14Dbc7UDRLVk=;
 h=From:To:Subject:Date:MIME-Version;
 b=RNv4gYsvj0H9gTGfoGv70em3alj22swfZ7Ze1Mj5akvq+mViisQ0dOLzAWkEROLuL
 o1O6A9op/5H3vlu2hvEPqYsEKkYI2t5z0G0vUaXkgrRutlnXvBwfqGFMVRmPq55ab0
 Db6dex1LgAw4Ga2Bff7d34BuFB3QXB4cwHuK+KYpyKHIM/ovbYl2hpa7itN7UJSlBe
 2cYb9NTelWtzKMSy81zQANH5jhhsbhOFJWQiLXUNJkZWUGaOl9zLzzaF3k7PfjxYbn
 mkUbHmlDHQMfpcj8rP+x9rVrBxF4ImND+Z2u+rNGbItwwSZwgh2nkLFx5JulYZd14S
 LkktYGggmDBkw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:14 +0100
Message-Id: <20220118104338.2081259-5-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfD+8w76+tNUl0pYXa96xSnupi7TMCZH7DWAJYcu3mlwKBVpe6dVTt9sKz/sD7NwthZmUP0RK5LHBnOwFRXq24xfEoHgENxEAMdwUTWzgh7vW34WRndtJ
 qguIQ0WAWmkeD41lm6JnEhpd5VmxpkvdtnL41mTeLOyJz28HYoVjiLHwUMNIDhvtR/Gmliygz2injeU+Uy/mVKQJ76yg+kkS9vP6PRuIHUrXRIIZUrl9cVjU
 IvOcEpUUYClfIw3rmvaY8gwfH8gxXheyEJFYL3Mpv28IdE9WMJbScTS/QkxagfiyllAZPLrwKiLWjJjBitJHGqG8sQDQ7ktqvgdeBbtkDDhlup7L5rrr4wKV
 1VO1qO0MbmW3vPC0zeFm7iDDZQDUh6LIhL1Lc7Rcq5Kgbe2OllOpwHGAK03c05hk2Q+DXHnGyLX8fWhjBmdN6bkEgkCDPhaQa965OCuMxuQ6MMvmqnKfswC+
 Jv31P081hdL7onSIG4ayEP9Py/3jBDfWZhsUv7lMydh4irRk/TilsrbuVPyPVj9wBdMIeMceOYE+VrahH6EngOpUiBSPZYooh2jVuxtkOJS8AEM+Yj+a3rxy
 H0mpN6iGKyqR3eHe50/7dOTJl9/EnNkgV1fZGDF3hgq/V43Bitx86LQdY35sjTwurC28aUTQzq3bVz/khcLPFG7xYYG5r+eMjqWuL3/uciIGm8P4d9xet+rn
 CtpkxH6MLXBNubaaO4Y+kPgOwjlaTavElQBvEjj3hwvz6lY65c2qowjm9KVH9o3H2Q+i+cldCBNw7aj10CwNyudKVfGBh5LK50Gxna2Cm4uA5UmYMPtmj50+
 i31sND8Sh3dpg+MPhwmj8yphdleQMqbpRrLbVJs+m0YxiP7RbQzIObC3PDGIOw==
Subject: [Buildroot] [PATCH 04/28] configs/bananapi_m2_ultra_defconfig:
 enable NEON/VFPV4 FPU strategy
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
Cc: Theo Debrouwere <t.debrouwere@televic.com>, Simon Doppler <dopsi@dopsi.ch>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>, Jan Kraval <jan.kraval@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Davide Viti <zinosat@gmail.com>, Mike Harmony <mike.harmony@snapav.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Michel Stempin <michel.stempin@wanadoo.fr>,
 Lothar Felten <lothar.felten@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Biagio Montaruli <biagio.hkr@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This boards has Allwinner A40i/R40/V40 that support NEON/VFPV4 FPU
strategy, so let's enable it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/bananapi_m2_ultra_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/bananapi_m2_ultra_defconfig b/configs/bananapi_m2_ultra_defconfig
index 67ecec424c..b22e597945 100644
--- a/configs/bananapi_m2_ultra_defconfig
+++ b/configs/bananapi_m2_ultra_defconfig
@@ -1,5 +1,6 @@
 BR2_arm=y
 BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Ultra"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
