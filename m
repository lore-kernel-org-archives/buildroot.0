Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1B5606A31E
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 22:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Plmlvxpm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=L6qwG0Hr
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 760D9405E6;
	Sun, 22 Nov 2026 22:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UcvILykiBHOV; Sun, 22 Nov 2026 22:11:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 78617405ED
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795385466;
	b=CDNQyLFFu6FHY15G8gjtivkVYr4Z8c818kpQD6o9GglqecIIS8+sKxddE0lgO1Fh6jaz
	 zgF6nCt3AcHySsvokBBCJeyp4Su66XFeF9zUsxhfvPIHizrsWdO7u9RFZvtwXBuTC1sSL
	 uLgUvTpitLTNAFa2G6WSD7EwhFW7pM3QOMT51WIOrnQ04UajKrZ9MLzH5pJbn4OwlbDGf
	 vKDHC+VIkrraxRe75fiBJykpD8b939ywIpTpH1DZqdknNaxFXPNIsr35mmVrpXSBdxQbN
	 Cl95f8ZZYmVkTR4lYCSqA/sfdMgAMIzMug5fx8PCAgLtiQ7lf99B1BiJLSASQwAR89A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795385466;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LLTgq0vPp+3uRvtDHkJz0FqkWDWbRFZSCeQK7EO4fxE=;
	b=rnuoG/tFoY0CK3KWHraumvXQIhYv2z9jRIgP/0K6xvhGzdinp87dt6VgNQYK4HpVAy5K
	 Qo41TmQd/Pj25Bjlhpw23okLg2UDL0Dds3Cs3Byf9PV9GttpQsHoSRrnQgMDNdVgNzsIi
	 ehvDK2IcLJ2PjDyYxOR7oz+u/H53qI/JWb2OhvDOwSM7TDvC2eRC4iwTUolpxp7po3EDj
	 UK6hcwNklpvdLZuc2z1Sr2wt/xn68ZaqxFQe/nV97bvg9whrQHIf3HoORXFrNvP52JspW
	 37Gk3oARBIKu9N1HMb0m1Jfu7rjRvxYbMis6Aw7mmtDw4Al3vMZQhJJZilbD1Wi4vCA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795385466;
	bh=LLTgq0vPp+3uRvtDHkJz0FqkWDWbRFZSCeQK7EO4fxE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PlmlvxpmdGLebobJqak7XFZ1IwvhgIVMAZOcbzajpu5c2xIdpYShS4zt5wisS8n7v
	 2kbirJY2NUTpEBglxQ3LjVDi1uGopbzB9Fwa49BCaMvSPXHH3jzMx9I8Ml3CzpMTyr
	 2vPihA7tKdijvliNy2CKeD+hgL7BqGSGdOejHXU14gQdBpfoTxBWDTpK41M1bE6GfQ
	 +qsFxZIqYgiasMgAAgYJ1s46IK9oWXFXmBeSXGaw6DiI2lnq0VDev8hSZrK5Q0xQeV
	 o+Z5lVPp6q11trs418mHAbTOxs9FGae0IEdujnkYaaG20zf9N57yyIb5zPm9bpPy/X
	 iEaORqRTzvwcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78617405ED;
	Sun, 22 Nov 2026 22:11:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 843EE371
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75F0D80D09
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gaJeCrS-C-Yw for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 22:11:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C1DCE80C6F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=L6qwG0Hr
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1DCE80C6F
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795385462;
 bh=SCMa3jsYLRVPmHH8i592zjz4qMb8YD8h40yBP39mHpM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=L6qwG0HrKZO+ISpjeeSGYlG+GzOcSFsKumcOnvzE5SKOuDArng+M4FqBoEA+4dlX2
 F6cZia7jVNXKr+kXafgPDTGQCqO6dkz33v9NQ11wXMNk9NtuftlgDzxUpuWd4+e2oe
 kGDT1qLjve+Yx6h6JNBV7+FCEM7SSELn4h0YoRjTWveGNmQ03IuT8VnLFpEucRVZB7
 jM5IBX5GJ0Nicw+q75IDRxQQW4ErWsNJuOS4QtZmD0N5F+HdCvRZeqZIrVB/J0NpS6
 Ue9bdA9YdyBB86LKw6urn+PnUPr97H8oaq69DjU0jEHlLqWREB080N9h1qEEoBSjhp
 uITy+eFBOCHfA==
