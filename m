Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7379C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 19:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 711634181C;
	Wed,  3 Jan 2024 19:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 711634181C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wQhytHRjNx5z; Wed,  3 Jan 2024 19:26:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCD2A417EC;
	Wed,  3 Jan 2024 19:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCD2A417EC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 996391BF286
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 19:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FF9F82572
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 19:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FF9F82572
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jxGJZPwfy1pE for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 19:26:28 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 371AE82425
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 19:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 371AE82425
Received: from fli4l.lan.fli4l (p5b3a0630.dip0.t-ipconnect.de [91.58.6.48])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F097BA4C0A3F;
 Wed,  3 Jan 2024 20:26:25 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59648)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rL6sj-000000002L7-34hZ;
 Wed, 03 Jan 2024 20:26:25 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 20:26:25 +0100
Message-Id: <20240103192625.2787462-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1704309985;
 bh=D7k8cKEWKEXexyNqnpQdlyXXFRMkqQDhTPvbftPpzwA=;
 h=From:To:Cc:Subject:Date:From;
 b=ECe9i9Mck6ov5dE+3o+sHnrJljf0SbfNSKchtJlctmcdcLvaM033VXTrzr7Huo6+Q
 U5lQE2Jy6zO0BRJjqRLKZJ6NzN0ii20SXaA+5gbuMEhO7SbIIzZqZPyFDcBSCt0o76
 S7JjUgMh6VwpuZ8GMtUHt4BC7dSXkX47H1fO1T6muCFPQni0ePgZ/FLWvDAOyX3bws
 ipmoZ0Mds40WDCNkcflwAxEDk+x5HLXvgvh54njnJEQ+AtxkjVZVoq/aiqHp1n9nft
 6+cQJdXyf2Y/UeYx8Pt8LV8WfM/2++kNaxV1zqwJI+5eQRCwbU70b60F995XSDYlSV
 gdphC5FKyHReQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=ECe9i9Mc
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
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

Updated license hash due to upstream commit
https://github.com/tvheadend/tvheadend/commit/3cf5acdc714dc025b2246d2395478fcfd058afeb

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tvheadend/tvheadend.hash | 4 ++--
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 5a9ec3df23..62c954234d 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  98a27a6a5ce2fc800df6d154534f494582418f6b24b3a1c30267785d191e50df  tvheadend-62adbebfd062d7b97829268274aad92df2033784.tar.gz
-sha256  54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
+sha256  99a2fd954d8e620029759f5a65dc09271c168cd047a6a152a0fe643de64823cf  tvheadend-b40a62b31e809523d2fe2f7f3f331cc55dfdbd0f.tar.gz
+sha256  16aaf037a2d00e6e7804de64619887fc7539f1ede99e3282c86dfbc61c2af63e  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 1d4e6ee30c..816ec6e161 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 62adbebfd062d7b97829268274aad92df2033784
+TVHEADEND_VERSION = b40a62b31e809523d2fe2f7f3f331cc55dfdbd0f
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
