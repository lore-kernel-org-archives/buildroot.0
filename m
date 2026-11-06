Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD0D606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=h6LfzTTj
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6C1981421;
	Fri,  6 Nov 2026 21:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LOjco0LB0rFu; Fri,  6 Nov 2026 21:14:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 14F9A81412
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999693;
	b=hfLRdw4mZniRKL85cv26sB5sPksBS5OCgRB7jU9pDHNkXlUAE3TDZmy8XP/08F2nsKDn
	 qT0zqY4AT1w8r2S33Fld/UoAR5MPaoBmNHSDMd+3i53blzzyoX2xwNHQDgPtZsy6r9Cta
	 HCIjFmF4eNXrCe92XoseYbzxwPZcnOM+ZU2TJtHW8aId6ScFYAv7HO5dpd6bbjXWwrJwF
	 LFTyYBMXtZVjPFlcY1tRRj4/LoIz6opkqEMYYOa1JSwiBQ6Y+LKlqWvmiM3CmmavLcjBn
	 a9hOTdy25EL2jp3hzlWvQ9DuI0xOKwIRFBAO0aamfbvoF30LRHwf7eYxroK/7OPwtMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999693;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=r7aou1oXvZS6koFufhQcRcEGDvk0aSatNPaRb0OHiNo=;
	b=qhkh2SBRzEfA+76I34IgPHoUEQi2OiChPE+l//Z32jdvqrosMcXUQgrl41Vg+dZoG+vy
	 kssnKxt6L1pT/1tw8NGiZ43e0z/S34cQ8U4CziJ8jSo/4Pf4EzZbrfY7MksCLhr2xsAN0
	 zrmuwmdPbxF2A+RuMW+wPaEIx8MOZCQVKpxgEpPKDqbzB892BQp50pqVKpo09PS8TkBY5
	 WJnKsyZNvjhBHBIzo3wztHMgmsSq9qlTsQD77Sf0hmn6AlvV3Qk/k4dyb1R9BmpqexHfm
	 S1Zkn/5m37DyWYQC3Rx5qYXvApwSgdY7WizWdZGatoeqGoYJeJR5yxPU838StLqVC5A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999693;
	bh=r7aou1oXvZS6koFufhQcRcEGDvk0aSatNPaRb0OHiNo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=h6LfzTTjzoXsBsFXsCEW9D2ETplgRrr1P1Z+CPAZkUIAHTUYs50gPdQEaCKbgkVPi
	 7Lo/7EshvO27WeDrKsAeT5y660RbXpHROBqIeyITir0s4EGXgKLPbeyeeZSj+8+r6W
	 QGDknq1hrvAdX79ffRlWBuqw6OTsdhmLG5gU2NGQijv30E0wPutjYQq0YYSSaQck9u
	 osdSn/zYNV3lCH3BYMzuR0mbnAtRnxPSSyGroqat/3m+bh0riTJGSbwbDRJa6w4nL9
	 b0DbzWL0QRSiEjNH/DGKpm15NFx9jnFY5DgbaKHhv7zsFSW9F+gYxqlS4enKUe/7o7
	 KXo6hvWSjFlew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14F9A81412;
	Fri,  6 Nov 2026 21:14:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D19424B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2D7040990
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id As5jyEqECm5v for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2BEE0409AA
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BEE0409AA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 491359E0FA; Fri,  6 Nov 2026 21:12:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d567740691c8b9c69878c0c1e62f9c1afa3246bd
X-Git-Newrev: 27fe395079e3a6e0b13e2a96b465fba1d6b04b66
X-Patchwork-Hint: ignore
Message-Id: <20261106211249.491359E0FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pysnmp: bump to version
 7.1.31
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/27fe395079e3a6e0b13e2a96b465fba1d6b04b66
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pysnmp/python-pysnmp.hash | 4 ++--
 package/python-pysnmp/python-pysnmp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pysnmp/python-pysnmp.hash b/package/python-pysnmp/python-pysnmp.hash
index 13686eba23..2e215c7f99 100644
--- a/package/python-pysnmp/python-pysnmp.hash
+++ b/package/python-pysnmp/python-pysnmp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysnmp/json
-md5  af979cb67cd5fc816e90ca8eedbec289  pysnmp-7.1.30.tar.gz
-sha256  db72f439b066725d2586dff068478dc8e9b303a4dba3294462b0e76b3cb63bc2  pysnmp-7.1.30.tar.gz
+md5  ba51c0ef0a1a1df294554a56a4d5b599  pysnmp-7.1.31.tar.gz
+sha256  97ae3e8dbf05937fa7fc69b85c03c0b2cc020a15d16b66e54d5743d895109597  pysnmp-7.1.31.tar.gz
 # Locally computed sha256 checksums
 sha256  aadf5d3f4d90a949f05e2c185b783b877efbf625874992c361f70a536bed83ee  LICENSE.rst
diff --git a/package/python-pysnmp/python-pysnmp.mk b/package/python-pysnmp/python-pysnmp.mk
index fa6cc9b341..1b31966a62 100644
--- a/package/python-pysnmp/python-pysnmp.mk
+++ b/package/python-pysnmp/python-pysnmp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSNMP_VERSION = 7.1.30
+PYTHON_PYSNMP_VERSION = 7.1.31
 PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
-PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/55/2a/ab68df5b1a2f673da731da7caf39c29d924735359e7d50eacb80d2d38e53
+PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/8c/da/1fc15bc8255dbe8cb3effe46896e92a52db76c1ef53ab37c4e8ae9f09320
 PYTHON_PYSNMP_SETUP_TYPE = flit
 PYTHON_PYSNMP_LICENSE = BSD-2-Clause
 PYTHON_PYSNMP_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
