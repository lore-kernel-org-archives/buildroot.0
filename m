Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA86C83F1B
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 14:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA94781DE7;
	Mon, 14 Jul 2025 14:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sudMRS0Dz_k; Mon, 14 Jul 2025 14:39:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD3F7812C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD3F7812C1;
	Mon, 14 Jul 2025 14:39:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C26E5DF
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 14:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A527E40A2E
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 14:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCzveihF_YBX for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 14:39:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B201140A01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B201140A01
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B201140A01
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 14:39:19 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id CB5842C84ABF;
 Mon, 14 Jul 2025 16:39:16 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 14 Jul 2025 16:39:14 +0200
Message-ID: <20250714143916.62916-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1752503957; bh=+en3m1mSfGCn5OGT08TVRw+a7MMu5nMqD0R5Z/yC4Zw=;
 h=From:To:Cc:Subject:Date;
 b=hOe/hwgE7hjzONZ3pWhnQhsI5pUqKmf5EQLJfzQ3V0wDDTPLPT0CkxbPmlxhncRKk
 6e8nefFM+Dj4cBCS4umGahGFlk3fAo0hUcsLPxYh4YaSzwTZAs0OmOvDcrHGVlhSTJ
 Rzpp5a26AoTwdhDWjrMi3aGeJmbGf6QHwTaFDu3sbpzg+xF6k1Wr7s91capT+8fXWq
 5CIN9AEl+naSmcZnErgDMJXwAISRD9UwvCQDuVFMan+AsVueVc24sN653e5srhldSF
 uHtQmq+gw0PhL84XzXQYP9W0YW4MdFHtNXVaNIDHTkFWlaCwQ0zzckGDsJnNxDt5X3
 8MDBl8aE2o0wA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=hOe/hwgE
Subject: [Buildroot] [PATCH] package/python-pyproject-metadata: bump to
 version 0.9.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/pypa/pyproject-metadata/releases/tag/0.9.1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 .../python-pyproject-metadata/python-pyproject-metadata.hash  | 4 ++--
 .../python-pyproject-metadata/python-pyproject-metadata.mk    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.hash b/package/python-pyproject-metadata/python-pyproject-metadata.hash
index 90f51c8c28..b29e00e6c7 100644
--- a/package/python-pyproject-metadata/python-pyproject-metadata.hash
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyproject-metadata/json
-md5  d947b3c632f4aee9cf23bb5950ac02f9  pyproject_metadata-0.9.0.tar.gz
-sha256  8511c00a4cad96686af6a6b4143433298beb96105a9379afdc9b0328f4f260c9  pyproject_metadata-0.9.0.tar.gz
+md5  d897e16dca18204e421f912487730668  pyproject_metadata-0.9.1.tar.gz
+sha256  b8b2253dd1b7062b78cf949a115f02ba7fa4114aabe63fa10528e9e1a954a816  pyproject_metadata-0.9.1.tar.gz
 # Locally computed sha256 checksums
 sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.mk b/package/python-pyproject-metadata/python-pyproject-metadata.mk
index 7429ba8af3..6cac09c376 100644
--- a/package/python-pyproject-metadata/python-pyproject-metadata.mk
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPROJECT_METADATA_VERSION = 0.9.0
+PYTHON_PYPROJECT_METADATA_VERSION = 0.9.1
 PYTHON_PYPROJECT_METADATA_SOURCE = pyproject_metadata-$(PYTHON_PYPROJECT_METADATA_VERSION).tar.gz
-PYTHON_PYPROJECT_METADATA_SITE = https://files.pythonhosted.org/packages/c0/79/406a9f56c435caaaca4a1c66397e4f63ecd48a72a6c4fc1d9ecdaac66acb
+PYTHON_PYPROJECT_METADATA_SITE = https://files.pythonhosted.org/packages/64/ae/5fa065b049e97f96880de0611dbba513f0ee313b6edd0a64664c7b46a8e8
 PYTHON_PYPROJECT_METADATA_SETUP_TYPE = flit
 PYTHON_PYPROJECT_METADATA_LICENSE = MIT
 PYTHON_PYPROJECT_METADATA_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
