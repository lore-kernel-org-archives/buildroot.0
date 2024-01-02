Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511B7C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F29FE60F3B;
	Tue,  2 Jan 2024 22:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F29FE60F3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ShuELBLXSWez; Tue,  2 Jan 2024 22:49:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E69960DFD;
	Tue,  2 Jan 2024 22:49:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E69960DFD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 388181BF2FB
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A9F280E16
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A9F280E16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZQ23bAexV42z for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:49:06 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D63480E13
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D63480E13
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d8991f1acso19459265e9.1
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 14:49:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704235743; x=1704840543;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8bwi0+gT3hBlba0EkmXnCsJWBEShtB/4tFczZmJh6EU=;
 b=oHVAZfD9guWSK1X/NJE2K+4JTpqbEhpxaBo8gruCfQ+Y25Kx3SD81332i/DrsY5ejt
 p4Z2VJ3+hnk1e84dH8CoAc1fE+jSxkMZwnP1beO5eJ+c/ULlYGnMd0M16TZW+XnZ7sB3
 9G/3SIQ2moF4E+7GFu11afCmK4/WQnZN2GWCfZOzeCbGjIDEGinJyF1+giN872lt7Dgt
 r4gj0yemHu0GD2Ur3sKMQ0yKkspsS0SnwyIvBCjZZ5XtHUtTdLYSymtH0Kpagkhax9WT
 L7/PtqoYYRTpWWBgeyygp00wqKhkBpA5a42TZi7tlwiWK0O9MCbzDtsbVom/lFDAkjP/
 KSug==
X-Gm-Message-State: AOJu0YxDj2iLZH73aqecP0lEtZ2XbvAne3sf8twQKuhT+EBUef8LTyCt
 LZnLQf82lQ114WEPwe47z/5wSEOHXiM=
X-Google-Smtp-Source: AGHT+IFzv8OIWnKUYLUzQE6+mFLhvnZBf/9055Ppl6MInFA3kuEjjJMJYxpWMe/o71MaUjyrxmicyQ==
X-Received: by 2002:a05:600c:2a8d:b0:40c:53c2:d7e1 with SMTP id
 x13-20020a05600c2a8d00b0040c53c2d7e1mr10519104wmd.48.1704235743407; 
 Tue, 02 Jan 2024 14:49:03 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i15-20020a05600c354f00b0040d62f97e3csm370071wmq.10.2024.01.02.14.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 14:49:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 23:49:00 +0100
Message-ID: <20240102224900.2534201-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704235743; x=1704840543; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8bwi0+gT3hBlba0EkmXnCsJWBEShtB/4tFczZmJh6EU=;
 b=EnD/9cwbu1FvphvGnYPlP9CC9NTulN5Yb7W6sPpbfYRopZBip3nELpqFS3rDOH8q40
 Y3ImF5XThiK13BeyNJfOyPhA3k3BcBmmVM7QwMK1Scxvu95gSMjZBbe5a5RBKVdt0RbL
 9hkg8zffpRFQacE/iRQ6Uspa84sn9O+TJTBxl/0MCxXGo8fOvj2JqxEaDuOd8ZSiYdWY
 6EEhDwQ8qcNXMTAs2co/32YF+Zm9qL4fUBOQQz/MYhkZqV/S6nh8ERxB4pgJY8QVCdih
 ILuxtTPU+ZW8PYcQe7BbK3z2rhC0L6n6VJO/1IWzMs395IL9DogdmPkjxm6V9yxoPibk
 rDHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EnD/9cwb
Subject: [Buildroot] [PATCH 1/1] package/pugixml: bump to version 1.14
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
Cc: Theo Debrouwere <t.debrouwere@televic.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of LICENSE.md (year updated with
https://github.com/zeux/pugixml/commit/1a9a41b0f455fd94fd9e66bb8a987e807419cd3b)

https://github.com/zeux/pugixml/releases/tag/v1.14

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pugixml/pugixml.hash | 4 ++--
 package/pugixml/pugixml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pugixml/pugixml.hash b/package/pugixml/pugixml.hash
index b828e03561..2446788d89 100644
--- a/package/pugixml/pugixml.hash
+++ b/package/pugixml/pugixml.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  40c0b3914ec131485640fa57e55bf1136446026b41db91c1bef678186a12abbe  pugixml-1.13.tar.gz
-sha256  206f671b6d342557adcc973088c2c638df0ec0b1dabbcd24e65aadd2191778d2  LICENSE.md
+sha256  2f10e276870c64b1db6809050a75e11a897a8d7456c4be5c6b2e35a11168a015  pugixml-1.14.tar.gz
+sha256  01e13f39d058cca09968f18d423912a18f8bf61b9161c65f8e5bcc418a8aba28  LICENSE.md
diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index 415227a40a..9772788d2d 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PUGIXML_VERSION = 1.13
+PUGIXML_VERSION = 1.14
 PUGIXML_SITE = https://github.com/zeux/pugixml/releases/download/v$(PUGIXML_VERSION)
 PUGIXML_LICENSE = MIT
 PUGIXML_LICENSE_FILES = LICENSE.md
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
