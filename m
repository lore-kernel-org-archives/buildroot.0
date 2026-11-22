Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669DA606A31A
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 22:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SYS9SrzI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=fbDDv/8a
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4367B80D13;
	Sun, 22 Nov 2026 22:11:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2eAeUEcx4zAH; Sun, 22 Nov 2026 22:11:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6627980D09
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795385517;
	b=WPZ5WSccohAkqjKK2HjkhlPJlHPvXZQiqxveQQaIiiftDBTHT5PX5gXZcUwpBGO0kcnj
	 UbL7CCjwtA2YUFsAYOMRZKFeI8wmsQzIHlGpybDDpD06y3wXm6FMr9e4sYxgt48CU4JCf
	 DY5Vw0spOtIzCODPFx0ZS1IqRImwDJN6YkTCxMjV/2V9zS8jO5CZ2hd1JXkuy3K6A/UAO
	 P/kmkOIA64NQpW/vT2SkpFiixEPKC4xmMJy5J24cc4GFndlGT+r39OonfEjllN7quyiWz
	 XNK0GEgpMpiMcjxHwfmpr/4buha/D+oPO1D8a9sZOqWrfvOV1Fkm6zxUA1D6xBvgsLQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795385517;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5Q6tHHfsMSQ/fSuxgt95ORuvdvvSqGJl3DFzzW8a0/4=;
	b=O8sLsaCqrHG9DrNNTBr/JHS75AIVzsPYWv0Exs6aBI/JGDpoRdZ027nLiOlV9jgibuWS
	 hWcSRpxv7+xFI/h/KOizLcmJWrkj42nuDLhZrMA87n4NXFAXWtB5ZyGf5/I/iUY8D40e1
	 oczJ23+kQZ8LGVeROYZQ4N8U1Alx63nrDn1H8x8tAWe59vvLqxXQo0W3kYemJW7ReTGdW
	 1FDtPdTh4FchuAszj/6Z1F8NqL3CZ+MuPn4JbIr/XE5uTawwlvD6FquS8maPJFG2FFJ0X
	 4GUGMuPetRYJeNbrBwUlsoJKFDh4qPBPFFOB9fRvbNR1wsTGcLC3ltke3457wvhreLg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795385517;
	bh=5Q6tHHfsMSQ/fSuxgt95ORuvdvvSqGJl3DFzzW8a0/4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SYS9SrzI7x3ZQ70scX/VhezEzr1HG+6xoL4YoI0aHK54z6hKsw14RM1IWPk0oXhaJ
	 4kCR7mCk2A1VkE/o5CEKSTolXqVb9ccsxAGYg7oZNYPfQYXV76cgwLSyX50whqtGXG
	 kKgKWQHDpbKN3qf/ynmRYl1PL+LzEB4LkFRvypf0WiVwtmnzGtaFOmFR6wOALN9KPy
	 s43lkJ1naXOivfkVB/GkmulQoVkmscrVdms0o64Rlm/u1X0+l/Ek/5MUg6h7snnBw9
	 apKCBorcTxls7rXo3xx9D+c12VGLo2amT6ilfLGh7n/XPh/AZOi1j/Wh4s4V/nLyuk
	 6BzIVseKcr6pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6627980D09;
	Sun, 22 Nov 2026 22:11:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C5E1F22B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABBC6405EF
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0wTydxITRkVO for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 22:11:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0B54E405E6
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=fbDDv/8a
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B54E405E6
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795385462;
 bh=5dEVpfAtBvd+hL9KKBqOQr+772CsCC6xT4olQzk5KMg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=fbDDv/8aQlzy3iWri5tLQ8BtgePTynWkaXq671N1ddJ1I3nINvRkPCxLYBHHDJlFN
 HDWqLknS+Fw1M5vZ7mzFiFT5yG+7H+q5SEOU6+Tl7CnOSLY+fPViH5NbxfCu/jXpHB
 eK++xW4dLhZ2uEVZfaq7fIOjgOymfdVJ9AOBpsc53Bn6hdAg5Thv6/JCG8Rw6igWx9
 VuHmFx37li0cvWT+XlFlWuREQJjL+HfwZtNeR6rAjx3d1sJcctfz6rXrihd9TK1vVg
 gyFONDZWHmpeEkuFeZqjsp4oYt+/Tue75pKIeAbaryjbC2kJ389OZjm8yk4iV6Hm14
 VvvGyK6MZfNrw==
