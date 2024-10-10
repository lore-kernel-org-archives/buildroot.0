Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3024CF11F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 13:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B14141038;
	Thu, 10 Oct 2024 13:54:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Igsz-Rlho9VH; Thu, 10 Oct 2024 13:54:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29CFD4107A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29CFD4107A;
	Thu, 10 Oct 2024 13:54:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB0E31BF427
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 13:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D913B810F1
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 13:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5DBf2rrKa1-o for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 13:53:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C5078810F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5078810F0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5078810F0
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 13:53:56 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.249]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTAFh-1tPWbW1Nnz-00QOhi; Thu, 10
 Oct 2024 15:53:53 +0200
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 15:53:13 +0200
Message-ID: <20241010135318.3064224-7-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241010135318.3064224-1-fiona.klute@gmx.de>
References: <20241010135318.3064224-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:mGaF13LMEZwwlMbwjForGOCGzY26uykOJwdzPy6gOxKHddXqpr7
 bJyVK6Gs4TaFzqNlB27/6a+/AMBRyssalJYfNkTsN0PaEZlX9Sv8smHwkrETSswxw97/o3Q
 YeNQ695zveU3KyfiZ1oJu/Dx+Z3DntEK1V5fJzQswS+PGIy4rlM/jS3pBUveN4GRZL29GQi
 N6faSfRr3JqvrCOvGQaaw==
UI-OutboundReport: notjunk:1;M01:P0:f8nR0wspTBw=;DT7U+Zfqs3pDEApzWCj8vEY0X86
 4v8utmaf4Iq6cqxUQRRLGD81li39q/2TPl/mvwRDC4d8jbwHPpZDnwBP6W+quqiOcFwvJvWyA
 Iv66W5MxhKljXfo7U31Tt7smIA0D6wUxYHPaZHJrVl9ThLK2jkJfF/LXh7Jhs9LfH3k94ZeUc
 F+dcId7TiS6SITYSbD2HQNPBCEjUAFo63AYi+l41dMBakdSMfFYp4xhFpfF/gfaySxND6Xt5+
 Wkv6K+sgy9Hzshw/ScG9gjkP3G34nvOrcufKU759T+144pGB3Ljows+fqoS0SzdydG16yzEd8
 Mu75ZiAmXa9V/VfnySY0XcBdTzy+QBOLayPbYf7XmINA1CKnBqG5g9WRMGTiu7sMF0ZVz/ihw
 b5ihlo5/8CupnLNBgR8ZPAhU7XyhMYzhSpcjEJLXezFIEK7N8xnthzK0QmhGymqUogKKJeH8x
 DuuE/i7eIPR9d+KfRWUrAJE3Kf8FJebeWZZpy5iVoY93OkdxMcpVX5L5cGcAQQZFcpmcYdf8X
 OOfykbyWG/7oiQCHfaXm7l3Qv+l6vNBpxL3V5zCEUxWsD2uNEkI3l+9vhdUfAW1Ud/yzA36ow
 g5Eycmqmx9aAQI/k9mugn3K1qleQbbS6C82Tdr2LsWhwkWy9Tp9/gqI1XOqR8bAaINvtuTEXT
 gV6gZmt4S6HpGKIqX2Vbjn3OI25FUph7l18KfU1ttoPr85fUZFNSAmPiWlgqt96d8tcFRbIhO
 Ze1X9CtfhAkRao/UDn9IvsMZ+Eg7BVuSl4jxllpUsFvi1DxJ3B6KLU4bfLHbRMuS7hxAYYVGz
 D3E3FImvxUBPIeEecAXlFZIK8InUyitYncKPcvJ01nU8g=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1728568433; x=1729173233; i=fiona.klute@gmx.de;
 bh=WZVrS+zFchJDIqBdWdT6eBqKtQLaVkDI89COnnZXY0M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=YyXszL/Py8xrkXQwowtyvbowzg32kdsKweiyQm7VJonq4FWK0cY2acTmEMFX1PGA
 hzVnoi7/ibCtBx9IvWTaxk7HjDZFILzL/E3VA9DHBYwXCyOiJPeVy9pKM+0lthwQh
 y1gvPlnHeydrw7msQ9FyWA6wbBHqQScmDix9MazJDKMOoUmQIUjG30G8Vu1k3efCo
 qkeQpOCmCtZZeLtD4eCGSz6Z+wX3DZqB+QNlDyQBFPjLd4DXcPtLk1fyIfz8TtwhI
 FNZXdIfNDnAuVBvpNfHqQfhWyks1bEgnxCAijPV5D4dmbgcXwKqVuUFb5yxg33z6U
 cxUU6e4LEE1A1j7L9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=YyXszL/P
Subject: [Buildroot] [PATCH v5 6/7] package/network-manager: optional
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
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
