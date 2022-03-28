Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D81BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 20:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B53F401A3;
	Mon, 28 Mar 2022 20:23:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w7HzqL17Jtmh; Mon, 28 Mar 2022 20:23:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F94240183;
	Mon, 28 Mar 2022 20:23:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF76A1BF28D
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 20:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE28C83E4A
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 20:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JZddLRw9o6_E for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 20:23:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDF6683EFA
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 20:23:05 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d7so21977231wrb.7
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 13:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=378iciaeRgaw+Xt3iQCQ5AsX7nR7DJv/r4ajheNfy30=;
 b=CGdv6RxfMM0EAOKrpupsHX7Jr1aLn/15X/7YMQB6aJmbHaFgQGXWDvaLA4sG1en1YH
 upcK+OxNG9K61G+XYzMytaL8v+SDidkMNJYVIbnAZV7LXSLGF+Vo6C1rgE8r6gjs8ClX
 SB7nAT8yrMdx7JBgJ+zkyItROrxkL65IlmzJYS8h2caqAWP7BB5PKRTCU/jVdomWESKy
 7fLDA8eBDO04ZzyPODAs5dfNdIX0i5NsBMb235f+6M1gGfdFa/DFAgxdESG4pUbShEJc
 EMjYJ7+sEbJamHvk1wX1g4jEjH23hwj3iRALhlAUFU7yuxbflxeOhDjgUmbjfH6UmjwC
 +nMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=378iciaeRgaw+Xt3iQCQ5AsX7nR7DJv/r4ajheNfy30=;
 b=26lAMNuR+Jsd/bn3ItTs18pvf5UlQ2R0qVgV4FFW/k54arGmCvhUjlKVS77fIzx33e
 mXvXuPfVAzsHjGs47tAI2DuwHiBKUqsdIAOVn34vQxViNGSUvh3f6JANS1gUdfuG1r7T
 uiKYan1LB9nyfETzYQPTId42pXGeJ0t+hwX7UEmd0+JTnp32JD1IlGUukwqAPGhQyOY5
 24JfhmktwfeV+1ALbIrtXGVpJR77RdBUYr0yhaJcaNS3XyYb5WGZJQa8sI2H4EEOAOQA
 FxKSJzcZ5oY5nusHbyE4Q0o2AKFkkaDxKcQk0GfCjynivJ01WoFdEYg8hFGHeAS1qu5x
 UYag==
X-Gm-Message-State: AOAM530YulMMNIHJghZJupy3Ojr/7IIaJizLXjJsKhvMrRTvm4Abl3Iq
 HMWGw4QFTTVjezUvSBnUvcbPYOxlxtc=
X-Google-Smtp-Source: ABdhPJwzM2Usw0ilz5ZGmvk83kAUU0jblnPytuZaiJw/Wfa53UQW53AN/o5p9wX8A4rCs6RS+pAUhg==
X-Received: by 2002:adf:cf12:0:b0:203:f917:82ba with SMTP id
 o18-20020adfcf12000000b00203f91782bamr26708543wrj.538.1648498983859; 
 Mon, 28 Mar 2022 13:23:03 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d4e08000000b002054b5437f2sm12832203wrt.115.2022.03.28.13.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 13:23:03 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 28 Mar 2022 22:21:36 +0200
Message-Id: <20220328202136.7182-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: bump to version 1.3.10
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Service release. Issues resolved:
https://github.com/eclipse/paho.mqtt.c/milestone/17?closed=1

https://github.com/eclipse/paho.mqtt.c/releases/tag/v1.3.10

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/paho-mqtt-c/paho-mqtt-c.hash | 2 +-
 package/paho-mqtt-c/paho-mqtt-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
index 4cdedfbf9a..931bf5b9c8 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.hash
+++ b/package/paho-mqtt-c/paho-mqtt-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  386c9b5fa1cf6d0d516db12d57fd8f6a410dd0fdc5e9a2da870aae437a2535ed  paho-mqtt-c-1.3.9.tar.gz
+sha256  c70db96e66adacae411d5d875fbb08bca6ff9945de3d215b3af93cbd22792db5  paho-mqtt-c-1.3.10.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
 sha256  bc0f3f447097eb82a29ad6c2f4929572bb548b6bd4c9e38fde1bf131a771b7a0  LICENSE
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index 68b58f2e02..d6356a7ccc 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHO_MQTT_C_VERSION = 1.3.9
+PAHO_MQTT_C_VERSION = 1.3.10
 PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,v$(PAHO_MQTT_C_VERSION))
 PAHO_MQTT_C_LICENSE = EPL-2.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v20 edl-v10 LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
