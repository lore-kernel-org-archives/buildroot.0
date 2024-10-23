Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443DDD0BB46
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 22:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F18A240771;
	Wed, 23 Oct 2024 22:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lZDcvHWEtV_5; Wed, 23 Oct 2024 22:37:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B36724077A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B36724077A;
	Wed, 23 Oct 2024 22:37:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 954632073
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 825A84077A
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUsjPVzjZ0CX for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 22:37:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6326240771
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6326240771
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6326240771
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:37:53 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-83ac05206c9so11223239f.3
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 15:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729723072; x=1730327872;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nXmn7KR5lzOG74SvQP9OicRwyEzaZENtoLE/KdV+fN8=;
 b=j46t/lDLY9tD11ISPJO4lHtHywxLjr/cqRUwzdJjp18DjsXrvRPavGScbPcF8SHMjU
 LnZxWNkAyc9a9hWzJdI/pIxW5DATKOo/KQuBW2kqZEVyaXXZ5M+JpeyiJio85O+Ugs+i
 zt0VZDeOFCV9W6YosI8c3tzR1Gy8ZXRSf5XqkJvlM/tS0Cu+wVguwDYi9CEwIkuRTDri
 k2y02pT8B+UC77nkUhXSBOAJ3KyFeQq+zjkKIJeStj98YKZBzvLM18YhpJzGOg1iu9od
 P1JyFX+X9vCd7CK3Ah4IE5AuIh4gyP4BajkvxFIrUlmc22w7CQ3nboCDuoSSM3sVIIDa
 F/PA==
X-Gm-Message-State: AOJu0Yy2EJlrw3Q3vB7HwRuEWx74tTguSYMPHImtqidfWuufUzpZC2AE
 BZ9TXoQDYL6wTlwrn3TYBUDJCw2ji2R+j7geWD0s02cMoxVTInZXht/XQw==
X-Google-Smtp-Source: AGHT+IH+eIc/B0shMwSoqPjhjOVLtmm3i6Ro2eq13hQV53An9K/lAHiaGWJs+Dh4snOTs+DHsSTygQ==
X-Received: by 2002:a05:6602:1547:b0:83a:b7e8:a684 with SMTP id
 ca18e2360f4ac-83af61f2407mr377662939f.11.1729723072012; 
 Wed, 23 Oct 2024 15:37:52 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a5570f3sm2391126173.62.2024.10.23.15.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 15:37:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 16:37:50 -0600
Message-Id: <20241023223750.3348377-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729723072; x=1730327872; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nXmn7KR5lzOG74SvQP9OicRwyEzaZENtoLE/KdV+fN8=;
 b=kTwaYGATzqoAAgqVz+9kWbO1zWSeE+DwoTSqYMjW6Rbt2O6bZ1zyf457O21s6gORHq
 MwCEQtDghNe6QSB8zFOm+1pU6fHkmMDYC2b711FQO+C8n5q4zBHYdDGmwXsSVizYki+m
 kBGE6sP6XvrPkz7/WCrEh1CZJDYISRDnc1aBffMkHeVDCgIj48aenDvX3Nxk24YUexoS
 poG8q5SyWV7rYiSS4hAN65IJh1u7S2DT3WV02ryFuczDFDrHJncHfVampcj54frqFWlt
 RZA5cAAR8D7K2UJzlptQlmptOFyMDJDSkQ58UNnjhm1yduUVSp3vM0RVhkQ3x6428A6K
 I0Fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kTwaYGAT
Subject: [Buildroot] [PATCH 1/1] package/python-service-identity: use hatch
 setup type
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-service-identity/python-service-identity.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-service-identity/python-service-identity.mk b/package/python-service-identity/python-service-identity.mk
index 4092461634..3c04a9d4c6 100644
--- a/package/python-service-identity/python-service-identity.mk
+++ b/package/python-service-identity/python-service-identity.mk
@@ -9,9 +9,8 @@ PYTHON_SERVICE_IDENTITY_SOURCE = service_identity-$(PYTHON_SERVICE_IDENTITY_VERS
 PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/38/d2/2ac20fd05f1b6fce31986536da4caeac51ed2e1bb25d4a7d73ca4eccdfab
 PYTHON_SERVICE_IDENTITY_LICENSE = MIT
 PYTHON_SERVICE_IDENTITY_LICENSE_FILES = LICENSE
-PYTHON_SERVICE_IDENTITY_SETUP_TYPE = pep517
+PYTHON_SERVICE_IDENTITY_SETUP_TYPE = hatch
 PYTHON_SERVICE_IDENTITY_DEPENDENCIES = \
-	host-python-hatchling \
 	host-python-hatch-vcs \
 	host-python-hatch-fancy-pypi-readme
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
