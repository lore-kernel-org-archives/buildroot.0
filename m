Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84595606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JsShWREf
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 619096065A;
	Sun,  1 Nov 2026 17:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWli5fcx86E5; Sun,  1 Nov 2026 17:36:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6710E60612
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793554582;
	b=pgadm1aHN0iPNQOo6LDQcH1zM/DTmRqlH4u8qc0h/Kv+0IAJUTLJtspCD5Sa1hMrWmOc
	 tAl5F6wRcoytb3H0c/+I0vqujS4+XBGqyIvruYgTdIGnYCmID1otfz2ERMeDSrJ7hCHTb
	 PMy3oX6b0cRZK1oBxFeBLnJPaTU2HbxmQO8rWHp8WgAzGwy9ReVZfnPn+YH3NWJoQH0sc
	 Uuj2gaombOzfg/dY+TSL/Hkzscchp+NreeazJIYZNNeZDs48mrZbY5ZuSf4pUwYEGiVrB
	 J+nctwiYbja9ECm162yUlrbVChGjj4lkmwFmLbaG2P0EtTjV88P5AEJqyvI8o4ZTCmA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793554582;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=J9QFYN7FMdE7s6sDEhrwNp5mBpeIghjHCoSEUc7UdsA=;
	b=DgXUPU780jpxuyae6aypELaHAxNIqeUaG2gXV7GE8D4oGn4BMHtQkQXiX2RM0miFxwR/
	 J3VCpc5iGBqN6YwZjNmnbjAEjaDQFRuiYy+Ja2o0QmVpes5Ktb4YSrcPzD4Q7jkFpBceB
	 imI9Z5ihzBYtYUJZ8QslRbhOqWTZBSBFZdLau2cG1yal1HT+iJ2kuLBG+1bXDoConVWCW
	 yaJrSBqFKUQnO1iWWrF1MdDFYuUfFci3FDNfVX4Q5/hiB9QUVeQB7Lawcku/hdOmCUDJS
	 6q9vh3FNPTntWYyfq4m8CbR7suCTqAICQY4dlc7869RTRKdW/1BbxbAHPupdp05ea4Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793554582;
	bh=J9QFYN7FMdE7s6sDEhrwNp5mBpeIghjHCoSEUc7UdsA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JsShWREfFYPC2x6x95+3c4/6x1R0OO5E36kdO27C0qhOWeYzHzfXEb/fbOSoL5Dku
	 h1Pa6A5PwVmoENTxGHZWPA2eohVx6KjKrKyNdgu6p5Umc6w3dFaJhOXeDk75SS8btq
	 ulV/+23+MdmIrI0w9XI2p8vaabwQ6U+TMphzT8Kjsr3rj+uEFvPBmKVPm29dDgcbbH
	 2xJ3wZKJU5FOF+2ScolvPuCshwuuC9Af9mbQz/ukK3MrRan4DZcOKobCbdM0g1SW81
	 eTB/IXGQSB4qDcF2B6PErkTi+f+CSORuNcO4dm93mg2qOZ7+WD8DwQyy8XjvJqHsZx
	 zzkI0mvBa5eTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6710E60612;
	Sun,  1 Nov 2026 17:36:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24648EF5
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 221396060D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RAYa1Gosjbev for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:36:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 709F160616
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793554577;
 b=HnJeS9zgCSgoQNgB1lNLoZlYJWnl36e/vvIcPYMCkrQ4BzUBuHStS74ikYlr+W9fvZwW
 ze2Fkrhci6Ivn5Bbob6X1NLTvSp8auM9jKcLjk6fRxrcAusNop0Ghlin//iRNblnYVnSB
 NpTfIPhZL3bmgktLn1s+Gb73/U5O6/Dgad+YXwMbO8xHrv8QayfL7kLsbtthx/3RQgloq
 x/hp+LtehY7aclFLApzQ7ptQOoYkVhsDUjaYu+jreRv5bcrutdrgUH6yEqyUGGkyFXed+
 qW34oQHLGvo0QvufMw3qWM7RyJUhOnB4HSFNHOsOEveyZbCpbUlT6A+UK8TWukEfGlQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793554577;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XdDIZ3OxazaU+a4swMFxtNAjswPxFPUNniCnOCrg3Ww=;
 b=PgmHAHk3EfvoFhNTIhf/kYIEApbFGxNifO3+T4hkWAnQnsnrvCb/A7a0viCDmwFheO8m
 NCZHLTUGh06meZPa1sh13MIezKz7ex9o+DB3E/5k6kuelhdIGVYVhquOywBMZdyHE7wu6
 nnx5pvUgP0tjttoqW9S7Qvf5Rl5qIiV917CkOa05giuDr6FADAUeypkLA+5RUqNZESShr
 VsarqqGtril8pbubFhwPzQcy4TVnJ1Og/Y+DZpOl/dlvm2jpWuJH25IZIa9f59cnV80TA
 fW1fMnV3/2mfXiX+0rpApBt25bcZRE23LMlM1OGWqCmA+kIHEDnmw7VQB7PUpGCjfKw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 709F160616
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:36:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F2129D4AD; Sun,  1 Nov 2026 17:34:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:16:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1cdd617b124514f68e26e6ce926d1522410e6cd
X-Git-Newrev: 006269e93297e1a4009553526b158c6287aad805
X-Patchwork-Hint: ignore
Message-Id: <20261101173448.2F2129D4AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-httplib2: bump to version
 0.32.1
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/006269e93297e1a4009553526b158c6287aad805
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add the missing host-python-pyparsing runtime dependency for the
host variant.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-httplib2/python-httplib2.hash | 4 ++--
 package/python-httplib2/python-httplib2.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-httplib2/python-httplib2.hash b/package/python-httplib2/python-httplib2.hash
