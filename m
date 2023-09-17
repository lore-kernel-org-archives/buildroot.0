Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE94CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 09:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5CD860BE2;
	Sun, 17 Sep 2023 09:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5CD860BE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MMU1B223X59r; Sun, 17 Sep 2023 09:14:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 259D160AA4;
	Sun, 17 Sep 2023 09:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 259D160AA4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F97A1BF2B1
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 09:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35DAE60AA4
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 09:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35DAE60AA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tkxMe6k7CUyn for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 09:14:08 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FEFE60A9A
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 09:14:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FEFE60A9A
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id AC497C63A0
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 09:02:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA8751BF203;
 Sun, 17 Sep 2023 09:02:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@48ers.dk>)
 id 1qhnfa-00BbrH-Jn; Sun, 17 Sep 2023 11:02:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 11:02:20 +0200
Message-Id: <20230917090221.2767084-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH] package/asterisk: security bump to version
 16.30.1
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security vulnerabilities:

CVE-2022-23537: Heap buffer overflow when decoding STUN message in pjproject

Possible buffer overread when parsing a specially crafted STUN message with
unknown attribute.  The vulnerability affects Asterisk users using ICE
and/or WebRTC.

https://github.com/asterisk/asterisk/security/advisories/GHSA-4xjp-22g4-9fxm

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 98ee3bdc71..41e1da2962 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  9b93006a87be9c29492299118200e4f66c8369851c66a50fdef5b15dfc4eb2c2  asterisk-16.29.1.tar.gz
+sha256  ef1ddc07dc02bb0c5f5ba58a5e42e42bcb63e55ac94199be8e3b5d3910f43736  asterisk-16.30.1.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 22ac0334fd..4f1a80ba8b 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 16.29.1
+ASTERISK_VERSION = 16.30.1
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
