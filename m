Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97691C433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 17:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D7A883131;
	Wed,  2 Feb 2022 17:10:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p9tBj591RBpA; Wed,  2 Feb 2022 17:10:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E4D682CEC;
	Wed,  2 Feb 2022 17:10:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 54DE81BF9AD
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 17:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 500F24052E
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 17:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yJbiP6COpp42 for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 17:10:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp2.osuosl.org (Postfix) with ESMTP id E76884010F
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 17:10:40 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FJ9QnNaa8kz4hFJ9SnsliD; Wed, 02 Feb 2022 18:10:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643821838; bh=VAdOCHfhFM/fctZvyG+y39jQaJeB6cMCWZhNvXCwOKQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=bIOmDZJ1nL0tmrR3riWjkXcy1P1xfNAfhaGRa4viqJKp5odxJ4UuWDD1CAyC2bvrE
 VON+XuF48ZHC4wn00X2QvA5zXgqDb0RqahHz8Qg7a/9Lfr4qA9/mRsOwCC+oFutAxz
 doS4ILk7/slJC5dV0lXcs1+MjZMYOp+GWvP48oea6tlErvqp19j2ELOU8gKTNsTtQl
 K2yywx7XnURLc6GJtvn/uR8bxevcMc4SZWUmYt9tMsjqryhP+HnRhTBAKmUd4uaWjC
 5e9ycDOQfWf8sutMPElwCtdJGl61zwFy1M22anQhcmaNqXA3B00IdWvI0VHhMDxrBS
 qdJCsaUVA4/Ew==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  2 Feb 2022 18:10:35 +0100
Message-Id: <20220202171035.1740791-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220202171035.1740791-1-giulio.benetti@benettiengineering.com>
References: <20220202171035.1740791-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfE2cRD/l1k+dXWIQo0oK+RlfLXmqd2rUbeiwguymtUvBXVSaM7wGUSOfixTLXFJ9n2MEZi8bn5SAaiRA4ZBsPsifwcJbB7iDAj7q+xbJ8oHnNjKei83g
 QWfJEP5RRV6oFiq+1rKqsb8oB8SiPYTu1kbzQqNVEIKGjQP15kSXutgMCqoQaHB8xkjGjaJ5U6ByEChUclnu6nNj+jsiL8/BZUfW5c2OjpgNqqQmMpdliDtF
 IpldKqmNIsdZCEn0U7dpa2LO4rXdAU2LPalLgxPrKVSrMXV5HyYOTD2aYG7wqRXRtVD0IwHtnbGIHbzwcNT+3A1puvdrLtYoTaflPFIL8bY=
Subject: [Buildroot] [PATCH] configs/roc_pc_rk3399_defconfig: expand rootfs
 size to 120M
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Danilo Bargen <mail@dbrgn.ch>, Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Default 60M for rootfs are not enough and generate a build failure, so
let's expand rootfs size to 120M.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/roc_pc_rk3399_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/roc_pc_rk3399_defconfig b/configs/roc_pc_rk3399_defconfig
index dfbc5e4f47..ae7cf19a80 100644
--- a/configs/roc_pc_rk3399_defconfig
+++ b/configs/roc_pc_rk3399_defconfig
@@ -45,7 +45,7 @@ BR2_TARGET_GENERIC_HOSTNAME="roc-rk3399-pc"
 BR2_TARGET_GENERIC_ISSUE="Welcome to ROC-RK3399-PC!"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
