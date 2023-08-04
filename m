Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A54C001DF
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 18:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DBBC40647;
	Fri,  4 Aug 2023 18:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DBBC40647
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g5JaCycAyRLo; Fri,  4 Aug 2023 18:33:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE2FE40481;
	Fri,  4 Aug 2023 18:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE2FE40481
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 519A21BF98E
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 18:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF0E9400D9
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 18:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF0E9400D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KucLmQ_TCDxD for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 18:33:25 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4466405FD
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 18:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4466405FD
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A46FBA4C0C85
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 20:33:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45074)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qRzc1-0000kx-1H
 for buildroot@buildroot.org; Fri, 04 Aug 2023 20:33:21 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Aug 2023 20:33:19 +0200
Message-Id: <20230804183321.1766262-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691174001;
 bh=amn9f0LB2PTVk/NSZ4wfJZ7yT9kElUlZn7/qkfMBKNQ=;
 h=From:To:Subject:Date:From;
 b=grBns3/wvdoL3sb6foqgqGyqmGDMd9PElbksHo2pTGLSQNzqttNNmjWY3ML85LJZD
 O5Yn07t5hsHJiq5DVRpqJIPDKZEr2O0n1JsZiHhonPNzUb6iMGql9i5JcJyRwqQw0a
 wp0giNMpL1cPO+nGsS0IMb5jYTEOimm6S5qI81mIR+SRX1E/Xl0v8W+cXeH1mrLZWb
 nDpVFMQRrYkri8KpNKYWyI6N3gAU2IMmnIFMJ339gNL5EfmqL/J3sVFZvEuvXCsbJS
 U4WVC/HmZ+g2vpczvIhrMpVVXqYyoWN5pnaP4tcYSMen4UlJCfX0Rc2xsT102pkkNd
 wrD5LJB8fbfDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=grBns3/w
Subject: [Buildroot] [PATCH 1/3] package/stellarium: disable
 telescopecontrol plugin
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 319c56dfe3309dbf24be01fed3afff6259a2c5dd bumped
stellarium which included this commit
https://github.com/Stellarium/stellarium/commit/186b06fa215bd28ea03cc291dc861b552af8d99a

It removed the previously bundled libindi source and lets stellarium
download the sourcecode of the indiclient package (not present in
buildroot) during the build:

$ find output/build/stellarium-23.2/ -iname *.zip
output/build/stellarium-23.2/_deps/indiclient-subbuild/indiclient-populate-prefix/src/v1.8.5.zip

which breaks offline builds.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/stellarium/stellarium.mk | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 4dc5692d79..cc25f91063 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -20,6 +20,7 @@ STELLARIUM_CONF_OPTS = \
 	-DENABLE_NLS=OFF \
 	-DENABLE_QTWEBENGINE=OFF \
 	-DENABLE_QT6=OFF \
+	-DUSE_PLUGIN_TELESCOPECONTROL=OFF \
 	-DUSE_SYSTEM_ZLIB=ON
 
 ifeq ($(BR2_PACKAGE_QT5SCRIPT),y)
@@ -34,13 +35,9 @@ STELLARIUM_DEPENDENCIES += qt5serialport
 ifeq ($(BR2_PACKAGE_GPSD),y)
 STELLARIUM_DEPENDENCIES += gpsd
 endif
-STELLARIUM_CONF_OPTS += \
-	-DENABLE_GPS=ON \
-	-DUSE_PLUGIN_TELESCOPECONTROL=ON
+STELLARIUM_CONF_OPTS += -DENABLE_GPS=ON
 else
-STELLARIUM_CONF_OPTS += \
-	-DENABLE_GPS=OFF \
-	-DUSE_PLUGIN_TELESCOPECONTROL=OFF
+STELLARIUM_CONF_OPTS += -DENABLE_GPS=OFF
 endif
 
 $(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
