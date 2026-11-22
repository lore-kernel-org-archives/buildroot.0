Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7758F606A31A
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 22:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TaQMcIxh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=rUFBa4xt
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55ECB80C7E;
	Sun, 22 Nov 2026 22:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id me-z3L6LBrdU; Sun, 22 Nov 2026 22:13:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 689BD80B08
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795385591;
	b=EwqoZnn1jLQGQWl99rzOaGZc3wYTSbYAyaFdNjFbYvGuvXsurdXF06c7l4526LcA+sT6
	 pLmAUM6nn/GAbpQdtJpdtBmSNlbHtg+yl85OdiPYuQw+hCbvGNzRVkjbP5/0VGVY1a+AD
	 Yfw3Y5nFbXoocZ6+ZLGnP3lm+Nd0SWk2a0DQHU+BZz7x+CBVLHUFsozldL6WoTvrZO5zV
	 mNjTAd9KpHzcNsG+31i2k6YtuVe4rFKLYozJO8BGv5QPX1pa4OYzAd8cun8rno9IwRpFc
	 /4TviL90PqdIYKK3bY3MQstvMRjr2So81ZPPjWdDnZoTEZKIgBrFmLWOdips16KJzfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795385591;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fUYrPSbzkgZgPA1Urjt4c//akVp0T+2yEZeu57L7Yjw=;
	b=Zrrzui8+BfDVvJqiN0cz6vxujDmsQ14E4AyGIKQPYpyHihCmekSxz+Nt0GmMfn00lg4t
	 dUfP/2WTrUzjuiQFmykLUOu9wpo15tRfXrm36GR3lO3s08VXpkPAVhqAs6ICL9MARLauU
	 12oN7V6pevT76fSY15S5L9up4ThGagsKtvPWHLSk8Pb18RRec9y+zNzyeX6f1Ptd7/xxN
	 crYIYe2YMgezXyxvZP8URno1rUfuYQytUAdHViOMwSS38Bml6vofUsin9H8JYdZ8x+FIl
	 Y7GUrw+sEzlbt2mayyB8+7eHZ8uHhSbzmlRnuRIHa0eYRpLGISdiDDcFvZoi3HgmH2g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795385591;
	bh=fUYrPSbzkgZgPA1Urjt4c//akVp0T+2yEZeu57L7Yjw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TaQMcIxhnUVn/XmWs/atEFrlNYxSft4TWxKE+p2uJNv3OU5tHssy+0ZlISnFQBKKz
	 GrVni9ymVqrDFIzNllS20e5H5pmwZhQ6WpEBvTxuX9vmf38aaSmf4MJrb8pj/KaEq6
	 xgiBp1rd0vIBqfQMu90wCW2aui6wM/D+C+PD4yVmlZEDth6p9otxPh0zRNOWBhBkeJ
	 3oYjdQVOZZQxhBvxW+/Q72UUITwftf0Nx5vIYPS6jzRSQCcyICjZKefFXinolA6ypv
	 6YHgYqFLnVD5F7+/5u9uM86LSr03tbi/GWAIXIZ2o0CbtkCb/8XrFpTpSkxq8ZEQBa
	 2bU0brZMn14Tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 689BD80B08;
	Sun, 22 Nov 2026 22:13:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 370A4310
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28D4F4006F
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:13:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aKNUQNePR8RP for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 22:13:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3AED940081
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=rUFBa4xt
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AED940081
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795385464;
 bh=LP3j9+Jv3CnzFu328/6fYDAocnUFKsZg3Jfp2oLuFbo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rUFBa4xth9qJYi1szjfoJmQWrhRfAhxls8JjO9kw8DRppjgRuo+l8wEE4NB/VU7Iw
 /A9FFUYl3AjGwT9IwppOuKzfv/MsOOgJrlB9CHVHzbnyU51IbmNH88H449wDxuLmnO
 GN4itY8Ev42PeZDEbxulYqjQd4BmgpXm7YPfDv8UIrMtKlaHJ2LV/DTG/Kppuu2Ipz
 t1CaRndl4c3RStr3Vpg56/68dlhlkrrXv3q4hsJqMfi+oABVLyjlPy3GWukDkbXPPx
 2AeVka4Fc2gHmJJqVXblGs6tmrg1VFFObZ+Dmb9pcM6CuILhUNSEYwK+eUOMPgp9DU
 v4xP5N84+6lGQ==
