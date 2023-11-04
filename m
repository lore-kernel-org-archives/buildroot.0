Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D679C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 22:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C93A60BD4;
	Sat,  4 Nov 2023 22:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C93A60BD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJJG3E51l1Vb; Sat,  4 Nov 2023 22:54:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D876C60D71;
	Sat,  4 Nov 2023 22:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D876C60D71
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3DC401BF267
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1417F60D71
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1417F60D71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sdVimcSuyh9o for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 22:54:13 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C1B460BD4
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 22:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C1B460BD4
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40853c639abso24654275e9.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 15:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699138451; x=1699743251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PvWPQ7l1EQ2QP+SaRmEUC7jDNvW0ubH71FbSYIu2tts=;
 b=paRH4A2cxZbwvpFs3EkYb+c4SWoyMJ+3nBVcsZzOtScXZhehMP4cDgetCyNGvoO4LB
 bKVnLxsFrKoN51VsdGhvooinSBlAyhFiMbYwWYlLHRpEpQ8L/4P/5Ogu8WL2Eg2BtJQg
 RA4U1fgYbY67MiSFo4gRu6RiWaZ4iVk4WQ0wG1iSoBaGkLt7iZzWJLJVCt+l0ER9oMC3
 05ai6i9aytGN18W1WRXvyVykNRj6ZRfQ697Rb5Jk9NvMJHrgWemlX8LmTDFTyewVWiOR
 RtAxN+fDTR70bhKoANb/bVdhHxJpAmYl6UADsuEocRoorYLvrnieku6bBMDdU2SPPJxm
 l/PQ==
X-Gm-Message-State: AOJu0YyWdN5Pr54qcG+aq4F6Df+p3RlPqP1Rojm9OKBJ+icyuKPdQ950
 dg3X3qi63o0SnV4NDGgnxFQq955ZpQ8=
X-Google-Smtp-Source: AGHT+IHEOjWcjuNQTyS1wTtMKTu+8wV2IiHTwmgEeqWi6JJrV10lLKqgz4mAepI8DeRq60WEaCllRQ==
X-Received: by 2002:a05:600c:4750:b0:408:3d91:8251 with SMTP id
 w16-20020a05600c475000b004083d918251mr20040779wmo.5.1699138450516; 
 Sat, 04 Nov 2023 15:54:10 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 q8-20020a05600c46c800b0040776008abdsm7111533wmo.40.2023.11.04.15.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 15:54:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 23:53:39 +0100
Message-ID: <20231104225339.380802-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231104225339.380802-1-fontaine.fabrice@gmail.com>
References: <20231104225339.380802-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699138451; x=1699743251; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PvWPQ7l1EQ2QP+SaRmEUC7jDNvW0ubH71FbSYIu2tts=;
 b=Hya5JSiPhug2loGKicn3fDuylIC+WitiErdJdvCMqxrVc8pXkjFn8FZ7RyJJCicY8y
 3CdCJIEWDbM2eQ49J+o1+d2rqouGm2kl6xrJWTP/9hS7vx+knL5udciKGsF3+pkw37la
 hkzyNeuHvfPXPRXbAZsLU8CaZhhOHwV9yn0tR9Ibp5LNsBAisLVFuRQig6Fb3009prS8
 VFxRvHKUnd4IuewCbHBZDVNvT97mF8Ikd6AhizAcRbD9vgl+x8MNe0nosH7KvPuB3zR5
 enPQH0A+wHEIvdqnI2sptGx2iteJ3fLEExTFrFBejkNa7SilQeZC7ubommtEspFkgU2X
 8p2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Hya5JSiP
Subject: [Buildroot] [PATCH 2/2] package/traceroute: security bump to
 version 2.1.3
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-46316: In buc Traceroute 2.0.12 through 2.1.2 before 2.1.3,
the wrapper scripts do not properly parse command lines.

https://sourceforge.net/projects/traceroute/files/traceroute/traceroute-2.1.1
https://sourceforge.net/projects/traceroute/files/traceroute/traceroute-2.1.2
https://sourceforge.net/projects/traceroute/files/traceroute/traceroute-2.1.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/traceroute/traceroute.hash | 2 +-
 package/traceroute/traceroute.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/traceroute/traceroute.hash b/package/traceroute/traceroute.hash
index 83791c18a4..cf2eb127a2 100644
--- a/package/traceroute/traceroute.hash
+++ b/package/traceroute/traceroute.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  3669d22a34d3f38ed50caba18cd525ba55c5c00d5465f2d20d7472e5d81603b6  traceroute-2.1.0.tar.gz
+sha256  05ebc7aba28a9100f9bbae54ceecbf75c82ccf46bdfce8b5d64806459a7e0412  traceroute-2.1.3.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/traceroute/traceroute.mk b/package/traceroute/traceroute.mk
index 155e134c68..133f8d3c3e 100644
--- a/package/traceroute/traceroute.mk
+++ b/package/traceroute/traceroute.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRACEROUTE_VERSION = 2.1.0
+TRACEROUTE_VERSION = 2.1.3
 TRACEROUTE_SITE = http://downloads.sourceforge.net/traceroute/traceroute/traceroute-$(TRACEROUTE_VERSION)
 
 TRACEROUTE_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
