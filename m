Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D4860A2630
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 16:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Zci/hFnu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202611250045 header.b=axR9Ggvo
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EE60409CB;
	Fri, 27 Nov 2026 16:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uy7egZ7Q4VrO; Fri, 27 Nov 2026 16:46:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E726940855
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795797960;
	b=ALhwLNUSe833J4PvINDnNYTKf0X1feNRDNqu0N4NXBIv1QePt/Lx21aKPVBM2QvAXIE5
	 yPzWGXdkIN44+co7vY9s4y7xtyN8Lg5D14qvEmN8oa+m5yZIRXk3aWbe8UgpR4oOtfapG
	 mjULDEGtrE92LE0VPWaNubfmnzkr9P7iZlanXzuZPl+QOgY87PUOtSlaLNt2YHhAXHTnY
	 bNBFhs4tS22LwDrVZ61GWJaJW6Pg84IGTJzanQOGh8BSsjcCtgH45sxgpT+pGg0xaIm8F
	 tUVhVHGZR0K6s60wjLfhmfU0IgMb9iAhrbUTK7Qo730jqL7BqdOU2G6nKlQxATVSv1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795797960;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=D0e0kaIjG4w1gEW3GnvrLCSjWMJN3kgKfq0Zw80Yn7c=;
	b=KhTIwRIG/s/6cHyNCIr03D6NoJlIgHIMcf+bQKRUJOOH++i7RV34TB6byL4ZI+EwaxPe
	 PEbiOB/9qgilaXzgZ5lb7v9V90MVm8dwfL1dlCVIJ2onz76rBr30byozigmt4669C4/6B
	 WuYDP28HlJOQvcCtxpnqb+bB5VKi84qC2XD/rZ01g8R/u7SOxsyVWtMObzVxpWF6ciO36
	 4wlHHAELzUMbPISPDw20TJou9nvFGBZYqbeQ/xMVjYVGV+qkIb0OTKuzaEBD0nEy5oZyM
	 qoZG+p+0thDe1slFJicyOgcOSOZqdzBmCQq/fguSMAK9oqUdlqOJ2z3ruXvVuTHN6Qg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795797960;
	bh=D0e0kaIjG4w1gEW3GnvrLCSjWMJN3kgKfq0Zw80Yn7c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zci/hFnu3BA8UC+O9l0PwF1dJvGp1A7Y8uf1mAxeNILyasW6byzfvGXFNbwQ+XyUN
	 TZO6cRCJG1cytN9r3kr+mbcNmJxvEpwYsqIu0C/Cr4F+amBrTJcytrgliOpvbXti/d
	 pjA5DvjPVWuDJJwbkB3dEOJaiihxZ5emPgdbeAe+zDyR59K3HIish1HuoEgRrHGr3L
	 e+N2CEg3fy+7l2WRgi9CJxM63j9uIRTgYQHmsyHdR16LtLoDr1hUgglA3s71VHIt7+
	 U95rLXZ7GCKYHaN5YDnL41JgNiL4hPbsTNhwNHUpb7NqCI3QlqsNh3+eWVCBJHsecL
	 y7Z80aIN23R4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E726940855;
	Fri, 27 Nov 2026 16:45:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C3F652BD
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 16:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5DDE60AAA
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 16:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X8PZBYNJM2SO for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 16:45:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7E45C60748
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202611250045 header.b=axR9Ggvo
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E45C60748
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 16:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202611250045; t=1795797952;
 bh=uPFnxXtgzUVgWH94g/Hjm9/IqxfWlKg82Aj2+PnuMu8=;
 h=From:To:Subject:Date:From;
 b=axR9GgvoqSRtb5Y7Ja/ug0xxDZ7EWdNIs7ViwTJS9EMzOTvkH9XAN09ZufC6vP/IQ
 UsqxgTivWJIbsiSXxWHhyiQCs94pfxcP2tMTpkHc/07q/lw5kyJai7a/g0VejxXG3d
 rBmRhPZFaYp20IQS2EDZO8wckBLTNJgViBcf2WDrisA5SjNwLb5pzwU01qMjZzcCXG
 yp9x+q+R9AaqisVVwMy7dprT9iM5weYmpdYi0uhz9HlhoU8DqSL90Giog5VVgI6gAi
 JLR/O4Ipm/R+MzlYposJstoZsPpOj6nW8JpXsp1o8E2Bws2oZ8ySybAjXNEtwXBCOf
 u/9vqC+OgGlHw==
