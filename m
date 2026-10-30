Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F132C606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 10:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oFCoTuU9
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA21440AE4;
	Fri, 30 Oct 2026 10:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k3uQhGLJGSh5; Fri, 30 Oct 2026 10:26:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6860740A9F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793356015;
	b=oziGLbl9bR7PsRdpI2xuOZK67cLvmiA8mhMaUol5MiD/qWrDK0Lf1b581hP5HCgsi2+l
	 Ft4AQ4W1dQ0yV/sNCOZ7FIwSJBKBbuVPa3wMP5aNcN33c81oKM61ezVkqpCKBZESYd7L3
	 05pWCu4CF3915cuFfZjEz4Nr5Kff8YLMT6h0Zkcy31WSIoV56s+fBleJC3LuMhDOLY9qv
	 Lrn04re8O0COo7U4dJbKhMWSfKlVn0MyRAd3OWVv0cpWi8E5e9RgvYZgiDYX+WcJBVLhk
	 PBpTuFF8SEhrefq3OFhkm9IqvJedZ40V/2xZMO1ZUxVkIr9l/URK9XhJwDD0xeiytrw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793356015;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FcynKRkU8+b/9AvPb+btPPhpSoJMmsXOix52cvvmT2Q=;
	b=LWDKKCH3mhAtp5lzK0/HU2ulj8jv7xiMluotiv7tqeDTgMv06OkkmzpEAeR5p6kazpVz
	 XF7EQ3U6+lHPs7kRF15SLnXf39Z5k+91wZ4hDFboF4RbxRdYJEnFfmSeVuBVUzej2yEhX
	 rlpzBPGIbU5UojyKjW9oX0CF6sRoe4X3jBfYATxDw7O3SgQRp60rjah6vfdcb4ngh4j4Y
	 8Vc05fXqloIHiBNU7QxFzoUpHVz2xa/yI+EiSjkSYtHuAMxurYlqZQr9XG7veczdXHlEJ
	 j9ae+2FdtgzVvufJ34IfS5JlCZ649K1c4XJhkxp9tsMoTRB7YSgL/HF6ZO5BlugPIyw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793356015;
	bh=FcynKRkU8+b/9AvPb+btPPhpSoJMmsXOix52cvvmT2Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oFCoTuU9/wvSpEnsXnRVreGHd369rb6tVbDQgn30+k7xl7Sev+R5oaLlBDmSXXRNs
	 cYSeVwSUKwLMLQy9LYfebTLeREbAJwn2F1s+pe4FuAjnOGoK/ATeYCHjYGOGYe2wlI
	 44Tk6wteQYfsMqkr4+6WCmrCbvwWg/8h5pmKPFFtSZxZOXVLkLC4mto0Kuyca0Cevv
	 pqciZq8ts1nPWu/1va+jv64G2Ljce8fqEsbr3FHtDKxe24W4IYgUpWFeI8HTGbm0eB
	 vmoAYzMQjPQl9ACqqAv7f7wDrHaru1aWzv+Qb+o74ikkg01Duvh1wgzMnEARzfirKz
	 WC10NZv/DK5Jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6860740A9F;
	Fri, 30 Oct 2026 10:26:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D0452C7
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 10:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2350340A8C
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 10:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lByUJ74sKZVQ for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 10:26:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CCCFA40A90
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793356012;
 b=TwQnaT9LbnIVtvJkI6NfkkPBZInoBDBX3680Nr8obfOQaObsohTppJqAoZXRN6wsz62k
 PJVQArlq58Izfl0DJk4ArwC6kE571XadbDhab4fPWK+xw6IH9pQG9GE9erSl8fBt4GGQ+
 9GwhbmHdbjcvJpAX7c6rfTmF4HV7/6BSaGjkkVRIn4B1A4qMshvoF3ufGu0lcf4YN9JE8
 xocr5Tmbenel/01DhOaltBkWUULA3JLU7Yq+x10ToadsV6QFwws1qIroCiX2gXMLrsUOn
 qwqMR5hW5zxwH/ztuabcrp+9p5lWDz8lRvHuPjZSZBQ7XwoCrSa6Mz4nfd8ic5Ii5VQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793356012;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=FMt4VykRd8S9fYCweCBhAfKLH98Hn9Re9HCSPwF8Sjc=;
 b=MTncosWZHzKw+tp66EkhH1J6JcyZveyDDFCpWo5UEoDFnqlpZE1/VFuzTX/OGZRJiFnL
 J/qtaZ1IS3LZkcQ7SjchboWHKa8y2LY5lnqnpiQzTRIiDZ22Oq7sQUjokIhjsptEJz4w5
 zXKe1yjqNdS1YqP/ZwSZIZyL1ROvEVZqO8nFDB1cNobtuqUH/abCVpNdk/1hrI4DGDkEW
 ETjIwCTFv21qMOtOqjd5X7j3ybBWy/HCtLEOYWWNZaWOyuVzSLqeDakN0c0rcFTRINmiC
 hCvZunqOlg3GwHAHPMFzko+0sfqezmOlVBx8qk4JT4+GlyAI53KW3nTfMaqjWu7wZKA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=zKkl475c; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::630"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCCFA40A90
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 10:26:51 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-c468bd799ecso59870266b.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 03:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793356009; x=1793960809;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FMt4VykRd8S9fYCweCBhAfKLH98Hn9Re9HCSPwF8Sjc=;
 b=aVvUN9He5WyQSZQ6XJWx6EXw8h3yEbTwD6FOTovEhx+M2c+KhDa2OaNqckYqfRF6P7
 Ief/7xiw9qiSCPVvu5tUgCxY53hT8B3h0YEOM0126YDk8yZfLvMfuUHpOSoLG5gNUuju
 8URf23FJAMzbX2G517n+54YwhoX29A5g2XoVZlpCCqVPe+MH1Az7E+MzIxx6PUZOYOEo
 GO5F7nfbplYPSh8u0caZ7E/Ztdys42UfGjAELRFI5kLuJGRBLkssFXRpye3c/TmntbOa
 A2WkXtWUBFpLi6kKKT3NesD99SNzcNhKzSLjy2j8gDy3GMrmTuQ5OSd7KKaV59eVch8C
 QrrA==
