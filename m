Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A13C4707C
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 03:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D47B68308B;
	Thu, 11 Jan 2024 03:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D47B68308B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZBS8jevHk4cr; Thu, 11 Jan 2024 03:04:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DD13831C1;
	Thu, 11 Jan 2024 03:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DD13831C1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D427D1BF588
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 03:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAE2343791
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 03:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAE2343791
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 45id_mk1NSqf for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 03:04:00 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6ADE843666
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 03:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ADE843666
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7ba9f1cfe94so147488339f.1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 19:04:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704942239; x=1705547039;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s8w2rBiM9X9jet7LwcdPUSF/a7yiDJY8P7uvEjABea8=;
 b=s+z4bdU+sGHErF8vJODlfYx7jsPj/Mq3j7edcWp4sbF/E9eg3wP/12D4WeQ9X9+Biz
 8RycZSUkmtDfMWUGw3NakSs3ZKy96QT2VEXOOagjCDhuAey54htl2euC4sF6uzbqrobh
 L56tPmoWm496/gtRzTcbwKID0ogbHELj5egUUsgnVbIgkdb4o9IUSDtHgmZ4howrQYJW
 h6PO2NOtG+lcQq/tSjHZUYFB6JABFZ1QRmcy2qlihkDi2N4BGtUDCpZw6BVqaWUErfwt
 BjGXpyOjPZjmSoskhkm+nYn5UTgxstCfTA/LoCqhQCNuD1P6ZaPLw3uDrKR/ZtgBKw9u
 hpgA==
X-Gm-Message-State: AOJu0YxbDH6pKChvP9X8h9mh+QUtwJJ2WF8YQXAx/igUnhBoiAU+oK4X
 pdCgP1QsfS0I9ojp7zEIkj+Imzvg/a433Q==
X-Google-Smtp-Source: AGHT+IFHDuwDE0D3DlGFdMxhrM1OxJQ0sB7TdHJBL+IXT6Wf4VW8KwRue6nu1kJneK6oDwugIQpBBg==
X-Received: by 2002:a92:d98b:0:b0:35f:e9f5:7966 with SMTP id
 r11-20020a92d98b000000b0035fe9f57966mr53526iln.22.1704942238532; 
 Wed, 10 Jan 2024 19:03:58 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 q16-20020a056e02097000b0035aeaed5112sm11227ilt.84.2024.01.10.19.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 19:03:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 20:03:56 -0700
Message-Id: <20240111030356.2678848-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704942239; x=1705547039; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s8w2rBiM9X9jet7LwcdPUSF/a7yiDJY8P7uvEjABea8=;
 b=IMVH/Cln4oMDcpGYhsUN6gokRIXWDiIg7ah0bQnSve0b9k6UO8RDYGmNzoPN3vnx27
 lREHcJHXfiLOK9TRLV8ya9sTXeVun93YHDC5QxeIgk8FMcZbuWsOZARrSWHjfzXfOgqj
 2r7ro189kZz9AzNuhZCPAQmOFscaRmiFM9wlipggAaxAjuww1ivuHIK3ZsxTuOCBS1of
 Da1UJg9YY0/1/xLXPEdnhOu08gGTiT3IxJhJnyz45GrNtCxjRWRJv2GssLW7TIM1wFlY
 560U9Mrw1VD79c3MEVVXcD7azB5ylEpc0+1DYm/79eJ7zaF4yTGyetG41ShHgLQXVeEA
 XcaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IMVH/Cln
Subject: [Buildroot] [PATCH 1/1] package/python-pytest-asyncio: bump to
 version 0.23.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
 package/python-pytest-asyncio/python-pytest-asyncio.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.hash b/package/python-pytest-asyncio/python-pytest-asyncio.hash
index f6cc1d2413..29a38c7dc7 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.hash
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest-asyncio/json
-md5  1d10f607444a375c1425a2a90960006e  pytest-asyncio-0.21.1.tar.gz
-sha256  40a7eae6dded22c7b604986855ea48400ab15b069ae38116e8c01238e9eeb64d  pytest-asyncio-0.21.1.tar.gz
+md5  0c81f6de855e546180de424c0db05c20  pytest-asyncio-0.23.3.tar.gz
+sha256  af313ce900a62fbe2b1aed18e37ad757f1ef9940c6b6a88e2954de38d6b1fb9f  pytest-asyncio-0.23.3.tar.gz
 # Locally computed sha256 checksums
 sha256  a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae  LICENSE
diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
index 5c5efd819c..8464c70f5f 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.mk
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_ASYNCIO_VERSION = 0.21.1
+PYTHON_PYTEST_ASYNCIO_VERSION = 0.23.3
 PYTHON_PYTEST_ASYNCIO_SOURCE = pytest-asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
-PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/5a/85/d39ef5f69d5597a206f213ce387bcdfa47922423875829f7a98a87d33281
+PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/1d/27/f036ec4bcbfd056c54572d7169ba3dbb54e7181f02f21caadd3aecb9cf5b
 PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
 PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
+PYTHON_PYTEST_ASYNCIO_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
