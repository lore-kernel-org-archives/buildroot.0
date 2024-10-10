Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A196CF11F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 13:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F2DA40FFF;
	Thu, 10 Oct 2024 13:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZmNqBf6db-P; Thu, 10 Oct 2024 13:53:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3982F41016
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3982F41016;
	Thu, 10 Oct 2024 13:53:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25ACA1BF427
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 13:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21C8260B29
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 13:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdKn_r6A__jM for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 13:53:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E715F60AFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E715F60AFF
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E715F60AFF
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 13:53:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.249]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOiHl-1tL4d7285P-00M378; Thu, 10
 Oct 2024 15:53:50 +0200
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 15:53:08 +0200
Message-ID: <20241010135318.3064224-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241010135318.3064224-1-fiona.klute@gmx.de>
References: <20241010135318.3064224-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:qHf9mVBempg1wuUzI04nNY5zWiU8lSxMKON8uummcvzrg2nAMPo
 r04QIAwSswW1Du3GNJemjWvidxtzdn9k02QlfIcVRONsKTgiuDXr2NRLiAhBucvlnQKEQ30
 xSclS3C2fucFnTY31NLmVgI9b1TkOB9ClbewuWS0/CKP1HYkizK3sp7/d5/ZTPFZ/M0EAAV
 PUgFYdhM8KoO/L10iz+6Q==
UI-OutboundReport: notjunk:1;M01:P0:/37z8IbQvLQ=;dZ9/RtMPVvuB9YH0/CToxoeE5Db
 3XZCiGssW1m7Ttt7QCgJT33stpxaFL4lYMR/r2XxZq7xc3XxWuAfW5MyfFkQBeE1P+3MbZBBv
 R8xnmhf/D96ICtY6iZrfCE+TcpwVdtjwbRffNlc3ss2C6p0I+njpu169BCFnQigDHAyZIwaM7
 DfySVWMzlGOo+Lhl36Uq7uLotC30r8ik5eLe1Jw18LwcSoe0HMM1zHap66I3ZkZUG2qCeAcNV
 k3hmPMwxZ5E6DgHiVvNgvEOn9yAEcJ6a/XcPS80IqXa45xPWUCh2xnqMQ9WWaiqlzGHK0hj9q
 p6p09cbjtzzrmWMzRi/x5pBQ/8BBBFqVU2nD9w92kp58H2J4tUwRhsMH0nbRf52P4i05luN0v
 Og7cHOqMZB1p8d0on9kH/01Wp6dPeOKo6fpbMNgGKEmpg07ckx5hWPnBn91Wf+N6Lejolk3Zs
 dZcpC1gRWeQlisOveAqaE52wDg0N3z89pyAL8I1t4b6CqTqKAqR9Xs12vz76t1bXv+KlH6BN1
 KOfAllF4WoRjNcSurJgFZp035uvHDmnc23aGlXyxETrlEPhwHDiP+bp4K+2ZDE8JOG2ZK6m5q
 u5SrtaKOLCzWzwZVuriozRFI5riZ+gV3zz68qqMUWsW144a3t1xbKpIcK/s3R2fKcGIP8nUII
 s/KPJjOMYXjGkrZxNGZIPYsBEuejaPTfG/aDGZZzWh/Q7vYDYFZlc8HkemoXH/EBFUD1FW98Q
 5GYnQuDj6gaPhxIlmvTdXC3yTuHqxjSbiW8L842ho2UrmqQQeVgy1AxKb6Ke4oirmXzqtaAHH
 z2ex5lyVwWUGJlEZf8YkJJlQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1728568430; x=1729173230; i=fiona.klute@gmx.de;
 bh=nQNGAfmcsRbFc8ahNUv6rUl2mpmhZWc8VZ1WJMvIcEU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=F5HIu0eZljNRM2LWGrGo3Tu5A1uwq2UWijpFCLdXbjYBZ9vUq9VR2H0kB54LceUa
 i0ndk0n0i0MgAc+RP0XaGdpBefdD0rYP9TffxOVtA1WNlJVawBGmZcNil0kLNbnsx
 4Ks5OPMmiwk2WHTnx4ED6khbSJxDCCFkVQtnOjmrljBNd56oaCUT384PCmKXVL9v8
 ABOvwh/gRPZ4ZCuWOatSM0HbgVOtq6R2L93UKWSBySgFjZok80A7QwrRqLFWWF3+x
 AuVDWWaonYkdNuG6hZ+wXZs3DxdSfrJHcZyt7mkUFGH4GE26OWoWoPvKiOxo6GsL2
 dWe/6njnXYGt9pHTMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=F5HIu0eZ
Subject: [Buildroot] [PATCH v5 1/7] package/gobject-introspection: don't
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
 Asaf Kahlon <asafka7@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
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
