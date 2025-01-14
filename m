Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18642E77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 11:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C79D480CF2;
	Tue, 14 Jan 2025 11:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWqkm_JIC_iD; Tue, 14 Jan 2025 11:32:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D14D80D34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D14D80D34;
	Tue, 14 Jan 2025 11:32:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B60BB8B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 11:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96FF240B13
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 11:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OEZGtvFTj-Be for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 11:32:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4FC4E40AF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FC4E40AF0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FC4E40AF0
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 11:32:28 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.119.28]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7QxB-1tUklz0icP-016PN6; Tue, 14
 Jan 2025 12:32:26 +0100
To: buildroot@buildroot.org
Date: Tue, 14 Jan 2025 12:32:12 +0100
Message-ID: <20250114113212.1791033-7-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114113212.1791033-1-fiona.klute@gmx.de>
References: <20250114113212.1791033-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:gIBRsY1q8qLT2Jm4sT5JrInR/7FHpwtmHJDdgMj97FCQHUQI4Gx
 /i8gzc7fowQmvzt7q3Im+9UHq7mY/IkfqMHqfxQndoSPdZpbCZdU7pJLezkl5L5Yus4/Osf
 LPQgUevTUUU9ULWpI0PL4GB+u6noSYA9ty3i2cwBa/UNjJPC9sJcC/IU2JgxUoKgYb7MLou
 3G0NbTt3W4hs/WqaJKeiQ==
UI-OutboundReport: notjunk:1;M01:P0:cMDvBxIZNVc=;CgvEpw4ARhbM5fgfPOiZs7Vyqo9
 b9NXqJtzpkhjKoCXHoZcrFtEUXTCkvn2xAhi1grih3RAeH4ctR/CjuZTMK6zNYDmMJjEfs/Hf
 41UgukkzWetW140Miuyriv57xWh2N4umNTKs4zxl86BAqnsQPI08nJR48Kwiin0Mzdrl21a8p
 2TYkXd6vXFD2s3av6ifv8naD9fs/4WC8swrf2wMeD6KfRNbM4/gSH8gpVorxRixjBGt08bWRE
 zOT8SbQUJW9m9593WqQRL57QPslN2soIxskXpY3UG9zkJSBvZjlo0qSej4pq2n8x8hID3bhX/
 fC1Cjyp9pNMmg8qExjNbhIfl6/ZKGDPMSpVvJJPMswwkFn5yHJL8p63I5mYo50MmxXn/Ar750
 w65kS+NWbFxuhAWWuejXcBZhvclIH1+GWWa0IYOIBLgepD3OGIUO8BUi/XVZDq+DEOE5dWuUN
 5Wr4JUTmleMMAU5mwJeifdoZuB+GNrq98WZfBX1iQeyh42Rhso0FFS+XrnM0jlUe/60xyJSR7
 cN1ivC1/lbqLlWELNJFSbC1YxKhHs4Fg1IH4bz8YRvXzOCzPicc1L7wqu3gMXlP2oRlMUnNI5
 Jvuq+hM3Hh88PyRZn1DFjeq/OyHKpvlNBfrMbcetGnM9oXbNvgYunvvtnExNl1WfeE1prKQc+
 SO5cxrQFYz+fmi8g9vzFSET95IGXSWKS5CMpAp8oCA+JtN1L+abW0atm0G7xsH2gPNEu9vdIN
 w+xn5w6zm8wLHQ44sY5+vLozsR0jGW2T0kCVmDgLdNb+kcF8tGDNWtWcBGLPDXQw8oiHKNyuy
 ZCFVLJEUFGGP5lTFMIBXWuMJaSEySsOPeJI1rDhUw7ZDJWmPJxWoaC7S4WJjgoWhBwq8uNi2f
 W7vDJf4DN5CSf6R3oLziYNEu28Einz2PslNaxlid27Mxi63ghQHenCgZbdUpf8J/10VF/x8ae
 BksZHwBl2nrczwjJQItALxpA0S3eOzpeQ0s3F0tX5KAnhJX3lmXe5DnvzwiPDFFEZvXHGGAUu
 ubOB57CvrHwe/F0HDl9dH7lyOqLive/NcIfk1Kgty+ptnF9Tj+ng0en0fJsr9Inov0MQdmZPz
 48oJ+xdiKJciUpyqj+nD81FKhSiLYb
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736854346; x=1737459146; i=fiona.klute@gmx.de;
 bh=ot688cWHlXnWNprwn98XVhb3Njn3QyfGm0T3NxWTmuM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ot5DkOPOEISdxVMr41b5+idQ2TaB3oYptgjGFEUskKlsJVkPd3xXr5GydZnfPOsg
 MAZzMhyYDebZtQdVBW1M5P5ey0SaQFOlnFU5EgnmFaASZDyf1orXHlQftpApaDfTJ
 bgTXPKQBaNbO4RNG3viB6wM5aveLf+Go0PWi25Gg1Eo7WFR1qgKblKBBibTsuZP1h
 ZapTlsLSHMsr9i5TO55b+XxBtKz5jkMFpdo64qGzzc9rMT72jA1KQSsL5ElhGZzbM
 nGPoaZcJDpX6ljMCZbA8gkEOYmV5zCIVAo1kiYOAhqf9HmDj/+dkxEerL7JGL/uDK
 Dno1xWGltIqr+p//hw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ot5DkOPO
Subject: [Buildroot] [PATCH v8 6/6] package/network-manager: add optional
 dependency on gobject-introspection
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
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
Changes v7 -> v8 (Fiona):
* Clarify commit message for NM GOI support

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
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
