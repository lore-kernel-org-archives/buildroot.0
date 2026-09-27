Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582FEC98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2150A60644;
	Sun, 27 Sep 2026 10:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ML43p7Dx7gGJ; Sun, 27 Sep 2026 10:44:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 36DEF6062D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790505860;
	b=fl9v5/P1NnLUtCdalTHR0swmYcZaJMKl4doa1lVhdODfpuYSgUw/Tx+E4DCq5MkdANwQ
	 gIdH8rv+RewCbEd3EdPimbhi1D6lqSAs7FxT9SV2+SWjKzPTBrTBQkSJrlK+z2SSk2n8d
	 xE1WtO7KQg8Ov8oJftYRcXwHq44hm66tOypecmH43TOqT4nGzWcHncatYuvIotitt8fZ7
	 dogHttLXaJl4+z7+mQ9LgP1JyQ6wMKrRCJ48z7awvabbN3JYoIIx8braV5cGPNoU/rng9
	 1fVWT4opPZUST21mDtjJfdZ0S5PCDzosrZKKFkbzwtpzhO/Cr09xmMuwN23caPRw62Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790505860;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RRB48JDrdMbZGhlDbEM0aqibD/YWoD16stAIb4U/o+Y=;
	b=A/5zDHJkAOcdqNSpsxKT/PCV1WkEIj5OJwwLCFSczpz7184PGnHV3WYZEyIV04YziUvF
	 WKGT8mZL9i1q/rdZpIP+SxVKHqLQHwLEMsfKtzWzyEiT2AZqY+Y3fKlDLwGbdiBZnQoY9
	 AI5DLihMgYbjOtu+vkNizx/lQlML90BoakPhuo9hCBT3DPf6Ml0YNVQS6iEWEjSVAZIqT
	 F8H8P+43zx6dQA3OQ8RKTGLR76oEDoaR6kzOTM66im1nSuI9+zJ1bd/uPx/SnXCBRFCSS
	 Uvqr8PKsfCBUeY+ZuEC4TQVeQxRGadQopX9WDdccNh0S4vw++uU9z4PwATLseAbVf7g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790505860;
	bh=RRB48JDrdMbZGhlDbEM0aqibD/YWoD16stAIb4U/o+Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bHRxRYgfxj9z0r4WolVeLI42T0jVdKbddj2Qnn1T9JX0EKfFingDbXrmhvPPIS+VF
	 v3JHco2oZN95MRYYtC9Qz+PHyoABx92tEoJMBA3+U/vESRmB9kzW9+FqAPerjbZbBh
	 0bRk9zk1gnR8QNrb+fSGKnEnEAYfWqtcBt9PmgXoSRV2W19cgxioln6CGEYZjyVy68
	 nb9m8cyhmTFaQBM4+fQFbnA9Duo0KPffNqDPfZSuGiBXwwPMaNCJ31mt8ASVuwYQL+
	 sb7wHwJ7MWs8lPI9g4cCMt+NHQc4MBk3hGCTcjYterNqflnhbSKLJjsDCFssYYKRN7
	 rPL9HNeJmb+Tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36DEF6062D;
	Sun, 27 Sep 2026 10:44:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E592335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FCEC810C0
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RHJNpfxK0gst for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:44:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D6C69810B9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790505858;
 b=VCGzIfUsEgc8HOgucpjlbGBt9jZHRlzoczY4C4sD0wfGVAJHXUW3KDMfeuw/Ynel+l02
 ePA/oMRjiiq1jq3xqA5bnIih0nxWB1fPIqpwGu11YKfp1Fu9m3kV+ZkssKmEL5ehPIZU4
 xQxgMBN2aQFxN9cuJUpBUtthOp2fMydDDatm1L5eIS2yVz1Mo93xik+XskfURNpXoNtr2
 Zv5V+OaQLS7kpoQQ9p1BDyyL8FJguG2bpJA5/9KGYu/Jx81zorhk9mJKx5DUwoH0zIOIa
 HgzBLSNT2juzJd2Oxm3g/XFnyVqlIipKMI5hHreQei1WTn/JS4/Qlad5xubV8U+F3hg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790505858;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=wdLaXoLcJxo0qO9nm1w7lLzCyIIJM9JMGm7hHEMvSLs=;
 b=hNTuN7elSS0oCprUeNiHHyQaA35uvLBDfU3LwMMI8ntdUOeUFuHO5H3gHcR+oYD+1WkJ
 RhvuyHMS0NDLerj9UaN77ztv59gZgcce1TtYtzhUw68EmIcYnqwI94pMpULm4V+wbSNTG
 6yuuCnJPXgPmFyP3utoLcIWS3TXOBUn0c3buqUP0178z8bi9JMlMnLWKIQ1Ber+ZkR+13
 3qDk1h9PHHG7GQWuBHLGYEBirWJxluAL6m+FzDS4WAF0vG97FMZXMGG3zszyAXduuhSVF
 H6ydOab7DRJMr35f2L/Tk9JPvYzlteHtBR57Yqe+DDFjBGSCb3dcFv/+04juSM7UJPg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="qFuU/vcs"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=qFuU/vcs
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6C69810B9
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505785;
 bh=wdLaXoLcJxo0qO9nm1w7lLzCyIIJM9JMGm7hHEMvSLs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=qFuU/vcs4/LfbxtVx8NeNtodCVY3SPQ6UCKw/W9aFaDVg0YWyAzpe73nvEVxwZwmu
 UZrYDHzNyrHOJ7NeOGnvyH3CMAHz1o5R817RZJRmtr3jNZABg4+tZGJwlfSB04L8SP
 s8OCO1ZImgQyL5I2AIsT2zVp3UeSlkeQek/SI2Up1xZAPqCuZ+nrgAjrxb8HGPTIwn
 it6lSiRp5D31lm9QQDoV7QsYluAJFu27L4L/vJZVRC9T3oO5RFcQaPv98HH8izEIA+
 ujYpvW45qX1gr/e2cO0AvJFS/pLOALZx39TnNy0IRCYtRLlxbyEEuODO0nbNLhnuEH
 QOzb4+smxUofw==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 5RRVp7AoKK1djNariJ7zp345keNpsz+g1AP6XjcQlDKqMxfAp5HNhp0UZAZxjpRS2KekdFD3mx8
 eCiLkZ+eEUbpHmPoFlsIJFs6C34yaPQxkAJGb/LRmRrh/bSy/Uq1GLFt5Ts91yWjojdEjzVMEOJ
 BVlLqLpfaRVcWyHv7CzmHiespdo8TnlpPForn2qGUTCHwmng7jmTcoKVQroIaSgV9JsGMLy/1TY
 3yvuymJEVE0erc4LiyHD+LUjZT29txkwK5uR7ErZ14apmxmmgSUcMDObpSGokBV/gG840uEnbiU
 3xJTpHWO/VmO0Iop+kCnpsIdrLroN44MSyHbLpKiObXGNM58Zn/VcBwA59U3C6sCf4tOkWzhPOj
 behVmyawQGnaszcrNRgoQmbHlJ28yTWLoBPBDwe/yBJcOzkDWHL3RCdkuYPWQdY0jJhPwBOoxzo
 AMx37b6VKigfBVS4ZQYy9Alunk/nikxbCFtI+0Seg+iFTtA4pUTUPagP+K2gjnATe+uDfdS43ZK
 Phb1T4+fYYoOLCcK5NRzinGPr/JFLa2o/TTj8CjXlnPeM/NsVQCZTFpYLlegcy/RPH8Nyd8IxWm
 IRIkxTe4AaDQN8kzYgM4i2NLc4Xomwd0mwGGylJe3nWNFe9bYvVrDP7V+lt/zzUYp5C8zy3y5mh
 gikyzo4E2Zoeeu60ztQ==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3669DA4C4F72;
 Sun, 27 Sep 2026 12:43:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLX-0000000007a-2nWD;
 Sun, 27 Sep 2026 10:43:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:41:44 +0200
