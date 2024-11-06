Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CA6D59F74
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 20:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5422680F03;
	Wed,  6 Nov 2024 20:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id spQKHRaddck9; Wed,  6 Nov 2024 20:41:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C11C810A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C11C810A3;
	Wed,  6 Nov 2024 20:41:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 79F0F3B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D97140479
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:41:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7H-tYFF6zp0O for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 20:41:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E7C0940360
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7C0940360
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7C0940360
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:41:32 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.161]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDywo-1t17KX2sDs-00FcEV; Wed, 06
 Nov 2024 21:41:29 +0100
To: buildroot@buildroot.org
Date: Wed,  6 Nov 2024 21:41:07 +0100
Message-ID: <20241106204108.4039479-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241106204108.4039479-1-fiona.klute@gmx.de>
References: <20241106204108.4039479-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:xhmyu08e+Jwhnnnl+2jVYmHVDs8jUwRFfht3x/nk4SQwAv0MC4+
 mmR5ZSzTm5+GoakH5CMAxMI5eFDJsXL4X0XrNzXxkBLwIqqL1g+p2qH38KMiqNC6/YNH5A+
 Ccc/Tk6JWEZcHyp8lYn3QNZro60KQM1WUHc28eTBZOKyHzfBaDjtXfL353f4f1x9sUZBMor
 Z7EZVm69i+w4BnIFzonJg==
UI-OutboundReport: notjunk:1;M01:P0:jvX5BU5ldU4=;HFOWlfwlbz2AxJaQqeuJ5YVbrLL
 CgvE4n6KqFmB3rtrvy4/NXoRKiFPr53nOrSBhmX91ndqIJRVsd+wYvExNbjfGxDdQki3WJje5
 2yrmmdJvm7Je39RK7roMNMA7+8CoXbN6apwuQ6zSPpbPgCrmafa4oAgzIOg8QTPRNRPhgdrhx
 Sqmmh/ve/siYsD70ExdvQirT/JCqwdR9rQbP5FuLc/oRigDnMFymtmpgC9fk+vijH153JFrr8
 4Le0t8S2bhcEhz9SCwxxUS5Itol3rajrcbuAl2bW/E2wg0qp4XIf8qNUe0EzB0meQDWFXzKjx
 Noa8laG5seh1Glp6R69SCy13FLatGmdcrIg2CHeF+ttCbOowUKWA3V34Xr5Whfp6ZcibdRGTU
 +xR1zaSHq3iNpbrK9qh9WUxmkn37BXq+tYVu5+0VeFrmw45URXPlrsrD+L6biY1A5ES+oiljC
 baV3ldTEhyz49EQzInq3CMHCHSjcq+X0zEIPe+mAbdUlRElpB6PE1mKjCHIaS07WAKJLAvpWX
 AEx2ClHhtLhUPKLzbtqxQO8FiPtjbB9SF8UDVUYqgsMmDLOFPPiCwBKmO0nM6tJMrbOwffcfP
 SSEHfwiZxrn0SMeSDXA/66rP1EfACre2CcZ2WJemSsWx52pHk3WcdStntkoA9kFz1ze3MAM8a
 tsX6s6ESIzIsR1y2ROz6YNm2K/mxgsift7RIGUe89DoQHdBSzKpIWkx12l9vCyEnKlt9vHNwv
 yzceYxSmhrjx33IKQtqfvvIc5qv3OAGhmOYVYaq836bEfxx7Ppf4H6qOr8RX1o+4k1pkgMWNl
 JHfNeU7NeSK5t1Tmtvv/jaVQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1730925689; x=1731530489; i=fiona.klute@gmx.de;
 bh=WZVrS+zFchJDIqBdWdT6eBqKtQLaVkDI89COnnZXY0M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=dedm6cVHQI1RX/MPfpnXZIrjrF91qPRnehR3R0mk7VeiovXWPm/YKwENRS3/AEDO
 VfUMkDs7rh7UFwibUGPqbIcUO+tsU2qufMsMBGLGF2WZpR4w6Vt5Ob5R3tbOkPbhY
 EK6mWSK7x9MDdeUX5unmct6SJIvvNl+W1g4T5dnI9SvV4AU55Y8oyBaJfu9p4sg32
 Uh4AUac3O1xQxgX8nSTF8r72YifdR/+F3WbicjWkaVBZcI9KtK3iRTTRC4FBma1bg
 w86d38EvDOE7mZwGFHs1Ku8UY3s8JT1QFrkWxipBzF+Ck+UAuiz4m2JlUYA7vsz2u
 aSuHfbImdsj1utdyRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=dedm6cVH
Subject: [Buildroot] [PATCH v6 4/5] package/network-manager: optional
 gobject-introspection
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Introspection gets enabled if gobject-introspection is.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/network-manager/network-manager.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 8349b6c79b..785976a0aa 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -26,7 +26,6 @@ NETWORK_MANAGER_DEPENDENCIES = \
 	util-linux
 
 NETWORK_MANAGER_CONF_OPTS = \
-	-Dintrospection=false \
 	-Ddocs=false \
 	-Dtests=no \
 	-Dqt=false \
@@ -50,6 +49,12 @@ ifeq ($(BR2_PACKAGE_DHCPCD),y)
 NETWORK_MANAGER_CONF_OPTS += -Ddhcpcd=/sbin/dhcpcd
 endif
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+NETWORK_MANAGER_CONF_OPTS += -Dintrospection=true
+else
+NETWORK_MANAGER_CONF_OPTS += -Dintrospection=false
+endif
+
 ifeq ($(BR2_PACKAGE_IWD),y)
 NETWORK_MANAGER_DEPENDENCIES += iwd
 NETWORK_MANAGER_CONF_OPTS += -Diwd=true
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
