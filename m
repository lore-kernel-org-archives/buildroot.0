Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EA0ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 12:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3C0240493;
	Sat, 17 Sep 2022 12:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3C0240493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kXVwNGnS5IqW; Sat, 17 Sep 2022 12:36:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 118F3402E0;
	Sat, 17 Sep 2022 12:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 118F3402E0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0229E1BF48C
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C42A2607C7
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C42A2607C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kr7yPV3zJNkW for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 12:36:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EDAF6070A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EDAF6070A
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 12:36:08 +0000 (UTC)
Received: from booty.lan (unknown [80.233.62.104])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 2DF4C240005;
 Sat, 17 Sep 2022 12:36:04 +0000 (UTC)
From: luca.ceresoli@bootlin.com
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 14:35:59 +0200
Message-Id: <20220917123602.961826-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663418165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=3nW/Bfk88CjczFQNBUxlLFMZQWAfId5gbs1s3gFPPM8=;
 b=Ussu4XPb4RevcaNAj1Pp1UxtJ6xlIDm5wjh5o6anqccAtwsgae7Q6c71X5bWo7G91R5Uam
 frz6w+b3l8B1S5dCGLmnGcKmkDLlscBSul7J7JYN0I7lKIfDFz/Nbbod/LPZWXA+Kcg5Hi
 X2WrUghnMUUUeeHeD713ATGfHbsMPzMFlmQFHeLUPPkDW1IIreHGXfR8tFFPzMXQ82QWRC
 v9VYjK55/3QuDo8Dpv969AY/TGb5umPvZyotP2x6JaNFllmW6NjPmGB1SrM4X0xqT0RjKh
 WO3xLfaoG4F/n7kR7YrphtD2yKiefQNZiOdxq+cWgivPMuibhWgJ9pFkJFozvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ussu4XPb
Subject: [Buildroot] [PATCH 1/4] package/snmppp: bump to version 3.4.10
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

Changelog:

  - Fixed: Winsock has to be included before windows header.
  - Fixed: Added SnmpTarget::version_to_string() function
  - Fixed: Fixed compiler warning on MSYS2 g++

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 package/snmppp/snmppp.hash | 2 +-
 package/snmppp/snmppp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snmppp/snmppp.hash b/package/snmppp/snmppp.hash
index db3a4b5f4f0f..6dc3d39ced1a 100644
--- a/package/snmppp/snmppp.hash
+++ b/package/snmppp/snmppp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7c0aaf4ea21db082453f880cc2062a86dcbbf0ee6c8d47c72beb8e0c77c26b6c  snmp++-3.4.9.tar.gz
+sha256  d7a77fd05ecd99b25c51cbab08dfeef22a5edf2677875695c213631af59d5bae  snmp++-3.4.10.tar.gz
 sha256  61337e799c8274e596e5783b22607beea8073ee296c6b27fc5c7487296e56851  src/v3.cpp
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index bc05cad5835c..005a5a9f3526 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.4.9
+SNMPPP_VERSION = 3.4.10
 SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com/download
 SNMPPP_DEPENDENCIES = host-pkgconf
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
