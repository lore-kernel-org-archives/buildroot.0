Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41233CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1F13403E1;
	Sun, 11 Oct 2026 13:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-sYZ5zeLRQV; Sun, 11 Oct 2026 13:02:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1D159403B5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723760;
	b=JEY321zMyI2irYeWVh8BZj4GtT95zXXvct0WRSV+tvcTSn3IEaUus/AvwMae0sRi01lq
	 c8PtP/Im2ra+9p6UR+5MhIIzZUskjgSEGJCVae0RvYhPmPeTsw2tY1NzNqvJxZsJ6r+Oc
	 VwQlvaxHRDuhtZjeTGbdFboJqfMu/2CbtMMG3/GSYJej4xbYGyjVXamJZX9UFzvEc/STM
	 LUOXR+6ALTTImulvp0DP50AFY386tWmzllyCRCSYRpKsHnZccHKyx0ApKBq7hM5TSPXYy
	 4azdhdkd06LxeJIp8GNUiRSsXrSYwq9m7DDVOKBxr9eXE01kyeymgMxnV2gCtUROS9w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723760;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=egRYj0AUALEmu5GAay6IUSbVyvt7FtzPoDQOq+9jyRU=;
	b=owe9Ee7byk8jdLV4yHCaZMdWr6iFjt3d5uVIOkxT8oizKhl68fuOYiD0TrX4d/ylkacf
	 y3DvM+mOfPwe//1Oe3eEdSR0ODRIqyksGp57obCAI6AT7pMzOzn+ohc3HVoAoTyKBme98
	 jjP2oZzYPDe9jclOn3qPWVQ0UOkfTCSjN3s8hw+bqBM3H441nEfTROLiuW6fqyTMG0tjV
	 YPrjEZZjFajPr4xyc+fIt94bu42Q2FtpMtmHdk73cB0+Zy6rwgtDnX1kk/nsGaTopyHa7
	 cpGGOnWNGY+f1y5FSPTsFTX0Q53qlmg9deXXWwkj3DQV+34kSeMXr0xtGbIsrxaxuDw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723760;
	bh=egRYj0AUALEmu5GAay6IUSbVyvt7FtzPoDQOq+9jyRU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NdkPmX9CVu9K2n+hHUOc9/KViuohjRMVBb/JBNtqmFNumNx2weVdKGzV99q/9DXs/
	 dPG8Z2L/ocdnptmHSekQe2+cWOQjQp9hwnR+ug0c69DrHcgy98h+qCGoYPG3/Hd0Vc
	 2tf1FGO2PKF1D6WrKVF1k8FTcmWrbTekBg3hDD7cZy0oq/OFq5szE0abxIEvbEEG45
	 ri6vETTzeFhzlzHRq0vvKCyvj8zDzc+qyhP4hKT6Hv3mjwHjSJrWZyxQy1hsFF7p7/
	 BlDHRWwQ/pfkdgTCO8niVj+lcZ5MOqb9nBWXif+r4uejoJVleFPdUpMi6itnRBRGie
	 7Z9OAtZ7TajVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D159403B5;
	Sun, 11 Oct 2026 13:02:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 45E30111
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BF9380CB6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gh074_7kIDyk for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:02:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3AFA280CAB
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723758;
 b=k+ntnDGm/V2vdJ6ZsdvAtrjdDB03pVdI6J0pdgl7/TsCuAt6nbc5HF7Zv941UsaQ+sHU
 qAmWUsPn5G+WsxWRv91CYxBKhF2aa1m0ro17G9awT5WUS6NoqhF9pXV+p/Aoktdn9+9YE
 KJRZ+KeO9SrEq1CC5/M82netXf6lQYh+PpgqXx6vEacq/NHQOE629aTQNYsDEZd9Y51hB
 /DiCvzpbDvz/SaAG+v9HU7B9+KEy3TvyTnYLqt75SLOUOIhRci8IJPNAOvRHBVPIzs7ZG
 /+DGDM0r9mF2utsx2GgvFVnG1f6uKZdi7nv1ls4Hw0TmxscfgzR30nysALLcQajgF+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723758;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Iqza05Z6AQM+v/sZnXLgaepNeeIFR6gzEtIQT6+1Eck=;
 b=Pzlo8Zu+igqEIAccVl6m6AYpU55CZQtcnMKn9XcnAPCwTG1BqDu8dzV4QZ1+ifiiaZ6X
 hKtZVImESuhJd91NVHR37ide4Q/YQrcterssB/6nbrF/CfBb5m84+WOt11b2ZzMQHNdfO
 3HBw71W69PJzK0+cYcXYZyoPrmINN9bWi+vUKOj0SBlBGKMCbuKkWeXGS93vDyCcUWo/t
 HIOZmEn/oSOUSwn3JhB0SxDDyDEj16UefClGZ8+KtOjgJF5Ow0iTeRLnGV4JaGJ5WyDBy
 P8A/QrOYcRxkA4tREScuxFIOiBtT5+Yod5107TS1D1/hDzgfRtNOLHpPsNwApN2AL8Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=XuiiNat5; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=XuiiNat5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AFA280CAB
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723661;
 bh=Iqza05Z6AQM+v/sZnXLgaepNeeIFR6gzEtIQT6+1Eck=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=XuiiNat5oa2xs/ASSQlweTWoXhCFTf7FYfq94YrJeG72pDC58TpEMQUes0tr0Ydy+
 dGUXSDpprq8nbWD04yiT/oXr2kW7D4tZ47pHJLTQbCwbtTjzEnI1QPFFy9jvjz1Xk1
 1Hx062lqlV6HA9bFxq9GhX0YQ0metI9/wSO2C82AkX0rC6Iy6bWXDGwE9qS6w3daMm
 zzVjvJS+UEg3D6wEp1ViJmJMqlARjSz4D306QL3ly0sfNeHfEWbCyR7uTlQAmUqBoM
 ZZyW8oOlG+sssrjZ0vQ/o9wXTHB7759L90Budl0i+5D1J/ck4fKmbmu4jgInTgE02C
 nLHW4znVLhAuA==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 zzBE1VwSBmX53i5YD2q4pfCSKiAmRnokPWLTn3Mi1sl4oT30k0tmUKlQwUa2J6F90L6IiCo0iF5
 AljpQEhFwjF0rwwTi64T2ftqkMmGFYH9IA13aRRwf4QpzlFinT4YvdM1MCYqdP0CKa6WiQcSHKT
 crEcm8ExejqPf0NSlhes5k3dtkmj403yh7WUfsyQsie1ZTpZf73tPCSg+V8DG0u4sE/Cni4F4Nm
 FLIEjlsulvQlXNkI2x1knCDpLN5xRrFnxQ44kaAQA9rcsrw+BNOF+jo+fBzA1NtUxLHpHkT2gGL
 bs5Fi+zkZXylI1Yn61ZRClFyhQdc2iVcRJnSDAU9bX/2hauhWcegnjzWvSpbWK+YvQmlMtHUw1i
 dmdoJhChCrsvFdc1Z9TP26vbwTRdr+dXe/u77z65DF/3n2XRficL4AN2Ebs6SwYECzp9krpBlbN
 DztunKQrnE68CY6rYkR2QDyI33kDEtxYcBE4R/6XQeoSzTZlz82dERP669MuHKbIsTjXSnlJTt3
 hNaGWFbzWhDqyYgmfgMCeoQDLz1pUDqb8USl3JhO0L47tj4rryS+WtOn1u8egzW6nms14Jtax/n
 POI/VDI+KW0BytyXcvceUYK8j/ucQA0Zq7cWM06gmv0wYg==
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 21511A4C584C;
 Sun, 11 Oct 2026 15:01:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAj-000000007Fz-03yJ;
 Sun, 11 Oct 2026 13:01:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:12 +0200