X-KAS-Sym: v3:f51bdf72230551df:cOkZzaRF/SojIxRVO0VMCzZWmuetw6gE2ZHqPF9/2+c8i
 6cGHwsvLB6d/jdvyvDdNk3bw0b1oz6GaMgXU0ihFl4ptrDnsEAcye+KIWYdUPuWO4eMahIKIlRc
 i9dDLCLmD9o1vA4vmoWDqJoEw0dYLHAjfAMVC259iCxNHM6V+des913qM3UdOAT2ZKuDwV3VaXI
 zgGEaQOzFpCdn3PU9i19CWihwUKWbyDD4a0xm3DPoSCUs1568h/KTby33S0NH4Rw9IOKsehlico
 rlGsP8m9oLgjJllNENhZXypxICNUnSnU6cShE+SmxndDcyj/6QzVnKaQQefxUa1W8IunCUDA==:
 QCy14D9JAP5bXDozVG+MsflaNVB/9uGuReCCG7ucaIq6dL1V0j41ZD3mGOrbmx/4+DwHI32SsZE
 bk+8y5yWQ7q3vVbH/PxPiU1U4/nt4IlXcqiuFJWA74zGI7AXAVubEhfw1uCe2VcUL+RxtFiLYn9
 +Z2xEYAP/plCtjtiCDgnMtq1cO53ZgchZaHjJzkbJp7CuExN+ZvYpnBOU7y9JDinhQzBYO4DE4N
 5aeE1VE0reGclF3FJ0VBv0QrrAiEC7Iyb3TI48Hzafvp8TAuVfLfYectegLYHZnnEpH5IlGiEqz
 yy+FowSgZKSHjC79d4/rxBIWoDPBtHUjPBAiOrEMA+cdYarj86Dc/EADzcbAdavKjUTk9ZEyXir
 K60i38vcd4dFT9IFAgGxDYAXRy8TnSPKOrRneQIqvGT/5YI8jjl7WMQ/IKZnari0CoIap5w9+jv
 6KOFjyvvRs6RkV1z9s2PHm0QF+gQPGfAu7OZOBvaJ5nwJwuSuoxDO2jJ661tR0DuSAklqnzgavc
 Ou04RzYOszyXWR5Ze3E5nnEdcJRbwiiyJ/jObEj/78xa3ZTMSV7ozIbtzWGEu1Nfskz7BnVTE7X
 5K4fHOMrWlCT7fte6FcSNa+OxpFdIYQQcGbGp9nsR644gg==
Received: from fli4l.lan.fli4l (p54a1bf23.dip0.t-ipconnect.de [84.161.191.35])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5D55BA4C4F19
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 17:45:52 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42414)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.2)
 (envelope-from <bernd@kuhls.net>) id 1xWz55-0000000014s-3HZr
 for buildroot@buildroot.org; Fri, 27 Nov 2026 16:45:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 27 Nov 2026 17:45:51 +0100
Message-ID: <20261127164551.3676196-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.6.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release notes of this bugfix release:
https://sourceforge.net/p/fetchmail/mailman/message/59438762/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/de54e4e5d8735a8b293c82fb576647c2c3e8c847

 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 3c41bbeccf..089e12cce4 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/59406635/
-sha256  3dfc47192e76099b5614f2b2a42198cb41fa05d7ca9b5073e08c051e9be81435  fetchmail-6.6.9.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/59438762/
+sha256  f32f1ecfdb99a243b6f7fef5d1b5f5aeac2bb0a45ce0162552d6063db3b48073  fetchmail-6.6.10.tar.xz
 # Locally computed:
 sha256  48aea24325e55932dbd79b30f558b9c87a416d675fe5f94445e8be5cb6606fde  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 35f48944a2..c6ff66b018 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.6
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).9
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).10
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
