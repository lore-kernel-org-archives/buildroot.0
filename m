Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819E0C52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38CE381E7C;
	Fri, 23 Aug 2024 17:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXt-ouYkcUyW; Fri, 23 Aug 2024 17:24:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9092840DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9092840DF;
	Fri, 23 Aug 2024 17:24:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 48B531BF314
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04F39412D0
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fFJHJgaTKkNg for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:24:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B8B7F41305
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8B7F41305
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8B7F41305
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:24:03 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.118.8]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2mFY-1ryHaH0Cui-014Vmi; Fri, 23
 Aug 2024 19:24:01 +0200
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 19:23:40 +0200
Message-ID: <20240823172341.1035485-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240823172341.1035485-1-fiona.klute@gmx.de>
References: <20240823172341.1035485-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:+ml2htLNG5j+RUQT+NJjcCKB/mVueqNYm2nqJf6FBAzvTLEcKEI
 zwgQ4xx4Mc9Z9vg8LC7M2j5qK9jUitoO4Tady031fAynsDc9n32TC3VpRB2btp4Z0O/WMhF
 AV2OEaCVDGDLFctxnJOLk5IxDA0/oGLhoxXzQ2CWmkJeGsWQIlMlHrUK5FZOHdkRGAWniwK
 UVMBMlqRQlQpVDl8qpntA==
UI-OutboundReport: notjunk:1;M01:P0:fg1mGu6iMcQ=;2tCj70X9RBsznw+DQ1YUhGp/0nL
 d2tzfjXYMH38C/VBZr1jJaJjZzUlmQi83ACJo3wy3OCHoKWhPhPYx4n7UdWA1DK7RnswlM6WL
 eIQkx/PP4qNtLbB5opnDR19qOHkOt4NMaQNon3u1gt4OlWMttW2vqGMbsRV+oiaZ+9I7Yl9V/
 iz+kBN8697yHJgNmtB5hdcYBE2jAsWRtDxYgDg+Yz9nRylhvifAwNZSUTCX3ZGvEBntjra9Rs
 fBlqds2gcCshS08B2oNtW740u6GaePADcf/xfxE/olg3lXQDBobuGUtKX0dAkDUW6xVY46paV
 g7p6co9XDqju7/NxAUCmA0g24hjtFgjnf005XhYkXgt2Qfx4iTST8X1JOuAp1Y1GZb7jwmfBI
 1fphPzJOrJQdH2u56RcudLVN8qzryNYxeAITvckTytmOPOvpLOFlSCWfIh65BX+afCr0S0QAo
 F9wgIA0KG10dSRxluwnc00KS/N53nbmOoX78qDPVVa/jcr1Di0EtbZ3lk4Qe9/7F7AQUN0DqN
 VfGL3sHwGa6BAYWDJh3g6BCUnYiy4iMf6wdXBGOHHAEGdFCtG26t54SrDE28bmFU/4QOFlomi
 GwFO0pzz+CKJxaXPnfDRmDk6BHX3+K8pVj39hbNqeFkhVtjJptFwSiGW73oCzLk8ghhaFXI5/
 lJkDXix1AwNO/Z9AoIQeQ1PoT+c7Jz8Mf0CitNo/jRzXRhM1IaGxZTaPLGe7Qpy5Dhj81UzmD
 FGQfJFIvRNO0QwzCAbGsUkITrTSGbDGn2KRFjrtoTTtkIJLqgh3ZDUj4/3XCmGMFeZsI2RL4M
 sIs3SZ2Hd+WNnRat+eK+HWAQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1724433841; x=1725038641; i=fiona.klute@gmx.de;
 bh=g87BWHbI2ehDWO+5d5SusvByiAt3EdDx9D63WWccVzQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=auD1n5gAnCPyCxL6K/IUa0YDf2JPoG+bCYJ/uz81UDZ40QiFY4r5PJrobwk90w4g
 sakYPJdZ9Wj/YoeZFi5o2QRWY5sNPX93qs1wwKUjyjrCsrwuwrQ2kxDySaKT2k+Nd
 up8VhGqij2AC+IUyF4pONEyJJw8QPu+xU8wrYZ5RPSFejem1ySyopmgN+MJHms19c
 eB2tCiz7jSu6gySEu7DxoIIPt0UszhmO0k2KYXHHD3MnizsCsJUFLRZn0KoQw89av
 hDXqDfC0sHBvdJBIkNt/IzE9yl2u/Xx4jzgrv22fH8QmEN/KVyM+BQ8Wgxt/FG4bi
 FdgoNnDrtAW5GwdeHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=auD1n5gA
Subject: [Buildroot] [PATCH next 3/3] package/network-manager: optional
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
 Marcus Hoffmann <buildroot@bubu1.eu>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Introspection gets enabled if gobject-introspection is.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/network-manager/network-manager.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 3937982c5f..a464abcf94 100644
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
