Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FA1C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CF10825DF;
	Fri,  5 Jan 2024 13:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CF10825DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hjZEkMYHu3rN; Fri,  5 Jan 2024 13:28:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDA2682591;
	Fri,  5 Jan 2024 13:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDA2682591
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CB3A1BF841
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7CE860BA8
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7CE860BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BQfT9VITOEBj for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:28:49 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F826607C1
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F826607C1
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3368b1e056eso1304432f8f.3
 for <buildroot@buildroot.org>; Fri, 05 Jan 2024 05:28:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704461326; x=1705066126;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yOonIvj+u/BRhzrlxhF/zfYEzfVInNwfe/wqYe7GRnk=;
 b=fDK0/MPqJ6UpggXY20L1/w7lLe/7LrKz1PBUr3F9wpSHTVHothwgxC/5yFrPfGODWF
 RzJqAoGjpGDFbfVYLx3bIrAeL7hkT59IDQhXsBJAm26zlwHstN0JoncIxANGt/sVboZn
 p/ZNEGvAIz1RFuwKby7IdSl9MrGTnBQ2G2SF92BG35f3USzfxOzzznzXfs5xMND+Oi7R
 xvigtGXW4GgYUyNwr3AF1urjL2rRDxpdvmFTK6fP1t4sDDsI9PAHL/1ILNJ3ul8Wq6Mc
 2MtA26duaM3DVeSdbe493jbqCV9OBsw9KeN1Okv5o2cSK5r69l94GXYptiP2PjFFOuMd
 3aKw==
X-Gm-Message-State: AOJu0YyTB7K/vqb2uxnf17T3dzIRPxMTkcyThL58sLb2cF+pIMuk6fbs
 HeKEIk+BYlPz3Cqr+M1rs9KT7jSWqlg=
X-Google-Smtp-Source: AGHT+IFhHc3+bFdgx9/8Quzcg+epo0rR+Z0+Rq/ML7SBbH3bDMy1EO8oZTiszMY8qct56d8h1YOUaw==
X-Received: by 2002:a5d:4f83:0:b0:337:5a0e:1195 with SMTP id
 d3-20020a5d4f83000000b003375a0e1195mr451795wru.127.1704461326124; 
 Fri, 05 Jan 2024 05:28:46 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 s7-20020a5d6a87000000b0033680f7be5fsm1399514wru.87.2024.01.05.05.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 05:28:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Jan 2024 14:28:44 +0100
Message-ID: <20240105132844.508037-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704461326; x=1705066126; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yOonIvj+u/BRhzrlxhF/zfYEzfVInNwfe/wqYe7GRnk=;
 b=OXt6K9WQFV8r+83pOUgHJOp2Z0U0plqu3ob7I2saFjbhaCgdL+k6uAgiwrwMrsSlJZ
 FOBrIvcyg0BptQS9yjt0eEqASlXtN1LYG/PduPTrA+l0heQAgN7LJTFNJnsE8H82dVmD
 AmcDtC/yEJavlUtfVjX3/os01ynJBcZ2xtHkLVJRexjx8U64RN2TMEF/bXL/Um48Km3n
 n/LLMLLT0kK154XhRwugpcAeDhEoTxQu/9VcZTDffoyXk/WUHhbYVZ8St0kKJAGNO9mX
 q1ns9kE21wqZiwQRZdrs4geE39m1oA2qu2BupbOAJHNvL8i8jlyCId0SJOh9XhP59tUl
 tEkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OXt6K9WQ
Subject: [Buildroot] [PATCH 1/1] package/supervisor: bump to version 4.2.5
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

Drop COPYRIGHT as license text has been removed from this file with
https://github.com/Supervisor/supervisor/commit/7fd2842162d026eee929e2673de37039c42aa5a7

http://supervisord.org/changes.html#id1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/supervisor/supervisor.hash | 3 +--
 package/supervisor/supervisor.mk   | 6 +++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/supervisor/supervisor.hash b/package/supervisor/supervisor.hash
index f6e9cf97b1..a61afc4410 100644
--- a/package/supervisor/supervisor.hash
+++ b/package/supervisor/supervisor.hash
@@ -1,4 +1,3 @@
 # Locally calculated
-sha256  5b2b8882ec8a3c3733cce6965cc098b6d80b417f21229ab90b18fe551d619f90  supervisor-4.2.2.tar.gz
-sha256  7b8dbd54ab1543b07b2fc5f6f5ab50d89d26c1c4952af93a579d8c52c56b8de4  COPYRIGHT.txt
+sha256  34761bae1a23c58192281a5115fb07fbf22c9b0133c08166beffc70fed3ebc12  supervisor-4.2.5.tar.gz
 sha256  4c35fda9f70bb7883fd94e5a4d5addd88ad1a6d5d15e21c9d17c4d96fdc5e369  LICENSES.txt
diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index ad34c031e4..eb2a4990b7 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SUPERVISOR_VERSION = 4.2.2
-SUPERVISOR_SITE = https://files.pythonhosted.org/packages/d3/7f/c780b7471ba0ff4548967a9f7a8b0bfce222c3a496c3dfad0164172222b0
+SUPERVISOR_VERSION = 4.2.5
+SUPERVISOR_SITE = https://files.pythonhosted.org/packages/ce/37/517989b05849dd6eaa76c148f24517544704895830a50289cbbf53c7efb9
 SUPERVISOR_LICENSE = BSD-like, rdflib (http_client.py), PSF (medusa)
-SUPERVISOR_LICENSE_FILES = COPYRIGHT.txt LICENSES.txt
+SUPERVISOR_LICENSE_FILES = LICENSES.txt
 SUPERVISOR_CPE_ID_VENDOR = supervisord
 SUPERVISOR_SETUP_TYPE = setuptools
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
