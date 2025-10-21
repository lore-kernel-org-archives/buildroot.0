Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924A7CCD184
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 08:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50F338052B;
	Tue, 21 Oct 2025 08:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F58Jh81YA61h; Tue, 21 Oct 2025 08:21:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 739878052F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 739878052F;
	Tue, 21 Oct 2025 08:21:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34773277
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 08:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 311958052F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 08:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZwwgcsIN9QCV for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 08:21:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0BF448052B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BF448052B
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BF448052B
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 08:21:24 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 9D3CF2C80CE3;
 Tue, 21 Oct 2025 10:21:22 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 21 Oct 2025 10:21:23 +0200
Message-ID: <20251021082124.723906-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.51.1.dirty
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1761034882; bh=4Zufe/NfViQAvdHSHc3gv5ZNWDiAhUk42gnNim5RbPQ=;
 h=From:To:Cc:Subject:Date;
 b=DcdKnq3q5+Z/uEZcCigx8AJ4csbOOmcQkVrIJeorzAei4tXLIK0jrPdiHeHLj6HYy
 BYmPCh75J7veUWO4GaeTwesoPFQw6eYjZmoJ87EqXpZB4svyQrbllHfrrNAH6F17j3
 /Is6YmIkd9+i8KkkacQqbiW3zZ6AKUR607NODGHH9GHijy5RfVyiy5sAw/D0F3XXXW
 c9h4bLZiyRzuEdwQ+bsCQlkahjPAFagiw0vM2a08ObD7XszOQ98EMFj9j/nrKhoygN
 G1uNlSptSypqiRffVRjfvX4Lbun/t88Oq/lZPNR0jOfcq5PjOZ8iKsTNVDxb6ALkqr
 8U+EJbN+/V0Pw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=DcdKnq3q
Subject: [Buildroot] [PATCH v2] package/python-uvloop: bump to v0.22.1
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 0.22.1 is an identical re-release of 0.22.0

Changes since v0.21.0:
https://github.com/MagicStack/uvloop/releases/tag/v0.22.0
https://github.com/MagicStack/uvloop/releases/tag/v0.22.1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
Changes v1 -> v2:
  - fix license files listed in hash file
  - fix version in commit title
  - more clearly state that 0.22.0 and 0.22.1 are identical by linking
    to both changelog entries
---
 package/python-uvloop/python-uvloop.hash | 4 ++--
 package/python-uvloop/python-uvloop.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvloop/python-uvloop.hash b/package/python-uvloop/python-uvloop.hash
index 24111e759b..78165c2f68 100644
--- a/package/python-uvloop/python-uvloop.hash
+++ b/package/python-uvloop/python-uvloop.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/uvloop/json
-md5  adedf20cf065ff49a96813b783ec1d29  uvloop-0.21.0.tar.gz
-sha256  3bf12b0fda68447806a7ad847bfa591613177275d35b6724b1ee573faa3704e3  uvloop-0.21.0.tar.gz
+md5  3fdd58ac1b7c2a520ed05e3151a64515  uvloop-0.22.1.tar.gz
+sha256  6c84bae345b9147082b17371e3dd5d42775bddce91f885499017f4607fdaf39f  uvloop-0.22.1.tar.gz
 # Locally computed sha256 checksums
 sha256  377025287798f9dcd819e1f826fa5fc5e2f382528691ab0528c5cf8c8c282c27  LICENSE-APACHE
 sha256  6dd4c399f26de043d77a2ad7e31db4cb5bf08ea8368b0a42d6e158635cc8ab62  LICENSE-MIT
diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
index fbdf74769e..419ee33062 100644
--- a/package/python-uvloop/python-uvloop.mk
+++ b/package/python-uvloop/python-uvloop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVLOOP_VERSION = 0.21.0
+PYTHON_UVLOOP_VERSION = 0.22.1
 PYTHON_UVLOOP_SOURCE = uvloop-$(PYTHON_UVLOOP_VERSION).tar.gz
-PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/af/c0/854216d09d33c543f12a44b393c402e89a920b1a0a7dc634c42de91b9cf6
+PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/06/f0/18d39dbd1971d6d62c4629cc7fa67f74821b0dc1f5a77af43719de7936a7
 PYTHON_UVLOOP_SETUP_TYPE = setuptools
 PYTHON_UVLOOP_LICENSE = Apache-2.0, MIT
 PYTHON_UVLOOP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.51.1.dirty

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
