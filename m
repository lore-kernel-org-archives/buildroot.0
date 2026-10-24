Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F43C606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OoESffGX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=O7Mom6Xm
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3877840707;
	Sat, 24 Oct 2026 21:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id If4UvO9Gh4eX; Sat, 24 Oct 2026 21:03:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 72ED140702
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792875792;
	b=os8+FwwfONKNTK2aGA3cqgAlfuyfg45yXi6sUDgwrcp8ntuEm08dnr6+16Tc/2AuNtIf
	 xRdZ+T7e4JDGKTLJofEt6pmg+wE0F1jwyB0hGvk3/lvaYs7rKIFipsrK2VBD7Ei8/ilgE
	 vY3pXNvlAbfte02WD03CywKG/3LScvKWtb0MPiOrnH6Mh3Y0OYF5/XqvkjC1d5E/2CiPO
	 5blC8slfqgLKoqm5wLozBv8zn9cF2l7kB1mMXgFzv6UvDSsG40sUq6oaR1pvz3fouJsbn
	 AXz2ewBSPXpuW6K5xfvTWwm2Zd47h6c/z4zWoqSWlNxSqqRZyYOISq0k/MPIgEFVxNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792875792;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PFGG58jQDDUCufip/pVXfXdFl6Y9jHnksMejvER4doA=;
	b=XIq3qgX1BTDQqL+napv9+Y7tC1H1EbWsZ/oJhW2AdGAliQ09+FPukM6XsI91aZ0WoVmS
	 wYCj61bNKUbTwnhWmJ7vgoZlJgzYRd0/3ueMOGJMqsGNs4Rv1YG/JbjUPrF40AnIQLj9m
	 rXllQxWsEdTWktN0MnL/1ZWAoox3/WuD9F6JPH8+jr7zajgi1Q1uJR40oKiAWn677jaqt
	 geDAdkyM4z1xtQfTXrIAzpkYw8T5Y1pxkWozNnwSD9v3mlg8vbeYDYmNsVokHE0+TNWnO
	 6lVWxBpK9MTnub2yxML3vzD7Ll5OoWSPJYBEOzThS+/CHVKGdBjgJQIzH58mn/kdWdg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792875792;
	bh=PFGG58jQDDUCufip/pVXfXdFl6Y9jHnksMejvER4doA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OoESffGXNkmZVnCU1uFgXZkUW44ZQHRSr98URQVorF7rVBrn1rpKAgZrwu1fRRSgj
	 H9qnVqkG9E8bH57neYgZ3HR3hFxL7mVboEIB7+x2kGhwAPQOe5hGtSFccdq2OMecjK
	 8UnztREF7Tjd23bX49MnHD6qtrk5o8EFLyoH+TAC+4vEzHe3JI+KGFvnLYpvkP40rJ
	 qeguhFBYe3U722HQyxzoTjy2aJjhztcL90qkjbiSoRuZrVE5P0eqPi2thICb1EkotX
	 KGAqfA1O/Or2eKSRJAK50AqS67ZrFONy2QqzhrUZGtQRQ8bg1wSqaegarK4z2fTOQo
	 Bf4R/1WTOx9tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72ED140702;
	Sat, 24 Oct 2026 21:03:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12C7E2F5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED50280EBE
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUWvShokeQLy for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:03:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1B1AF80E83
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792875790;
 b=kOt8ePL85WiII22SytOAwpn416wBhrg1m+wVyPc/d6wXJBpFowaHeUYy03jDE1zWwTT7
 xrsFaTupNjocgC5f/CQtyavUanUyZZibPRmBgi96oZRL3rddeAQAoHm623kYyaf7r33tg
 8Sk3jNR4pxYUawl1KNjowqAABFfGolwwxD0pj8VHLlvrkG/6jf6qtliWfS9QFpaoma1OX
 w5inTrRbAACqsAPgs8MHnjizKVYypnGqEfJB8a4jGkO3XEAmfpU6GTl2UDNfeglmO2Vub
 uvQVhx0Fv01R3P9WI0IFRZSSyZl2HTSrSAzDi5M0MBkNq2jNZiSFvB7dVQvFpcEA9Mg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792875790;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=UCA84uFSj84R9A6RLLhjKO1JzUbCnTEdKAn4ixuJt38=;
 b=EmM9pukPheDpKhqDV+uMmg8Z3i3I+zBlQOwxxsbNCj2Wft5soUbSzx3FfzPGsQoycClu
 106eAMkfhbKAcQdLqJ/EGnD0ECGkniAac5GNYICvnyLH4cPrO96cDqw2UdaZwRUCZ6yQ8
 dgUX5U6RYKndNyb8MZIAAIfpKcXDtjFT1EFdOIbmd1eXSaqpYxKbQUCY74LGNlrBcZ9Fb
 akZD1OXwV4CQ9rYs1nXOTz+BhXbF5n6/hhnTQiKpX5xCvqc3t+g4DpkjWPMP2d8sl6mVG
 dEag11WruKs286lLwU8dgjuFbIl+SWEJ/08ngvUEooyZkKORk7ThWLQ79u/TGQJ5uMw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=O7Mom6Xm; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=O7Mom6Xm
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B1AF80E83
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792875787;
 bh=UCA84uFSj84R9A6RLLhjKO1JzUbCnTEdKAn4ixuJt38=;
 h=From:To:Subject:Date:From;
 b=O7Mom6XmKgijaLM128FzG+kWyudqadAugk18WozJWY48YMv0B1PDjZjpdMESR3cbk
 gYcrusRajc6CAHbdH9wf+9dCBFw9jx0nPCxitpVQrHrIRNBEZIfLThav8PuuFxfDVt
 Nmdq4bCtj/qumkG21EL0NsNuuo625RGgqru3jonbWWlFwyoq3bhjrd1yExQbN76pYC
 wLFzq9Jzxe9HykqXcGT6VAnNZVk1Ox+tiPNv9Ve0ZbbBmw40qr6UtpC0ldrJYBj/X7
 QVx5cLQmXq9XqWt/jtDZ1HVV7XJR0auYZqxh/t8rKV1QAmaPVfLC4Up1m/BZ+9gffD
 73XYtr3EO8R8g==
