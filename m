Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2BECCF9F8
	for <buildroot@archiver.kernel.org>; Fri,  7 Nov 2025 12:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39D9C6133E;
	Fri,  7 Nov 2025 12:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xU00uCbBSzt3; Fri,  7 Nov 2025 12:09:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57A6561393
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57A6561393;
	Fri,  7 Nov 2025 12:09:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1952C93E
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 12:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B89C40594
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 12:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Bl9XdvtZp_F for <buildroot@buildroot.org>;
 Fri,  7 Nov 2025 12:08:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8E62F40582
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E62F40582
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E62F40582
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 12:08:58 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.111.117]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MjjCF-1vxFjv0Jch-00cXTI; Fri, 07
 Nov 2025 13:08:56 +0100
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>, Julien Olivain <ju.o@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Fri,  7 Nov 2025 13:08:44 +0100
Message-ID: <20251107120844.582160-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:EAn5/wFkXp3MqXgLONNK4LiAzpzQV3OvQ0uXaPVQy1l92bZzZzv
 YFxqz6Ek2Vk7F96hgn8G1jDkzk5eWErgW4TDD6o/s0yOik+69KjNOVQ84SO5sAVrVGGQw8B
 BYOfux2JILeU2pHLFq8jS9MwzN4KwVgk74yer5wIGsiUWSuak5E0nn8J+9pBxLUl8fa6TiL
 enR0eVj3PKr1TpVALdwLQ==
UI-OutboundReport: notjunk:1;M01:P0:mX3Brw5JHr4=;iXI08YRpq/S27YOLm1faV9ALJ36
 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
 Ih9P4SmXWkbv61vU+sb3jfv4ry6Si
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1762517336; x=1763122136; i=fiona.klute@gmx.de;
 bh=9CooXFugy0NUvceEdP5CiClI+qV+LCy2M5YjS4XhJwk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=fTvuqbRZMb2ELeh7kNs8ZJXuUyhrV6LJfqe1JVnuQ4VUqjl5kP8ZYLJUczXxz0mL
 WZ5BtP2NWCn5DWyyzfPnYKwmZIQrr01YbvbHNsJbTYvPG24ajzlGPitu5+BHZZFQh
 NXHov+eEQv4cJqloYoel0nefZ3SbPo30ShhO/Xs7/l9Yt8Yg1OajzkhYdSUMBZ70W
 agF/2NCCk4SUKy3HqR2WGvfWjNCstGbrHHULhS4LRtrTCl/XD3eSgIf+BTZ2hOPkR
 GCpDux4NWntYXJrLePJY2IMa29xrVcur88cUG13S7MNq05Tm0K9SpMF8AnTFbVb3e
 ed9YzqNk109B4Ha6HQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=fTvuqbRZ
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: enable all hash
 algorithms if FIT support is enabled
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This allows using any of the hash algorithms supported by U-Boot for
checksum (hash-N) nodes when building a FIT image, instead of only
SHA-1 or SHA-256.

Fixes: 14a0169714cd5c35be40faadc066412f144bc1a6 "package/uboot-tools:
Bump to version 2025.10"

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
This is a follow-up to the discussion here, with the simplest possible
solution of "enable all supported hashes if FIT support is":
https://lore.kernel.org/buildroot/3c366bcd-29ce-49da-a077-dda299470e3b@gmx.de/T/#mf34b24e239e9ae3c698c0e328ec3545a904ce78b

 package/uboot-tools/uboot-tools.mk | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index dcc9c08fd2..37ccd7b953 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -17,13 +17,21 @@ UBOOT_TOOLS_INSTALL_STAGING = YES
 UBOOT_TOOLS_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
 HOST_UBOOT_TOOLS_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY) host-gnutls
 
+# the available hash algorithms and the way to enable them are the
+# same for host and target
+UBOOT_TOOLS_HASH_ALGOS = CRC16 CRC32 MD5 SHA1 SHA256 SHA384 SHA512
+define UBOOT_TOOLS_ENABLE_HASH_ALGOS
+	$(foreach hash,$(UBOOT_TOOLS_HASH_ALGOS),\
+		echo '#define CONFIG_TOOLS_$(hash) 1' >> $(@D)/include/generated/autoconf.h
+	)
+endef
+
 define UBOOT_TOOLS_CONFIGURE_CMDS
 	mkdir -p $(@D)/include/config
 	echo "#include <linux/kconfig.h>" > $(@D)/include/config.h
 	touch $(@D)/include/config/auto.conf
 	mkdir -p $(@D)/include/generated
-	echo "#define CONFIG_TOOLS_SHA256 1" >> $(@D)/include/generated/autoconf.h
-	echo "#define CONFIG_TOOLS_SHA1 1" >> $(@D)/include/generated/autoconf.h
+	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
 	echo $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),'#define CONFIG_FIT_SIGNATURE 1') >> $(@D)/include/generated/autoconf.h
 	mkdir -p $(@D)/include/asm
 	touch $(@D)/include/asm/linkage.h
@@ -115,8 +123,7 @@ define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
 	echo "#include <linux/kconfig.h>" > $(@D)/include/config.h
 	touch $(@D)/include/config/auto.conf
 	mkdir -p $(@D)/include/generated
-	echo "#define CONFIG_TOOLS_SHA256 1" >> $(@D)/include/generated/autoconf.h
-	echo "#define CONFIG_TOOLS_SHA1 1" >> $(@D)/include/generated/autoconf.h
+	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
 	echo $(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),'#define CONFIG_FIT_SIGNATURE 1') >> $(@D)/include/generated/autoconf.h
 	mkdir -p $(@D)/include/asm
 	touch $(@D)/include/asm/linkage.h
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
