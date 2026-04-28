Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A66FF885A
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 14:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE2D383438;
	Tue, 28 Apr 2026 14:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uIkqfkekXeOI; Tue, 28 Apr 2026 14:32:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74ECB83143
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777386754;
	bh=ySxhH4lbQZ5GcoQBa0DaZeYesyA05w4WAjVAxD8xSXo=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Gi4evbW3Q1e5vGrdhCR65P6pw6FP1ds9T6f0WIuAZH2rsRlZdR+exFjTTdeDuGlyO
	 ySGmhjxkOBNu37hHwD3g927BGyaMKWtztAyClDStJN7DTFIDLcVWjuE9Qmsw/7d6Mj
	 dD7FmuQNIyu0Bp4K58iBWl7hjIoEV6OI1o9Rmqz5CL7R1B3qG+VSPlLuZZlYGFgxh+
	 wmOntM6s6gyd5DiNI3MxOjCGulBmQBTvpxdBIieWL3WUKKNpOOnDVm8UrsfWhX1sa9
	 sxobM3XDKHCPS69eqDl1VIzZ5hQYFDSO06TV6oxlMZv4x5ImBW9CKoWCiVDdId/Jrx
	 1a4EXI4Fa3S7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74ECB83143;
	Tue, 28 Apr 2026 14:32:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 57A091B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 14:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49343403D7
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 14:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nAK-rnQtCpAf for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 14:32:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.92;
 helo=sender4-pp-o92.zoho.com; envelope-from=kingxukai@zohomail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 50DA0403C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50DA0403C3
Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com
 [136.143.188.92])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50DA0403C3
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 14:32:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1777386748; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FlSyjtsLj3sqc7gn+WS4yk6FLRonQFePhAk2RBUGhALGB/LV2Nmf0EuEY0I8u2JmEuLWQiSfZG32oV/T8VoZKs38a0ys2xswO0TMcg6bWg3PfzbX8rSPlBNq4oovTKLzkxwvSz7lPBJcd/4xQjVsytmNu9OG2ii1jBW6WcRzDBw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1777386748;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=uqkEJV+OwdpGT+xMAWfHav9Lw9tHjQ8olx65/WFt/H8=; 
 b=GSSarOUyDHcPG+6cEcYrUzpegluz4iTbymMZM0r+xdiobHk8REcA63mUusRC3xsSWEo2JhFG6/oqPV/YmgsvJQOIF1p8jnxd6jY1fP1F55Zv2mOdki2s226w3iHP/9BMmyUPrHvs3b060A8ubYqBmGe5OFLZIynWjHZlv/jwqCQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
 dmarc=pass header.from=<kingxukai@zohomail.com>
Received: by mx.zohomail.com with SMTPS id 1777386745552324.51572483804307;
 Tue, 28 Apr 2026 07:32:25 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 22:30:20 +0800
Message-Id: <20260428143020.2129906-3-kingxukai@zohomail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260428143020.2129906-1-kingxukai@zohomail.com>
References: <20260428143020.2129906-1-kingxukai@zohomail.com>
MIME-Version: 1.0
Feedback-ID: zu08011227c993e19dc00b699c5c8548dc00009555e8772ca9248d9b05d97449100c055f0c55afa74ed28192:ZohoMail
X-Zoho-CM-AccountID: 2ee5dd3c83366259b2ba1e9826250ffebed1ef2dd213857d649ad25aba73b429
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1777386748; 
 s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Reply-To;
 bh=uqkEJV+OwdpGT+xMAWfHav9Lw9tHjQ8olx65/WFt/H8=;
 b=F2OB7uzU4JU/seikkAuRGxWXs4UqiFCnhi4asNpovKm7As7+QhE5vSPcQlnlwc22
 kC/qYxqt5+yvWwEzpUXUHuocORbH874Pf7BtgS2gOgOSzxLRIOYkAGqCsvPyPvoLwKg
 yk2kxsyNnzNcsFWkDeDmO+owrq4t98a/E9SQnDKc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=zohomail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com
 header.a=rsa-sha256 header.s=zm2022 header.b=F2OB7uzU
Subject: [Buildroot] [PATCH 3/3] package/python-gymnasium: bump version to
 1.3.0
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
From: Xukai Wang via buildroot <buildroot@buildroot.org>
Reply-To: Xukai Wang <kingxukai@zohomail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Xukai Wang <kingxukai@zohomail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/Farama-Foundation/Gymnasium/releases/tag/v1.3.0

Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
 package/python-gymnasium/python-gymnasium.hash | 4 ++--
 package/python-gymnasium/python-gymnasium.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gymnasium/python-gymnasium.hash b/package/python-gymnasium/python-gymnasium.hash
index b76e0a5710..9a3b598346 100644
--- a/package/python-gymnasium/python-gymnasium.hash
+++ b/package/python-gymnasium/python-gymnasium.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gymnasium/json
-md5  b67cd4243af164eb11888fe731c91e11  gymnasium-1.2.3.tar.gz
-sha256  2b2cb5b5fbbbdf3afb9f38ca952cc48aa6aa3e26561400d940747fda3ad42509  gymnasium-1.2.3.tar.gz
+md5  e401a13a7c39201ec6e55c2dac1f91f2  gymnasium-1.3.0.tar.gz
+sha256  6939e86e835d6b71b6ba6bfd360487420876deafc79bfb7bacba83a7c446bcf3  gymnasium-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7dacaa9772e856aee6943b32ef663d3634d91d72ec7bbc74d136943673f91e18  LICENSE
diff --git a/package/python-gymnasium/python-gymnasium.mk b/package/python-gymnasium/python-gymnasium.mk
index 1cf79a0baf..dd5ca59f30 100644
--- a/package/python-gymnasium/python-gymnasium.mk
+++ b/package/python-gymnasium/python-gymnasium.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GYMNASIUM_VERSION = 1.2.3
+PYTHON_GYMNASIUM_VERSION = 1.3.0
 PYTHON_GYMNASIUM_SOURCE = gymnasium-$(PYTHON_GYMNASIUM_VERSION).tar.gz
-PYTHON_GYMNASIUM_SITE = https://files.pythonhosted.org/packages/76/59/653a9417d98ed3e29ef9734ba52c3495f6c6823b8d5c0c75369f25111708
+PYTHON_GYMNASIUM_SITE = https://files.pythonhosted.org/packages/4d/ff/14b6880d703dfaca204490979d3254ccd280c99550798993319902873658
 PYTHON_GYMNASIUM_SETUP_TYPE = setuptools
 PYTHON_GYMNASIUM_LICENSE = MIT
 PYTHON_GYMNASIUM_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
