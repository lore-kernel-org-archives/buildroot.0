Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09B4606A31A
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 22:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JzcVU4Hc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=q1s03GTk
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AB256063F;
	Sun, 22 Nov 2026 22:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iywt51leHHH8; Sun, 22 Nov 2026 22:12:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B3C4C6061B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795385528;
	b=JjeAwr9MECIXHRs84Kh1YVMdiaTJdIXDsRS5T03KK0JK4ITGdAOMMv3Y1kAce8Fao0oT
	 g0XxpygBd6/SSQ6ICfzT9W333+GYZ0mC9l1e0hP+MOfbbdw7dikcXr5In9pB5n10wt9Dy
	 b2fLq9yLHpgh58SHg3pBBhcU+1Cr4VwkWPHPGAwHqC8PovsdeMXUu1Q5d+N+fS8d21SCJ
	 Ti1h6s5NEBZRSoex3zoBGFn/hZFAJOyrfnfHfiqMEHOGBOPJBvGH3yGc8lodEHJ6p/XHs
	 GyKETDAgZYTK80GBmFAaZuoJWfd1Hpf8Sd50PC0rMar0xmcLB5TNMqbA3im3qbkNIJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795385528;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qf9+jx8j4RnURkPh8mZnXP8voRKeJYYxhXbHp8gGwQw=;
	b=PEK51rM483KFz+ctkpIKKzhQVqSEF6I9aIl0Ptr0jX2CkGZYdFeb1yq+w+ufx0q0iCIW
	 3Y9IS3tqfV252hQiv8ApWZZa3HsSs8C6mxPRVaEjgtyCg3O5GFIIsqRqSWl3OiGyF/6b+
	 dtRJEDZ5El7LsWKhL+RsiWagfUyilGru3PyK+yRSX1gEFHMUg1FXK7sWfOqptshwjzQRi
	 KOUjySVmwVanY+JLA9GbLhV26aMy3wdopdiXpAQwoYMTBow+YMeidMj6XlnFLenektPV5
	 Eig7vefzwxKv71qhoYyUGPW35OMmc0Q5CqLT0M+LalotnSY+EJcYH/TNDxXnw30s0gA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795385528;
	bh=qf9+jx8j4RnURkPh8mZnXP8voRKeJYYxhXbHp8gGwQw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JzcVU4HcEyaFZbH5fMmGy+nSdVTzLzXpWrlClB2w9kZUdz8ja8gfUtuT68O8VVsBJ
	 L7f/eVTWEUnEu01GfrJiioiuw3MyAeWScER5vRkZo60sYioyqNNLiNN/fqIUPpaAGr
	 KyGs6UrbT62Bhn1qXIKHD6rSfv5bkEaES2gqQo8Cz5pwk1E+CyqbEnHNSjwAZFw30E
	 pKHv7IgyiZgflOJ7nS42UkOloY7t/PgDNaroW4qq4whKz92F+hIAaTXVb2xDZ9+m88
	 n8IiY8gKuUS/pFK2rPJetNFICcKKN/qjhBPpigHYq+Esb4wUNdEo3dvNEkRazrDh2o
	 4wjlf1gysGK/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3C4C6061B;
	Sun, 22 Nov 2026 22:12:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 769AE371
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C84280C6F
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:12:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kzl4W8wsprUb for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 22:12:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A9EB580C1C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=q1s03GTk
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9EB580C1C
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795385463;
 bh=fbnDDXQTMJdleGqbignjvHVFmgKxLonwe3pKPSCTZ3U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=q1s03GTkvGdrf0XuWrbSKdYgxDa1q7PGwm9SCp+W0Uho7QGuzvOIFouhY6rDpXiTg
 pG5OqBEUw1BPGuCDGT7Dp2efeZChENL0ebMEtX162g0cSBInookmpEMffa5oVhdI4w
 rG8YFJdXEVs21SAmVJuWmjtgP8jp6+ZsP0d4gS51G9HMvkxUrU7sQWRyFWMViBAxa6
 3kMJ4O86DAf/yQ02oGtALZHNfNGUbeQcNpKuezfkOo1KKjmEFr9e8G4unzqHexI+qa
 jRCnlUxAAWH53iIcsC+8q0WuimPP7/IiFRXJCpACqVd7igavKp2/FOEuibjwiXITHh
 h9yJqPNutHPaQ==
