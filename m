Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6E7C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 09:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D79D41758;
	Sun, 25 Sep 2022 09:09:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D79D41758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mNc3Tm9GGqqD; Sun, 25 Sep 2022 09:09:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4304941764;
	Sun, 25 Sep 2022 09:09:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4304941764
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2205B1BF5A9
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 09:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E56C660784
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 09:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E56C660784
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v3H9lJ7hHs0T for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 09:09:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B58060A9E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B58060A9E
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 09:09:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 03D121BF205;
 Sun, 25 Sep 2022 09:09:25 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Sun, 25 Sep 2022 11:09:18 +0200
Message-Id: <20220925090920.1585682-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220925090920.1585682-1-thomas.petazzoni@bootlin.com>
References: <20220925090920.1585682-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664096966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a8zhZeIYkXdMFsvYi8Gx9m6Pr0zKnwXo5Z9rEnA/Lw8=;
 b=Uvh6rx5h6YMHgg1gNDkX6cBb/OoK0yB9r8tKrGd7DknhjwiNt+BXCUfTZS2fr2x8xlbbhP
 3PrPikvw0tX6O+0RVIyU7lDjifvEx+UwawcaTTWXK2g+JIkSY3y4sO9d3HRbcs5cOhdjGK
 FVSAGlX6Nxqw6OfLEx4+ccPITOL4aFzcdMN5PANUPvhVawbHlqx+ktVNQmQK205PnDZ3l1
 zSCCS6eeRFCJIkX0wWc25TYkRv0W6nfpDrdlzl82ZABU+MsJB4cssC7xAJMPZ/x/ywuH1Q
 xZbVb6UVm4P0aZzBB46cYud4PcgVfMQxdgxjntYT+kB0HjEPBn3RscjNSgH+bw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Uvh6rx5h
Subject: [Buildroot] [PATCH v2 3/5] arch/Config.in.xtensa: use one line per
 case in BR2_ENDIAN definition
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
Cc: Jonathan Ben Avraham <yba@tkos.co.il>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As we're about to introduce another Xtensa core, let's tidy up the
BR2_ENDIAN definition to have one line per case.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.xtensa | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index 4bb58e1964..3745f84537 100644
--- a/arch/Config.in.xtensa
+++ b/arch/Config.in.xtensa
@@ -55,7 +55,8 @@ config BR2_XTENSA_USE_MMU
 
 config BR2_ENDIAN
 	default "LITTLE"	if BR2_XTENSA_LITTLE_ENDIAN
-	default "BIG"		if BR2_xtensa_fsf || BR2_XTENSA_BIG_ENDIAN
+	default "BIG"		if BR2_XTENSA_BIG_ENDIAN
+	default "BIG"		if BR2_xtensa_fsf
 
 config BR2_ARCH
 	default "xtensa"	if BR2_xtensa
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
