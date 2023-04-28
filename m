Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1707AC77B60
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 08:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DD0461698;
	Fri, 28 Apr 2023 08:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DD0461698
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ch3an3JmMlXD; Fri, 28 Apr 2023 08:00:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F37D6168B;
	Fri, 28 Apr 2023 08:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F37D6168B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 47E471BF215
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 07:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2233A40647
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 07:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2233A40647
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y1Cv0dvQ6ZB7 for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 07:59:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F7A840018
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F7A840018
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 07:59:34 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-94eff00bcdaso1776952266b.1
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 00:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682668772; x=1685260772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=17buqb/3E97KwdUpvBDbSznoTJdtE0KcS6dFMwYi6VQ=;
 b=RvXCONrRmsqfTrQL2GFZcqdSaVrQ93eKi1pknepOsCC+7LQtoq5jgkdJqILctJlvWK
 ByoJV0LwAfsWV2tjNs7E7SOPYsNfk6cH5N13G0iNss2Umflo+EIKgUIofBnbHy3feJIV
 eLLePshX2jSreAW8NUzoLnC5+cZzVKnRTEcIBzzY0aPNxazAipBypZ8cKKg1JgDGO7v4
 4NaRLHiBWXX/m1Jbswetxe4ZwoNdd2VOCPj5WkY30fdnMXYFiapo6UoqfC4yJitIAXqv
 K96x+TEGMnUBRcNkKWQRyoV1P3Ch+h9g59DFPCU7/7bw3pZmd8GBGkzztflRxg+vYU3K
 C2nA==
X-Gm-Message-State: AC+VfDzmL59apLi7hPKKqkncvqN7C15F3JuteoExngjx0x6RZ/fl9lvW
 F8Fd/MdixQx5q8n1rPPnZdXsbfDC17h2Pw==
X-Google-Smtp-Source: ACHHUZ7iT2gaYebYGTCp8PkIelCTkUfARzKtrBn0o6Orra9W/Z14GRKYq9uB83UIm4XQ5eWNTMecLQ==
X-Received: by 2002:a17:907:728d:b0:95f:2046:d20d with SMTP id
 dt13-20020a170907728d00b0095f2046d20dmr4571142ejc.2.1682668772173; 
 Fri, 28 Apr 2023 00:59:32 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:627a:ae86:20c8:b204])
 by smtp.gmail.com with ESMTPSA id
 sd22-20020a1709076e1600b009572bd99281sm9324798ejc.224.2023.04.28.00.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 00:59:31 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Fri, 28 Apr 2023 09:59:20 +0200
Message-Id: <20230428075920.3750005-5-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230428075920.3750005-1-thomas@devoogdt.com>
References: <20230428075920.3750005-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v7 5/5] package/libgtk3: fix update-icon-cache
 on empty directory
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Daniel Lang <d.lang@abatec.at>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 James Knight <james.knight@collins.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If both, hicolor-icon-theme (selected by libgtk3-demo) and
adwaita-icon-theme is not selected, then the /usr/share/icons
folder is empty, causing find to fail.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Tested-by: Adrian Perez de Castro <aperez@igalia.com>
---
v5: 
 - Fixed indentation.
 - Grouped patches.
v6: no change
v7: no change
---
 package/libgtk3/libgtk3.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index bdd54dcdc8..eac569fd41 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -146,8 +146,9 @@ endef
 # Create icon-theme.cache for each of the icon directories/themes
 # It's not strictly necessary but speeds up lookups
 define LIBGTK3_UPDATE_ICON_CACHE
-	find $(TARGET_DIR)/usr/share/icons -maxdepth 1 -mindepth 1 -type d \
-		-exec $(HOST_DIR)/bin/gtk-update-icon-cache {} \;
+	[ ! -d $(TARGET_DIR)/usr/share/icons ] || \
+		find $(TARGET_DIR)/usr/share/icons -maxdepth 1 -mindepth 1 -type d \
+			-exec $(HOST_DIR)/bin/gtk-update-icon-cache {} \;
 endef
 LIBGTK3_TARGET_FINALIZE_HOOKS += LIBGTK3_UPDATE_ICON_CACHE
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