X-KAS-Sym: v3:f51bdf72230551df:EH4wQjPla4QHGqFqRN4iUyyvNbNI1uLzAwAhvs7phaINU
 rex5rdM+zlO7tcEyEJVVuXFASyqa0yu9EV27HzaWW0gbLeHZeTleizWs0WVyvysSpCChJmV90YW
 spsK2ByWhUh6ptuQ0VP6hR6UB0AU17e9QMFD+oQf+HHL1eTxZwqzDEZx2D1tqC6Z4qwIkCED6lF
 O6GfkRoI//qwytN/DRQjT5bd/iBDLCeDnp8QfQa+YLpJ8ofHBJYF4kEbFo9JUKrnTjPKvDqpq/v
 GUPuEcPySW0OlB7UJ2Yq9S3cXREzMYsTtUUEeBq/sRXjt7Sh0jPTDam+N9EXEZ240+rFwWDA==:
 9d1DCnjA1P9MHHKhmwQB2yR+HHHSvaKQehWmllrABbd6RifdBCf2i+T4It7jUdASxzHt+kdKFuC
 dIAkNn7I8CZVrw2PavYfuY6rdxN+cZ180fJDMWcjwpBkbinVmoL5O9Zz5aZTS+j7IZvlXSxeLWh
 nfq7IVvgT5CNQ2GV+oGLiZNIr/9CqoLUpzsuCJCPrAWZMWc829Tm+ctfXDfOO7fI/N0jW8C+41S
 OZmk+Lj5mbItInVfJhj2yShBZVdrt/IZ7hS4pFnGCNtCTe+npRC+5pMy5Pk+BSqGixbrsLD1DAD
 g0PQhUL+oSSXgWZtYV8EedsiBz+4jKd/6iKl8uNgoCr6+O+0vRCA5qzP/lYFhFcWCAIzRn07SoO
 hAwzXhiLQ9rJ+sfNRAdRWMejfRdMxpVhSI9uI6x8PFtzERLy45rCbDra/aHnnOBN1MMae7WK0ov
 p6mpA77I7rtNATf0OmDIIFpIAeZRMCpZ+Yxk7XKbRm88q5/LqEUPKtCwO9Eh1IS1eHMFNfJUPXU
 5+v9nNXxrN5jiCX1yJlRPQ7RXhT1SvX1BvXl4RoXHuLphKC3H0odCXXPIXKFQPkK1inBVo4Dvo2
 Y+0+pbPjmMHSzAGjhLB+gdKqtQueqJPV7XritTbziZwcHZg=
Received: from fli4l.lan.fli4l (p5b3a0d5e.dip0.t-ipconnect.de [91.58.13.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E599FA4C4E7B;
 Sun, 22 Nov 2026 23:11:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41694)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xVFlJ-0000000014Y-2bEy;
 Sun, 22 Nov 2026 22:10:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 23:10:02 +0100
Message-ID: <20261122221014.3945599-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122221014.3945599-1-bernd@kuhls.net>
References: <20261122221014.3945599-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 09/20] package/boost: update graph dependencies
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

The graph Boost library also needs math, serialization and thread.

As of Boost 1.83.0 which is currently in Buildroot, there is no
visible impact if these dependencies are missing, but as we're about
to bump to 1.92.0 these missed dependencies would be causing
problems. Therefore we do not recommend backporting this to previous
LTS/stable releases.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 0ab55631b3..a6135adb70 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -154,11 +154,20 @@ config BR2_PACKAGE_BOOST_FILESYSTEM
 
 config BR2_PACKAGE_BOOST_GRAPH
 	bool "boost-graph"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	select BR2_PACKAGE_BOOST_MATH
 	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_SERIALIZATION
+	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  The BGL graph interface and graph components are generic, in
 	  the same sense as the the Standard Template Library (STL).
 
+comment "boost-graph needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 config BR2_PACKAGE_BOOST_GRAPH_PARALLEL
 	bool "boost-graph_parallel"
 	help
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
