Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E484B606A335
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 12:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=A+Th9mSP
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B95AA80CB1;
	Mon,  9 Nov 2026 12:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id brCjpHFQDKVr; Mon,  9 Nov 2026 12:37:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E6F2780D0F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794227854;
	b=iHR1R+Rg4z8WFHdbJNv+XWbuW8KNsoHHTcy+6dvJN0AEIGsiODG8WNOTaU/o2AlAnQDh
	 lXzlnZxWWXtANQw7BM680kvyax0m+Zm4/g+72Jc8W4OYtThWvv44ABz52aM2nd4GeFfZr
	 U3ofa9T6MwLlqODOgE9MYZ8HLX67yCQGwR3IkYeo9Ki5qbnYHfPPvklA2aCJs9nABdVxt
	 SQ37WAOi+xpe1HqdZexcA/M4iwwC4HD2A8ViwI9k8Ndw/ZpfMLX0Jhqu3s6CKoby82iB9
	 DvQkpYDQjXjG1TSKATBuPOnCLFy1JYudpYJbYpVgBu9581KZjZvldk8xWlOwcOfE8Gw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794227854;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=O8/FTCgFThfiE7LxpYUWuUHo/T8eSMFMd3MIcmoayb0=;
	b=OMQu6u8vF8mFD0ZVHzw/XBkBA4hkm8NP5aKmZZB3DA3GIMUhaGqyXS76fZr4m7jCSnDI
	 YY8gukd5g1Qma+9bOhL9h5y3RbBHt/miZB62k2zHnZuxpRGjnNf+7L4HSDi1ptN0HIvuK
	 IzaflDxQJAlSEBOAr4W+G9d8QJw9LqUb82Q5KC0dUCwwPeBQ6IGOOxvUoimTqSZk7tlos
	 iiGqYk6c7ZIJ5svYB+U816RdaKo/hS2dvnJDdhIdBmD3DRtWkjT2t3EWrIF5P4I5ssbo2
	 yLdGvKpUI47cu7XevMbpR13LpQhg1zEPraNGhEG3IB7CFbWDPpmUJdCKMczZVvD+yfA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794227854;
	bh=O8/FTCgFThfiE7LxpYUWuUHo/T8eSMFMd3MIcmoayb0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A+Th9mSPcruqKNPFdgVoQO+68NRk3A8HOIBnQO7Et+rXSYPAdR/ix38PCkeeNGt14
	 hRLPL2dJXFYt5cm9vlyVE7EBmlOd4jL10X9skeM05MjVY3Dl96pxQAkMASt10LCTXH
	 xB1QB47CG/4xTLePqy2JYFB5Kc/gFCSKQKloWzS+dt9iM8xQOC+3YGjqzBWyF6yatJ
	 AMEDe+ae53jjQBNg8qQamphyli/SxoNwki/nEtLqvhqrFqrwRXT3DD5wTBSiPV6qlJ
	 cqdi3oIEji6B7aFm/nqhwa1BEZ9+7pTntVe0DCSBgJ6uH2QJWo1Im0y09WxL2Um9yi
	 3GIYoem4olNgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6F2780D0F;
	Mon,  9 Nov 2026 12:37:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E893B6C
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 12:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3445D606DA
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 12:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cv_Dm9Xvo75m for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 12:37:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9C2BF6072A
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C2BF6072A
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 12:37:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4893B1814BE; Mon, 09 Nov 2026 13:37:27 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon,  9 Nov 2026 13:37:16 +0100
Message-ID: <20261109123717.2228375-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/catch2: bump to version 3.16.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

changelog:
https://github.com/catchorg/Catch2/releases/tag/v3.16.1

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/catch2/catch2.hash | 2 +-
 package/catch2/catch2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/catch2/catch2.hash b/package/catch2/catch2.hash
index 35c3d52eea..5ad7e2ceed 100644
--- a/package/catch2/catch2.hash
+++ b/package/catch2/catch2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0957cae5821b17ce07f0833aaa52b5137643a8382203221f363a8303c109af34  catch2-3.16.0.tar.gz
+sha256  d16bd1b8b2364918bd472cb216394acb93bde6784890df0d91bccfb3f28d777d  catch2-3.16.1.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
index d33ec8e289..59af49d7cc 100644
--- a/package/catch2/catch2.mk
+++ b/package/catch2/catch2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CATCH2_VERSION = 3.16.0
+CATCH2_VERSION = 3.16.1
 CATCH2_SITE = $(call github,catchorg,Catch2,v$(CATCH2_VERSION))
 CATCH2_INSTALL_STAGING = YES
 CATCH2_INSTALL_TARGET = NO
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
