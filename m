Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D34606A333
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 22:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kzzcwwy0
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E34B180CE0;
	Sun,  1 Nov 2026 22:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A9j1LdLEpG6S; Sun,  1 Nov 2026 22:32:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BC64980D6F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793572326;
	b=PymLaJsQG0D99GIK4YcjtfC/oKWYop6Fp+kqOkeSIGwghFg1SXlPW5Gzjhx2Rr+5P5hT
	 eaTfVn/Q9HhwMn5DJBCtwlOuS/zXDx1Pw1CmHyHpHLb3d6dkAwrwY6uqLfMS7s9hKpqXt
	 gJsfW4OrPwYzKHqRt74BewlcN4qO5NYSkLiRjYC5EWgU+A9RpIJ6Yg87WHIWlGKchZpnA
	 QWAInTP/B20DR1Vk4FNKkDzpI/Vx316udp79Mf7CHRmNRGrvDKgj38eYQQOR3vdOSGkHM
	 Xy943QSJXYyDT3SBZUm4hHOten4b7nYZcz00/yqUNy8oOYccH4O+2dYI6iUyKQE1P7A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793572326;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9QmPiKjJYZWmb9N06IjabNhQyfmkYeYNqX7amaoq/qI=;
	b=FlTXs4JZ9B+GibfTb4MyTczFpLUQ1tuM0TkR2Vy7RkMc5awEYa7UwZnaQqAN+FZTohRt
	 SMlW20A+MvnK2JF7FNBYvtVBers5lmdUjYKmeOWNPi0OuZ4QWEHh4pSv/7R/F84FuIdVE
	 VXyhgXndBYuTpTep+vicj60S1xMlm0rz7wqiInM2R7nHm8W0TE73HRWpI41w1uzsfcBYK
	 uLkRCkCzyTf3uyMq2ELcAxd1+603VHS0f+30hDzYnh6OB1+QyojskOdoGkHR0i1WvqU4u
	 KCki+1jn7H1FN+lPVBIUzspqaxk7HDhlHBW93N2bHenQlyBANV14n8GZX1fP98M3kCQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793572326;
	bh=9QmPiKjJYZWmb9N06IjabNhQyfmkYeYNqX7amaoq/qI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kzzcwwy0npfSqFgDjgG3QaP3CCPW4LMizmLQM2b4eJIpUccIxPw1pPne/ZYWeQfyg
	 TD/slKC2vZRGFgIRX/gLb9a548mQrCGYAu9j4Tuixx2VYIjZckTJ/SAwLdig/LNWnY
	 uLAubxq3JY2XoYFquOMULxRQeYtzxfjl9mZAzN1q8H9mavYfAMwsPsRBgYUivQor4O
	 qqG9uQeZX5NIoXU6hKPoE8OyyA+JHpreHfJ2IzLsYm4MmXKds+MSmzFONKktuhJ2eu
	 tKB3k1IkLzT6rRoQAHoldWzzNHox2jQiTjgleLmwn37TvzUXpOkH+KibMg0LwQqnpf
	 k6VgSNvsCxG9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC64980D6F;
	Sun,  1 Nov 2026 22:32:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98D94435
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E45540086
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yH7v8Hu2YCoZ for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 22:32:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org ABFD240042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793572323;
 b=aL45GC3Kc3iFwbIz74Ts4oZeCVIUPX6t1jmyDKALnJF8+vQOXYa6RPKVbhA5p86VTexG
 lv309qmm86ipp8reA5d5NlX+dC2zlriksO47TsX7cmcivZ9+wriOYX8wr3NwMW+w1oHbN
 6118K1a1qw/4Ix6ekyVcIQvDOfDVKvd0uQxcsxZI8joy6JJGaTTs1VVvsNNEefaEjZYry
 MEUyn4bm051kLwgwPkx63iqpLWjmi0fxG1N7IIegVR7QBPyeUvjI3jFF1/TARuTJzRKJV
 5CyO3eOr+K1tWK1dPW4sN1vn7xx7s75yA/lijntMLllSAZEqQJ/d7vymUwDr//B+8qQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793572323;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=daSzX1OF4tecgXkiVrLVtu5mhHziBQu/+N3WNGiVqhU=;
 b=NgbLq21ziiagGApPG43JzUvk2AOJ6Vb4D91+pOLnSBEH7VkXmGZbI9f7398J2ixFtSXQ
 1MohuoZEbv51ozYikdvvnoGDGRe86spLnJF9jnMwW6T1gVOcqzuIF0rK4AVou9JlcWbwS
 8Q745hynLa9Plr0Ip8qCvDkuECPnKxrTkny12bLSIRPQYHlIqA8tOkvK8Yykv//GMwI4j
 F1X43f57vlI5pzNUWIdJYYnm6OMn4GYmLWo4kMEVYQWdg3plGsvj5AOsz4C5BiNlrddHV
 uByM8WgIR5xoMQUc7oJEjvPxIgdFpq23NJovYmhnfVQBP73ikwv8JqOMFDVnOajjgTQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABFD240042
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:32:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C9E79D5AD; Sun,  1 Nov 2026 22:30:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 23:27:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3095fe471f6aebd218a669eebc8b717d71f7f13
X-Git-Newrev: 84ab6812ac661e0f4aaf0a2ab00b54ea8f50ae40
X-Patchwork-Hint: ignore
Message-Id: <20261101223034.4C9E79D5AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/open62541: bump to version 1.5.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/84ab6812ac661e0f4aaf0a2ab00b54ea8f50ae40
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/open62541/open62541/releases/tag/v1.4.0
https://github.com/open62541/open62541/releases/tag/v1.5.0
https://github.com/open62541/open62541/releases/tag/v1.5.10

