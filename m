Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A80EC001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 18:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D182C82083;
	Tue,  8 Aug 2023 18:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D182C82083
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IKY5-L01sN0D; Tue,  8 Aug 2023 18:48:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C4E382055;
	Tue,  8 Aug 2023 18:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C4E382055
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F18721BF330
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D847E60BDF
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D847E60BDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TxJBCL61qqrl for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 18:48:23 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EFD560A65
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EFD560A65
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.222.147]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mz9Yv-1pXvLb00ih-00wHoZ; Tue, 08 Aug 2023 20:48:20 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 20:48:08 +0200
Message-ID: <20230808184809.4470-1-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Y2ue/fHi2yn+fr8jJdMuc5o8SNRkD1tTGDREdHgs8DOxYTFsY0m
 ubRy0vj3JSrZ3Oq5Nnl+GaIQEQCbkFjYwX3Ogj5orFcDium8JD62/j5C5XI9gpxL2ey57u/
 b4sDSrix+BPgIm1UM3BnJZuNHTLdQo0CXtr4RGPtuES/HmZFNTHcHojf3LBii0rMwpiufXI
 l3yUxrhrQPt/QBl9jzZVA==
UI-OutboundReport: notjunk:1;M01:P0:q8troVXKB+k=;DhI6Ds/9A1sMnpKz9MWj5s4VBlM
 M/uYV7/rdhPcYjvoPM2qzOCjkaLvaxB7SJedycsEZT+z1at6zOot4KbdwkuyuEP1Ql/4OglQE
 F2P6/xbG2TYreXmMNycgYoMaNyswtPy8dO/9sOTXhJ0h3R7kulqj9m8YY7lVfbGTj5Ko6OuFb
 PJNoVrUKJtvAuef3cn095WXUVqi0RY5ROI/2U5N9Xhaq9XiumJgqNQit19etHPgW4YPgaDh0D
 mMAyMR8eaPrmqQuy7FE2APgBeQZv2488mJyJQV4uzkEb7ZRJDpdlpZMXSihKzDsCW5tmNLcaJ
 QWbn+RPAFHpd0DaLkedGiB6KeSW0VGk5fLNCjkInci83/vNe5XhmQ2yEPh9lXBf94u6D3mfLz
 3uGGXNjaS811pVMDl5/u1u3cx40uKBIKhgPS+AtrsJB8vYlr2Ex/fYoK7f+f2v+TD4uMRuipW
 J7v2YKA7eycU83phN12mjrr5Zrzc51UNbluvrUrLCtkM+2kKlQC4QBuHU6wPn8Gb/D2RvKRxg
 v8vMineqefh1Q2ecLqnX8o2YT3xrMy3mCMioxRi+zfW+e7dcKvStLEbZrA52ceg5g0MrJPbPc
 JLytW+k3PrsoBiVth2uzLnDkqvyAPz1jsgwEQZy7XDZ0W3HYkzMqLeSYEYXJBNjLt2s/WSqIj
 Hgz1VDP4Q+VYAH/hbgY3c/W2ztvmuKZezOHlyKDdEIRPK2BH5/cQegUxUAN51mhDApyzFFfXn
 jRYI0xJ7r6t9vYxb0kwQqy3EpsyslDPywIiAtCu2OTA8bwQgfuJuvBBOrRjP8mIuuib7Rr60a
 7RJsUrIaOpTg5HBi+JgVbWsoL6kO93+9U2amRtnq6aLZLdlrqMjA5RriNvFTI/Fm7izx+9QgD
 JqeMJiEjEa6FHwbe+tP1T0P3FI7lRW3nU3lKQai7DbGqHeo4mQSt9TVi3S2dY/g3LW9tV7Mi4
 9op0lCyHLAOo2k4vPob2Qa76KMY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691520500; x=1692125300; i=dalang@gmx.at;
 bh=t3czOmvuixR5K2Hg1ZLzCoA1EsKy1r3gAw3nl84dRy0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=etishllAygh3ozYoD1B9cI4aV3xuL+/gC11Tze1KKO8FNMtL2w19CKbQDpCsd1YH3kxf5+w
 QQZlpraOu07Gp6AoG/GjYiRm5GCxtwt+nDn5I/iq4g4BzBQeTD9To7by/q6j5Z+TmOOWwUlzr
 NI/OtWo4Q14vnXiAezjHUbnJma+d17V9zZleWfhhyfi7wSqCqdknWNc/dpINAcwpV7OfB4FZ0
 roO+nvF+rC+PBBEnLdtWy2fxFu1ekI2ur1u3D1JMVufTq/0EtOXzHKd7h7FWoEG0dC6yBgla3
 2epeTFcVbyJiDO0oQugw8VBJ2Z/A6941rfywf16RK0P8Rb7+IYyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=etishllA
Subject: [Buildroot] [PATCH] package/log4cxx: add CPE ID
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

apache:log4cxx is a valid CPE ID:
https://nvd.nist.gov/products/cpe/detail/BFD3FB55-EE37-4297-BB3F-DD0A051DAD65?namingFormat=2.3&orderBy=CPEURI&keyword=log4cxx&status=FINAL

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/log4cxx/log4cxx.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index f50267d737..a5569126d4 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -10,6 +10,7 @@ LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
 LOG4CXX_INSTALL_STAGING = YES
 LOG4CXX_LICENSE = Apache-2.0
 LOG4CXX_LICENSE_FILES = LICENSE
+LOG4CXX_CPE_ID_VENDOR = apache
 
 LOG4CXX_CONF_OPTS = \
 	-DAPR_CONFIG_EXECUTABLE=$(STAGING_DIR)/usr/bin/apr-1-config \
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
