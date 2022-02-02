Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91313C433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 17:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ACF941573;
	Wed,  2 Feb 2022 17:10:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ak5LEk5jQziH; Wed,  2 Feb 2022 17:10:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 838A541295;
	Wed,  2 Feb 2022 17:10:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3538E1BF573
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 17:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2306B6060A
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 17:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Bl8WSalqvhy for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 17:10:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTP id E51906058F
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 17:10:40 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FJ9QnNaa8kz4hFJ9Qnslgi; Wed, 02 Feb 2022 18:10:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643821838; bh=tZuKJkLYggD+JLa8PcNEiHaEwykuhIBbW2QVopolY8o=;
 h=From:To:Subject:Date:MIME-Version;
 b=jzBKDNv9bBrlk+Op6fyzMh4MV8yutKlkcdyx4YdniXtsEBJMOvocaVmcNvj2O1hWk
 C7pmv41eG+8Csj0y2rgIsUY4okJgZCqCH7JNlBNmX1tKTKV+wZnCojImItghF5FLxn
 k+ufdD9cICpJSmSrqMSZGQzQuO8DurstvXMY+j9Ukwvzux6TzWHQhOi1lImsiWZ9go
 4uvZNP+QkepF/0jg1Lj7yb7tStLPVhOwcVhJ2IJC0SbbnmVpcis24GathU0dIQJnbo
 7enMmShBTJxSquy+ycNMP9tHUm+5LwtmCn0s4u4Q2Pa6szKbgHngNyengz11i+gxEY
 ZGfjKO69BmfhQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  2 Feb 2022 18:10:34 +0100
Message-Id: <20220202171035.1740791-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfE2cRD/l1k+dXWIQo0oK+RlfLXmqd2rUbeiwguymtUvBXVSaM7wGUSOfixTLXFJ9n2MEZi8bn5SAaiRA4ZBsPsifwcJbB7iDAj7q+xbJ8oHnNjKei83g
 QWfJEP5RRV6oFiq+1rKqsb8oB8SiPYTu1kbzQqNVEIKGjQP15kSXutgMCqoQaHB8xkjGjaJ5U6ByEChUclnu6nNj+jsiL8/BZUfW5c2OjpgNqqQmMpdliDtF
 IpldKqmNIsdZCEn0U7dpa2LO4rXdAU2LPalLgxPrKVSrMXV5HyYOTD2aYG7wqRXRtVD0IwHtnbGIHbzwcNT+3A1puvdrLtYoTaflPFIL8bY=
Subject: [Buildroot] [PATCH] configs/pcengines_apu2_defconfig: linux needs
 host libelf
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/pcengines_apu2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/pcengines_apu2_defconfig b/configs/pcengines_apu2_defconfig
index 0792c93c19..a85808554c 100644
--- a/configs/pcengines_apu2_defconfig
+++ b/configs/pcengines_apu2_defconfig
@@ -8,6 +8,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pcengines/apu2/linux.config"
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
 
 # Default hostname and TTY
 BR2_TARGET_GENERIC_HOSTNAME="apu2"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
