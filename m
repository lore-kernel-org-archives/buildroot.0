Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03FC606A33F
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 22:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lVvDKit+
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E8A4407D3;
	Sat, 14 Nov 2026 22:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8FATsC_cUv6C; Sat, 14 Nov 2026 22:22:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9FC63407CA
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794694931;
	b=nZdFB9AWKb+dIfOKVMu7vO2sg7V5/OFlH30gL0ks26nrK5fgxobdyWtoUZ+IYcdzuhpm
	 3a/WQ1BkI2GKgc7oZEuDVz+7NHKMlOpDUuuyhJSVs1k3k49FKMOYmTpfp4T2qzTxfjsjE
	 tsEijZlqaIrChRHa1KNsdwUjK/+2xVvcdsmKZFGmIvxEvpt3eZJZ8UYRI6FbdVYzYarXz
	 ciTIHs7SHIj/hwyPspjNBOl/yO1L48D5fysZDSJkI/xqzC+7hVFW35edAjOpasMVN3YT2
	 4KGh2e5wp42lNXEutlRRXAsj0a8nKNRD+qxiiri2kWhyOWvgFGmsg+IquS4807Sx8Dg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794694931;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Vkr0wEfRd8ySKR7M5VpJ92umHzPNixydqD8Bimn/LBM=;
	b=U30+1AoG3ZoVXEq2YNqJ5pSGD33ZyBG4cNKvBX6cIQqp5ZyZbcCHRYFePRkKvsZQFYzy
	 1FOfSoDj8wO3bO/1PHZdoMMRd79uvGah6u+y7cN0ycXwGZvhVci4XEYTg7U/wmUl+RssE
	 wRbKk3qc64CwRQcSKJlcOSMdnxw8wJjUpuyjEoeaF0CPLbaBhxAhD1MRrtZWhDEFCsY3C
	 3HQfBZPIr0O3J9NQUKtbQfnYdasB09cXAjaBXen2Uuo0wEw+XjcW1cpEqrMjDLiAbE9KB
	 wEFAHYQBFJa0CX6M3kt3fxiMMySM95D67SDYmO/6fXRau1LoqNTIS6DS/x87gdwX5nQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794694931;
	bh=Vkr0wEfRd8ySKR7M5VpJ92umHzPNixydqD8Bimn/LBM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lVvDKit+5RB6hX5DzOxfAiULdwJhyAx8PeeZj6jB+FQn3LkrGpyNi0pMz2F3fLg9t
	 BGrjZ8LBZdpSDsEgQsC/JPotLW/WHcDjU7nicC0WVQUmtcByZKQj45nnqu89diAkkr
	 Y3b48eqGJRzfP1Pw38ZJQ1N2X/iEZVZ8KeOCXgfn35t/LvgW2f4zyn4sgQ0lAftNig
	 NNn/G8cweM4GHoWKTaO3bUEL2pvSa0dtpNXzxoWhEnXcaNUuD8i8W107hnCblNnCZI
	 nqoeVC9KiCnCaXDR3ipX1kxlZdazXVmwsHzs0KY9Qd/3QjcEvvU8pshUBaLPUj563N
	 4Z5vEcldps0Qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FC63407CA;
	Sat, 14 Nov 2026 22:22:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A36011A6
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 22:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 958BB407CA
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 22:22:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I84c_ZKz24fj for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 22:22:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E7308407AA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7308407AA
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 22:22:08 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 089645FFA3;
 Sat, 14 Nov 2026 23:22:02 +0100 (CET)
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Julien Olivain <ju.o@free.fr>
Date: Sat, 14 Nov 2026 23:21:54 +0100
Message-ID: <20261114222155.1450949-2-ju.o@free.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114222155.1450949-1-ju.o@free.fr>
References: <20261114222155.1450949-1-ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] Revert "support/testing: test_python.py:
 disable interpreter colors"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We are now disabling colors for all runtime tests. Setting NO_COLOR in
test_python is no longer needed.

This reverts commit 3a6e2b4a0395f6e049cd847cf16406a4d0d998ad.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_python.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index e815376d21..c9ecf9acda 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -17,9 +17,6 @@ class TestPythonBase(infra.basetest.BRTest):
                            kernel="builtin",
                            options=["-initrd", cpio_file])
         self.emulator.login()
-        # Disable Python colors for all Python tests, to make pexpect
-        # pattern matching easier.
-        self.assertRunOk("export NO_COLOR=1")
 
     def version_test(self, version, timeout=-1):
         cmd = self.interpreter + " --version 2>&1 | grep '^{}'".format(version)
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