X-KAS-Sym: v3:f51bdf72230551df:EH4wQjPla4QHGqFqRN4iUyyvNbNI1uLzAwAhvs7phaINU
 rex5rdM+zlO7tcEyEJVVuXFASyqa0yu9EV27HzaWW0gbLeHZeTleizWs0WVyvysSpCChJmV90YW
 spsK2ByWhUh6ptuQ0VP6hR6UB0AU17e9QMFD+oQf+HHL1eTxZwqzDEZx2D1tqC6Z4qwIkCED6lF
 O6GfkRoI//qwytN/DRQjT5bd/iBDLCeDnp8QfQa+YLpJ8ofHBJYF4kEbFo9JUKrnTjPKvDqpq/v
 GUPuEcPySW0OlB7UJ2Yq9S3cXREzMYsTtUUEeBq/sRXjt7Sh0jPTDam+N9EXEZ240+rFwWDA==:
 i8JL3Jg09kVVw3qmwgUSLT9HytRqahj0pur2V6u+HS1zvJSxZYr2E29ZhU3+9F8hw59jtuTLBBp
 5dbgFLzhnYNcEYkqALUufS/nepolMtWEXnerSVAfk6nSRMsncIlws1R2UrlNOtjANj/sDEm3K8e
 zcQbqMSw3Srkz9ixHgx/619NKec/Hp8BGieER/b9BYSH3+dbqoFZa811pldXMYiMGeNKmIP4gCy
 gjUv8Fj/pxx3kZQbx4qR7byRF7R63igny1yw6tp/8/F0UkLC3fyefZr05JGrRRgaBtPch5qF2Jc
 uQYpcqVQx+agpJHov9LDvyyn9srsT6PzDY/4AsPEN9AUCgRc56iEjaHZnlGOT0YnPgHTyZdGOSD
 2CmaXf897NI2zkYtia0IDPch3yv27daZLC7LkKoG4DUZM/hpn0jNEHU78TV2oEbqh3sMHIhU2at
 fb8HC84vxMHkmntdYnRewjx6R4L/sAbs+jOvF1DXHF3SPl9/3JLAQY5YWPLM5bD4vsxHK1nRQFw
 qU1vV24jyCWWkhw7cMdG+zvFAjZiMI3xvotOdSnES+t65JOYWDYtYH6jm1mbs3GOpyi0RYCl555
 NsG5zyt18lJAB+vJTP/NGV1+st5AMIGQOBIcXw==
Received: from fli4l.lan.fli4l (p5b3a0d5e.dip0.t-ipconnect.de [91.58.13.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 18EEDA4C4E5A;
 Sun, 22 Nov 2026 23:11:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41694)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xVFlJ-0000000014Y-1qhH;
 Sun, 22 Nov 2026 22:10:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 23:09:59 +0100
Message-ID: <20261122221014.3945599-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122221014.3945599-1-bernd@kuhls.net>
References: <20261122221014.3945599-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 06/20] package/boost: contract needs thread
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

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 8df2a0f577..d98dbad5aa 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -64,12 +64,14 @@ comment "boost-context needs a toolchain not affected by GCC bug 64735"
 
 config BR2_PACKAGE_BOOST_CONTRACT
 	bool "boost-contract"
-	# pthread_condattr_setclock
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_condattr_setclock
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
+	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Contract programming for C++.
 
 comment "boost-contract needs a toolchain w/ NPTL"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 config BR2_PACKAGE_BOOST_COROUTINE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
