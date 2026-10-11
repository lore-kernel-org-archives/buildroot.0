Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8FACA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4DCD4062A;
	Sun, 11 Oct 2026 13:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wpIn-H1oXIzt; Sun, 11 Oct 2026 13:05:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B58AB405CC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723907;
	b=gwbFGE3yQDGAHE+St/ioC2caMTzMhPG28TcqAvs5PtUJsdt+lu+9E1exdD3HlTAsN/kd
	 JJCqtIReiuUXtNN8RE/Q1yRC4s6maiMeGrp7xdpMTPygqgOG9F4p/tec3+SPb7DkuD++j
	 zlhZDJVqxGxJOReXv3pyGywGWxbR4YHSmOO/gZYfT3MZHsUCD734CgCDN2UJyPXuit31M
	 EFdLY0pff/k+bdWd1tBHmAcHDvGlMJ/gk0J7McUY2yEhl+KCzix0D01LjrmzIikLmVdRh
	 tZHgYuXzvoysYE8U5LSa/edzGuHYcMyo+NFkzSNgRThNvLDTXOOn9oZS5Xkn+BBfi7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723907;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qQiuKWQTjW0iinkppJer8c+QFb48DlUuMVJFF6Fs928=;
	b=KG+EJ7dsJR72gBe78uGk7ZOsHT+oBLeELaO+mcwQM4jO6++WmSpOyq2+71OaZum08aDW
	 YPLwPYSKBpN6YzWAXkMyP2zhdACvJxTIRyrFxK6vLbNeGM6T8oFOkU3s0U89YWe5KjPe8
	 s7n4yqDQFJ+/hCNEp7hN4VBcrQ7NNbBYr4jSsT6+YbcJKVZLy9HkKE9F99igzDW1YGiD1
	 UErf738ALkrzSwgwG7U3qVDQdDR0uiEezX+OfY8oXmsGa4M46zLWeEnX4bEA7ymiqHkPC
	 10VvVF8S7KKwXN6nsjO7M+ZSpqhOSGslBBtVBOMvL4D95X5Atf9R1JOlzWmHiCAMa/A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723907;
	bh=qQiuKWQTjW0iinkppJer8c+QFb48DlUuMVJFF6Fs928=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gapGoSsWXhHWv6fycby28vn2Grr0yBHANLWWotltEOAwzE/SHtL27DyPau7ZBS56s
	 EcWO1EIi3fgCmeQ+I4YhLWpTPsC5uhLg6x6zf5V+TjxDraiPmB7muMWabQCYwAQ8LE
	 4zQrqZv6/XPOrqx9D1Tmn20lTcpGWO7pERuTN93D6it0BBtuZ6bj8i1z4ybwE6PVxJ
	 IqkqUdssBQOscxtZuHUKarA7HzlskTxQpnfoO8cOOk6m4IJ3/WHEXiVXuTP7FNIGJJ
	 22PBBRLqW+h8wbOs65zlUbETJZGdJAuGbH7R7wa7RrVeS/UTo9rLsPVWDt392xVySG
	 0D6u0pn7v5sMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B58AB405CC;
	Sun, 11 Oct 2026 13:05:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C8721A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 427A04008B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Q_obSxczncp for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:05:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 683004002B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723905;
 b=c7wRRySkHYFa7kBWxYDy/LXzmSd/Um63//5YCRc/KS4wrzraHsbmA6I60OJ0VTW+y862
 LeMagcmhVLbMrYlAH9MUFP7BoLVNGMhBDPC/flZwhZEHyQl1jVnWJLqsk4e2M1pfAhmIE
 58HGQpOTEjYrzT39Ux41ldmCgyxO8DqN1YMDzyyydpA9YTsQh1kQaQ0D4iqJ+t1PNofc7
 /yg/cLmwha+tnG8iFejo9QkeAnU/j+RYPUnrv6gzlPrbTNVnZ+0ArsrJ8f0E/UlFL9m1A
 LtEk1X9PPtgPkOR+3jrPXpKnahx51ZIe5PR46WuFVu7uJCjyGG4tYGWLIPB3zWx4qcw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723905;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=v3HJ3mitSvwktQSaPCjpUEhJxAqYavoZNZmm+219tDs=;
 b=juBJydswKNM3ONovZUAK9nnAC4Uz3KxdDaFkMO1gBd0kll903TDBl6pX0dm0Sie3Q2v+
 NI83b3dWTw4kIQ/KGbT9k0nJfQN8ubVO22wCajua74l8hxltUCMIBiYqLBvSZmPtG8qUq
 bu6UYgLn7BXUEYpfzCCw0/HX4lSwT468BJ2x0N73ND+LhCJb1ch9uxZ/9ZNSHjpPAbfgb
 Qi+uIfkcYrT2k4l1P+f2ezgaNERSZIbr01STcaSM6ksy03vtDhv5xX80D1YxWwF/4bdyr
 FtjlSe8pcJ7ddH+vo1gYm5Ek537bNp31iG5Rd2cKOJkqWV1thOfhcKd8+aFD1cSNSgw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=MY2DkQBt; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=MY2DkQBt
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 683004002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723662;
 bh=v3HJ3mitSvwktQSaPCjpUEhJxAqYavoZNZmm+219tDs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=MY2DkQBtijq5fqobqi4Z1fHnlvi+dnj1yfbNo3Yrzwl0VHbldKcAIklHQNEq4ZtLq
 tB5ZTmhdBmRSFa22bK8+EpfVdgGkforDj6KLtF565wVR+sx3DqkUIfdHfXl/voy4Rk
 eythWWrl1Ir8pHR/535sNUvGRJlkqHwh/WCkuyxD22VGIBtVFwte7532LxQaWE3/0S
 sTszJ/XuFsSi4YihVfl10Bflwsx10gQ1CiFy+4A8xbJZ9NWK+wi/gBNcvpofu7vll4
 LE/fYBTUmrbUEJ+2zVgWnUMrmaNBEwm3lu3P+wKtEDcvI68WzMZTvBE+ebs9mbEHhf
 O2GIwxI+0OhrA==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 rc8llsvUr6LYQPgKur2iFPW+yol8y/h9yHB7PfvH4XSJcxtaljsluAhWcQyjD7LS4JBx9kPu2Pr
 wwkbKtdbJ1MOVCQJkdKO0LeAePBg485cCbrCAetzwKLLSw4khiTYaqtecnJCcmsoQEsWbgu9wTJ
 XCb3EqpS4OTWABCOJIGTo4bB/DOzeJUGIQ0ZUq9kCrdIeG7L3wXdca2nnF30iI3vRuGE+lxrtIA
 fSgMPvIT1T+PnduQB4O1VwOnly80wKHWAVoRuy+RaDkNrZgs8g3AZLcrzFghhkm79udvBskD5e2
 kcjJn5ApHCwcuS3dd6TJrjYNAmm4RApo7CehvhKYkcnd5svE9sfYfgsN6wK7FaWMHX+PrkE+LFq
 jxHTVpMD7Lk6VmWG31xRJrb/CFbL1lxufgBM1Jmvu8OlHRNfJqIQOgL0e1dZlwYdl9hmx0tiOkE
 D0c6wEDeHkH2BGq4RnZVzWaVJVYh6gpgwGnUj3WTlQtEK9w8DdE8Ju2iQ/u1VGwwL7AyZdtLsQ6
 q3mo+OS8FyHCliWZCClsGee5c0Sv3w5mPUrzSQYjjHPA5+0Uu9QE0PLSDCe72r2Kym+gHin49wW
 4uMPOWUlEcEwKNRxFQ0cl79JDR8CoqZGnlhIamCUaw62LSs=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E08D7A4C585A;
 Sun, 11 Oct 2026 15:01:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAj-000000007Fz-34Qz;
 Sun, 11 Oct 2026 13:01:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:23 +0200
Message-ID: <20261011130058.3443432-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v9 18/52] package/boost: update locale
 dependencies
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

- now always need thread
- charconv

this changed in boost 1.88.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index d4626bf79a..93ba15df50 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -217,10 +217,11 @@ config BR2_PACKAGE_BOOST_LOCALE
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
@@ -232,7 +233,6 @@ comment "boost-locale needs a toolchain w/ dynamic library"
 
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