The UA_ENABLE_PUBSUB_DELTAFRAMES, UA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS
and UA_ENABLE_PUBSUB_ETH_UADP CMake options were removed in 1.4.0: the
information model methods are now always built with the PubSub
information model, and Ethernet support is part of the POSIX event loop
on Linux. Drop the corresponding Buildroot options, no legacy options
are added since those features are now always compiled in.

Since 1.5.0, event monitoring (UA_ENABLE_SUBSCRIPTIONS_EVENTS, enabled
by default) requires JSON encoding, otherwise configuration fails with:

  CMake Error at CMakeLists.txt:955 (message):
    Event Filter Parsing require JSON to be enabled

Enable JSON encoding by default, as upstream does, so events stay
available as with 1.3.x, and disable event monitoring when JSON
encoding is turned off.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/open62541/Config.in      | 29 ++++-------------------------
 package/open62541/open62541.hash |  2 +-
 package/open62541/open62541.mk   | 25 +++++--------------------
 3 files changed, 10 insertions(+), 46 deletions(-)

diff --git a/package/open62541/Config.in b/package/open62541/Config.in
index a5c07d5043..024067f6bb 100644
--- a/package/open62541/Config.in
+++ b/package/open62541/Config.in
@@ -71,25 +71,18 @@ config BR2_PACKAGE_OPEN62541_DISCOVERY
 
 config BR2_PACKAGE_OPEN62541_JSON_ENCODING
 	bool "json encoding"
+	default y
 	help
-	  Enable JSON encoding
+	  Enable JSON encoding. This is also needed for event
+	  monitoring support.
 
 config BR2_PACKAGE_OPEN62541_PUBSUB
 	bool "publish/subscribe"
 	help
-	  Enable the experimental OPC UA PubSub support. The option
-	  will include the PubSub UDP multicast plugin.
+	  Enable the OPC UA PubSub support.
 
 if BR2_PACKAGE_OPEN62541_PUBSUB
 
-config BR2_PACKAGE_OPEN62541_PUBSUB_DELTAFRAMES
-	bool "publish/subscribe deltaframes"
-	help
-	  The PubSub messages differentiate between keyframe (all
-	  published values contained) and deltaframe (only changed
-	  values contained) messages. Deltaframe messages creation
-	  consumes some additional resources.
-
 config BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL
 	bool "publish/subscribe information model"
 	depends on BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_REDUCED || \
@@ -98,20 +91,6 @@ config BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL
 	  Enable the information model representation of the PubSub
 	  configuration.
 
-if BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL
-
-config BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL_METHODS
-	bool "publish/subscribe information model methods"
-	help
-	  Enable PubSub informationmodel methods
-
-endif
-
-config BR2_PACKAGE_OPEN62541_PUBSUB_ETH_UADP
-	bool "publish/subscribe UADP"
-	help
-	  Enable publish/subscribe UADP over Ethernet
-
 endif # BR2_PACKAGE_OPEN62541_PUBSUB
 
 endif
diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
index 3beead1a20..fcf8f26412 100644
--- a/package/open62541/open62541.hash
+++ b/package/open62541/open62541.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a8719f299505b144bd68bf557ad0b023fa28faf8862ff2d0b171381c8bd278c3  open62541-v1.3.15-git4.tar.gz
+sha256  6c218091f334fc458126635d0c7c3106b47b8f6fedd6c648defe06950654380f  open62541-v1.5.10-git4.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 8d9c5e44bf..ac0a33bf87 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN62541_VERSION_UPSTREAM = 1.3.15
+OPEN62541_VERSION_UPSTREAM = 1.5.10
 OPEN62541_VERSION = v$(OPEN62541_VERSION_UPSTREAM)
 OPEN62541_SITE_METHOD = git
 OPEN62541_SITE = https://github.com/open62541/open62541.git
@@ -58,7 +58,10 @@ endif
 ifeq ($(BR2_PACKAGE_OPEN62541_JSON_ENCODING),y)
 OPEN62541_CONF_OPTS += -DUA_ENABLE_JSON_ENCODING=ON
 else
-OPEN62541_CONF_OPTS += -DUA_ENABLE_JSON_ENCODING=OFF
+# Event filter parsing requires JSON encoding
+OPEN62541_CONF_OPTS += \
+	-DUA_ENABLE_JSON_ENCODING=OFF \
+	-DUA_ENABLE_SUBSCRIPTIONS_EVENTS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPEN62541_PUBSUB),y)
@@ -67,30 +70,12 @@ else
 OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPEN62541_PUBSUB_DELTAFRAMES),y)
-OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_DELTAFRAMES=ON
-else
-OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_DELTAFRAMES=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL),y)
 OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_INFORMATIONMODEL=ON
 else
 OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_INFORMATIONMODEL=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL_METHODS),y)
-OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS=ON
-else
-OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_OPEN62541_PUBSUB_ETH_UADP),y)
-OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_ETH_UADP=ON
-else
-OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_ETH_UADP=OFF
-endif
-
 # Remove unneeded files
 define OPEN62541_REMOVE_UNNEEDED_FILES
 	$(RM) -r $(TARGET_DIR)/usr/share/open62541
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
