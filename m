Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFCCC54E41
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 15:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93F7260E81;
	Tue,  5 Mar 2024 15:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zm2k1Bmd_UcA; Tue,  5 Mar 2024 15:40:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A57060E3B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A57060E3B;
	Tue,  5 Mar 2024 15:40:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB6AA1BF2C9
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 15:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D30CD41777
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 15:40:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yvkZayZcEjoU for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 15:40:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0F60641765
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F60641765
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F60641765
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 15:40:11 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33dd2f0a0c4so3366090f8f.0
 for <buildroot@buildroot.org>; Tue, 05 Mar 2024 07:40:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709653209; x=1710258009;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=50XtkFpBLE/kl6YoY9Y7MU86m/tZrUjgu/MxVfbNt6k=;
 b=mJuxgFjNAJ72MTdpXRuVrbm82SzkMLFwnpQaTLmV/Q79N0R1BN/Ugmr1hykMBZpAoo
 3TV0On+0HBEr7Zz4FZcsyPjl9BJsNgGOkp7x40sM9zrdGeKPextN/+skEiDozrbHfee3
 ojupHLQlcJSBL6HcYvonhRmUAVFqzfjVaz2uu0Lzz533JbpDXF5Z5xLMKZHfDpY99ix/
 BFaZnh6YstImc42mj/8DsaaBOhaUpdL+8QFqBKvC3g16pJpQtbwjBx24YNfbzLD5TMRF
 FmZ58XiSxFELaNgXUeit+AE0NKvGsk/dbc5jJ93itPwmK0fdbL73ArafgXZluRGqnMrR
 xfZw==
X-Gm-Message-State: AOJu0YwDlS7i/UR7wUZhFAEEXfGuxZXCVNxVc0aamLXasx/ewCnPl8I/
 OqBCqAJhjQRbGc6WNP2PvsPeSimQdr6491eq/SF+m8VxZ1MbZ69VazLbq2Db
X-Google-Smtp-Source: AGHT+IGeXh+sfeKbckb5UXFhZ7SAzUtOG3oQ9zqulCfHg069B0NXu+pP7cwl8Pb8lVqIxKevE9135w==
X-Received: by 2002:a5d:5889:0:b0:33d:f56e:f867 with SMTP id
 n9-20020a5d5889000000b0033df56ef867mr12769547wrf.67.1709653208815; 
 Tue, 05 Mar 2024 07:40:08 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bu28-20020a056000079c00b0033dc7e50488sm15610931wrb.96.2024.03.05.07.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 07:40:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Mar 2024 16:40:03 +0100
Message-ID: <20240305154003.1756299-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709653209; x=1710258009; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=50XtkFpBLE/kl6YoY9Y7MU86m/tZrUjgu/MxVfbNt6k=;
 b=mrP1pE2XEMvWlOfiU22QMerA6+9esG0pIA75kmgaDuy54Nvujnvg8lPN9FYeo5pCr+
 bv3nPrH95NqKq7YgWR63gLvSiKN0aJaGKj2y1mKrdTH25mcxvT43BYtUQnBhiglNtaLG
 Hl9xw8zW9s7SCFDL6XF0Pxvx+5i1aJgZziVQFTjyNJWP6w6E0pToB1FeZGsB1NKngrGx
 cDS9E0XyIce5UoCg/jGiFG5NlODS753Mrqk5IxiM/b7gOZiTrlaP5F6+51gmi1ZtDW13
 C8KkrzE7X0mq+LeaKzNz+FiFvZYF2kvsig15ScIDZvxftWmYN3ymjLLVy5uPM6pCpSoM
 MBew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mrP1pE2X
Subject: [Buildroot] [PATCH 1/1] package/php: add libucontext optional
 dependency
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Select libucontext if the toolchain doesn't support ucontext to allow
building php on musl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php/Config.in | 3 +++
 package/php/php.mk    | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/package/php/Config.in b/package/php/Config.in
index 69b4268c1d..af8574ac75 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_PHP_ARCH_SUPPORTS
 	default y if BR2_RISCV_64
 	default y if BR2_s390x
 	default y if BR2_TOOLCHAIN_HAS_UCONTEXT
+	default y if BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
 
 config BR2_PACKAGE_PHP
 	bool "php"
@@ -25,6 +26,8 @@ config BR2_PACKAGE_PHP
 	       BR2_USE_MMU
 	select BR2_PACKAGE_PHP_SAPI_CLI if !BR2_USE_MMU
 	select BR2_PACKAGE_PCRE2
+	select BR2_PACKAGE_LIBUCONTEXT if \
+		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
 	help
 	  PHP  is a widely-used general-purpose scripting
 	  language that is especially suited for Web development
diff --git a/package/php/php.mk b/package/php/php.mk
index 4daf7f633d..28893be4c6 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -40,6 +40,11 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 PHP_EXTRA_LIBS += -latomic
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUCONTEXT),y)
+PHP_DEPENDENCIES += libucontext
+PHP_EXTRA_LIBS += -lucontext
+endif
+
 ifeq ($(call qstrip,$(BR2_TARGET_LOCALTIME)),)
 PHP_LOCALTIME = UTC
 else
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