X-KAS-Sym: v3:f51bdf72230551df:iEs5yKH7pu0nN7xJj3WqkKZviwk3lMD82LRmL3LSmYZSF
 omShvYJRIkpy5CAo2bB64J6tH+6E5dp4bhVjren5VktC2svkYJkjSfsEpq17S77iyt3YX4zREKx
 G9PcoDmptEZLELy6lMBuAfPl+FWb3qAP2dspa8+VIXGBDaE0XCnx3YPhzLV4Gj8BC31qGRhR3SR
 +4jPlBL88m6WBrT2iaxUjU1PSu4UyU8QrTEAGaVpVbuB79xaNs68pAV+V5Drk5MgS7VnVh6XUl5
 ElhwNzrAHCk3sVXWzfuhJQ7ZDCLQiDJp7vpLPnwnz3atJ6ku81/N6YG1uWLjzDHg+k9mkOSA==:
 hp9tfJcCoTPm/G0E8RXpMkOJFvRBQzf5f8efzy78MTePSO/sE8LHLQRQx23hRzIrknfwoUR9q17
 daVSXz9vKKS9/NQVyQ+UdxtmBnttYciL9dRtXTSlYtFCQDBylx5bvxxfg2LxoV7NmSocYqjXoYT
 Eu+gtI2LZuUj5lAxHikt8cMHWBvGOLO5CkSDNChTh8ZSfgNdvrKuPX/kWd4Ka3XbyUROpmVOOC6
 rQCUf+nlbxBUVwXGzs3EjcjI6+L5TPc2QsGoLjsCeVMYu4OVRbTnYYgocsCaTz6In9CoUy0wkrK
 OrJlLrEhTGO7JkOS/tVo3P/8rb5/AV4dpv5/CcbDQ/UbiuI9Z7zTUMVgEIztPMHKrjn7NsgMAEe
 NytcNwvCNUCIBoluX9clG4tfkPa9DX3x0vwJnqRuQg1ZoF95B2FCBGDN7+Grc0U90OxDPh85GEe
 EN8vEj61jDYS7a4Ac/nIpIoRMTBSYDPHTIasf/ADbPmWSDDpNEfA4SRs//F4ewkw02Vj1JpJ3W+
 4evJ7qnoUk4jwjdgHMvvUr1YeapIhl6MXCM70W74qSFctggtf3Ht1Odte7KGNHRnzcMBjG8+CZT
 JZNMOA==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D195BA4C681C
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 23:03:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45528)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKitP-0000000065a-3FMu
 for buildroot@buildroot.org; Sat, 24 Oct 2026 21:03:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 23:03:07 +0200
Message-ID: <20261024210307.2815833-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/rust-bindgen: bump version to 0.73.2
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
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/rust-lang/rust-bindgen/releases/tag/v0.73.2
https://github.com/rust-lang/rust-bindgen/compare/v0.72.1...v0.73.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/pipelines/2985086914 (check-*)
https://gitlab.com/bkuhls/buildroot/-/pipelines/2985087643 (tests.package.test_mesa3d)

 package/rust-bindgen/rust-bindgen.hash | 2 +-
 package/rust-bindgen/rust-bindgen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rust-bindgen/rust-bindgen.hash b/package/rust-bindgen/rust-bindgen.hash
index fecafcd4fd..cc47145758 100644
--- a/package/rust-bindgen/rust-bindgen.hash
+++ b/package/rust-bindgen/rust-bindgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8e5a0999c2f4f6ab1cdee508e913e2ffef5225fb313816a0151742cd2103576c  rust-bindgen-0.72.1-cargo6.tar.gz
+sha256  7b9902040f3ecbe84d2acaca91f171ab34cc19b84cbd3c4cba89a637f714e6c7  rust-bindgen-0.73.2-cargo6.tar.gz
 sha256  c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  LICENSE
diff --git a/package/rust-bindgen/rust-bindgen.mk b/package/rust-bindgen/rust-bindgen.mk
index 55f3b4d5b7..a1a129be43 100644
--- a/package/rust-bindgen/rust-bindgen.mk
+++ b/package/rust-bindgen/rust-bindgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_BINDGEN_VERSION = 0.72.1
+RUST_BINDGEN_VERSION = 0.73.2
 RUST_BINDGEN_SITE = $(call github,rust-lang,rust-bindgen,refs/tags/v$(RUST_BINDGEN_VERSION))
 RUST_BINDGEN_LICENSE = BSD-3-clause
 RUST_BINDGEN_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
