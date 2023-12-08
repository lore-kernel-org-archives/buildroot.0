Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD82C4167B
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 22:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05BDE6FA56;
	Fri,  8 Dec 2023 22:01:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05BDE6FA56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H3Os8W0RAj-W; Fri,  8 Dec 2023 22:01:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6482B6FA67;
	Fri,  8 Dec 2023 22:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6482B6FA67
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 708511BF27E
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 22:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49F1583E59
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 22:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49F1583E59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uEZsn0u5BlGr for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 22:01:34 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C76983BCB
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 22:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C76983BCB
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40c39e936b4so2584435e9.1
 for <buildroot@buildroot.org>; Fri, 08 Dec 2023 14:01:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702072891; x=1702677691;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vrrp2xHYwPps7ZtGg0G64s9gkFP9Ge9d3ZEc6vcNuN4=;
 b=JmURUaYgdk2KDikhrtd12/6W6NeLadlK4BdBo2bScpOyQIFYcb9JCPe1+i2/owHB4P
 2MaK0L9+YUjgHnyCvWmpP2Uxj1C2puPbrggns8hPKPF031AB0q3SeLG8LT9v8fucfDTl
 oCBjxWj65wkLHa7lDsSBLGrL1rVVpnVH6zTVHMQVMkcn7XUumrHOBnx24Ri0/pA2KvXS
 Ju/HBhrOFdgBdlPjEax9SA/BvA0WWI00fQFoJAjb0p1VaSNW3i+UABHC1oqrb6K8PIEB
 ODfFrvS8GW0GmGJvtjyRqrS8V2GP9I7fVamGWZ8D1P6wh4GQ7gIMdAQZZ5jBU6w8fX0R
 HuKw==
X-Gm-Message-State: AOJu0YwiHUV2xeUAJxQPH7xFSGMjANVKLBSZRa3NFfYAsy7iJH0MGqO6
 CUJ7IAxiOqTqNBBDNMMtDpp9y7UOmy8=
X-Google-Smtp-Source: AGHT+IHMwUwEjm/nTnNy2zGuBiMkY7w6cG5w/6aUQvlTz+0gxXMS3wkpoQR/7xk5+WN5pRXPtVS8jg==
X-Received: by 2002:a05:600c:4216:b0:40c:3630:264b with SMTP id
 x22-20020a05600c421600b0040c3630264bmr152971wmh.249.1702072891194; 
 Fri, 08 Dec 2023 14:01:31 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m27-20020a05600c3b1b00b0040b38292253sm6292597wms.30.2023.12.08.14.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 14:01:30 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  8 Dec 2023 23:01:25 +0100
Message-ID: <20231208220125.11341-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702072891; x=1702677691; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vrrp2xHYwPps7ZtGg0G64s9gkFP9Ge9d3ZEc6vcNuN4=;
 b=DoEASeiGXMo3FfL7vm/dXj7ozLVycHbCZknO/SweWCChBpzy0KJCroTGnUZ2upvytg
 JyWCWxRj2F98D/rUjBe2uzWp0BUdk4bVkztNeDUm83jjYIpG7E1q4UhSiH0QzuBdJkUm
 pig2/Q41D2ip4vk6yadTxslJ8WHWvWKb3eAUoCvitccl6hN6r6oDVh2QapNayEUj58/u
 PRlMeSfHSJHX36eP7GnbgJWfcTaaEb7hUOXg+GBl6F4PfAt/mtsE5O4UapHUNjwhxpE0
 Z345U2gXoIlhcItU4yRWBLGOp8/kJyuZBeoJ8WcLldAVnoC+a1XhKnVFMDPaL+D5ZYgF
 YNcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DoEASeiG
Subject: [Buildroot] [PATCH 1/1] package/libmaxminddb: bump to version 1.8.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/maxmind/libmaxminddb/blob/1.8.0/Changes.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmaxminddb/libmaxminddb.hash | 2 +-
 package/libmaxminddb/libmaxminddb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmaxminddb/libmaxminddb.hash b/package/libmaxminddb/libmaxminddb.hash
index 7e56351c0f..23830a6afe 100644
--- a/package/libmaxminddb/libmaxminddb.hash
+++ b/package/libmaxminddb/libmaxminddb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e8414f0dedcecbc1f6c31cb65cd81650952ab0677a4d8c49cab603b3b8fb083e  libmaxminddb-1.7.1.tar.gz
+sha256  1107799f77be6aa3b9796ad0eed8ffcc334bf45f8bd18e6a984d8adf3e719c6d  libmaxminddb-1.8.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/libmaxminddb/libmaxminddb.mk b/package/libmaxminddb/libmaxminddb.mk
index 993b4aec9d..c741f429ed 100644
--- a/package/libmaxminddb/libmaxminddb.mk
+++ b/package/libmaxminddb/libmaxminddb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMAXMINDDB_VERSION = 1.7.1
+LIBMAXMINDDB_VERSION = 1.8.0
 LIBMAXMINDDB_SITE = \
 	https://github.com/maxmind/libmaxminddb/releases/download/$(LIBMAXMINDDB_VERSION)
 LIBMAXMINDDB_INSTALL_STAGING = YES
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
