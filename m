Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF923CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 06:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C7F14011C;
	Sun, 22 Sep 2024 06:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qnemRdef8fjo; Sun, 22 Sep 2024 06:32:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32DB9402E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32DB9402E4;
	Sun, 22 Sep 2024 06:32:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A79A1BF86C
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A0E6606CA
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gO2i1c1y7Z6O for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 06:32:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8EDDE605C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EDDE605C6
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EDDE605C6
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 06:32:12 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-82d07f32eeaso172413139f.2
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 23:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726986731; x=1727591531;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=li+/YnVeaa2JKwfp7b9VIFF19k6Zg/CqD1G4pHxwEZw=;
 b=U7JHytujRkN9UoxzsIXuTrZQGv9VFT58G2AOdw674RDvAI5sNq7UGZfohfDiRFtL97
 0pvOlTRNUc6euMrUy7YW1b7E9tX6rwRUvieFW3XpaIg0n99KHLEyvAoU73P/qlHAmrV/
 i0X3udigeoy4RNsEzpKDbz1IcH7FnAcHHK35FBWjNt4Q/vcHi6ybcHzSkQw7ZINmuNiw
 T0RTkHgAy+c7WtNAMORhW2tXts81lNq1BoAbMSFd7VYC5DBXISLuDbAm1HM1zOR8CJXY
 5MyO7hB1qHRdh6CbYxqoDsv3EkI9w8I+adhsGzp08yGNLVi7refjNQ46nlLlmwyDXy5A
 nEgw==
X-Gm-Message-State: AOJu0YzGbCePh29Hy2RstRMj4NGwryu4GF43tB8ZZ6BruHxk6+viAJxy
 hJUjLJVJ/kdgnBOFA2wFtdevoJhwXj8PgHbg8lkI5H3aluP3IMftgVAYoQ==
X-Google-Smtp-Source: AGHT+IGESQFEupBpmtmSZBm1y6fnnfKrFgu0QWwTJGPMxb0krzaRcZp8E/qfEkMfoh/haCDpHw5I+g==
X-Received: by 2002:a05:6602:2c0c:b0:82c:e8d2:f86b with SMTP id
 ca18e2360f4ac-83209e8dd8cmr788649139f.14.1726986730838; 
 Sat, 21 Sep 2024 23:32:10 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d49356352sm476049639f.51.2024.09.21.23.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 23:32:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 00:32:09 -0600
Message-Id: <20240922063209.970459-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726986731; x=1727591531; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=li+/YnVeaa2JKwfp7b9VIFF19k6Zg/CqD1G4pHxwEZw=;
 b=T2e2Rwdp39vMCJDKlCwgzzd5DU1Xqmp5vjpA1C1TCzwE6eyLQ2W7mlhhLdoYLKeemh
 EvPh9UqCMvGiY1AY5AWCZJ6JtFZsG+8Yr4KsCVzAqNwSuCq2iPjkeCL8MFSPmEywglj8
 VyUI2lGagZzVBhdM69Bho5MtuGSO3nln0q2NmeSRxjN2dZcS0Pcb6SR/SVlxgpbudPVz
 6ZQNY1opuAsVv+tvOULU+kyLKWFg2/+XUq4kOnYDXLBCfVPlFE6vxXKMQF5GwFEiy+tW
 ynyJZKcPSO8LHYnLNHMPkDBhYTXCzo3xj4T+UcUESP2Ea6ojlbvjwRuFrxZ9+KsE9MC7
 qo/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=T2e2Rwdp
Subject: [Buildroot] [PATCH 1/1] package/python-web2py: bump to version
 2.27.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-web2py/python-web2py.hash | 2 +-
 package/python-web2py/python-web2py.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index 1b4d8f5632..ce3896a1ad 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  d5d79f6260ec9f53f90447ad59313a8fac0571fce0018aa5f6fcf95d28c04382  python-web2py-2.26.1.tar.gz
+sha256  2221840e4ef2c1e3810017921b2a72f2d5d1f888ca1f771cf7263bfead60570c  python-web2py-2.27.1.tar.gz
 sha256  2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index fe7774fc2b..ed10333f53 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = 2.26.1
+PYTHON_WEB2PY_VERSION = 2.27.1
 PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,v$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
