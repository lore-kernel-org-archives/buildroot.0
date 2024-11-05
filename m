Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22C9D3177E
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 18:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8079F60651;
	Tue,  5 Nov 2024 18:29:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RToqtB1BGZZQ; Tue,  5 Nov 2024 18:29:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D2D4606E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D2D4606E3;
	Tue,  5 Nov 2024 18:29:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BBBCB8
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2984C4095B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bTRlT2Ov_AeW for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 18:29:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EF69A4095A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF69A4095A
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF69A4095A
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:29:35 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-83ab21c26e5so229892739f.1
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 10:29:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730831375; x=1731436175;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xnnev+eFL7ikeMrZE/9mgQLZxSlvTaayTlSy0n4DJZw=;
 b=CiZW7zwluaCoN7BEdoTvRRdR7nzqoavMeMS1EvsPzYzYko6OYBcr67S53xSbcUornu
 HbZdMo1iN+jFt96SfyQ9oXvUFO70cCVAA3q9Ki5b9upbTxyJeH+BSs2EWVGCJn6cVK1p
 gC+okV7e3N4B1aYmSsG5vN2pjgzgOlmomD0XyqtjsaarIL2Qasi35AK5AOauhMwa0fld
 BUsikHzu7nrVMbo+309W7Po/ziFbHCfKaKd/9g7nygCVtRKo/AhkDraeG7bsP51Gyuec
 f3qk8zVvn5F+b/6GjsG+tgxlSTSjOH/Eae7gV/f/8H6ScKsi6v4Uw65fliEgwB1ldV3U
 TxTQ==
X-Gm-Message-State: AOJu0Yz0bBR+Zb5U1TUMAbO8eSSTVAAnjKzT8BbwkftoePTiluvq2ovI
 pfCREjVPyc7ACrGSlMh5qKI3OTnE3xaagHICtfiAesrzkmh912etea/OCg==
X-Google-Smtp-Source: AGHT+IHqOvfR5osJeSJEhZe5gv7S8+yxl2/XhSBVVPe5cNZmzEsMcxUg6M0pM70u+10n3BYznPkFQQ==
X-Received: by 2002:a05:6602:1489:b0:83a:b235:2d62 with SMTP id
 ca18e2360f4ac-83b1c3b1ce3mr3354246439f.1.1730831374712; 
 Tue, 05 Nov 2024 10:29:34 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de04888287sm2541773173.18.2024.11.05.10.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 10:29:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 11:29:33 -0700
Message-Id: <20241105182933.1429795-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730831375; x=1731436175; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xnnev+eFL7ikeMrZE/9mgQLZxSlvTaayTlSy0n4DJZw=;
 b=dPpcIwJpWNcnvJ6Lw2hYqdje3mbhHQECnlQz2GM47hYVREXdAA+qMxmfhaE/zbzord
 fWmozCUjpb5LKAw9+bm212wJTCtzOB8GtOL2F2oJBBUxycl7IZnzMWF3irqdMBBqhYrN
 8BsThJZXRrJcAZkw1s4YUfW+75YxMlSLgdMJL0dOfRxWkcyLKzh0pvrAsFLqPt/MDJEn
 o5ju4MKOyNtsufCwfe6CIqn2+Mt7Yc5xTfLkbM0tcvCYT6DLEwM+nEXpkoi/UUeELbRw
 rLp8ddA/laIgIcEMlvwKGj5iwsdJM6nuHosKHHITFLYhZuKmqb9Mm12z0RkQCRwOTEk+
 lOOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dPpcIwJp
Subject: [Buildroot] [PATCH 1/1] package/python-alembic: bump to version
 1.14.0
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
 package/python-alembic/python-alembic.hash | 4 ++--
 package/python-alembic/python-alembic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
index c03236a105..5f20b18be0 100644
--- a/package/python-alembic/python-alembic.hash
+++ b/package/python-alembic/python-alembic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/alembic/json
-md5  c56a6402b0601a8c2d844a08928d752f  alembic-1.13.3.tar.gz
-sha256  203503117415561e203aa14541740643a611f641517f0209fcae63e9fa09f1a2  alembic-1.13.3.tar.gz
+md5  a12686c41704218fdb29f140be75cdfd  alembic-1.14.0.tar.gz
+sha256  b00892b53b3642d0b8dbedba234dbf1924b69be83a9a769d5a624b01094e304b  alembic-1.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ce19e7ba2b77ca584b82a6792856e138eb30b311c896b076c09a405ee45fbee9  LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
index a1e45630a3..5050765db1 100644
--- a/package/python-alembic/python-alembic.mk
+++ b/package/python-alembic/python-alembic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALEMBIC_VERSION = 1.13.3
+PYTHON_ALEMBIC_VERSION = 1.14.0
 PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
-PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/94/a2/840c3b84382dce8624bc2f0ee67567fc74c32478d0c5a5aea981518c91c3
+PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/00/1e/8cb8900ba1b6360431e46fb7a89922916d3a1b017a8908a7c0499cc7e5f6
 PYTHON_ALEMBIC_SETUP_TYPE = setuptools
 PYTHON_ALEMBIC_LICENSE = MIT
 PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
