Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1284EC369AA
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 09:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D091061165;
	Wed, 25 Sep 2024 09:06:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BsB9DROkRN79; Wed, 25 Sep 2024 09:06:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71F4D6111E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71F4D6111E;
	Wed, 25 Sep 2024 09:06:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1113B1BF865
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 09:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00CD5847EB
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 09:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8cl5xXrbmPaY for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 09:05:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9BC8848FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9BC8848FE
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9BC8848FE
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 09:05:48 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.185]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHGCo-1sgCgE0sgi-006yf4; Wed, 25
 Sep 2024 11:05:46 +0200
To: buildroot@buildroot.org
Date: Wed, 25 Sep 2024 11:05:24 +0200
Message-ID: <20240925090526.3462217-7-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925090526.3462217-1-fiona.klute@gmx.de>
References: <20240925090526.3462217-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:IaerBczdy9V8KmwI5EeLP+9tf4OMhHQJJ42bfz0meG5oWtTYybx
 yMVb0h1WDjPgVyjTx2cvqW5IOA/yKwzf2NORIj8mOtM6WRwsX+PtvHBvHmNrif1sGj9zmlM
 RLBIuyUNFa4VG3vrEB18lmXfJ24DyL4eBojWgPJ50JsOesusV/4jl6hHpswC1BVwdrLHKkX
 kzTaZdT237YnNsyDgi2+g==
UI-OutboundReport: notjunk:1;M01:P0:fXztZRPG2H8=;d3vdHQsMSbLUI9ApgT8G92X17zN
 Xdz8n95USCoL1jw3c+NxqZljiKNdmXsgMqHfMFee1ItSlkczsPAxKTV6By33V9fKHzzcwLCrt
 T8sXPMQHFk7Q1vnPe1jcahQ3zLBDCT62GxuCQRjoXM1kP53IbZ1vPnjAYEcQ+U3otnxLkbZ88
 FvddvVN04rAhyH2c/6c0ORYah5NgbW2yBrErPeaNurdDXJwog6cfmwZdvPm7UCDSdkiqIxSV5
 rj2JNycHxqG7egiVQehCHHQj+jNQegfqA87xrqX9zVqSZFCrDQeUTVyfY/2V5yBDbg+iB+X1O
 uzqS6tXm68LKaZhBlDAaS09gmCzZSCU/n5UqVd/CC4e/nbwt+Mrzl67EvwMAf2Y1O84hw5xV4
 hCfJdotHzbEVbk7/a6jcG0L7Apyp1Y+b9DfMQiZaYiXF8YRPM54Nsh9mBZQ5y2KEBV6N2FqIn
 WdI5hUbboAf+ITKSNINnCMqoV2xMaiLvpJr+/yytbSssXDcXklXLt2fxek2ZgUBTXzZoZg18m
 3x85JgVNdR32VUfygnsbFZrsyFpuTqiBKeEW2d+DXw/utrR53nHyxedHhnQTw/ceXAiF9eDQ6
 nQt4DYthLKKXlixu8IdFGnUMZS9o6S47C05UW7C0jGB1rVKHshZB1VzV4gmojuCLToLxBU5ZV
 nqOR6l0FrNL30978f8VUZBlpWCjOJHUBydR4xvceiyqHiycURYQP8ZS8E/SBCP/dKaLCTDviD
 p6Hw/e8ckHjEfIagp2XEB83lI5ssGish78kyWtq67lI5VDKrwtMscy2/20kd/KHyv+9a8pZGd
 +Q3gwAbgDpbG3r+qh/sKuVjg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1727255146; x=1727859946; i=fiona.klute@gmx.de;
 bh=WZVrS+zFchJDIqBdWdT6eBqKtQLaVkDI89COnnZXY0M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=t75MOUl+b/0mVarryYjt/THdBW3h9NDkagN7R8hM2LAWEMzxiivNU4hJIB9XeUk1
 38cYXcHXC3xkCObINcX1MYV2a0+o1Pozu18TsTI2OPxxCzeQ9cSAP5CkIc6jm7uqp
 lvftiTajfxOmgYDeQb3zIN25U1NQvV48JgbS+aE/y7ViMk01xHouOlE/8M1MPPU6d
 lMlcV9IppKLdSdY/M5ZrgksSoqV9BMlNk71ppLSVkKUcZCfYl29jteLw8iCAdEMXC
 sDqfdMK8qAw67MW6PiYVEuHRzUFhRcjaxDtcISQeXnwwTKc2ydq+5hTdfWxACW+tR
 xTZZQP7THSiCZwy1cg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=t75MOUl+
Subject: [Buildroot] [PATCH v4 6/7] package/network-manager: optional
 gobject-introspection
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
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
