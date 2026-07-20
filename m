Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774A9C44529
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 17:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20FEB606C6;
	Mon, 20 Jul 2026 17:04:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ofy0zPAmjmpJ; Mon, 20 Jul 2026 17:04:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4365C606ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784567093;
	bh=0DBhWsnD+tteMfvGhRKpNQMELU5vdwLatUgNQOwwiaQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=A+9q2aPB8uhnU3ezCmImRJuZCbfUGHNdttvuPEt143OIbOlIT8eG01HQ6GCQUqq1u
	 KhQDfy+CIdTb1YJyC9abODSVqwpDUipZQgsC+Z9qWLysujvyWYlxDVYxtKGhZeY82f
	 q5Dcx90gCQE6F23iWopZ0I36RyYfBTkSa8bXaS1DUqtKviJtmU8alEyXk8du6RFKKy
	 7B1tpkWJl1vL1ZYp+KvLH/oCDf0UEjMcOrW51d8LVjeHGyONmFQjSlAZUOwfYe5SaQ
	 lLaf6fxcm2/GEbrFtUi4OktApJWXdeJMrX034+0LG8w42FwbpU2aWqKpb3EnoLTfKQ
	 /HKAnS1B7y0tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4365C606ED;
	Mon, 20 Jul 2026 17:04:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A01620DB
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 17:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BDFB406A9
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 17:04:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id urVcSG903r5L for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 17:04:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3F256406B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F256406B1
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F256406B1
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 17:04:47 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbAh0-1xJ0NP1AMK-00qRC6; Mon, 20
 Jul 2026 19:04:43 +0200
To: buildroot@buildroot.org
Date: Mon, 20 Jul 2026 19:04:33 +0200
Message-ID: <20260720170437.133823-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:z49JO+KKV1kx3eAC+s9pG5R2isj47qa7zJX7MToIIw953k+BAYl
 euVwbR6qsBh6nXTzXlwdJjbh0KxXEksDl6aPlNtqFTMA4gaFqqqrjqrxUpCeIBCl8SUdfFA
 HUefff5bLiFUXZLNpQe3RlsN8ZVJWqxMycmlEzWBslifeErY4gpevKvlzjaXIydLlvMKNWs
 hEqg9vq/XJYKezgJ8o7OA==
UI-OutboundReport: notjunk:1;M01:P0:8UddniEMpGo=;hR1fuYzA+RNGoQg8tELyDo5R8DC
 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
 9OYVH+h5rO1b
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1784567083; x=1785171883; i=fiona.klute@gmx.de;
 bh=s6GAxDwm/gWXeoCzJFF2ZEvH4GADllJXYd/jxiQcqak=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=PKEAwqCHEF0QP++AYx/MbCme3sI2Zesu8d9iKuPfmDYHNSCupg5+JqxRYWXYnF7i
 QhbxsDroMW4npDGlcoDiveP1PFgk+2+zLk4Uto2OHGak6y9Cq4+KGJ/+Ulbn7puyA
 HVpCvIPwVskjmztoa0qvaOURXfkDgb6ta3yYqukPxWF1Taha3EBkmmah4zkTmRWX0
 eY8Txv2ODgr1Ds856rHoCT1tp0O/nPgItzQ9IH7BMM5M43bsv1J4Yw3qxpMG54DXP
 ZCmCqAuX6+0EL1Hw10ILQFxa8G4KK5qQOIOVthBlSQX5Rjl2BhtRj0QkhA0teJQ+v
 7yKFDlKbNEV8AwCMdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=PKEAwqCH
Subject: [Buildroot] [PATCH 1/4] package/python-paho-mqtt: clarify license
 information
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Davide Viti <zinosat@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Fiona Klute \(Othermo GmbH\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>

package/python-paho-mqtt is dual-licensed, so licenses should be
connected by "or". EDL v1.0 is a BSD-3-Clause license, as confirmed by
the ESF [1] (see listed SPDX License Identifier), also confirmed as
intended in the pyproject.toml file [2].

[1] https://www.eclipse.org/org/documents/edl-v10/
[2] https://github.com/eclipse-paho/paho.mqtt.python/blob/af64a4365c6ac5a7a4d339e7b00f44df91353b35/pyproject.toml#L10-L12

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
---
 package/python-paho-mqtt/python-paho-mqtt.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-paho-mqtt/python-paho-mqtt.mk b/package/python-paho-mqtt/python-paho-mqtt.mk
index 90ed8370f7..5e1d2fe32d 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.mk
+++ b/package/python-paho-mqtt/python-paho-mqtt.mk
@@ -6,7 +6,8 @@
 
 PYTHON_PAHO_MQTT_VERSION = 2.1.0
 PYTHON_PAHO_MQTT_SITE = $(call github,eclipse,paho.mqtt.python,v$(PYTHON_PAHO_MQTT_VERSION))
-PYTHON_PAHO_MQTT_LICENSE = EPL-2.0, EDLv1.0
+# LICENSE.txt, EDLv1.0 is a BSD-3-Clause license
+PYTHON_PAHO_MQTT_LICENSE = EPL-2.0 or BSD-3-Clause
 PYTHON_PAHO_MQTT_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
 PYTHON_PAHO_MQTT_SETUP_TYPE = hatch
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
