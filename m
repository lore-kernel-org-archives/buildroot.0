Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93615C7EE29
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 13:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 347D060EA7;
	Sat, 10 Jun 2023 13:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 347D060EA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e-Qsl-yClh5x; Sat, 10 Jun 2023 13:33:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 699696058D;
	Sat, 10 Jun 2023 13:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 699696058D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0252B1BF343
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 13:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C912460BF2
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 13:33:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C912460BF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U9eAGKomdZwm for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 13:33:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E208C60AB5
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E208C60AB5
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 13:33:01 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-977c89c47bdso492394966b.2
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 06:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686403979; x=1688995979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u5kS/2/PZqmBTR8sNt2OBqCMj/J0GFDiTlddHG9XpAc=;
 b=ccHRYZW3yYZkBIYa9AbzlvLH9eCuaoY99owB42U8xLEvxjs47bJe9EnIZJvGFIijwq
 IQX4RjkF8sMre/whag/97qv9HxvFUdq/x8UtPklrxahmaFJFKLsS9+2RUpIR7z9kNS1h
 5h2wmJJXIiS2BmveJ61jQAkcrf69hQ9qa2K5FwqFPsB3B2ZdXKZfyzn6DT9V92plGTkt
 js4Z6Ry0hZ9q3FQOEf5IzTrEcdrjfqorgXD3kqlD2K+bmtPhmsa8rSbzQViDWG1lVlGj
 47hkmJkQCk31t1vzUkj9hCRE8t3iycbw20Zq9hFQ3HSD7uZnxDuA+PtIocnQSy0hne88
 P3vQ==
X-Gm-Message-State: AC+VfDyWs3U7Ph8Xynynpw4B/AKsGZ4KEWpmjBd0TbMFjyuWCQhC/YtK
 5oBjeRMuEBeAJn5Ucd512NlOuEBzXgpSLQ==
X-Google-Smtp-Source: ACHHUZ4idUBIkNyHKXjwSWCFfMsFn1zZdaxwxDbrR56xoBEeszT4iWNE01EKVq6DgH+q33mxYtTQ3g==
X-Received: by 2002:a17:906:fe4d:b0:974:1e0e:91ee with SMTP id
 wz13-20020a170906fe4d00b009741e0e91eemr5587969ejb.13.1686403979306; 
 Sat, 10 Jun 2023 06:32:59 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:9ac8:47a3:9e97:6ffe])
 by smtp.gmail.com with ESMTPSA id
 i23-20020a1709061cd700b0094f07545d40sm2559774ejh.220.2023.06.10.06.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jun 2023 06:32:59 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 15:32:50 +0200
Message-Id: <20230610133251.97022-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230610133251.97022-1-thomas@devoogdt.com>
References: <20230610133251.97022-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/4] package/fluent-bit: drop cxx handling
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fluent-bit is written in pure c, so drop any cxx handling. Only the wasm
part needs c++, but that one doesn't need the fixes which are now dropped.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: No change.
---
 package/fluent-bit/fluent-bit.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 2949c5cdd0..9df34efd78 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -13,7 +13,6 @@ FLUENT_BIT_CPE_ID_PRODUCT = fluent_bit
 FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml openssl
 
 FLUENT_BIT_CFLAGS = $(TARGET_CFLAGS)
-FLUENT_BIT_CXXFLAGS = $(TARGET_CXXFLAGS)
 
 FLUENT_BIT_CONF_OPTS += \
 	-DFLB_DEBUG=No \
@@ -49,13 +48,11 @@ FLUENT_BIT_CONF_OPTS += \
 # Fix multiple definition of `mk_tls_*'.
 # https://github.com/fluent/fluent-bit/issues/5537
 FLUENT_BIT_CFLAGS += -fcommon
-FLUENT_BIT_CXXFLAGS += -fcommon
 
 # Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
 # large file support.
 # https://bugzilla.redhat.com/show_bug.cgi?id=574992
 FLUENT_BIT_CFLAGS += -U_FILE_OFFSET_BITS
-FLUENT_BIT_CXXFLAGS += -U_FILE_OFFSET_BITS
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 FLUENT_BIT_DEPENDENCIES += libexecinfo
@@ -74,8 +71,7 @@ endif
 
 FLUENT_BIT_CONF_OPTS += \
 	-DCMAKE_EXE_LINKER_FLAGS="$(FLUENT_BIT_LDFLAGS)" \
-	-DCMAKE_C_FLAGS="$(FLUENT_BIT_CFLAGS)" \
-	-DCMAKE_CXX_FLAGS="$(FLUENT_BIT_CXXFLAGS)"
+	-DCMAKE_C_FLAGS="$(FLUENT_BIT_CFLAGS)"
 
 define FLUENT_BIT_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/fluent-bit/S99fluent-bit \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
