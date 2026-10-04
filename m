Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA72CA5FEC
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 21:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1138A406E1;
	Sun,  4 Oct 2026 21:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CAPh-T1r6YDX; Sun,  4 Oct 2026 21:31:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C1EBA406CA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791149488;
	b=lIjGhhJD3ihGD56WB4uBDjCOv6PV6sfBpz4o8Cu22wu3TH+Y4V8f1bTScvwV/6DOIwnh
	 O2Aq5Hk/kXMPLonfKWTEniQCay3W2IGC7k3kt1O9qA7+TXqBBLm3kO7Gp/Pl+ueoCG7rP
	 xgRcJFqUswNse/w4h/e/q39JU8vawcXcnZGR26BWqGn7t+j3lK07nEGIFVJyEoldzI+Ux
	 TyBm4eecTk2qmaKUBYTcBQC8e13KGvPJKxa7xcascQ7dW07gzNXNfs8wFlIjoesdSbi6r
	 RUvf5Cfnq7WHyGOsPHR/+qXvo09i0v5Uiqa7bup9Z2+7MH8vM/I7P5uJodd2gKB2IWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791149488;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=mbRTWVxeXNdF+l6ZkfEZdPs/erNlsm3lLh4rwIcnv3M=;
	b=bLa6Ki9FuIxApa1PIo4+RkwDsJLrFhl1F0VY+OpNGne2iIvp+ORXw+hox6yQvi+HMRz2
	 ymwUFQ2Qaf4wt/VpKDcQsfJG9wBhTkU/V10efYa9feDLkvUSgorwJ3FyLcgqGJxqjKGE8
	 YjH/uWZVICA22yY1WEui0w2VXrCrxBVK2ySetMzgWnhdM2ckeBnuhQnvXro0C72YiOlLy
	 0HVD85/cDOQbI5RNWAQLqVHcwyP/ns5uTYoeYFRd89BlZ5uiX3D3Jqhw8gzRy6qjVBwbT
	 UVd4Wo/2qLYd96n8o6OLD3mHhl5covZ0oqlHPWqI+xbkv5KxDcgEYFw9OjrHKfy0c5g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791149488;
	bh=mbRTWVxeXNdF+l6ZkfEZdPs/erNlsm3lLh4rwIcnv3M=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=FztBSKBS/hV5CgzROb4iNVSTHdhfMwsGsQjgPcIkHIbZ1tjOMC8Z6N7BjDEYBRc40
	 Wxjkww8piqBTRkhV0PAXLuiSpSHDiiCLQPUfJYFTegMPSBzY+QLEDpnLJ6INQz55Rc
	 b7SBid4Ac58u0ioMwjvu5Y2IZMlpLRXKNkUoiFH7EjBLNL3by2D2Ws9NcMtO38mTJM
	 68lkQ5cZJnSSaF7cuDGsKD6lND5tgsFZvLmQUGCsrT2ccpC3fgY2/NoA0bG6Eh2qPS
	 eaGI2kKWwsSk57T29d6MapDGqhns7mYym7e/9sIMLTkYp/pPCDkrBKC0duOFtTTfr1
	 CMbaImmFkUb8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1EBA406CA;
	Sun,  4 Oct 2026 21:31:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C00AB335
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 21:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A61B940049
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 21:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id itVBk6FpHXwx for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 21:31:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7A33F40004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791149485;
 b=ljkciqM/PHevJfuR8fyHur2NaywlKUQmLvFNNOEap7L2pR/aO5JGletPM1JyNFbDH3xz
 rCm79+yPkZl1GkeDZ/ixNH5coUmCBAf2fmZT4grB1UL5z3nVVGcVRvJgQdC3BXc4Z6iK2
 3CamzFbXF4LcYBmWGcIivYQNbRUBtfetNCsUqfKs7FqX3YKgfHr+wbYBEICvvTAmAMN07
 ELTVQSANtDtlS6wKoxz03pRPXH8pKcdQmzOXtbxETjWjEoJSgep6J5cvGTW9gnNy13+x9
 eNN3h5R9dJGn6sSrPXjTMtzBeyNCCyvNV2E6UmmQxLeIQL3+FaXv9Ap6Ddd6g9pkreg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791149485;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=N2dZr4HQ5dKvC3TENgEelwK05xejkZb4MtTqgR1otCY=;
 b=N4N31yw+0zVbh043UOpTN3DkzqEy13FAbhD61yi+/lvggEPa0VpB06cgezMOQZ+457XC
 wdEubeSulFydFRYaK9hkz/zMp+evd8l2/LXgbwh2jiXKlDDVI47ra5Ob4tEUkQHFBUEWd
 jJe77kZrRYz+AJXOPMT33Bi26mXgU0T9SC+gZs7bJ9JE23UX4ySvnJ1GQykKeouqvQIMq
 kG8uiIpaMsIv8tXCJe5V3+ZkYgPOU/8OHHpEmueYbz0OLDfwdkfYFPmfvKDu0gU3o5WRV
 cgWSmyNfmnsBZ/CgdQCkQFpyYwQPqzgigLdbSY3gSVgP5w/9cRyFG87Cs6YmTG4P/jg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=uDoEcE9w; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=maxime.chevallier@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A33F40004
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 21:31:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id F15044E41169
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 21:31:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BD06B604FE
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 21:31:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 81FE61032820F; 
 Sun,  4 Oct 2026 23:31:19 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 thomas.petazzoni@bootlin.com
Date: Sun,  4 Oct 2026 23:31:15 +0200
Message-ID: <20261004213116.39415-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v2] package/linux-tools: selftests: Use
 KHDR_INCLUDES to locate the headers
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
From: Maxime Chevallier via buildroot <buildroot@buildroot.org>
Reply-To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since v6.7 [1], the KHDR_DIR variable isn't used anymore by the kernel
selftest Makefiles to locate the kernel headers. Instead, KHDR_INCLUDES
is used to specify their location. It was only available between v6.5
and v6.7.

Keep KHDR_DIR for compatibility with v6.5 to v6.7 kernels, while
KHDR_INCLUDES is used by both pre 6.5 and post 6.7 kernels.

Let's pass it with the "-isystem" flag, as is done in the default values
used in the selftest makefiles.

[1]: 43e8832fed08 ("Revert "selftests: error out if kernel header files are not yet built"")

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 package/linux-tools/linux-tool-selftests.mk.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-selftests.mk.in b/package/linux-tools/linux-tool-selftests.mk.in
index db7e4fa1a3..032a71e320 100644
--- a/package/linux-tools/linux-tool-selftests.mk.in
+++ b/package/linux-tools/linux-tool-selftests.mk.in
@@ -24,7 +24,8 @@ SELFTESTS_DEPENDENCIES = \
 SELFTESTS_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
 	ARCH=$(SELFTESTS_ARCH) \
-	KHDR_DIR=$(LINUX_DIR)/usr/include
+	KHDR_DIR=$(LINUX_DIR)/usr/include \
+	KHDR_INCLUDES="-isystem $(LINUX_DIR)/usr/include"
 
 LINUX_TOOLS_BIN_ARCH_EXCLUDE += \
 	/usr/lib/kselftests/tc-testing/
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
