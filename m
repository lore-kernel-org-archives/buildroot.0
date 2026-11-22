Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4984E606A31A
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 22:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=X0Duh1h0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=oJCQgv/e
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 207B5405F3;
	Sun, 22 Nov 2026 22:13:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0OylL6hFSER; Sun, 22 Nov 2026 22:13:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 38DF0405EE
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795385617;
	b=DP7tfN0gb06leKSJk0/UJ87lhjW921MQqNY0I41ZQhR2QHkFaVnna0d9dblioBn0mzgO
	 s1/pr269AQ2+JxFAEiuY8tuiaa1Go/w7/fNbiap5oTfa0m7VPWJr64tIgZkbbyzgK/P/s
	 Gsu5idBodjxdotaF8yk2ljbMk9ulRf3+Np8kIUBwd/5+y1I7hLcVXxnt114PibAOFhfMG
	 Neu2cABJK9+r+Uqe+kphuAPUDIwHLLjl3LRx4J1Mr945Xf/h5ev/0uM3b65GJa87xnl+w
	 R4XmIyEePUKuZ96pW1irnedWFci6UmXDQ/uThAreVWkSJCqBpyr9Ln4IibMr0lsZP5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795385617;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Fy8Z0Rfj4jMUIoUdZEtEInsUOVX0kJGN/S/E0hGBzCs=;
	b=ndF9wGsQjG35AMaeDoHj4RIQL42Vg6OH11sDtUcMIiy5lgV2jUfZGH4Su1iXfR59Jdfs
	 WzNwe9bf67Cj+BWSpb44TMRc67k8PbMVX2zNCFEquC/EJD56+rsJWV1R/eUM0kkFIaiy8
	 5HOJKO6WHPn89EZ932po9tCEiYmHvRWak9gZhKLgjaAiKoPmna5adn/Y8l2I3O+lq+wo+
	 NW3z8rjyt8het6r6AJuCgSDNGShBMlAoLV+bTd00SLYIY7ZnAe9N28+D6Rr13n68iWa96
	 2r6DhTMDu/hK8iHwx2PqPQjL1P4ktf0+lGbVV2UN4kl0YnC/AqaVffP5xN+3KP+eLKA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795385617;
	bh=Fy8Z0Rfj4jMUIoUdZEtEInsUOVX0kJGN/S/E0hGBzCs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=X0Duh1h08C/zJUfiQ9pWZkoXFZkdCgqT/BOLX7CCotGgc0jSn3AN9bV76uSglaQjb
	 rE67yG3Ili2zLuAlGVOo+biTZAxchq4eWPdpbPMcoYdXzaTD3uQVmd+/8Z1ADOz9fQ
	 iHqYJIKhjjJv77NVCWByaKUp89QhXnzLtauRH55lAfs8dDbSxUcX0XTa/ebIKvVzL7
	 Ida8R/IsteE3mr8mel3mFTaOIvvTQXkCZlA1KCafvRADqQ/bF1JrdiS6HQY6PwFifQ
	 AdyGY2pmsA9HF56e90rPJV0uWqTHQ4jaRzJhH/AvIDTez9nlOKkK0CvEztLP2icQvc
	 QGg90XRHPaPgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38DF0405EE;
	Sun, 22 Nov 2026 22:13:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D791C22B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE0076062C
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:13:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s0cL4ti6j6zE for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 22:13:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0C51D6061B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=oJCQgv/e
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C51D6061B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795385464;
 bh=n8dyc6eyo/2WMl24WVGvg9Azfo+Mv0B/IbHEmiNq2XA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=oJCQgv/elE3hENSpvGAYB2Bjqy02toZmcf59xJeKgQIqNhE48AxAYiDWoznhxSini
 rL9tru66hVmaDKs83b6awouWHKHjdqIbcnAExY5ISIim4w6Tm2BiisG4/5nIedcJhZ
 rjIzR45eR1p/CzTYvcrI1cDSNeHy5YnR+VhTExTQGimLzmQy3tnyk3wOM+JxSkg/kH
 muLgFIyYM4QtwBbfyybwUcOQVdCJu+Uzd4/vI7arLvXSWjxIldmV47jFb1+fgCcpUt
 /rCsfL2NqFVnkhH14okmnMzjuJFYqB6HM/7BG6lPxmBKuU6XDmbCs/lFcYa/clS2xX
 ewzvKUnDzCvyg==
