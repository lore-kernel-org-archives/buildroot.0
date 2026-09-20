Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D92C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90D5480F44;
	Sun, 20 Sep 2026 14:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6lNk-FFDqPsX; Sun, 20 Sep 2026 14:49:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A655C80F28
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915777;
	b=kfdYtq951XZCOZqV1qNV/p/28v/2cqd/trUXtYoBv6iY4s8dk239fVWUSUY6Ob7k08Qn
	 sdPxA9GJK9NW7U91r/3N0tZsCmYrmcPFzKiAbLHrASborUvWY4Qa37GcMDdfNBHIdi35O
	 Igl4oxkQQiwgDu7e9qETEKuemUDK//4tge1Elw/F/ht6DEjMMqEvCYtTtGtWXtFzGlcHB
	 tdh6o6p/I/T2DhNoOdrJrxF8BIg0VmqzR96Gem7DXoWlaFCLArdJ2Xs4ZxQuirykyphCT
	 tKMByHYiUFAKBoQdQJ31DAU4tZD5rJEhOWdndNdpD7dW2sfvh3mxFh60P1NOM5EV37A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915777;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=z+AdxNtlsPj3RpuClS5bTZOoECb0K8xDh5ikjbTSidQ=;
	b=UcXBcTGxXXMllql19d3dbgjJJD6TnnxLQ6T+SL7xvAWwsLyihqhTCI4BwKH//uiaN6+u
	 /rm/EBrXgY7rhfLeDsYwBPDDFOcwgCPpcn3pfe7rOxCM8criv/irZyPi0ZQ3H1nkwyB3P
	 dUREozIv8D+S8dWUoXe85IdOtAogwLF9IVSA99hwmYHCu7ro+UxpLwb5BgkhINqx5jpQ1
	 L8yRvjxCLYzV7XAp5J0QovR3vvPDx5ge7i6VUDIpZ11PyjFvZ2XXah/Y3iIj+9nec9qUd
	 Lqz/rxh46xQ7IG75iXxS4HlAyMhqpk5lShBmQdqmeXvu2Yafw+mUKaa0CJ0vUG0hphg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915777;
	bh=z+AdxNtlsPj3RpuClS5bTZOoECb0K8xDh5ikjbTSidQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dGjiJlA1TcefYc2ww4CRLK0prWpg8Iv5uE40RixHDoLbVdJYrc3FE6uII1iYRX6Nc
	 LwCaPrWnZj1sC8d9Mj5oWLE2OiHJwFbCAHg9lw/4aFi1jisIdv+g7aCE/KBhtmZCI3
	 jN10mHOZPBBoJ0DdO/vyda5KRlYTgrjNxNvvEG9Ji6N3UDmj31o4zhniJpxUvnL8JH
	 iAsORGS0zkMtS06YDK2Hr8mcr8tah3uXVQLc1qNQs5llBrOluAWLw3OflHQK6YcCkS
	 r8r29fs9iq6EgAhUmDSGqD/giz/wIGvfXsDeO9DIub+hwxgkJjEQM/ouGZK0J+o9sO
	 x9A/6FjGnZ1qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A655C80F28;
	Sun, 20 Sep 2026 14:49:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BCBA37A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 826AD4002B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_OK2yftUEhP for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:49:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 9972840022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915775;
 b=eHY5HnMdcuR4iFiJt6etzOsmFX1b09+BYW6+83uJ4OJ/tMxX6Zh9yfQwrYQZhSCbYOK1
 g6J8U+lbIH5XqdlhXeWRWPqLuqM7D4gjyHtOjzMfNcbgKmad3EPzrAKvJJeEIZBtM8ZxI
 qBQsXGhvdWt9hQqdqeodz8QUzdJzUOBGyHnD5fVWUJJSYEHuFvoNd6+hRVsQTSb4ghXqy
 Df919cFNBKAoDcyAIghJua3lMRLY4trgkADvgiDSBZqvvwvix13e5BqEtVp2+weTbALIt
 Zz5+zLJAzsERvMGs6EmsWqsdqLXnMkvrNEjkAwpGJTQpcoV+SMOw46s2lcTnzzxdXEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915775;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=t+wAoYYHyKtV+Eq97J1+gkp81w1F0wH1jS1vowMZLFg=;
 b=llFSwxQEWMoy4R22gJL0cgzJfsExhYFUQ9kw21jhkNo1xCOA5lWw4ETb9HDVXXMKM8my
 fwwHvZcvQZVrrCCehxmL5RDMBO0cj0S+Ke8Idc3yMkltyTRIOgtqzGhCpB/7fUSDgxmAG
 WNXxffVyxeHABYLnGyxleUc6HgJBcNn3X2XHDZoW6nKJqrf/2OyzKB/yu7th7i4FKV1BL
 ZVDF+C5zXjUKDct2UcAW7wjnmxwbX9aTQX9R7OYTQreCL/OIJ8iTeNwg134rDbvGGj5rr
 6odmGUNSieDKOkU4LGNbBhafi0kLjl2cQZgS476YjDbWXZnhfAPPf/DvCOS2aw0UPYw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ipShkmzt; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ipShkmzt
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9972840022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915502;
 bh=t+wAoYYHyKtV+Eq97J1+gkp81w1F0wH1jS1vowMZLFg=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=ipShkmztarMXvclK7nfuVDLASX5gimVA5S4pZSJzt9J6dGe1DaiIG55DF/B+TzMhZ
 +zdLTqcJCEGyn0czBCad+l6ljSS0Fb9VWg1GyMksUJuZIso4U8l/drKyALdyBnpJJB
 hpoSsfijywqgpS7w21r+cUzRZdnmaILlyaAL3rZgOiyvY6R1ShidcgctUcH+ZjNvz5
 Bv/L4WkT1vxUVOdKsXbpmt0DYg3grDnSPpcwqbA8HRnTSxJq9ao9kIdqmLCjzm88a4
 iUZZ0JaDwrgaJiV1ZFxwbuVrrkOIB2c+ODAXsTBP7Us6TqJ7WJuoCSXBctdidoPinf
 q+tN9UV4nkU+g==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:Oh3wjJkseuu/uDIR1JcKEHIbZseJrR7xTryeG9Hb1qwyiWK2DFmMbdlkXOzcaqJSeR1SSncc2BSBZJHobbZSzGjc9kYgAa9qWjQ5CvHDIKpAMjfJs8knYp2A99ulnhhY0IladoaZTDBc8Q7R1ge+zRvwusX+2AF7MEZzShnMeRDyfIsEolfbRKFAco0jV5/X4Je0DYwe+6Z6l0bWa5PmRNw3WK06uY12qqw50wcppG0SGKcoQ7GVqo4BMLNQlcS5QmIj8D+Ur9x/p4Sww8dUN+U+ishdKlEvSa7IUldk7fuZz+ECD7Nz5c+uWSlFDOTO4oaOSlqOYu7+IFJ+swLYf+hD+lvwr9Xuz8RFMqgSFrtbt/78tGZ0z4MBHl2OeW7iKgTLPhnyvEg3M9hPidyRAvAz1yvKspo3ZndZAQXA7kvbpmU1iZzvFbS01xDbQ3fZ7Su7CeDPh7otWuvNpq2HcHF7nDcIg3ki5B6hyZSsLzFlCXmV6Taq1beueFG57D3snEaH10Q2WEWCTzwqokw4y4p+F2qsQqbm42wJblCkLvoG/hQypg1MXMCjh/ZYO4lZC01hx3rGhEG22r9F+vVD+LzXm6emYT0=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 892EDA4C487D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imi-000000000hB-0FXX
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:47 +0200
Message-ID: <20260920144428.3009612-27-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v4 26/66] package/ca-certificates: Replace
 c_rehash with openssl rehash
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

