Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA84E6F07D
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 19:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0A9D6067E;
	Fri,  1 Nov 2024 19:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NUQan7g6q8BP; Fri,  1 Nov 2024 19:23:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1805605E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1805605E5;
	Fri,  1 Nov 2024 19:23:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7477A979
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 19:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6371880CAA
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 19:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tej-0vLDJ3qv for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 19:23:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5DA6B80CA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DA6B80CA7
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DA6B80CA7
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 19:23:48 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-83abcfb9f37so95952839f.1
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 12:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730489027; x=1731093827;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9l6hObm3OCYGsU1n0xLlERBqtfxnolMDTnEodhFHIv0=;
 b=CHdAzdyijtFWCA3+6/aEnPkCfQlX9pi/+bnh0IXqusdYr4IUSTPoGvSPNlpTPC46fQ
 C09xQHLExE7WOx9u3zM+B5pbdkkY4dm7feEoEYdRroZC1ZagL2X691XKMAuZLtxqhyyd
 TcMmbnDKT4LHnCi5qP7r0CGlXRzHcdekClGS01UtceHlX33kjGHLYzoJqvw2KfG19TZV
 r9YHlYfSUb1PQW+Ba2B/GTlZD09q2n1lyvbCEpoaxvui5CN0s/vuqyaCYIGYWL3xXx48
 23CH/DnhmmqNs/6ZV7Cg4hX9/9ZTDLK8zaDNrXtgwaZpwtRjtrGrICz4wrZctoqMrZfv
 itUg==
X-Gm-Message-State: AOJu0Yx9i7bNtWN3tpDMF/2uEdstF4UMtUWCnHbIp2qotWtYEqAFG8Ap
 iRQW4y+9VW+bTbuzNRHwWuaNqZe7Dz8OLDgsOCjHQ1h0/zR2qWDxyZQCMw==
X-Google-Smtp-Source: AGHT+IGEPjrc7E3XSHPi/2+llzft/OrizYqevQt/UvlOC32uZuQkWLpdhbDzUCuo0iBqkToad+7bIg==
X-Received: by 2002:a05:6602:13c9:b0:83a:9f64:6c75 with SMTP id
 ca18e2360f4ac-83b1c3b79f9mr1881573739f.3.1730489027149; 
 Fri, 01 Nov 2024 12:23:47 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de0488952csm863000173.5.2024.11.01.12.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 12:23:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 13:23:44 -0600
Message-Id: <20241101192344.1064302-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730489027; x=1731093827; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9l6hObm3OCYGsU1n0xLlERBqtfxnolMDTnEodhFHIv0=;
 b=ZuxO3CQGk/QT83A+pId0oNW3qKmR5fPaxuL9FXTYTg7wtMGDmz9LukDtC1NQF+Mch9
 k91NJt4Dgwp/xc/veILe61GkyDo7MBMDT6dZclRQE0ET2ywInOAby24UhLJG3XkOKXb/
 gFkIxxFaB8T2GCGKvzZH+PMnO4FhvP2kvgdxch7IzVcBPS204685ehUUOxZeyP3LlK8w
 M52iHt2p9cNT9b56QXKEU/ufkFk64e5PYM9dVuFp/Tpp8GEcOWOdZHcRPMH2DsgJlve4
 x2mDE7lB19k9HlsQ/8qEf9fqiDFTwm7yWPAPz92L7rGXXZpPb+s7RU4/aLvSV7hIy3to
 UgDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZuxO3CQG
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.25.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 8280447a14..2ee1c5cfef 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  34fc9b62235ed33320ee6139dff66da88584fc08a7322a808526b95aa3141449  python-pydantic-core-2.25.0-cargo2.tar.gz
+sha256  5617ab9b3785c52ffc07f19b1125d24e6062179041a839be8e7d1ceaa378c522  python-pydantic-core-2.25.1-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 0ac54265a4..b1d0a21e15 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_CORE_VERSION = 2.25.0
+PYTHON_PYDANTIC_CORE_VERSION = 2.25.1
 PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
-PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/b5/fc/4e4d9ac36c99c2bbb5a87885abc508f7d274706a571e3be253dc570943eb
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/38/f2/88e2e8b3903be9df15207bdcab90987d16fb98ee794ad1b3cfdbce9815fc
 PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
