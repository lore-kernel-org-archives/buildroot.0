Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F560C369AA
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 09:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14A476112A;
	Wed, 25 Sep 2024 09:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vli6I0neNhSc; Wed, 25 Sep 2024 09:05:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09BE66112D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09BE66112D;
	Wed, 25 Sep 2024 09:05:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E5E01BF865
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 09:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A7648480C
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 09:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 353AUFKli88e for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 09:05:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 02B15847EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02B15847EB
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02B15847EB
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 09:05:46 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.185]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0XCw-1rz4QF1NES-017iBa; Wed, 25
 Sep 2024 11:05:43 +0200
To: buildroot@buildroot.org
Date: Wed, 25 Sep 2024 11:05:19 +0200
Message-ID: <20240925090526.3462217-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925090526.3462217-1-fiona.klute@gmx.de>
References: <20240925090526.3462217-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:vQL01eUybv9OLn2K3z1xlx3IEZ06EcLCx3f5ub9jQiyss0d6fQq
 +ny/p0tYrS16eeVMD4kPdEcR3q0UGlfPosMFDlKF43OGzQ3cWMIMy1VOsNQbi5Zk56b1VyZ
 4K+8WpxF88bXckSjBU304c+3codzodf8MqzvGY1M2s2dXQllxI1oGKg6d1hvaJMfLIw8RU1
 4fNTf2Q2J5oGi3KU6ARjg==
UI-OutboundReport: notjunk:1;M01:P0:rUdIRxlitvw=;6rC4Rn9rPvzFEiOWxBzyR9JxJp5
 xXX9gX48aLMk5a+ScoxTpnIugWF3sH6+M4EvBil66P201nYdi0EfWCoISKwHhLrEoesdWQ9l/
 Ske39eUkwtXcmLMhna6+h8RDJJxDJTLFMR6oyfv9TIl0AfL4D/FUPqKIAyK8w1XC/m3ZNXBg1
 4lz2BTcTEvDpiDpKAJ0igyLpxCADI05hajFUB09awInMOHIhjIkBoht53g2oW9BK5SgIbfGNC
 H3B+6CiyWMGZcGaTf/NgvLavyXi7iVp+rXIMitRCYKXHlblw0KGGBasoUn6vXbtpuy/rDqX1w
 uDDjXABpl8cwFURvLa3y88bMaksD0HfczmeAVzdcVo3VVxWc0r6F+sFEn0LukMLCTEz/k8VUC
 hJACOR3elhTp9f4VT0KDYGFc/VX3E05spVc2UizEYJqN9WTSo0t74gSybzKhB7xEARXyJxKpT
 0xQ5kvKbg1L7bp5yCFPHYHAfWf7LQ8chUTJfOFeQJnAoZeqdfSGGCY2Tz7VHM4hiEL1J4VER0
 oHsukpaH8ap++N00/DSBAn57rPa/y9N8zqFHm8jWnLPBMPgOd8xr0ulLF0TutSC+SdJmeuCMj
 4wnLvGc+6Lx55pkwZwhhe4yoEy8ihM2p/HsQPEzbEzSVPB/odtjd/QQ2+sLeENvOR78I+Bsdr
 4qukvRc1FLdbIb7R1dMFldikLbQHSowhjxEURn2z4AVl1PLwGCMFq3vdDf6/aDQWwPARbqzzJ
 HlkLSjqb3u3F7y/s9xF+54GBASqNw7RVye3MyDSfb3ysbe8iXxpChsXMmLKKY43DZA8ns8Jrk
 h1q/kwAMsDCNr/aOKHVAf4Kg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1727255143; x=1727859943; i=fiona.klute@gmx.de;
 bh=nQNGAfmcsRbFc8ahNUv6rUl2mpmhZWc8VZ1WJMvIcEU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ktqZWRzicb4DkI4dKrVt874zPk1Vg75wNyFHbX57QXeX7t1ik6bJXdWDDsqh8R2s
 +Lqsa8ZPZeFjyJJvpKNHL65Tc3hEJKURoFiqob6dBpJqFYaSsoLI1OksIbtmI5t7P
 P/QJM1yVxRPpFr7YtU5fCZiS+oycVjrcHpw1+CaGI42o+MgF34xyCPcRgmkft8ypu
 GHeOxvMzN8BIzsxLgelHztxAnTuvQaNLenC+wXo0LCgwaUbQTsy6ZxbxAVSxGJmkh
 MqVtWeErOLKpH7hXD6HOyZpfwJs+p9dBKvDlFTwGn1c9dw/TEKm9TU5iosMS4yn/X
 oWqny+rXTnJ59Ou7bA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=ktqZWRzi
Subject: [Buildroot] [PATCH v4 1/7] package/gobject-introspection: don't
 depend on cairo
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, goi depends on cairo.

So far, this would not cause any issue, but once we bump libglib2 and
goi, that would cause a circular dependency chain, where goi would
depend on cairo, cairo on libglib2, and libglib2 back on goi...

However, in goi, cairo is only needed to build some tests, and thus we
do not need that dependency, even before we update goi+libglib2.

Thanks to Fiona for helping sorting the issue out.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/gobject-introspection/gobject-introspection.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index ad72af22a2..af27781cf7 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -47,12 +47,7 @@ GOBJECT_INTROSPECTION_CONF_OPTS = \
 	-Dbuild_introspection_data=true \
 	-Ddoctool=disabled
 
-ifeq ($(BR2_PACKAGE_CAIRO),y)
-GOBJECT_INTROSPECTION_DEPENDENCIES += cairo
-GOBJECT_INTROSPECTION_CONF_OPTS += -Dcairo=enabled
-else
 GOBJECT_INTROSPECTION_CONF_OPTS += -Dcairo=disabled
-endif
 
 # GI_SCANNER_DISABLE_CACHE=1 prevents g-ir-scanner from writing cache data to ${HOME}
 GOBJECT_INTROSPECTION_CONF_ENV = \
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
