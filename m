Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F54C5AD49
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 07:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC7AC60F25;
	Sun,  8 Jun 2025 07:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNsnhhkw7x-5; Sun,  8 Jun 2025 07:44:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5E4360ECF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5E4360ECF;
	Sun,  8 Jun 2025 07:44:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D0D78C8
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 07:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2B3381266
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 07:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nk5Fx22vvIiM for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 07:44:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 609CC81215
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 609CC81215
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 609CC81215
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 07:44:52 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.202.143]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MEV3C-1ue3fw2mdO-005B73; Sun, 08 Jun 2025 09:44:46 +0200
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
Date: Sun,  8 Jun 2025 09:44:42 +0200
Message-ID: <20250608074442.21390-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Glah7T8+44JobkWsAwVfaSd9xx3gE2xYrA4z9vCynAIpBqj/fsV
 tOh73hA3duBlJSko11mzcd+q+Z+uo1fkZB0BGR4K6pE4nAsK6dPbUmFXN6ycrCzsRHRoiYM
 aZnuq+BcXCaFIscrA4+2gz2LRinwgitGeqACixnWHZNGI/6UdXF8w94s4LCjuTweBPtQqTo
 DY4dVklNJf1rc/pkTbeaA==
UI-OutboundReport: notjunk:1;M01:P0:3uJhI84/0Lw=;HYTmygFZRcjQmzsMwCn4jX3eLNm
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1749368686; x=1749973486; i=ps.report@gmx.net;
 bh=Xd8Y6QvNa4KUSrdfHH20gzrcC7GDYkLAjfXqAprC3c0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=fOpUBfdvsSKRmTqTQ2m5UQNWR410O1CLl987+SJ+j1ireho20dWJsi02H+5OIkq/
 vILwsGEckaTkm0+IlO0ZTtt4Y/l25VoHQnoLOSn5HXTWGIvWAF6Adis8n0IDD4q4n
 pUIvWD1lQZ+KNbqXhEItUhj/yTB2ZQ4k8WAeBdgz3Y5QRoEBfXOWvqMJsVRq5Eo4c
 0Ad2f6BRJUmLbCVB24H/iDD+kclPgcxmrhIYCs0W85v6GQc2SbcCdU353EPekb4Sx
 GLgPLuWhZmsFwdeLFfOeh+4Hs6xpmfG7mxavyK7o3P0XLRjGrdY//0HMnwvklBA16
 /rFYGxh/GWrcR/YyGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=fOpUBfdv
Subject: [Buildroot] [PATCH v1] Revert "package/lm-sensors: update
 LM_SENSORS_VERSION"
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Revert back to the hyphen version schema (as actual returned by
https://release-monitoring.org, see [1], [2]).

Fixes pkg-stats output.

This reverts commit 521afeab9b7c0b07a849355e8b1c1fde0965c84f.

[1] https://release-monitoring.org/projects/search/?pattern=lm-sensors
[2] https://release-monitoring.org/project/1831/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/lm-sensors/lm-sensors.hash | 2 +-
 package/lm-sensors/lm-sensors.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/lm-sensors/lm-sensors.hash b/package/lm-sensors/lm-sensors.hash
index c941043343..0ca07b7e69 100644
--- a/package/lm-sensors/lm-sensors.hash
+++ b/package/lm-sensors/lm-sensors.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  0591f9fa0339f0d15e75326d0365871c2d4e2ed8aa1ff759b3a55d3734b7d197  lm-sensors-3.6.0.tar.gz
+sha256  0591f9fa0339f0d15e75326d0365871c2d4e2ed8aa1ff759b3a55d3734b7d197  lm-sensors-3-6-0.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 1bf27fc25a..8975efaffa 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LM_SENSORS_VERSION = 3.6.0
-LM_SENSORS_SITE = \
-	$(call github,lm-sensors,lm-sensors,V$(subst .,-,$(LM_SENSORS_VERSION)))
+LM_SENSORS_VERSION = 3-6-0
+LM_SENSORS_SITE = $(call github,lm-sensors,lm-sensors,V$(LM_SENSORS_VERSION))
 LM_SENSORS_INSTALL_STAGING = YES
 LM_SENSORS_DEPENDENCIES = host-bison host-flex
 LM_SENSORS_LICENSE = LGPL-2.1+ (libsensors), GPL-2.0+ (programs)
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
