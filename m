Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8116CD1292
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 18:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A44246067C;
	Mon,  8 Apr 2024 18:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6oA5AAyPa2U; Mon,  8 Apr 2024 18:34:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AECF4607B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AECF4607B4;
	Mon,  8 Apr 2024 18:34:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 880A31BF2EA
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 18:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81D91405F9
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 18:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_xOFlG50B1Y for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 18:34:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8B7A2405F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B7A2405F4
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B7A2405F4
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 18:34:07 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 49243B0055A;
 Mon,  8 Apr 2024 20:34:02 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  8 Apr 2024 20:33:44 +0200
Message-ID: <20240408183344.993590-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712601244;
 bh=Nxu+KvHuW/ZUPiMDL7cn/Aqyogung7cGvW8OBoU9jtE=;
 h=From:To:Cc:Subject:Date:From;
 b=WNnA1PX9h6eqqHkP+UB5DtlfuYXRGSGf/BRvby6UY1m7cw80B5XySsBvq9CQWgWy6
 AqlnKuotPSBHdr1PXhPiRV9vscClpPT7ww5d/Fn6H0mpOfQOZZdKFmeCdp2ZlZx2dk
 C6dODA9kb1z/IywqH55Q9FlX/X4hF55DgFQzlfuJFz+hFtuKFRS9asW7kXjF8NG+5O
 hSPQjQlboA7aPJ2w3l5fhAr6SzAyyLaBxwRRlE60JfRD7K9ZZyU63TKFC0grcsO2e1
 +llCVeUXqwVs9iTd2Xt6JALJ0CzG1ZlHw40QQQVNPNIYUDS0m0CCy3tE6wO6KXe3e2
 F5dB5ZMxCNvWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WNnA1PX9
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: bump to version V0.17.07
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
Cc: Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see:
https://github.com/ColinIanKing/stress-ng/blob/V0.17.07/debian/changelog

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/stress-ng/stress-ng.hash | 2 +-
 package/stress-ng/stress-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index a02b65c9920..1f704809de8 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7ad1f30237011149e7f83451ea7cb49e88c0a79bed55e29b556c6a72b9f1d79d  stress-ng-0.15.07.tar.gz
+sha256  b0bc1495adce6c7a1f82d53f363682b243d6d7e93a06be7f94c9559c0a311a6f  stress-ng-0.17.07.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 24ec4cb5157..04427f70ecf 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.15.07
+STRESS_NG_VERSION = 0.17.07
 STRESS_NG_SITE = $(call github,ColinIanKing,stress-ng,V$(STRESS_NG_VERSION))
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