X-KAS-Sym: v3:f51bdf72230551df:EH4wQjPla4QHGqFqRN4iUyyvNbNI1uLzAwAhvs7phaINU
 rex5rdM+zlO7tcEyEJVVuXFASyqa0yu9EV27HzaWW0gbLeHZeTleizWs0WVyvysSpCChJmV90YW
 spsK2ByWhUh6ptuQ0VP6hR6UB0AU17e9QMFD+oQf+HHL1eTxZwqzDEZx2D1tqC6Z4qwIkCED6lF
 O6GfkRoI//qwytN/DRQjT5bd/iBDLCeDnp8QfQa+YLpJ8ofHBJYF4kEbFo9JUKrnTjPKvDqpq/v
 GUPuEcPySW0OlB7UJ2Yq9S3cXREzMYsTtUUEeBq/sRXjt7Sh0jPTDam+N9EXEZ240+rFwWDA==:
 Z/c0xxPHDPWfW7I+OWvd8S5+rdHs1wNm12K0jlobqvXhcEzsupPrjbTy3aB+yT9ffI3SeatIGf/
 D6hdoaR34VBXMNNbF9EXf9gwFT0X6btoBCDqU6CHVpwyPJ8p47e1PhaFor/hAxTHVaTX+zi4bnX
 VK9C4OTtkUwFYVNjKR1km0nZVKDbcok+xuu4Ytn/ksVQ2TgrqSO+HhrQY5EsIziG93/yAB05rJn
 mjV4gtaGRTYpfOzgVqMbZy3IjRm+HW203bsH79eh9LdTeNSy4uxCWvBhNa3EEh+NwXxivHtfbe6
 jD/3Se15Pta+dgRx2lKCNsimSk7J8H3+XvFvcBEje98prW5YXorIyANyKtXB8jroQnBa5jVKLCm
 fu+cHnfO/Ic7BxkzyCYTDG+ZL5uiqwdsh4M+QPpccFpHe1NPsI6nJ3UVInrNDd0VCHERjaj8yFY
 PrllQWRYIgNCimfvUgJYGVSfid/A5A8FPR0TEg1XcwKFDvxUzxAaWh/Ud+cf8I8lehY9xkXm8P+
 4m1UEwh6Z8+VEWVnoGaXYLIgwubI3CxZsrjRrof96OKYJUXR1k/whOwRGrf8oH7sWQu3sJ2xMld
 6lDY2pESUBR08oBf/JR0uHj2SFCKcObw8uPaX6A=
Received: from fli4l.lan.fli4l (p5b3a0d5e.dip0.t-ipconnect.de [91.58.13.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 55A05A4C4E9D;
 Sun, 22 Nov 2026 23:11:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41694)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xVFlK-0000000014Y-0F86;
 Sun, 22 Nov 2026 22:10:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 23:10:09 +0100
Message-ID: <20261122221014.3945599-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122221014.3945599-1-bernd@kuhls.net>
References: <20261122221014.3945599-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 16/20] package/boost: boost-serialization: needs
 atomic, chrono, container & date_time
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

As of Boost 1.83.0 which is currently in Buildroot, there is no
visible impact if this dependency is missing, but as we're about to
bump to 1.92.0 this missed dependency would be causing
problems. Therefore we do not recommend backporting this to previous
LTS/stable releases.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index aee89be87a..e5cb0bf3fe 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -156,7 +156,7 @@ config BR2_PACKAGE_BOOST_FILESYSTEM
 
 config BR2_PACKAGE_BOOST_GRAPH
 	bool "boost-graph"
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread, boost-serialization
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST_MATH
 	select BR2_PACKAGE_BOOST_REGEX
@@ -226,7 +226,7 @@ comment "boost-locale needs a toolchain not affected by GCC bug 64735"
 config BR2_PACKAGE_BOOST_LOG
 	bool "boost-log"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic, boost-serialization
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_FILESYSTEM
@@ -315,6 +315,11 @@ config BR2_PACKAGE_BOOST_REGEX
 
 config BR2_PACKAGE_BOOST_SERIALIZATION
 	bool "boost-serialization"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
+	select BR2_PACKAGE_BOOST_ATOMIC
+	select BR2_PACKAGE_BOOST_CHRONO
+	select BR2_PACKAGE_BOOST_CONTAINER
+	select BR2_PACKAGE_BOOST_DATE_TIME
 	help
 	  Serialization for persistence and marshalling.
 
@@ -396,7 +401,7 @@ config BR2_PACKAGE_BOOST_WAVE
 	# limitation of assembler for coldfire
 	# error: Tried to convert PC relative branch to absolute jump
 	depends on !BR2_m68k_cf
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread, boost-serialization
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_SERIALIZATION
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
