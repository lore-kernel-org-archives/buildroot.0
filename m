Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEF3EB64DD
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 12:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3895D4150D;
	Wed,  9 Aug 2023 12:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3895D4150D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sPk5lVGkk_og; Wed,  9 Aug 2023 12:39:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 742C2414EE;
	Wed,  9 Aug 2023 12:39:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 742C2414EE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FE221BF316
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 12:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 380514092C
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 12:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 380514092C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DKlp5wydT7MX for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 12:38:59 +0000 (UTC)
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.155])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC5C040922
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 12:38:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC5C040922
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id C426840EB9
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 14:38:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out003.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W6VGRYPPLBb2 for <buildroot@buildroot.org>;
 Wed,  9 Aug 2023 14:38:53 +0200 (CEST)
Received: from int-mx002.mykolab.com (unknown [10.9.13.2])
 by mx.kolabnow.com (Postfix) with ESMTPS id DE98440E35
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 14:38:51 +0200 (CEST)
Received: from ext-subm002.mykolab.com (unknown [10.9.6.2])
 by int-mx002.mykolab.com (Postfix) with ESMTPS id B7E8E3680;
 Wed,  9 Aug 2023 14:38:51 +0200 (CEST)
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 14:38:47 +0200
Message-Id: <20230809123847.1192879-1-zgyarmati@zgyarmati.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received:received:received; s=
 dkim20160331; t=1691584733; x=1693399134; bh=YoXrcV84gyjwlVUVmpY
 0lA89fC5Y+ugrAd9Y1aFWw9k=; b=452gkpxaGVYwOm7uy+EYY/IBzgROeJlnsKy
 I0pGnFYabYXq79q0plhCqoNW3JuJWaqrR8bAasLg7B4POJyCdT/hG7cYYZBMMJwh
 7O5nluB7qlXR88BNYpUvv0Z/RsKev3utBvCI0GZnKsuw+UuUoXMhVcuAbXQhSOpl
 1dECY/ikKqiKhFcGi6TWT6Lq1q/fjibbOhgwuKyrlWxSFuaUpsOLdOBMrUdSejUQ
 mxoYSQYSKkonYwj00aHKozW3C34WywAb6wNNKIpOWdqE2nMvjXidJA8AmNjZRyLX
 BUQp/SyUmPTIzvPyarghXDsciSZYXiFYGAlGyS/PtZsxtzvBZlOTYQdzKRLyscL6
 qabnyV7ng29KxbiV+88vkJUEHsh47l8wDaKA3muQEGQm0qPEswy4spKqe3xivBm4
 2167cZJ+P3cuLCzX7zXLve8iQXlBnXcpcVZS+Oi4huaCiHlT6LhVTKEZvgVc2mZP
 YFi4m4fi3i3Tf4Sgp6NeUAFOsqtXrxH2TzXioi9ecy1sCQF4ULNd53eWrWnUUe5j
 Fgn1mWILk5b4h+Ye2AEyR9ksrQL3ZJELC2KuxtGAAqpNg/l3M9NMs6lKtcQb0Epp
 Q4gzKLUw419U7mtHqCJ5c1pFqyHotlKCcw1onWlwtHKMttVldCq8fUA5Ji4l+T2p
 Bku88uQ8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (4096-bit key) header.d=kolabnow.com header.i=@kolabnow.com
 header.a=rsa-sha256 header.s=dkim20160331 header.b=452gkpxa
X-Mailman-Original-Authentication-Results: ext-mx-out003.mykolab.com
 (amavisd-new); 
 dkim=pass (4096-bit key) reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: [Buildroot] [PATCH 1/1] package/grantlee: bump to 5.3.1
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now it also selects
BR2_PACKAGE_QT5DECLARATIVE
BR2_PACKAGE_QT5DECLARATIVE_QUICK
as the new version requires it.

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
---
 package/grantlee/Config.in     | 2 ++
 package/grantlee/grantlee.hash | 2 +-
 package/grantlee/grantlee.mk   | 4 ++--
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/grantlee/Config.in b/package/grantlee/Config.in
index 779306bc2e..566c4c1d2e 100644
--- a/package/grantlee/Config.in
+++ b/package/grantlee/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_GRANTLEE
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5SCRIPT
 	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	help
 	  Qt implementation of the Django template framework
 
diff --git a/package/grantlee/grantlee.hash b/package/grantlee/grantlee.hash
index 6508aa70cc..57061fb03f 100644
--- a/package/grantlee/grantlee.hash
+++ b/package/grantlee/grantlee.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  139acee5746b957bdf1327ec0d97c604d4c0b9be42aec5d584297cb5ed6a990a  grantlee-5.2.0.tar.gz
+sha256  ba288ae9ed37ec0c3622ceb40ae1f7e1e6b2ea89216ad8587f0863d64be24f06  grantlee-5.3.1.tar.gz
 
 # Hash for license file
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
diff --git a/package/grantlee/grantlee.mk b/package/grantlee/grantlee.mk
index 7079679ca4..0b5c1e6fba 100644
--- a/package/grantlee/grantlee.mk
+++ b/package/grantlee/grantlee.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-GRANTLEE_VERSION = 5.2.0
+GRANTLEE_VERSION = 5.3.1
 GRANTLEE_SITE = $(call github,steveire,grantlee,v$(GRANTLEE_VERSION))
 GRANTLEE_INSTALL_STAGING = YES
 GRANTLEE_LICENSE = LGPL-2.1+
 GRANTLEE_LICENSE_FILES = COPYING.LIB
-GRANTLEE_DEPENDENCIES = qt5base qt5script
+GRANTLEE_DEPENDENCIES = qt5base qt5script qt5declarative
 
 $(eval $(cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