X-KAS-Sym: v3:f51bdf72230551df:EH4wQjPla4QHGqFqRN4iUyyvNbNI1uLzAwAhvs7phaINU
 rex5rdM+zlO7tcEyEJVVuXFASyqa0yu9EV27HzaWW0gbLeHZeTleizWs0WVyvysSpCChJmV90YW
 spsK2ByWhUh6ptuQ0VP6hR6UB0AU17e9QMFD+oQf+HHL1eTxZwqzDEZx2D1tqC6Z4qwIkCED6lF
 O6GfkRoI//qwytN/DRQjT5bd/iBDLCeDnp8QfQa+YLpJ8ofHBJYF4kEbFo9JUKrnTjPKvDqpq/v
 GUPuEcPySW0OlB7UJ2Yq9S3cXREzMYsTtUUEeBq/sRXjt7Sh0jPTDam+N9EXEZ240+rFwWDA==:
 NK4ThAMnAUC79u9xXCzkje7EtiF2dLdVYraHn31PjpXu7uDBXC4JUkwsfOoTOFlbmsHpLPj0sT5
 KZwseXn3V8e/a96TfdF953Xoex03EAgi7t2E60RnCKGHwd4qgzV1/BeAtQrMgfc/Vr54XeCtlZ1
 VO4fsKglupHwpXV4iXgzdcLOYgZSl+CyLW+uQyZyGSKPS1msE1Fs0P+i1V9qpbCE1T/pUjQ0v4u
 82x7AkfjNmNXjwYIf8292U7Gdekj27dNVDxcGvPv3rz9LcafyYbJgfYt2GTs6a7avR8w7U5aSZJ
 zvXmZ0CvOqmUaWPtgkwb84qN+az1dRCWoq7d4mlxb5B+9c7dnhr52geVHBkINb9w8ksU0Xd4cDE
 GthrViyfMsUjOk3RgV42pkijyYexku3vE/s5dt2bSTz+bV7jfjM63cQmHy7RcGJk0+kAp1ggsA9
 RFyLrGdlj+0XSf/G0rp9MDygX2aWar9G8lL+U5P7WqGLcrjhkomWQIl5q47HhGYxqH/Do7epkQ2
 DhtbO5WkbWxq48USHGeahhpuBpBrk0V/UP8rlGAl1y6yFCW8TxfSgZOpp2Vm10lDeUrWgK//3BZ
 RKp/4jEX4iBUZcz+M2y1MkPLMl50BvtV6oMXL6DwmTuv4QI=
Received: from fli4l.lan.fli4l (p5b3a0d5e.dip0.t-ipconnect.de [91.58.13.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EBB00A4C4E8F;
 Sun, 22 Nov 2026 23:11:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41694)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xVFlJ-0000000014Y-3uXx;
 Sun, 22 Nov 2026 22:10:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 23:10:07 +0100
Message-ID: <20261122221014.3945599-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122221014.3945599-1-bernd@kuhls.net>
References: <20261122221014.3945599-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 14/20] package/boost: update locale dependencies
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Michael Nosthoff <buildroot@heine.tech>

- now always need thread
- charconv

this changed in boost 1.88.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 03fbac2f95..4ab59a8499 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -203,10 +203,11 @@ config BR2_PACKAGE_BOOST_LOCALE
 	# https://svn.boost.org/trac/boost/ticket/9685 for more
 	# details.
 	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_ICU)
-	depends on !(BR2_TOOLCHAIN_HAS_GCC_BUG_64735 && BR2_PACKAGE_ICU) # boost-thread
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS \
-		|| !BR2_PACKAGE_ICU # boost-thread
-	select BR2_PACKAGE_BOOST_THREAD if BR2_PACKAGE_ICU
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # charconv
+	select BR2_PACKAGE_BOOST_CHARCONV
+	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Provide localization and Unicode handling tools for C++.
@@ -218,7 +219,6 @@ comment "boost-locale needs a toolchain w/ dynamic library"
 
 comment "boost-locale needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
-	depends on BR2_PACKAGE_ICU
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_LOG
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
