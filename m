Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FF4CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF42885E96;
	Tue,  9 Jun 2026 13:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bhBPB0cnBekN; Tue,  9 Jun 2026 13:06:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 908EE85AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010360;
	bh=O6Zbj8AfRo5rVWuVFyQj9OXK1Bl7l1VJbMF3RTHvjXA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KbOkrT1b4YLkhfUJg08nO5sKePs8tIiC1LZb7rjis0QxTMJGFZhKLiFjQ5HbzdODU
	 2Nmk3GXBVPfIinUNlSkjseOdCNm0cGTCK3ftVjj8Hutt/a7j3QT6xrhTUWK/NKuBe4
	 /Yxl049ZvCNsisbvDJIrI+gbpTwaGZLPgL5nTkaWeycvLtNt8Vke2N2x9WTPQXRI52
	 ljd2F18Ae4Z2vZnNXBpr7Tut1x0Aq4TbTX1KjuJ9foC9HNVZyyaNSMrE+i/8eauzGy
	 NoGd0OjufBouBBIgoCTBWL5RQNIQsbmYofCxbklVqJGvLrHczMl3We+2o4o/UxzSKb
	 jIfq31IOQEtzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 908EE85AEA;
	Tue,  9 Jun 2026 13:06:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B1709190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9B904528A
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ly0it3NXSPq0 for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C63FB411F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C63FB411F2
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E2B587E8C; Tue,  9 Jun 2026 13:01:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 23:58:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72a022ec2c5be7552403d5199ec8bd01e3a64641
X-Git-Newrev: 6be20a5df1b8208b8d156fee292954d4738a4b3e
X-Patchwork-Hint: ignore
Message-Id: <20260609130125.0E2B587E8C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/paho-mqtt-c: bump version to 1.3.16
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6be20a5df1b8208b8d156fee292954d4738a4b3e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/eclipse-paho/paho.mqtt.c/releases/tag/v1.3.16

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/paho-mqtt-c/paho-mqtt-c.hash | 2 +-
 package/paho-mqtt-c/paho-mqtt-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
index 8ca597c4f9..59c74cd044 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.hash
+++ b/package/paho-mqtt-c/paho-mqtt-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  60ce2cfdc146fcb81c621cb8b45874d2eb1d4693105d048f60e31b8f3468be90  paho-mqtt-c-1.3.15.tar.gz
+sha256  8b960f51edc7e03507637d987882bc486d8f4be6e79431bf99e2763344fd14c5  paho-mqtt-c-1.3.16.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
 sha256  bc0f3f447097eb82a29ad6c2f4929572bb548b6bd4c9e38fde1bf131a771b7a0  LICENSE
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index acff7d5cc3..3a6a4e4b31 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHO_MQTT_C_VERSION = 1.3.15
+PAHO_MQTT_C_VERSION = 1.3.16
 PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,v$(PAHO_MQTT_C_VERSION))
 PAHO_MQTT_C_LICENSE = EPL-2.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v20 edl-v10 LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
