Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C18C9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B8266065E;
	Sun, 27 Sep 2026 10:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VCdycVUu-SqK; Sun, 27 Sep 2026 10:51:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6E26C6062C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506281;
	b=eOdA6h44TG1ONEAFcWz2SJTfOLOQA6bKEEjFlylaLbcL5h8qZGkJlS0fdHVyl6rT7GbD
	 t2aq7XM8WHnDDtcbQgNRKOa/Z3TSFui27ziKKn2K0h1xKDdT1bN6czXoZXrMsSs3ycZDX
	 WfxAbwa8ITanbWpptQ3fk1nKjaWhvgjJ2Rx6Y2IKfImD4xUrPdeDEY7yDBhAq0skafMo4
	 Kvsa4NFBGRMjkOSCK8VM0Jz8qTCIh+5kKedXacyv8l/hagQX1UJ3Qu3Af4M+pZS/eoxa8
	 ePCfGSJ6mGTUG6N5ai6+07D7acg7TwZKMASKN6WkPyNPe8ZyujmJa/ZvURoZIWLdu7A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506281;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kvlKkCrwHWSbq4ablZMybLOPTB82iOTJTDbIkDWrgCI=;
	b=rIojLlSXTxiNyTmAawb8O9BMLvPGNK325Z+hcRgNltAHUlfclAvEoa1YWYbHNpXfSKu2
	 9cFXO6a48XC1D6WbRpwboKPo87DjDi8rUq8T7YO4xfo7pBdpyhakEBhrcZ/QGV8E0rk3T
	 aGBSrAWM0SaHS8/OhYalJ19tzPt5Na+yvS0X5uMMiI5PA6bHl5+ElWe8gnTR3m1K7i6rK
	 wudEV/r0ZYANm11j7c/amnmy3b5jHPcrITgGXlL2yvwR6LoGRYbX4+gpJKKO+oRDjy7ho
	 nna3EL4bBMS4V8d1nmyb7+xTkB7aLbyDkO0scCI/uUyAdtc+5fsDPmwo2a/tBC1O4ig==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506281;
	bh=kvlKkCrwHWSbq4ablZMybLOPTB82iOTJTDbIkDWrgCI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=P/QvO4yu3pauQAXidYb9Y511CFWBKorsT9iWEsLM3w2Km343eSDA2nLM1QqKT9QGm
	 wqhILVbwxGr5Z/nmnSlB4sPNNDTc7XjYeZIHF+4Y9Yw4djqhF3fm3cq8+gjoCLWyQa
	 5MVQvxmWC7aBzjlh3PakCnDQdqWJFVxT6CQnhGxKJwS7YXneLEWOTR4m+43143a+mX
	 lBbyur4FY2ornEPEAWY3HEwlQuk8xJvx5GdNwR9K7UENAPL5ljsCzNcI5kgtirLRZa
	 pMS2l1taPwdc/8QfKqT698ARDsw/axf3uXTUdmmtdFxH34L//PWNeoM/AID5KQPJcA
	 IdjmhjTAZZrvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E26C6062C;
	Sun, 27 Sep 2026 10:51:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13C40335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDDC3810C6
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kuxKqcLiZwxL for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:51:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4219F810D1
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506279;
 b=eQL5Mm0voj4dLH2GgDf71AW53dLCHKg7opaC3Q9CA0sRewzDQSJzR6YIotbvUMSCqhB/
 NP36RIA2POd3Q4S97TDvqmz87ST4vXhTAALxBXYaVFyW4NNl/+SnHFHVUVf1D1hWvbNeT
 LLWzeRtd/6ueAPdigfZuwfzqO09M7L9uufyzj5Fit6W/92rJlpN2WBtAa1HnhXGB6HEHi
 7Ta3ieg1TKE5+QBCFHL/Z/2tm9kRqAkd65Ww40busOhK5rp1CWrr9Rb+g74A3ff/SgKk7
 P9dZieCgo7X4WMFxQwdSVzdvRQ01zrv/5lMgZtOO8BlbAPUGeLThmoqW2tytQud/59A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506279;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=w0Z+z+Kw3jjHFI54NS1u4vGM2CN9y6hyWisKv+EoAxs=;
 b=qTfC2nG6Y06WXI6tCPeBJcr/2MIocFSyT2RnY/ElrRh3yqqNRbdTIZZ42WpnJtNhWB1D
 e726uLeOzu+6vxe+HJE2govtwjdLhYhrB217E4t58bfjt+509s3A4I9D4z7VbYUk7JmUj
 bGs2upB6iS7cRofCij2G9tHjoBbbEVBx7Oa95lb4gSJwhFJQcIang9l4ZByOA/87PNler
 DaJbSD/JyiuQB7ka0vsEk3JBVZWiUfL4hRXlO0mKim6d4ckrM7VroNQdfm5Yv/8pHDQxr
 uJH9D35F0u07/SNfUW7miGRLLErcdL+5gcLZR5TtUeeEpLbSkaq2U9p/FJ6n2OLd+2w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=VrHBMnZt; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=VrHBMnZt
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4219F810D1
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505848;
 bh=w0Z+z+Kw3jjHFI54NS1u4vGM2CN9y6hyWisKv+EoAxs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=VrHBMnZtGHt0RdZ3GGvWyFi/UF9PHEKeRCdOveboztQu+FkgRcaBko5viWu1Aiiy2
 dFHCycHYAjg6VgLgzb3+T9w7dX9lwZ6ebmoyc0OzDR2C9wZCDSYmtmB6/lUd9l1Sx3
 NSri8PwRw+LDp6mf7LERKnxCnBI6AIu5SOvW8ack1PmlW/K2hvPr+LghPR3y488o8g
 k5BZnaxTAkLrvk632ioWh5FqKhukZdvCOKVbUqT9YCXRsqWRjO4D8+UBQbBfB6AYoz
 VwLiMY4UFhd3qU45L0G0jvAe7m1l5eedyDhonRz2f6AHvSiq83aRaXUTxFVfn/o6P8
 0lhpICY7bM5ww==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 rklBpB3XuguRH8D3nQYLZqpcwevAFmPxtW1NWpmezDu7DUUngs+sKBEEW9uoWDBeeGuNZqFFUeU
 QrY94wo6gEn9f6tRASl+uJr0KKUOMZOIuyG/JkacfcJ8UvTJliD+qPUWWPdC8dZ3SRwlEPOQ3DF
 pFthuqNQqSdggl2ytkjg1enCOULvep9aoHV0Pd8dopHV2rv4MVk4EDCwnoLikgAeSGIEd85a9aw
 EI/fB6MadfFJx7o1ccbQqQ5Dmd9OxJyn+KW2AVUVfZIduFWwiPphDyKoTtXDDFT+qljJwrSkkFl
 gekwD1s3Mik5KbyTApZo01vNDhBXq3T/AtCkbCegzj0V6CSo7rqBfmIpPCujG9dXRowQrSN91zl
 ixpX97JLLHxlwTA3pnGyeViFATkHJPgHBwqdY69M4KWb6vF088L3Gb1gxUG3o7h0SeUkkohpxPR
 HK7TRo+9CmpTKZuC3H/mPGtap5/0FjfHO+dPXXp110vcT2b81GMixQxfa2gz9JOzpWlJ++ukdHO
 tZTFzPl9B8MXqiVzEou4aPt9QtJdIHrg8V10Itgzhh+D6xkuGuTxuuIjERIDvzeWg4liS/VJVkZ
 SMiBdwQn99YS8Mun4yNo4hOySoeV/zgfGsdhng9yIVqfOZSPLrbI0SPfhAD21fMUM4T/S1de9S2
 1AXwRlWAtC5uOsHmeU54=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 28F22A4C4FA0;
 Sun, 27 Sep 2026 12:44:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLY-0000000007a-0wkL;
 Sun, 27 Sep 2026 10:43:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:41:50 +0200
Message-ID: <20260927104301.1801638-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v6 12/82] package/boost: fiber needs exception
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
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index f22f263538..362cd6c95c 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -147,6 +147,7 @@ config BR2_PACKAGE_BOOST_FIBER
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	select BR2_PACKAGE_BOOST_CONTEXT
 	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_EXCEPTION
 	help
 	  C++11 userland threads library.
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