index fcb8b19374..58929f2577 100644
--- a/package/python-httplib2/python-httplib2.hash
+++ b/package/python-httplib2/python-httplib2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httplib2/json
-md5  0c45edbd75957af282de53fb428f6b1f  httplib2-0.32.0.tar.gz
-sha256  48a0ef30a42db65d8f3399045e1d09ab0ba66e3b9efc360d07f80ea55d286025  httplib2-0.32.0.tar.gz
+md5  61c2a054468f59da08155d4addaedc87  httplib2-0.32.1.tar.gz
+sha256  37900eb8a74576bd99fc39ae1dc8409f95f965d45b56cbcb2194bb55f58a90e1  httplib2-0.32.1.tar.gz
 # Locally computed sha256 checksums
 sha256  589eec38f72df2be203711d3b8cbece9b908c5e7ff00bc3cab7f63bae9e366b4  LICENSE
diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index ae683c759f..f4ac638f33 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-PYTHON_HTTPLIB2_VERSION = 0.32.0
+PYTHON_HTTPLIB2_VERSION = 0.32.1
 PYTHON_HTTPLIB2_SOURCE = httplib2-$(PYTHON_HTTPLIB2_VERSION).tar.gz
-PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/84/f5/ccf58de92d61e3ad921119668f54ed36ca1d0cf5dcc5c1657dfb164fd78b
+PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/93/da/affa4b2adc11468c7d88d9b4258cac432479046edcf212284b55d4528593
 PYTHON_HTTPLIB2_SETUP_TYPE = setuptools
 PYTHON_HTTPLIB2_LICENSE = MIT
 PYTHON_HTTPLIB2_LICENSE_FILES = LICENSE
 PYTHON_HTTPLIB2_CPE_ID_VENDOR = httplib2_project
 PYTHON_HTTPLIB2_CPE_ID_PRODUCT = httplib2
+HOST_PYTHON_HTTPLIB2_DEPENDENCIES = host-python-pyparsing
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