X-KAS-Sym: v3:f51bdf72230551df:EH4wQjPla4QHGqFqRN4iUyyvNbNI1uLzAwAhvs7phaINU
 rex5rdM+zlO7tcEyEJVVuXFASyqa0yu9EV27HzaWW0gbLeHZeTleizWs0WVyvysSpCChJmV90YW
 spsK2ByWhUh6ptuQ0VP6hR6UB0AU17e9QMFD+oQf+HHL1eTxZwqzDEZx2D1tqC6Z4qwIkCED6lF
 O6GfkRoI//qwytN/DRQjT5bd/iBDLCeDnp8QfQa+YLpJ8ofHBJYF4kEbFo9JUKrnTjPKvDqpq/v
 GUPuEcPySW0OlB7UJ2Yq9S3cXREzMYsTtUUEeBq/sRXjt7Sh0jPTDam+N9EXEZ240+rFwWDA==:
 wHfi9RPu99ZZ7GdVgMLK6DEB80MaP57LYJuVM4c/Q16XXDoxCqfdQncmEdPTmciQd6BsArmLahr
 X7PV6TGhP4g9pv1MULpzMaz51iIVIZ+878oXQ+s7MTw2He+d+n5Ye+u7nWbG73qlMlmYI7JYQb/
 TUC7vI3OlQifLE/8s9xcqSJRW1dQmRRJqeX8uqBFyno2dNSLFciRfg/bcq2peV2vAoia7LrGhKG
 UjRZEZbY8HRwhiCEpbDVvjOEV3GrMJJRuNPee9+wR5CC5EEzWeyV5sBGc5K8grqoqNPdmj7FYti
 ASHSLiCJ2R3D7HyGZ96S5lTgZh6qt9dUyqedFZyfDa6h1iSFD6hOzftu5gzOo9uoa1MtI2gRyZC
 o2An9q2FbPwO3Jhr7xhLufEiohkYKLIeo2EdjNAc2tCPJlHMLjGpqcWyIz8sKfqDVSK/CTILLom
 tznjia3oRm4Rw9I47QrkN/x9gFsovxB364+4M0jqU43OSlIcoj2o75eGsy24/0OTOlNX3d6r1dr
 Iv4eppBGvkmaGb04f8kX1/9QW+5JPpFzNu32A0ptC9ITZegtrgD6Dn7Wa8L+peW13kCCr6VmgX4
 4AQaGyiBl+Yy46HdcXQ7rV+uYaYUVPcC9S1uyacIiH/j9w==
Received: from fli4l.lan.fli4l (p5b3a0d5e.dip0.t-ipconnect.de [91.58.13.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BD081A4C4E74;
 Sun, 22 Nov 2026 23:11:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41694)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xVFlJ-0000000014Y-1ane;
 Sun, 22 Nov 2026 22:10:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 23:09:58 +0100
Message-ID: <20261122221014.3945599-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122221014.3945599-1-bernd@kuhls.net>
References: <20261122221014.3945599-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 05/20] package/boost: thread needs more
 dependencies
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

As of Boost 1.83.0 which is currently in Buildroot, there is no
visible impact if these dependencies is missing, but as we're about to
bump to 1.92.0 these missed dependencies would be causing
problems. Therefore we do not recommend backporting this to previous
LTS/stable releases.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 5afddb54a2..8df2a0f577 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -330,7 +330,11 @@ config BR2_PACKAGE_BOOST_THREAD
 	bool "boost-thread"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
+	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_CHRONO
+	select BR2_PACKAGE_BOOST_CONTAINER
+	select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_EXCEPTION
 	help
 	  Portable C++ multi-threading. C++11, C++14.
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