X-Gm-Message-State: AFq9FYK6e7VwaIjU8lMnuCvbguv21f1QnDiPdu9uzo325MAtolhbUh9l
 zxQi4OlU1VjIEe/2SiZFgo1TvgHNXRYAEsEz+n3Sm36/BUynWvtcKI/gs5g4qw==
X-Gm-Gg: AYBFou2dbLTVInrhrp9atcY3l5BUQ50Dsg5PJ4hA2ZVniEo/MZHYjhIULJ+5pDoNMSI
 06IXAqvtA6Q8fibnxR0M7Edu09Wh9Lk5CxRWX5GUGQGpnqe0RXlAJbnutW4Drd2dZaRWhotmLgG
 rhlClXmzVkVTHiMK8fwfL7wLj8GKch8XZtDnkQJTUffY1bsO1HXDRD04pDAlYlVAQ6FsFVxp3Ck
 Taxkk8JWNfYmlsksNs3lQuP3hUMwd0GxhE0w7MGElMRvdvfcTqQ9fJEqCrqx25rrjpDd1cYpsRA
 +3uUMcFlamr0alm+FX9wUY6jdVqX2SCcbOlGUneVhkf+5DX3BcmoyBclcJGUdmhIsbITGpBoW6a
 n0P0zKXa7hjLztiIh/oz66y/71mzdsx591Vv4wzCbRI0jhx8lKTqUAYJvOFSmLsw22kSEmcvKFM
 T2oenNZ+Pt2Ru0Q29B0+BDX3aM9D4iYJxP6Sj5EbjDqawnKArjnBcq7xJMoKE2JqtbG9spXIdsO
 oO6RC71bkj0uTNGZcC0O3697dpuF22PydWwxUqy+97mxsYVjTb2g5JIOyPWzPstUi6ctMaDWDES
 PAJHVlv6vM/H2XUmn6PqNEI4WKz3cSxBDYidwhSZlPOiQBO+ypsqA2gsgldZ2+/VUdAmfK0vImQ
 m3b+K6zK8
X-Received: by 2002:a17:906:ef06:b0:c41:1e13:8891 with SMTP id
 a640c23a62f3a-c4ca7a43c0fmr167022866b.9.1793356009166; 
 Fri, 30 Oct 2026 03:26:49 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b4d7ae6c7asm479199a12.6.2026.10.30.03.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 03:26:47 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 30 Oct 2026 11:26:47 +0100
Message-Id: <20261030102647.927989-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/open62541: bump to version 1.5.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release notes:
https://github.com/open62541/open62541/releases/tag/v1.4.0
https://github.com/open62541/open62541/releases/tag/v1.5.0
https://github.com/open62541/open62541/releases/tag/v1.5.10

The UA_ENABLE_PUBSUB_DELTAFRAMES, UA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS
and UA_ENABLE_PUBSUB_ETH_UADP CMake options were removed in 1.4.0: the
information model methods are now always built with the PubSub
information model, and Ethernet support is part of the POSIX event loop
on Linux. Drop the corresponding Buildroot options and add legacy
entries for them.

Since 1.5.0, event monitoring (UA_ENABLE_SUBSCRIPTIONS_EVENTS, enabled
by default) requires JSON encoding, otherwise configuration fails with:

  CMake Error at CMakeLists.txt:955 (message):
    Event Filter Parsing require JSON to be enabled

Enable JSON encoding by default, as upstream does, so events stay
available as with 1.3.x, and disable event monitoring when JSON
encoding is turned off.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 Config.in.legacy                 | 22 ++++++++++++++++++++++
 package/open62541/Config.in      | 29 ++++-------------------------
 package/open62541/open62541.hash |  2 +-
 package/open62541/open62541.mk   | 25 +++++--------------------
 4 files changed, 32 insertions(+), 46 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 29c9b7f9e7..185160f1b7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,28 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_OPEN62541_PUBSUB_DELTAFRAMES
+	bool "open62541 pubsub deltaframes option removed"
+	select BR2_LEGACY
+	help
+	  open62541 no longer has a separate option for PubSub
+	  deltaframes since version 1.4.0.
+
+config BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL_METHODS
+	bool "open62541 pubsub information model methods option removed"
+	select BR2_LEGACY
+	help
+	  open62541 always enables the PubSub information model
+	  methods together with the PubSub information model since
+	  version 1.4.0.
+
+config BR2_PACKAGE_OPEN62541_PUBSUB_ETH_UADP
+	bool "open62541 pubsub ethernet option removed"
+	select BR2_LEGACY
+	help
+	  Since version 1.4.0, open62541 always builds PubSub over
+	  Ethernet support as part of its POSIX event loop.
+
 config BR2_PACKAGE_MESA3D_OPENCL
 	bool "Mesa3D OpenCL support is now provided by RustiCL"
 	select BR2_LEGACY
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
