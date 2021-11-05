Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DC2C433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 22:19:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40AF5611CE
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 22:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 40AF5611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CE266FD04;
	Fri,  5 Nov 2021 22:19:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iCJ3b389wuWk; Fri,  5 Nov 2021 22:19:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 583416FD00;
	Fri,  5 Nov 2021 22:19:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0583F1BF386
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 22:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 019B24039C
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 22:18:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TYDtGyga96h5 for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 22:18:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp4.osuosl.org (Postfix) with ESMTP id 210A040433
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 22:18:07 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id j7X7mGJ7s5cjnj7XBm4SRc; Fri, 05 Nov 2021 23:18:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636150685; bh=qJa2G4TFGr9u8+PtD5I0IvCxtdArdOmZsc6F6GO0SJ0=;
 h=From:To:Subject:Date:MIME-Version;
 b=mkmKlq8KV6blmgIYRK3CyDAPnt4TGdj0Nb/QlFF5mIQdU+z0FwHisGyinLQJJNDbP
 nmwU2fA7zn+KE3kNwn78f2zjUt/QxCWU6fS0JBnQVbb2azpdk9DG+AIWwgkLijcx0M
 GvIUit193gFO9+5PSNmedlrPnM1fHZVm5PxiBj/XCrr1nPb6jwGv5mIVkxP80t5XN+
 WJk7l+zDtQ8m+x17FgsM7YeG2/lM9zFuTqeXsJtPkV/khOuxgfhRahWiRoEH6GXJs6
 jrIeEljY+sNrSWtG2mvDF/9cPGI6h0iQfaVnB/Jr9eV3WYRDhjwPGFf9VEkVpVDq1l
 geFJFr1DZTffg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri,  5 Nov 2021 23:18:00 +0100
Message-Id: <20211105221800.1451167-6-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105221800.1451167-1-giulio.benetti@benettiengineering.com>
References: <e20b07ab-2d45-1d04-d426-e740d20f8f67@lucaceresoli.net>
 <20211105221800.1451167-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfArbBkITVtNvQdF/CqwS08sspeAuSQbVwEYuT+/UKl7A8Rb+2YaahvaERGEhj9Kd4u6BjXFjk8DfvkcOdXjzdOHxMUbGf0nc1jIt9zCw82q0YNekHVsG
 aG4c/Vr6U60Lka84eMyKPdFYSI+H2CChqsmH80Ex9ILx1VSJ7SGlcid8nkvbjtEY2AVgCzLYXMrLmsaFe3owNTw7EFErfKMGbwy9lK2xtBSrkZ9RmSAHsAG4
 qpktdBNyCP4/YnYlic6KitHeQSyjfv3Hziro1uzmUYKsQeeWIVEE5ZVtR9DReDAT6agXgwEB36Dz0VdIKYOoQLjLTsOu8CCw8sgH1tvTStjzdk5AWqf+uFN6
 qg3EXOqpFT1Ch6HjF+P5B4FqxF2DMt5R8Gi3XfAJ6O0goYMmoFSez1k0MgHHXWko/TF4L5hk5ZR6plbJJCpmPi/OKyTBtv+YLkOUmP99mk9KqQnkxMT5AMU2
 4b77/auMlz3QBr2zv5xZ5AyHaSTUeaZr+xFVOsCX0HxGxpCpZYhadj87mks=
Subject: [Buildroot] [PATCH v2 5/5]
 configs/olimex_a20_olinuxino_lime_defconfig: use
 linux-disable-lima.fragment
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
Cc: Julien Olivain <ju.o@free.fr>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This defconfig enables sunxi-mali-mainline-driver so we need to disable
Lima in Linux to prevent Mali to not load.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/olimex_a20_olinuxino_lime_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 17da786a8c..698137e46c 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -26,6 +26,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.13"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-olinuxino-lime"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
