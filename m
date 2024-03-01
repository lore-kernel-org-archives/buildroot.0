Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AEAC5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 19:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3133341CA6;
	Fri,  1 Mar 2024 19:56:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MNq4PsMssT9o; Fri,  1 Mar 2024 19:56:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26A5C4193F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26A5C4193F;
	Fri,  1 Mar 2024 19:56:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 725FB1BF322
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 19:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80F5A41F9B
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 19:56:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DmX2imUl669i for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 19:56:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0AF7041F97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AF7041F97
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AF7041F97
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 19:56:37 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d220e39907so33355441fa.1
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 11:56:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709322995; x=1709927795;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0SwdxQFJdaeEvfGHzHTy92gwfgJ2N0EI24ZRh1op+B4=;
 b=Jnr9Tcw1DrAzzkomxS3YtzQNC7am5vrqW6I7VKsY8l/W4HVLCIX62oZdZ2GJdzdCPd
 d2UhWTU7SS2s555RTbNaOL6WsIGatrTG6GafKrVr4TSXO4EcddtkUUOWmgES8SGCcgMg
 UFvFeqwY7sSutCZJhEBrdvn2moCLR16zaAqMkPwwPtWTBh4Dgi1+/fZ3s9XRknqKAncX
 k1sg1t0kpQ+E0qkFnuHT9vXVJtaBHQzQpu2VIPANE51YJF6Iluvkus3WI+Pl0b8qdz4T
 TvAn2aHGNgO3HlDUM7YRV9E9sMwuAi7sSqxkpLN8PYNY8fZRcLFu4BfTbE+AkhDnW/ir
 c+jA==
X-Gm-Message-State: AOJu0YzQgidtVMCeI4AeiT6RIKz+nhp4JJz+OktAHyFP2JMSwmWL2tAh
 oSjfyausLWcSBES59EcfcpKF10hlU3yMf1Gux7ujD0Wq/jzYLx1QbiS5bxcl
X-Google-Smtp-Source: AGHT+IFhPcy+Uhc/IQjwJtcgIa7NJYgou8aYQGQ3lCSJSvo/ZVlGqiZRjS94pNbVXk+z6FiZyKKzkw==
X-Received: by 2002:a2e:a486:0:b0:2d2:724d:f653 with SMTP id
 h6-20020a2ea486000000b002d2724df653mr1893320lji.38.1709322995029; 
 Fri, 01 Mar 2024 11:56:35 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m9-20020a05600c3b0900b0041294d015fbsm6465467wms.40.2024.03.01.11.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 11:56:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 20:56:18 +0100
Message-ID: <20240301195619.863853-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709322995; x=1709927795; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0SwdxQFJdaeEvfGHzHTy92gwfgJ2N0EI24ZRh1op+B4=;
 b=I6STlJQ3v7/dG2MWcRRI8P04EU3S6VljKyaWAufOYQEh25Wj+JNVYrE+033YO4bnFO
 yYG0fUB0Fw7FB6Euwogn3IBpw17ocb7zoJuJ8K5C6xES5u2WvTDqium1aW4v4ft6MaWW
 KGhbVjBET/OIjKtfiemLu9Swo7TJtEHOHjxQaiqAvYh5oPcuuiLlGMEosjkpxomZPjlB
 NeuboCxg1uIyu216wn7bi2D+Ml7pLvxLAWDnOrlNefUgzNWNmB1kf9MBElBsqIzdf91Q
 WY8cQacCo5vXAI7ncJFgFN6f0EhtWakQfSeWvIhFsSxBqIAmXstBp0N6kxkvyNb4wI9S
 Sivg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=I6STlJQ3
Subject: [Buildroot] [PATCH 1/1] package/libxml2: security bump to version
 2.12.5
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2024-25062: An issue was discovered in libxml2 before 2.11.7 and
2.12.x before 2.12.5. When using the XML Reader interface with DTD
validation and XInclude expansion enabled, processing crafted XML
documents can lead to an xmlValidatePopElement use-after-free.

https://gitlab.gnome.org/GNOME/libxml2/-/blob/v2.12.5/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 670ff80a41..959887ab0e 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.3.sha256sum
-sha256  8c8f1092340a89ff32bc44ad5c9693aff9bc8a7a3e161bb239666e5d15ac9aaa  libxml2-2.12.3.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.5.sha256sum
+sha256  a972796696afd38073e0f59c283c3a2f5a560b5268b4babc391b286166526b21  libxml2-2.12.5.tar.xz
 # License files, locally calculated
 sha256  7fb0a66f3989f9bd5c7e5438a3de02cd4a7a47dde0aea2f7ea2ba2ff454ee6a4  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 1893206ccb..6070c07b03 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.12
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).3
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).5
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
