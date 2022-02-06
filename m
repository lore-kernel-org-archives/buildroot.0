Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19092C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 09:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A868840160;
	Sun,  6 Feb 2022 09:08:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iq2caOnrRwnG; Sun,  6 Feb 2022 09:08:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF3C740134;
	Sun,  6 Feb 2022 09:08:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CDBD41BF83C
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 09:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C93B281291
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 09:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SOEHtzrH6zzD for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 09:08:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02F5B8127D
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 09:08:11 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GdWknIUKSX0z7GdWknKCKy; Sun, 06 Feb 2022 10:08:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644138490; bh=dFk7Be9Sixs0OTvODqkdsOsQhOlpytjMGbRyV4nNwbk=;
 h=From:To:Subject:Date:MIME-Version;
 b=HRU/iezRfx+ZSidsRHtpL7O5reuoU9SLYPkWxFTXg15Ny3XuPTLyM7XUlb/fCnC0W
 AMe8S2BwK6wYVaaLskYxsGqtVfjqPemJS3XRjrRsYDWsY0UbJJqRHFJJ52sL/jhew2
 aKzGv2cXhIqgdnlLiIH2WAyj10zpU+Neh+OrSuU956SWeo+LFIfrc63n6uQJsTLzPp
 dGZufElJ3OEH0iPL/5EkA+Nqvc/jWzNOLTR2J+v5OcxQwO/FTkuPyaHssSNKr6jdwe
 qPwv4tE0vvOyjjGQ0A0UQly5Yg4Bc6l07Wjb0geojCec3DUWYkA6B4JA6TI2URsW86
 HJnsbvSzYsviQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 10:08:09 +0100
Message-Id: <20220206090809.1532589-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfM9Q63azfiM2Xie4McgwHIAORP0MLB9ByewsnoNqhMuAHw0wXGVmV+c5rHAQReyxPfE+zRvPEXmFrZ5dh9KNFTRbE7vtUMOYFs+hDyzmLTvPI5yNNjoa
 /q3z/RkjziG6JHFe3QCixeEAVrZQ5EVeQXEULAJmGeAdU8gfXqtLXi2LDrrtK+u7LhuRc7fNwYYmhoRo8yHe9ZzOR83Sqjedu0buIW8wBGX4IqaTw5Ytcism
 CBmdCEeDv3WD2RYpNppppctgNPALB3bIX8XMgMEOLY9nFlDS9gJDd8U2JE/M907L5DvSlFunhsMbt8OYNknzPQ61bIu4+zPnZcwv+rcTlKk4P8YVELUBCtX0
 Zf0VTcS4WC2mAw7CaJy4TZFfe0Z0UYosXDRtDguXrV5EhF2ub5w=
Subject: [Buildroot] [PATCH] toolchain: update gcc bug 99410
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Gcc bug 99410 reappeared in gcc 10.x while building belle-sip, but it's
fixed on gcc 11.x, so let's update bug conditions.

Fixes:
http://autobuild.buildroot.net/results/846597f3573d3b0d52e80627a9577d14b9348547/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index ccdf62503d..aed8f393a3 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -185,11 +185,11 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410
 # Error: branch offset out of range on Nios II. This bug
 # no longer exists in gcc 8.x but reappeared on gcc 9.x and has been
-# fixed on gcc 10.x.
+# fixed on gcc 11.x.
 config BR2_TOOLCHAIN_HAS_GCC_BUG_99140
 	bool
 	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
-	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9 && !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_10 && !BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_nios2
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
