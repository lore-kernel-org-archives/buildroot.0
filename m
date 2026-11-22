Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DC9606A31A
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 22:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iCF08yRa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=l5llpIC4
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1D4B405F9;
	Sun, 22 Nov 2026 22:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsSCmOw_HIAE; Sun, 22 Nov 2026 22:12:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 009A1405EE
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795385579;
	b=Rvr8MlDDFNJsws2QWLNYW76KbONNZzDY0s77ygSnGP13DVoBeCsYp86LF6R0QdkW64PA
	 Mjvr5QDOBvDyIuuH4VNM7h9MAyzf8agfEBBxeA9rfDxjqjvanHcZbna//2Kl8f0qbCvfK
	 TI6b4/slwrxNvkPgETnrrqQh3SqvLAX8oBQ8RF2bq1aEPzl4KxeA7UttTDRbAj+p1mzkb
	 ijeh+afyLbJ7xP2aVbPdndpuGesOCGhAWzEMv9iLSJVOE4pKl6b9cS8W4+7/BGgdo5c3o
	 kcZdK7fCkPbF5EeFpgQKbm4eXEv1qVzZzcBKFDRIOPoE43AOKUy/IMSA/MPCSDBT/gQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795385579;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=B2HEW90GV/p+wBgjeW2DFGJY16pob6PYILjmRsHNOLA=;
	b=YU5Ae6ukMluDoka0HzSJdNN9N1bTEojk+43+rt/ZjbK7WxVc7p98w/0ujxBeiz5llPYQ
	 0mThsN7ebu6uR8gN41JGocNtayIsCiVMiCRzhycxmI3mFIdxzs5aZrfUyq9uzvCxX2PkX
	 Ea1sqsM9L8uVp+pT+gNAQfmBblbAR53pYa3tQ3th/VekffDyCZJdons0JmoU5LugQRr/g
	 jsKUDgueK8rPQxfiO+0wkK/8FPVzClJ8LrT7tn0+9mhf8s61RxRiAh46KH4At9wa6RZGm
	 7q9lAOvs0xCmkfFWvfEyf2bQ0Rwx0iAAdWY2ntQyTPGmBfBFlx9Rfjqqf02B5OLGLWw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795385579;
	bh=B2HEW90GV/p+wBgjeW2DFGJY16pob6PYILjmRsHNOLA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iCF08yRarpNjcba0BSrI0z8iaqQwnppQkL8zQtM9jrJkjpKrUgI+JbrgINHlGAyjW
	 wRjTLAudatZiRuGbXJ1mTKAwBUNdrMf8274bRMG+v4JE8Bgh4aQIe25q5bk7iHxJ/n
	 jwHkHwsr0XLbDURaSIW7fUALHF6w4MyAe1KTHcxY5eICdXKlWgwYQVzSB01wGrNHgN
	 5tUo3c0+7C0WqEUN1ZBf1s+M3qNEHerZPqcD/+PjPU9kpXfJ86Kve8j5rDNh9kaOnh
	 cvQHOYjzKKrSxyoRLJzKHMVcxGvJ/A8FNfsRXrdF4Ka2iqEbBXhY67fI8QbWb5zrAj
	 +fXGbSOM/bJMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 009A1405EE;
	Sun, 22 Nov 2026 22:12:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F31C22B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8129380D0B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zONfG_TLbXPw for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 22:12:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CDED180C1C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=l5llpIC4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDED180C1C
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795385463;
 bh=WfbF6tidh1ssuPoBfOmOUAOnNP66NBkJuKxTWQJBae4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=l5llpIC4u0gfMfpiy2wUfymoARdiS3r3kzNFASHXxho7xk4gexSc5piC07iMeIcsp
 Qrm77hzHV94oA0CGw/SwwdFvdX3H0xSskPT+2atAvris+Q/kGC4SoQT/l9Rb1dIOob
 MiDIYQdR2c4QeFPdPL0fH5VKN/tIi2KBaQEeecf+tLP74fBZbaYngtGuXU9r1YykCX
 5sImBPEJ5TOudOOqyN8m1oHBtXbizEuGu6Bkr2WfBsj5R3L2dQpl5zkX2LX/OHhJS+
 G6hmDxsugn2HWjaECMtlCgTDq0z/r6eHi5OhdLmrav7Pd77x+AG8ws6JNCZhqS2l+7
 R1pBA3kR5pDCg==
X-KAS-Sym: v3:f51bdf72230551df:EH4wQjPla4QHGqFqRN4iUyyvNbNI1uLzAwAhvs7phaINU
 rex5rdM+zlO7tcEyEJVVuXFASyqa0yu9EV27HzaWW0gbLeHZeTleizWs0WVyvysSpCChJmV90YW
 spsK2ByWhUh6ptuQ0VP6hR6UB0AU17e9QMFD+oQf+HHL1eTxZwqzDEZx2D1tqC6Z4qwIkCED6lF
 O6GfkRoI//qwytN/DRQjT5bd/iBDLCeDnp8QfQa+YLpJ8ofHBJYF4kEbFo9JUKrnTjPKvDqpq/v
 GUPuEcPySW0OlB7UJ2Yq9S3cXREzMYsTtUUEeBq/sRXjt7Sh0jPTDam+N9EXEZ240+rFwWDA==:
 5peRD05gAasIuou977tYYmHp2N4RkqsEhTw95v1uKEK0jdvt+XKfw77m17oKZo7zUoWaaARf9vT
 rfpTO0LsJUrtIFe1VFCaVy58N4LjK7tbyOCp2w8M31HN+s4By9kOocahEa46kic54yea84ETK9r
 d3R964c/uznT1gVySOPGdZ+EHJE/uIAaxVioempil3RFLsukZd7z/A1n4BYPDgG74Av9r7bycko
 46/g/9Q+0uz2tpiHgErWE2GDZ4dgCBWYrWRjxnU3upp2BxdTDmnUiis42luCJWa5kn0HjtuUadk
 dawxdl0/yaFalP6Ruh49J0IyL6fTItmyTOGLBU0WDZK+mKWzXx7QdB7ptkTejMeUUTAYk2BEO5q
 TmR0yh4LE1XWhCGgxBoggbAeP17vqE1JJ5T0OXsZbTyFL14wOLHTkkJBb74bBT6RNfh+NB7UM1a
 9SUYZk/pd8X6zwLDjGsKumCU74pYCODHFSQXthnneTZQa6vhPvXt/kqoY3yJyN0K2UP7g7t2mmu
 WxDtrPfmNXK8dJV64n/atXQbHiFqcARK2EClDVxnm49bmG8CWpat98nHydx9fwS5H3qB9ebInoY
 J8P7nJ4A86yQU4x021GARtZPfi3+I7LJpnvPcYeJL+zSGV8=
Received: from fli4l.lan.fli4l (p5b3a0d5e.dip0.t-ipconnect.de [91.58.13.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C691BA4C4E8D;
 Sun, 22 Nov 2026 23:11:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41694)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xVFlJ-0000000014Y-3fGd;
 Sun, 22 Nov 2026 22:10:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 23:10:06 +0100
Message-ID: <20261122221014.3945599-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122221014.3945599-1-bernd@kuhls.net>
References: <20261122221014.3945599-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 13/20] package/boost: wave needs thread
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Michael Nosthoff <buildroot@heine.tech>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 8e1436a21d..03fbac2f95 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -397,6 +397,7 @@ config BR2_PACKAGE_BOOST_WAVE
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_SERIALIZATION
 	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  The Boost.Wave library is a Standards conformant, and highly
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
