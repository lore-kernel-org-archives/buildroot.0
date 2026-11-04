Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088F2606B2E4
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JGsKlKEJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5E446078E;
	Wed,  4 Nov 2026 22:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ky2v9MYCAam7; Wed,  4 Nov 2026 22:20:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DAC66607D5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793830826;
	b=r3Zx0nQU8ruYck0Zqse8WR304Q+uWomMR9sEOfX/yU+aN3IzpJ9qJY5Jf7Uq31F0cGgp
	 7aE0esCIlOtiJiFKe1U1LcAHs53K34IgaVJ7GtWhFEI3z8NTe6KzGmmlq9fSv4VG4uYby
	 x4aqBto+wCuAY7AU7y9FCOGKuwox4TubrNgn3DjN9pRT2wNtkGqfk1lPcFhL20LSRr8Ck
	 PapurZntris1VO3Qz6JUyDgD44M3wIaSahSxBpkTiGQzQNAI8jOltvJk4ZGq9N5AMXZyg
	 EvMCv0VsJRS+3C5GA+DKwkGm5c5kTbwOboidczC2KK0n01kc1s4JGhWm7v5+U0tFhzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793830826;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jK9s8lABbDOJ/QKiEFF86ZCB7BtFdD0bUG8fx23J8U0=;
	b=jAXyFhmZCihqVzHVF6IUZwqH9nc680D7bN3Ed6D6/3MOVDLLQCTuGdOI3YmodzlDzL/o
	 sxpwID6wNehqoPxPAL1P3oLps6CXOQ3a2LDq/sxQUQakVYmDtMXTTC4dFDHXIagMRe5ge
	 Bmky32k3oaIvxK1hm1HlCJ2PSH/LG2gtb50QO+c7SiZ73z0agP3BbPjjuRO0pqSjfrq1m
	 OvnAylsKw6oMvrXDOsEDpw3TgtMu1b1X4NbQjfBdixEAkpKmIvKxxdaScN+DbBxQ754sX
	 6/BztqZ4yI09O2/GJwPiHhWmpgcUezVEnxEGU//8fiA8hXmw7bW+maQX9EucRqwg9xg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793830826;
	bh=jK9s8lABbDOJ/QKiEFF86ZCB7BtFdD0bUG8fx23J8U0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JGsKlKEJlr4qM0Y98oPSzJBhAXNhOvOJvoWdeYzp0eIMobK45FY3MBPj94NXYII3r
	 OZ/Et0L9AnDestW3Sp0dqE03gpVfWNMAu3FYZn/+V0Pj6blAZM4in2fd2bpoxYxj3O
	 zWugKg1MQw47dDAizvxrX2QOmu/V6O0+zkkrOPlzEiuFCqMSlDMdRguTV82LpuwLTv
	 4Bo+qIG3qNvUd7/4U57Z8reAwatdtDlaKO5s8vfgoJC2P8uUK5cgLAtBj0SJBdKBSa
	 NKL5JCF4UQ4QGDsIpSKFnJKqPIsV0PP3sn621vO+rgJLAdqxm8nECFFCYBRz0WBvpT
	 mPHPhZzUGMjQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAC66607D5;
	Wed,  4 Nov 2026 22:20:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D038C362
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B610840217
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UotO30uB_S1z for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:20:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 02F774008E
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02F774008E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:20:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 167989DF12; Wed,  4 Nov 2026 22:18:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 23:19:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 784356284c4b73a98db76e9d257631f649305bdd
X-Git-Newrev: d316ece99e6212861a216a07b0e86fe075add8c1
X-Patchwork-Hint: ignore
Message-Id: <20261104221853.167989DF12@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-platformdirs: bump to
 version 4.14.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d316ece99e6212861a216a07b0e86fe075add8c1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index 073f9b002d..dba740657b 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  07dd523bb5ca12c4525df2cd242336b1  platformdirs-4.14.2.tar.gz
-sha256  6d13b4c1d66b7548dcec9e3db13c1ba9d9adb65041b5d07869313afc07e6e41b  platformdirs-4.14.2.tar.gz
+md5  7c9ce7098f9d717b4a0614fa8656f871  platformdirs-4.14.3.tar.gz
+sha256  021add1ab113483edbcd4694f5fbb2d688b893ea30d35e1155bb371cf4be0be8  platformdirs-4.14.3.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index f6da1e5498..fe8d990be4 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.14.2
+PYTHON_PLATFORMDIRS_VERSION = 4.14.3
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/6e/4e/2684728d9f2c8c4110738dcadca7e0bed4b60c8dc68c40c2a9e0cf017900
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/9a/6e/886dc7c9d21e2d95aceb696f1e31271742033aeef3661f6e9c8921493592
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