Message-ID: <20261011130058.3443432-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v9 07/52] package/boost: add switch for
 boost-process
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael Nosthoff <buildroot@heine.tech>

since boost 1.86 this is a buildable module.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 22 ++++++++++++++++++++++
 package/boost/boost.mk  |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 45b98ec0a2..736255a33c 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -287,6 +287,28 @@ config BR2_PACKAGE_BOOST_NOWIDE
 	help
 	  Library for cross-platform, unicode aware programming.
 
+config BR2_PACKAGE_BOOST_PROCESS
+	bool "boost-process"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-context
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
+	select BR2_PACKAGE_BOOST_CONTAINER
+	select BR2_PACKAGE_BOOST_CONTEXT
+    select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	help
+	  Library to create processes in a portable way.
+
+comment "boost-process needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+comment "boost-process needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-context
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 config BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	bool "boost-program_options"
 	help
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 87a576f277..37ec918aef 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -60,6 +60,7 @@ HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	math \
 	mpi \
 	nowide \
+	process \
 	program_options \
 	python \
 	random \
@@ -142,6 +143,7 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOG),,log)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MATH),,math)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MPI),,mpi)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_NOWIDE),,nowide)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PROCESS),,process)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PROGRAM_OPTIONS),,program_options)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PYTHON),,python)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_RANDOM),,random)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
