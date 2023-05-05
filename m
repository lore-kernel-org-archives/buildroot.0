Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9BCC77B7D
	for <buildroot@archiver.kernel.org>; Fri,  5 May 2023 22:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3B9940153;
	Fri,  5 May 2023 22:30:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3B9940153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u6cPbrUguMct; Fri,  5 May 2023 22:30:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9541408B8;
	Fri,  5 May 2023 22:30:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9541408B8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C8521BF385
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 22:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 002EB60AF6
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 22:30:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 002EB60AF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7kE0i_cx7x7I for <buildroot@lists.busybox.net>;
 Fri,  5 May 2023 22:30:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D8F960AEF
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D8F960AEF
 for <buildroot@buildroot.org>; Fri,  5 May 2023 22:30:29 +0000 (UTC)
Received: from localhost.localdomain ([146.241.104.90])
 by Aruba Outgoing Smtp  with ESMTPSA
 id v3wYprrAtMsifv3wYprLwQ; Sat, 06 May 2023 00:30:26 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat,  6 May 2023 00:30:25 +0200
Message-Id: <20230505223025.47663-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfD6Ho7OBsAHVUdyRUSdiKoNABW5GSaqq+FowdXWurjMHmmwVoy06T0/AjUT5B8ASp+9gUEUBKpvo7zP/mTvxkGkk4k3rb3+UTz9J6WtuCjbwIK+BqIZf
 q3Jiy0x441lk4Xh3sZ/J2Aq2aDu3SvXj5OR+yUrihzxhCoB/UvQ851kTWukyZnsDTMrWGCVG8hTnD59cBkX4eNs8p6AlkaS+k7WkyLnFwQ4zBWarnMXR2bsp
 dimR0k4z3vp0OmjaLEhhfgCazvczYxjLvJV4FXmOnj0pR2J+1VUfRGGD5IwsIIzY6Y58ElA2X9wt3J/ATfLbTw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1683325826; bh=CINQC9Tj6sIiV0VE3mBi4EUJf+PI+YILXn9WO6TQa+g=;
 h=From:To:Subject:Date:MIME-Version;
 b=O3bXt/ZHlOzZ0uVuw4bhV1WMrWftQyI/T6sIx8UJuGfuna+k/Oun1qcobrFR4Td36
 GEa+ffWnFyfaNygOWx/SUUHrhnlDC/JsozaUNdgnAI5//ZuJiiZp57tOU2tYJEr7AH
 lNrh/BQjBlU2CN2BP7lG9opl742ts4X4bCqNilLOEf7xKHqYEyb1oAtHLRJjd/BV9h
 SKMLgdQEyyH2CUGpuQGlsNfbUzwgdbF+SUbNOgqwzDd3Dylki0wo82wrIExHwk0T9f
 dv6LiKdjn1BLKCrm1DdYgabfYehAulWsBGLMh8Hzt7VRCSW7vMWIv5abLvx4FL0huy
 FwVXOmEfs3USg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=O3bXt/ZH
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.89.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 483320d95c..63a35285d7 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_89_RTM/src/SHA256SUMS
-sha256  55c37a3f4da010d0574fb8b39264cb1e7b4ce9e6c2954c1c7ecf9f41ee00bed5  nss-3.89.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_89_1_RTM/src/SHA256SUMS
+sha256  3adaedb9e70c3c5f40603bf60a01e336190a6dbe01929d395f16b01fe84a0156  nss-3.89.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index cc5dd8bdca..d3f227e909 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.89
+LIBNSS_VERSION = 3.89.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
