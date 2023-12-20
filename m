Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E222C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 18:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D353E6108E;
	Wed, 20 Dec 2023 18:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D353E6108E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PL1NylxkME95; Wed, 20 Dec 2023 18:39:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32D96613B2;
	Wed, 20 Dec 2023 18:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32D96613B2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 54D3D1BF3BD
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 18:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D75661534
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 18:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D75661534
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IPyevbYede07 for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 18:39:40 +0000 (UTC)
X-Greylist: delayed 581 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 20 Dec 2023 18:39:40 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 608DC6108E
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 608DC6108E
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 18:39:40 +0000 (UTC)
Received: from allenwind.lan (unknown [IPv6:2a02:169:3c22:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id B1B945C9B10;
 Wed, 20 Dec 2023 19:29:55 +0100 (CET)
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 19:28:51 +0100
Message-ID: <47f41c5f59356bcda28bf1ed0c8046241876b21c.1703096871.git.stefan@agner.ch>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1703096995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=s72IiywAHMflOdF9HIOnoM2VPHTCWK32tMY1hzua0rY=;
 b=jEJ0adbIV6ahGs3McqBs/WaQEEr92xcxLavyMMc9P7bNgS0e69Oj8W9NFq5xnU9bPDdCgu
 hIIpFKyl6KnPm/xKFeGBcYiaimaMHlwKKfjBTMunx/11QhVlbBpJWqK/KdiAzVHOH6ln5g
 jNJ6QXRT82dQkoexzoR0Mx5Ojjtp4Zo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=jEJ0adbI
Subject: [Buildroot] [PATCH] package/dbus-broker: bump to release 35
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
Cc: james.hilliard1@gmail.com, Stefan Agner <stefan@agner.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This release supports the new `ProcessFD` key in
`GetConnectionCredentials()`. It also contains a fix which avoids
using randomness during early boot besides other fixes.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 package/dbus-broker/dbus-broker.hash | 2 +-
 package/dbus-broker/dbus-broker.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus-broker/dbus-broker.hash b/package/dbus-broker/dbus-broker.hash
index 06c8f229b7..7adf04f2dc 100644
--- a/package/dbus-broker/dbus-broker.hash
+++ b/package/dbus-broker/dbus-broker.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  23713f25624749fdb274907e429080fa2d8f4dbe76acd87bb6d21a3c818c7841  dbus-broker-33.tar.xz
+sha256  d50daa31ff33f48693194596ea2aeb1a925183b59cdc82a550774e5c43982252  dbus-broker-35.tar.xz
 sha256  3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4  LICENSE
 sha256  20ea1f96abc15553695c6725bb3dcabff4b43b85b7ca7d675a2b8860e3b01f87  subprojects/libcdvar-1/AUTHORS
 sha256  8153c478102dc209b30dd4627cf5bb3596263f99692bf3eec174b1e17bbf8a3b  subprojects/libcdvar-1/README.md
diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
index c4e3679a2e..f3d1ac6840 100644
--- a/package/dbus-broker/dbus-broker.mk
+++ b/package/dbus-broker/dbus-broker.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_BROKER_VERSION = 33
+DBUS_BROKER_VERSION = 35
 DBUS_BROKER_SOURCE = dbus-broker-$(DBUS_BROKER_VERSION).tar.xz
 DBUS_BROKER_SITE = https://github.com/bus1/dbus-broker/releases/download/v$(DBUS_BROKER_VERSION)
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
