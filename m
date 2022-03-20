Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C87FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 16:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9877860BEC;
	Sun, 20 Mar 2022 16:59:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6xKDx4Szmk2h; Sun, 20 Mar 2022 16:59:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF8E160585;
	Sun, 20 Mar 2022 16:59:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBC591BF215
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 16:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA7578141C
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 16:59:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8uOcSYURhDGn for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 16:59:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E90DC81414
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 16:59:18 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 bi13-20020a05600c3d8d00b0038c2c33d8f3so6519553wmb.4
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 09:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dL6ZerA5wDJLcehNYGVFLOAG3cvUv6wA2tJfpSR7oR8=;
 b=WC93yYo/v7OaK+fAh1u6Y6a5r3ZSudTjPxnsSHQeTNeSaSGe/otkOPjWC42k670mGE
 WPlr4Q90B/9KcYweZZ1D+mZEDp2LYJTQXbm265oaVV6qRJPc9d84fJoL7oiuVg+2sft4
 ZWFVcx4ZspJWWq0Q7DRSlAzjgWXkrE5GdRXLdy3l2QGfvY3VMNSlqD7G38BhyafRnKd5
 u5WR7ZFQfWttHJmQVNbg7PBJxAFgE3sZwSFntdIqqHVjWw8UZkpzfgkAaOEhNRbuFs3h
 CfbPnkcwvA6whTwIc3juNCeZaTvwQA1k+LRabd0ZrD8dQw5zpMS9XKUBp8LAb5VRTHnE
 MeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dL6ZerA5wDJLcehNYGVFLOAG3cvUv6wA2tJfpSR7oR8=;
 b=DYhC92P9H6Ey8D27VEDAv/yhJYje+8KjyX/ar144m3cJrERyUadrNe0hAF7639V/I7
 Ou1sPhWBStRTnhy0Sg/iTi1+SWs85b/ZNNw4gCAuWj+oOCclfoBb844TtJMU+9YguIKZ
 3Pq5vMjVYBFG4ltVjcaOhK8d9mRHYe9S1cMKf92UC/nyKPdgqWHj3hDS0k5blm8sJ5y5
 VLwLkKln1qsKq5bHdC1mAbu31Sz9jlPjLdRpy5vTXqCtJuOJ+zoORsYXWMD9FRSGUGEn
 Pa/Ht8BlOSg4GI6nHZ7cJRwQBUA+yntQtUjUk8g9EKL5FtNlaT6c1RrZkhp9Vpc5bq8U
 jhLA==
X-Gm-Message-State: AOAM531M+VIL+zl8FPCQkKlBI1y7GOJ+44da33Vy4WCk7hlvhwKQ3FvZ
 1Uf8S4Mz3yKAosI5IP6dNNqWGHXOiJs=
X-Google-Smtp-Source: ABdhPJwnsXzl1xRPduQ5+KV9L6EjgeCgFere1l4JliSkpDsWQuas2FtezVBx1hqjxXLqvLB+M29/7A==
X-Received: by 2002:a05:600c:49a9:b0:38c:987d:d692 with SMTP id
 h41-20020a05600c49a900b0038c987dd692mr6052318wmp.166.1647795556967; 
 Sun, 20 Mar 2022 09:59:16 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r186-20020a1c2bc3000000b0037bdd94a4e5sm11925842wmr.39.2022.03.20.09.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 09:59:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 17:58:01 +0100
Message-Id: <20220320165802.1584746-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/snmppp: bump to version 3.4.9
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of src/v3.cpp, update in year and "Frank Fock" added:

 -  _##  SNMP++ v3.3
 +  _##  SNMP++ v3.4
 -  _##  Copyright (c) 2001-2013 Jochen Katz, Frank Fock
 +  _##  Copyright (c) 2001-2021 Jochen Katz, Frank Fock
 -  _##  Hewlett-Packard and Jochen Katz make no representations about the
 -  _##  suitability of this software for any purpose. It is provided
 +  _##  Hewlett-Packard, Frank Fock, and Jochen Katz make no representations
 +  _##  about the suitability of this software for any purpose. It is provided

https://www.agentpp.com/download/changes_snmp++v3.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/snmppp/snmppp.hash | 4 ++--
 package/snmppp/snmppp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/snmppp/snmppp.hash b/package/snmppp/snmppp.hash
index 2dcf836fc7..db3a4b5f4f 100644
--- a/package/snmppp/snmppp.hash
+++ b/package/snmppp/snmppp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  a3eb75e2310c315d9b2c2094154c7cd9b46684adb80a4b36b8957dcc09af4041  snmp++-3.4.2.tar.gz
-sha256  f6fd4321c7eb6e51a272f91f964aea7f53039bb2b55f690d5a9d042f3a5d79b9  src/v3.cpp
+sha256  7c0aaf4ea21db082453f880cc2062a86dcbbf0ee6c8d47c72beb8e0c77c26b6c  snmp++-3.4.9.tar.gz
+sha256  61337e799c8274e596e5783b22607beea8073ee296c6b27fc5c7487296e56851  src/v3.cpp
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 601e28e207..bc05cad583 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.4.2
+SNMPPP_VERSION = 3.4.9
 SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com/download
 SNMPPP_DEPENDENCIES = host-pkgconf
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
