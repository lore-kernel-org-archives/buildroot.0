Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98254E6F060
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 14:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 424A1605A5;
	Fri,  1 Nov 2024 14:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dhb_DnLNeTk3; Fri,  1 Nov 2024 14:41:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54F8A6061B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54F8A6061B;
	Fri,  1 Nov 2024 14:41:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E5B983B
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 14:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C468581241
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 14:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a85rjzWlXFTP for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 14:41:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E5AC80BFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E5AC80BFB
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E5AC80BFB
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 14:41:20 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 2A6902C801F3;
 Fri, 01 Nov 2024 15:41:18 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 15:41:15 +0100
Message-ID: <20241101144117.3083087-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1730472078; bh=iMnvIJ/ECCRT3BpoHs98oWaJ9yZcnNYBCUgODRb7qBQ=;
 h=From:To:Cc:Subject:Date;
 b=Qu4ivXL3RZrn73cMKxF7IOxKeeJtByLuQZ7rY4N5Kn7kfSd+0FZkRxHhUAwwbzZdj
 ZEA/GqnidZgbh4zCeK7aRl07WWeoYFIApKu6RsrrC0epcd6ttw1A9R4TJcszd6n6eg
 PMds5OtyWGZc+7EbXvjRwkD4QsVsyJxtCCbOSxGyk6VWrG5JdW2U3M5Q8KthtZXRd/
 8aYlk205BgUV0+2FZthLP+ula/uoYVODbs6ABnd5j5WerLYzhIHQXjwS97ZgyOZWds
 BdEloomtPLu8jXilyjHfFeBw/sVFjS0eRLtPC7SgQcjJkEKxj7NgxirE09tkoecTCi
 jbrwUFQ6FyAaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=Qu4ivXL3
Subject: [Buildroot] [PATCH] package/python-flit-core: bump to 3.10.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <marcus.hoffmann@othermo.de>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Marcus Hoffmann <marcus.hoffmann@othermo.de>

Changelog: https://flit.pypa.io/en/stable/history.html#version-3-10

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-flit-core/python-flit-core.hash | 4 ++--
 package/python-flit-core/python-flit-core.mk   | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/python-flit-core/python-flit-core.hash b/package/python-flit-core/python-flit-core.hash
index 4d4907f5dc..2cc8032194 100644
--- a/package/python-flit-core/python-flit-core.hash
+++ b/package/python-flit-core/python-flit-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flit_core/json
-md5  3bc52f1952b9a78361114147da63c35b  flit_core-3.9.0.tar.gz
-sha256  72ad266176c4a3fcfab5f2930d76896059851240570ce9a98733b658cb786eba  flit_core-3.9.0.tar.gz
+md5  38fd365dc980d99107dfccadc96d0c4f  flit_core-3.10.0.tar.gz
+sha256  6d904233178b3c924f665947ac7d286f2ac799fb69087e39e56ceb4084724a97  flit_core-3.10.0.tar.gz
 # Locally computed
 sha256  35b4f1dec512e617077fd6980dbb43ef8c2887adc5d0185edb4c04da175dd816  LICENSE
diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
index 34e58d03ca..e57d795a63 100644
--- a/package/python-flit-core/python-flit-core.mk
+++ b/package/python-flit-core/python-flit-core.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLIT_CORE_VERSION = 3.9.0
+PYTHON_FLIT_CORE_VERSION = 3.10.0
 PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
-PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/c4/e6/c1ac50fe3eebb38a155155711e6e864e254ce4b6e17fe2429b4c4d5b9e80
-PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
-PYTHON_FLIT_CORE_LICENSE_FILES = LICENSE
+PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/52/92/89cceb9c49f3e6c72091304636c5ebc2fc48c546742bbf8a6a474e48e666
 PYTHON_FLIT_CORE_SETUP_TYPE = flit-bootstrap
 
 # Use flit built in bootstrap_install for installing host-python-flit-core.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