Message-ID: <20260927104301.1801638-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v6 06/82] package/boost: add new charconv and
 cobalt library
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael Nosthoff <buildroot@heine.tech>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 29 +++++++++++++++++++++++++++++
 package/boost/boost.mk  |  6 +++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index da213dd2d3..45b98ec0a2 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -22,11 +22,40 @@ config BR2_PACKAGE_BOOST_ATOMIC
 	help
 	  C++11-style atomic<>.
 
+config BR2_PACKAGE_BOOST_CHARCONV
+	bool "boost-charconv"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	help
+	  An Implementation of <charconv> in C++11.
+
+comment "boost-charconv needs a toolchain w/ C++11, gcc>=4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_BOOST_CHRONO
 	bool "boost-chrono"
 	help
 	  Useful time utilities. C++11.
 
+config BR2_PACKAGE_BOOST_COBALT
+	bool "boost-cobalt"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
+	select BR2_PACKAGE_BOOST_CONTEXT
+	select BR2_PACKAGE_BOOST_CONTAINER
+	select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_EXCEPTION
+	help
+	  Basic algorithms and types for C++20 coroutines.
+
+comment "boost-cobalt needs a toolchain w/ C++20, gcc>=10"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+
+comment "boost-cobalt needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
+
 config BR2_PACKAGE_BOOST_CONTAINER
 	bool "boost-container"
 	help
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index ed63a608ac..87a576f277 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -40,7 +40,9 @@ endif
 HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	--without-libraries=$(subst $(space),$(comma),\
 	atomic \
+	charconv \
 	chrono \
+	cobalt \
 	container \
 	context \
 	contract \
@@ -68,7 +70,7 @@ HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	timer \
 	type_erasure \
 	url \
-	wave\
+	wave \
 	)
 
 HOST_BOOST_OPTS += toolset=gcc threading=multi \
@@ -120,7 +122,9 @@ BOOST_DEPENDENCIES += $(if $(BR2_ENABLE_LOCALE),,libiconv)
 endif
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHARCONV),,charconv)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_COBALT),,cobalt)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTAINER),,container)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTRACT),,contract)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
