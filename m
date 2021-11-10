Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F46C433EF
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 16:10:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69C84611C9
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 16:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69C84611C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=live.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1605760AD4;
	Wed, 10 Nov 2021 16:10:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vksn4EK-Yi7G; Wed, 10 Nov 2021 16:10:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55DDC607BE;
	Wed, 10 Nov 2021 16:10:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A5DBC1BF318
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 16:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2A0380EA2
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 16:10:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=live.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MrSWbE6675qh for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 16:10:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-oln040092065033.outbound.protection.outlook.com [40.92.65.33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B7AF80D18
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 16:10:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NL+cGYNjHKhaW4LSjelViAZ4SBSvqvRgBFOPZ0hwXsAKwNjqG9SvNR9It+RTWobXhrIVwrV64O+nHN2GCy8u59Nc4KAGpPAajnMnEBiPj+qyacYBzaPQWwKfw7g2pEznG1gxyIf6a0mZKgSunkP2SHVQDDWBSNfyC4ZlEF3LF8RJ5TPmNej9LpY1Y8PfJ2CBA+H8ETvNoqvPPHynel6/pNqTXWrq42qx4gYmdS5k5ncSTq1ZWl23G4sOjAA5MveoVf//N0KoiHXnopCoOLXoUJJX3X/JDqvChJF/qA6+BKG8lQQgCkRS21f3ZzbSj+fxpBtlDALN+887cvVhpi5LIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyOkrYlbZQPmltr/Iwr+upvnmpWX8ZxFDahTiG/Ims0=;
 b=cL2aA435RK2DD7DinG0fOQP1HYo8ItxgdBgzrXf95zpufG6jOLuJSDcTgtmNtosM662kHS9sKvOk9/ow6COwO5OoY5ZVG3+rInxVJtbuJARB30cbGQa+7GzCzx9RIIR+ccBhZcGIIZkMAQbXxqzfA8vOQy7bPiVi53imD0F/h50WdeR49Eecf57zHxsAODcpnTRYeW7yl61xiTptzud8HXfTIp132wA5xFbzAYpNk3aom6/GCX15nMFg5xZJVuzppYZnGTfnhClrdj0uJ8uOvxM34sDMdsaozCDvzRa9CKreJ0Id6yvLiSzc/yiOEU10SuxkDjMAJM7jq8Jg1C1XEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyOkrYlbZQPmltr/Iwr+upvnmpWX8ZxFDahTiG/Ims0=;
 b=Jl7rkWIgmOz6+Qpb2XU3O2tugG5W/BpAGCBDZq1ciClYlzEzyg7ISaX2hwZoOa6AQy7fWHbtr8UeYYl51qF7ZAyKiobKraBw/oMUgbHzyZ3PBUJT+UqvvM0NZ5XkAYMtKn7g+cgGfNDC5eWU1g5VZlFQ+xo+Tt5xinvEmfYSL3fTwCDopYsmanshaKQ0Tx5MuDXQhBOGtH1E2UFEoNwn4LEXadVvGamdxXKdKALkMKgtYB17CeSPEVLq0c+miwbs+mh5c9faWO758mTZn+oK0BHjU6B3VKwmJTKp0OHqxaIaKTFx+sgGAunEdwS1nmCwjMrWuqfUUmT6nom7f/z+MA==
Received: from AM6PR03MB5622.eurprd03.prod.outlook.com (2603:10a6:20b:f7::18)
 by AM7PR03MB6198.eurprd03.prod.outlook.com (2603:10a6:20b:13e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Wed, 10 Nov
 2021 16:10:39 +0000
Received: from AM6PR03MB5622.eurprd03.prod.outlook.com
 ([fe80::c519:4480:da7:cb54]) by AM6PR03MB5622.eurprd03.prod.outlook.com
 ([fe80::c519:4480:da7:cb54%5]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 16:10:39 +0000
From: Tan Xiaofan <xfan1024@live.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH] fs: allow strip binaries when create rootfs
Thread-Index: AQHX1k1qSuL8FIpGvEOLGdiSlpjTaw==
Date: Wed, 10 Nov 2021 16:10:39 +0000
Message-ID: <AM6PR03MB56227C126CCA7748EAB48382B5939@AM6PR03MB5622.eurprd03.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: c9344286-8651-f965-303a-2722ec0b0d1e
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [9ztaxa6nIYFwKgyZzuStCLjxnD63yBTca1wBnXC5LZI=]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34fbe571-7e84-4aea-0c86-08d9a464a3a4
x-ms-traffictypediagnostic: AM7PR03MB6198:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5s68RuF1oSZCbZuHoPehfryU2jSULHgkJZfPcHhfel1KUz9NVVFdQHvKv693BE+dGicdM+O8LbvcWY1MYrajIRbrZTrKmh1kvL6oIxdMVvpGTbwfwhvjMjO+Xrd6nRAKQ4T8Da987sVUWhoWtxFREWS+Ii8EX3ajFFhJeupQ50utOyA98KnAVJfBMtOmqI/GwmHAlQQTCyMtpuZ3JOB1+E0sYfrtkKwYqyStNrLFUCMPxKLzkTlKKJf+6fhHPNb9c9gMRCNu+yQtlPMoJ+bEVZszuldcDqGPr0WmNcH22hUEfXhbudeiB4ztGrm9/KMdoii56XQ8POtTxtuN4zfj8q5fEVsIelOtPLKwgnewNI9IwKgNTcpPzPGBiDxumO0nJaxsAuM2MtWqVdn5oocBBxB5UUr+uOI7VHhs0DJIkjbgA8fTLvzSPFz9KMhOimiOZHdi5+qQKzMs2781Bv0AJBRYLrgoU8zEhXgYqBqxEBmNwwH9hfUnhz4dNz5wMCJ7pQYCJc7EQjvIZ3dchVhHfeyT0kgC4vPK2xsbUiep7aY=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: a1N8MZE98jGlwIe8Z8PFvicZRB3evGAXAGAQD8bAsUW+AenHN7NURapV+PK9DvLuqXvQKpEB0lgjQOWZsQXZm018kW6DyaBo6PC97ecZgFgraJrg+NPD4DHzmcT+QL3bq/48+YAYUX6r1v2VqUhbktAmrZykx/KxeFQT7KdSk2564pjtFnBbORgfdTmNmyUKyfjRUhKemImWoRy31ihcngc5DpfOEdGEoVbXAw3rPLi1rzSpkvK5jJNBtsMjven95Kncj72bLPCsiuJzSMZAQ4KcBGyeiUtY2Ab9nI9WuweyJq4/DnFYCNTb8ZLtxzz3292u8ljoLbVHK/tadFIa5zdruaG3NLyIn6X9LT3J5loYRbc3NE9hKuNNInMAP/rKI5R5klRqz+r+V4WY6YKqiU+0xW5jaQauBtIFAY8canLv9aw8I7SXi6knl7wZ0GoQIP5kvfz2gbSUZSZUknSFda0QaQ8NbZE9TZR5rj4RbS2EEsvh1HsY7C4Au9zXiwTJaMxaFE/tnxs0DH2XPpli+1dIC9kj8XZxHR3tAx8ABtFjnR0CbBajR2aVihr7Dwg9TFs38nIfcx0HvOy50Sa8evZxFYuFrRBqb5Rf44urA0cnBOI4M21pQJK5IjxTlxbAOVoGDeHgqEqrxpbcySv+b4VWjHypuCyCvPAMYFhxrCwoDLIuAksdKDQ+CC92qUnkO0am3t0F//JXKTWuR5t1rw==
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-e50d8.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB5622.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 34fbe571-7e84-4aea-0c86-08d9a464a3a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 16:10:39.8388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6198
Subject: [Buildroot] [PATCH] fs: allow strip binaries when create rootfs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From 2f74b5bedffdf32e71a3786ca740c82257982f80 Mon Sep 17 00:00:00 2001
From: xiaofan <xfan1024@live.com>
Date: Wed, 10 Nov 2021 23:13:25 +0800
Subject: [PATCH] fs: allow strip binaries when create rootfs

Add BR2_STRIP_ROOTFS option, it is useful when using gdbserver on
target board. Host need unstriped binares for debug info and target
need only striped binares for rootfs size.

Signed-off-by: xiaofan <xfan1024@live.com>
---
 Config.in           | 21 +++++++++++++++++----
 fs/common.mk        |  4 ++++
 package/Makefile.in |  5 +++--
 3 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/Config.in b/Config.in
index 3db2c8d..60a15ae 100644
--- a/Config.in
+++ b/Config.in
@@ -425,10 +425,10 @@ config BR2_ENABLE_RUNTIME_DEBUG
 	  Note: disabling this option is not a guarantee that all
 	  packages effectively removed these runtime debugging elements.
 
-config BR2_STRIP_strip
-	bool "strip target binaries"
-	default y
-	depends on !BR2_PACKAGE_HOST_ELF2FLT
+choice
+	prompt "strip target binaries"
+	default BR2_STRIP_strip if !BR2_PACKAGE_HOST_ELF2FLT
+	default BR2_STRIP_DISABLE if BR2_PACKAGE_HOST_ELF2FLT
 	help
 	  Binaries and libraries in the target filesystem will be
 	  stripped using the normal 'strip' command. This allows to save
@@ -436,6 +436,19 @@ config BR2_STRIP_strip
 	  on the target are needed for native debugging, but not when
 	  remote debugging is used.
 
+config BR2_STRIP_strip
+	bool "enable"
+	depends on !BR2_PACKAGE_HOST_ELF2FLT
+
+config BR2_STRIP_ROOTFS
+	bool "enable: only affects on rootfs image"
+	depends on !BR2_PACKAGE_HOST_ELF2FLT
+
+config BR2_STRIP_DISABLE
+	bool "disable"
+
+endchoice
+
 config BR2_STRIP_EXCLUDE_FILES
 	string "executables that should not be stripped"
 	default ""
diff --git a/fs/common.mk b/fs/common.mk
index afab7b5..ac261ba 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -171,6 +171,10 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
 		--exclude=/$$(notdir $$(TARGET_DIR_WARNING_FILE)) \
 		$$(BASE_TARGET_DIR)/ \
 		$$(TARGET_DIR)
+ifeq ($$(BR2_STRIP_ROOTFS),y)
+	$$(STRIP_FIND_CMD) | xargs -0 $$(STRIPCMD_ALWAYS) 2>/dev/null || true
+	$$(STRIP_FIND_SPECIAL_LIBS_CMD) | xargs -0 -r $$(STRIPCMD_ALWAYS) $$(STRIP_STRIP_DEBUG) 2>/dev/null || true
+endif
 
 	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
 	echo "set -e" >> $$(FAKEROOT_SCRIPT)
diff --git a/package/Makefile.in b/package/Makefile.in
index dae7a85..d623837 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -224,10 +224,11 @@ TARGET_READELF  = $(TARGET_CROSS)readelf
 TARGET_OBJCOPY  = $(TARGET_CROSS)objcopy
 TARGET_OBJDUMP  = $(TARGET_CROSS)objdump
 
-ifeq ($(BR2_STRIP_strip),y)
 STRIP_STRIP_DEBUG := --strip-debug
+STRIPCMD_ALWAYS = $(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note
+ifeq ($(BR2_STRIP_strip),y)
 TARGET_STRIP = $(TARGET_CROSS)strip
-STRIPCMD = $(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note
+STRIPCMD = $(STRIPCMD_ALWAYS)
 else
 TARGET_STRIP = /bin/true
 STRIPCMD = $(TARGET_STRIP)
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
