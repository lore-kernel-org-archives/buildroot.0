Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3ACFC46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 16:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F88660E44;
	Tue, 26 Dec 2023 16:59:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F88660E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wg9DYrj_xHOB; Tue, 26 Dec 2023 16:59:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E685A60D5F;
	Tue, 26 Dec 2023 16:59:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E685A60D5F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A1281BF228
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 16:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5167840530
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 16:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5167840530
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pnvn-BjnK34F for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 16:59:36 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 556BA40182
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 16:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 556BA40182
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40d5095834aso26166915e9.2
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 08:59:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703609973; x=1704214773;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8+KPz1IzyUz/tBENmWGSS6RC+z0a9pqMHXV79DkeOGM=;
 b=ZIMnOuBXO+zOeiwnEXYPFjBdAJkev5xFZJ2WYSivaM0lpDHYzVQgYOarNTNMo17Cbe
 Il6yABWKHo2iP5bS7+D8XBzWEtZw/Ldb3atnGMQL8rZxoReKD0Aa8hLxNPAI728pGzuL
 qRyhYG6sWfP9pIPSdiZq7h4BdrvragWpBF+s1bJJ+3psz/wXkB4FwWp21sR097OBp7fc
 9OmaeLiG5V3hPZtbNebWQTCU7+6MFXZk/1QAMo4Cjr1ywYHtLQPB1j36KJIgXoHH0poN
 s8Io0V6MWy4CXYxY+9MWwPmSCRJ1ph23SmP1u9cDlMLcWkBE5M4zWgnc3n6dau2UWlWO
 jISw==
X-Gm-Message-State: AOJu0YzW++v9VDGzk80SYU8gc2ikETBgyJNPhNyWWLWVx2BqUZ4ZYEX1
 ylJqpXHxrxvnfX1Iq3xngAi3PjW9jLw=
X-Google-Smtp-Source: AGHT+IEPMkSio+u349wT5T0Pvb0/EgLC2XOQOPND2T6vN5dHlXVTJj+/Nw5qOHErbikpGSbjszcB2g==
X-Received: by 2002:a05:600c:4444:b0:40c:6a6a:bfc0 with SMTP id
 v4-20020a05600c444400b0040c6a6abfc0mr2169794wmn.34.1703609973450; 
 Tue, 26 Dec 2023 08:59:33 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 hg12-20020a05600c538c00b0040c41846923sm28592013wmb.26.2023.12.26.08.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 08:59:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 17:58:51 +0100
Message-ID: <20231226165851.814560-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703609973; x=1704214773; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8+KPz1IzyUz/tBENmWGSS6RC+z0a9pqMHXV79DkeOGM=;
 b=RGP5MJuTLuTIVEFlfLQgUN1j4vKEuujMUg8+1BhW7RYwipbbSl/GINRyDs9uonx+Fa
 OvrUqQ3oGSdAm/beZAiNcT6KP/dbnTBXz9CxYwLSD0IT/Byh5FcXrbUlg/4lI3mr5sR+
 tOHggOBHxD5MoB7Grmz87LPyhLyqlqMEI64tQebUczg/yn1KnJ6GMN5l6zH6SfIDrYGa
 gkS49i3YoLvewKMa2v/et8yxHV11BltSoUARbaSnuT2i4dLTd3xjw344kbPHjYYP1UyZ
 MVZsrtSyMQ3EWxC1Rys6OGnGXgB9gsnHkqjn7KeBBipHi3HQbUP4pwAn3QqK35V5vacS
 Dhsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RGP5MJuT
Subject: [Buildroot] [PATCH 1/1] package/libcgicc: bump to version 3.2.20
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

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcgicc/libcgicc.hash | 2 +-
 package/libcgicc/libcgicc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcgicc/libcgicc.hash b/package/libcgicc/libcgicc.hash
index 87540c8144..699a0dbfd4 100644
--- a/package/libcgicc/libcgicc.hash
+++ b/package/libcgicc/libcgicc.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  2a17b976248de03447f9e36d6ce18a80749990d8543e2dfeea09c413eb67f7f0  cgicc-3.2.19.tar.gz
+sha256  0f91c5ce8adf406ad35a46152ffb2b9c8d6079604b796d81f48b66d1f068ad4e  cgicc-3.2.20.tar.gz
 
 # Hash for license files:
 sha256  a2e480f5e8afd7c587a3c0ac2ed3b73ed4b10fa3a553dea26e7b661c7cedda72  COPYING.LIB
diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index e9ce4043f5..3d651aefc0 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCGICC_VERSION = 3.2.19
+LIBCGICC_VERSION = 3.2.20
 LIBCGICC_SITE = $(BR2_GNU_MIRROR)/cgicc
 LIBCGICC_SOURCE = cgicc-$(LIBCGICC_VERSION).tar.gz
 LIBCGICC_LICENSE = LGPL-3.0+ (library), GFDL-1.2+ (docs)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
