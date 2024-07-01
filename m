Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F916C3065B
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 18:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50D5B81EB3;
	Mon,  1 Jul 2024 18:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nGd-GpSecWxJ; Mon,  1 Jul 2024 18:51:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 503E581EB7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 503E581EB7;
	Mon,  1 Jul 2024 18:51:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A50261BF33C
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9088F81EB7
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nDSN3-l3K7u3 for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 18:51:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 965E081EB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 965E081EB3
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 965E081EB3
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 18:51:53 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7f3ca6869d1so135664439f.0
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 11:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719859912; x=1720464712;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6jwvUrO8OxnYZTZcJW7NPFqm4/wXxcwRjayxdCnWb9U=;
 b=wSdK8ubaLdDkxzloLQ/2uhqXFUclH93Pmjm09Lsy3Sdvm5o7wPFdSWYj31/CoTmY5q
 Vzb063dsUE6kRCDxZRD+1+WSvAwkIEaengSNkqwNX60wjCD6p5V8YUToMHFKK9L/hptv
 h4Ws4wS3RtTAQau9OLlyRjMDsNosRURbAi9B33dUZfVL6OrLeMczWNtUUlEH3Ox9GbM/
 8fIratN3sD03EbOWDoVWHPLVBFDm5NX4Kia4SF/SCeA4aRDJxWjIOdLmspGmE+rLaMOZ
 FWhZYBomvllNOmBMYZ1AJ0aaekJdHff+lUU2b0wZoEcT1QVcMPJcv9+Im6lZeHtKfExR
 VWEg==
X-Gm-Message-State: AOJu0YxAICYG3hCrdEphZPZIWPV1OxaQfaRKqwS9TgiRevq5RhcnpMlS
 iPVaSzcpvUOpCRQV0j+pfZWcxYG2UagTR0/DoJOE5pACjKcxMIsA6s4bEw==
X-Google-Smtp-Source: AGHT+IHT1xp+kplvcZGc+ztRlpl7Vxh2QYslM62AbWqm/8PFA4moVWoQ4tBBjCZUQMKL80WriiZZmQ==
X-Received: by 2002:a6b:d317:0:b0:7f6:2f96:b3f6 with SMTP id
 ca18e2360f4ac-7f62f96b4e6mr809646539f.3.1719859912249; 
 Mon, 01 Jul 2024 11:51:52 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bb742b00dbsm2351781173.121.2024.07.01.11.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 11:51:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 12:51:50 -0600
Message-Id: <20240701185150.1754085-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719859912; x=1720464712; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6jwvUrO8OxnYZTZcJW7NPFqm4/wXxcwRjayxdCnWb9U=;
 b=He4JpsuxPOwF9iT7vIBoLPzTaFbmhEX4nO47D7cluzWZzQgZiUr3Xsc+xfZ9FlMBAw
 nA0ENhaoZUdt56fepeBwXXV3oXcRtP83F5jsxsjbW6BIajwaiiLN052ZMvZTyIDdlbIh
 Q81rQdEv4HYQxnGN374QUoRPE6L1F8xjuiL93JNoa3oqv29oNAEQAZ8iLmDh6z6FnVIj
 WQLC1hEgxHC8ulQtNyxsp/MR29K4qAcVMCEJEHb0omeRekASFQsSWF48qN31IR+r8Blr
 TzTKqc3PhX7ZlOQBJnURS7JLyz/pW/beIrx+yyQ87+eJmv+akbXEZn9qrCBL8inb0Yoe
 hKPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=He4Jpsux
Subject: [Buildroot] [PATCH 1/1] package/python-jinja2: bump to version 3.1.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from setuptools to flit build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jinja2/python-jinja2.hash |  6 +++---
 package/python-jinja2/python-jinja2.mk   | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
index 2ab343cce6..2b32f5cce4 100644
--- a/package/python-jinja2/python-jinja2.hash
+++ b/package/python-jinja2/python-jinja2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jinja2/json
-md5  d31148abd89c1df1cdb077a55db27d02  Jinja2-3.1.2.tar.gz
-sha256  31351a702a408a9e7595a8fc6150fc3f43bb6bf7e319770cbc0db9df9437e852  Jinja2-3.1.2.tar.gz
+md5  02ca9a6364c92e83d14b037bef4732bc  jinja2-3.1.4.tar.gz
+sha256  4a3aee7acbbe7303aede8e9648d13b8bf88a429282aa6122a993f0ac800cb369  jinja2-3.1.4.tar.gz
 # Locally computed sha256 checksums
-sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
+sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.txt
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 209ca2e25a..780b693281 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_JINJA2_VERSION = 3.1.2
-PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
-PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/7a/ff/75c28576a1d900e87eb6335b063fab47a8ef3c8b4d88524c4bf78f670cce
-PYTHON_JINJA2_SETUP_TYPE = setuptools
+PYTHON_JINJA2_VERSION = 3.1.4
+PYTHON_JINJA2_SOURCE = jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
+PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/ed/55/39036716d19cab0747a5020fc7e907f362fbf48c984b14e62127f7e68e5d
+PYTHON_JINJA2_SETUP_TYPE = flit
 PYTHON_JINJA2_LICENSE = BSD-3-Clause
-PYTHON_JINJA2_LICENSE_FILES = LICENSE.rst
+PYTHON_JINJA2_LICENSE_FILES = LICENSE.txt
 PYTHON_JINJA2_CPE_ID_VENDOR = pocoo
 PYTHON_JINJA2_CPE_ID_PRODUCT = jinja2
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