The upcoming bump of libopenssl to 4.0.2 removes the c_rehash script:

https://openssl-library.org/post/2026-04-14-openssl-40-final-release/
https://github.com/openssl/openssl/blob/openssl-4.0.2/CHANGES.md#openssl-40

"* Removed `c_rehash` script tool.  Use `openssl rehash` instead."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ca-certificates/ca-certificates.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index f5675b754d..0f88df3eec 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -36,7 +36,7 @@ define CA_CERTIFICATES_GEN_BUNDLE
 	done >$(BUILD_DIR)/ca-certificates.crt
 
 	# Create symlinks to the certificates by their hash values
-	$(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
+	$(HOST_DIR)/bin/openssl rehash $(TARGET_DIR)/etc/ssl/certs
 
 	# Install the certificates bundle
 	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
@@ -65,7 +65,7 @@ define HOST_CA_CERTIFICATES_INSTALL_CMDS
 	done >$(BUILD_DIR)/ca-certificates.crt
 
 	# Create symlinks to the certificates by their hash values
-	$(HOST_DIR)/bin/c_rehash $(HOST_DIR)/etc/ssl/certs
+	$(HOST_DIR)/bin/openssl rehash $(HOST_DIR)/etc/ssl/certs
 
 	# Install the certificates bundle
 	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
