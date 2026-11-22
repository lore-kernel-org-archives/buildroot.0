Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9F5606A31A
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 22:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eCrPBwj0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=JQrcWAvJ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A3AD80D13;
	Sun, 22 Nov 2026 22:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XCHpzLU8l80p; Sun, 22 Nov 2026 22:12:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4D3F280C6F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795385554;
	b=Sxh0grf4ZuwLj/vWewQr1eWKaFpVmHslMpbFsyqc9M9W3wBvwq7ZiQsk9tbKnzECMw8P
	 1IDqg+zVNrNwUftrFKljPSVULcBvZm34NhbqBHDuvI3A1bH7f9h4VCk9Bf8vnZs4BIp9t
	 z+IC8xB3//VaFUXYyOEhacyOq2gCQWAdrCPMiiDjGrztHAktcyNO1bRtRfLCkLIIV2vvl
	 06K032rkOlhvoPbpvvFFVUQTFtnBEuR7y3r3yt/rOIxw6rLUEqISk+0eLDZzAso/JRFWQ
	 l/3t9wN5nmRjcMTLIEsYdxhMu3wuModZ5SJRbQ/6tYp5W048JoL7U5kEtD4UEIjea8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795385554;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=uLriGmT5ReMTN9/lj733xiWEzzmq0QBqG/vegx6Y9e0=;
	b=EDjHFI0U7wE+vPrgfrCXUGiHF2krh/Z31Md4QnX7EEq8lCW6Y79Uvjm2ZSrD//g0ZtCT
	 GNYUpYrNnGz9CGhDBka1K98/w2+COngmox/hBLVZKWSspz0fk2KYie5u8KWUtDfAfYFjS
	 wHD8niHCf9tmFev2N6OY7+0zyhTeokPcvDBKjfo3hOTH30LCa/4K1u/4sQA9ghQx5LlZj
	 e3IV0tXE9kVmuMeBNwxAfCKqYTZ2VuhWUsAGCT3rbAWllm111+a1tBj2HA+uuH0pniXIJ
	 zJeKeX6HM0/3ZCmRnuZnAUqCTR5rfY4lYHPNFLSXjDoJTRdakv+cSl0p9zrQWkdVJZA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795385554;
	bh=uLriGmT5ReMTN9/lj733xiWEzzmq0QBqG/vegx6Y9e0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eCrPBwj0iTfFnywWoBqXExiJRfCDXWObslNCUr8Y7pQ+OIx6W2EZXzpcAa900v0Hb
	 EIw1YLJewUlmlNxqq857h1uX5bbCIT1Y2Jefh5fhEeo2XTUrySE/7kjkN5AtjiYFwI
	 0SsFEI30t4GxLvs+ojqcDR3IlMxZXxtP7c8p46CXz0tLSqRBZfDkSnjahkQpjhfVWv
	 GM6upCxv9LjjtzvkzhEdN4XJ6VFWleBBA8wjTY9jhxE50fb3aSC2IQH+9xIhCFIjN9
	 AYFuBUOQ1+feClMvh2PutyNQDd23SqAsGMsixFGCr1VIawZRgR/9LJV0qzO9Z2EK0J
	 m4+W5iTduNOzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D3F280C6F;
	Sun, 22 Nov 2026 22:12:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8171310
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA65940081
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gD9qXK0YeXPa for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 22:12:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3D4D04006F
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=JQrcWAvJ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D4D04006F
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795385463;
 bh=DHl6TnThaDeU0Ew5ySYDum5lKAc3shxQio+5oMiWnic=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=JQrcWAvJgd5B72V8MYVlMghYelJ24IZBw8kIa3F1jNWff4cU/BF5jIi8PWqPHDeVz
 ImK92TgqV9k+oAWyQ7sZj67hPSURlz4r3Ghyiu9zrfJXOcYg9WWtkUif3U494tdkf7
 Xiwr2kpqDttjNCA/6uJ7Fb1Q1BNMjC+1aJ8YGc+vW3K6tn2HewVasW33CHNNVxZPAX
 xoeGSRtOInWBclGOWL0Bqw4irSrmNX9IDrfhP0YmCUwWRfaEuEk9LVHNuJ44y2ZTRT
 H1Q0kZkIy9hmbvud15PIEF8KL055oCDr6dYTIPHAN2830eP2+rl9DLLMTJIBwiGMFt
 BbN16pf2Il6yg==
X-KAS-Sym: v3:f51bdf72230551df:EH4wQjPla4QHGqFqRN4iUyyvNbNI1uLzAwAhvs7phaINU
 rex5rdM+zlO7tcEyEJVVuXFASyqa0yu9EV27HzaWW0gbLeHZeTleizWs0WVyvysSpCChJmV90YW
 spsK2ByWhUh6ptuQ0VP6hR6UB0AU17e9QMFD+oQf+HHL1eTxZwqzDEZx2D1tqC6Z4qwIkCED6lF
 O6GfkRoI//qwytN/DRQjT5bd/iBDLCeDnp8QfQa+YLpJ8ofHBJYF4kEbFo9JUKrnTjPKvDqpq/v
 GUPuEcPySW0OlB7UJ2Yq9S3cXREzMYsTtUUEeBq/sRXjt7Sh0jPTDam+N9EXEZ240+rFwWDA==:
 tEMNvQo2YPt5iDl77K9nHA3ojn9KtCEr/vs1INVGeab+iGC+u4Juz/IVKzwHO1owLkORY4ZEAwA
 p2VZjTgIE9CJwBCFMFWsghFwtDJDof6P0I2gF+Oyqd/imA60Vb2rOgO6IOJ1pEY7x7PqGSlbNgJ
 K2vl21nvWgSpXR6jLI5DhsGb18683vJWy4IuIBIO5uGpRG2zqgKcQu0vUFlLCumqCb4nu5efaQY
 VeqqtHu+UOr610gu74pK1c9cqADbUgyrtivNvltOwYTv7jIGHGHpkECYQXRyIQWKqn4ukS+mgC8
 M+/5byMUMF0KPBFjxAkJtBP/IbUt3riOmDScud6WkjQi7lJRpzMtXUe6eZ5aaOHZhwTUB1i9Y6z
 s3SWGjwqIsy7IYkUP3yFb8sl1AFW5Bz8YXAunW4TjI3aOpZDx/GJhUdjEOvl21pYLrls7EsBY/+
 WYGvoNjGnlpe1ZyPjZMe7gmEiMWkhHP8lTDn3p0tB2Ynl8l6JloKC+4XClG6JziIkOkr3I6aqT3
 DST0ZbgIaZfBUQLLfOdPLV38K0fajIJRkQaCUlS78obRHDyDq27bp9aGOJJF6erP24Ap2J1RhCR
 ZvRL+ThqO5rON3wrtRQHhSOXq7lo2aYe7QH3fMpsz331N0s=
Received: from fli4l.lan.fli4l (p5b3a0d5e.dip0.t-ipconnect.de [91.58.13.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7A4E6A4C4E82;
 Sun, 22 Nov 2026 23:11:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41694)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xVFlJ-0000000014Y-39Iw;
 Sun, 22 Nov 2026 22:10:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 23:10:04 +0100
Message-ID: <20261122221014.3945599-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122221014.3945599-1-bernd@kuhls.net>
References: <20261122221014.3945599-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 11/20] package/boost: log needs serialization
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

As of Boost 1.83.0 which is currently in Buildroot, there is no
visible impact if this dependency is missing, but as we're about to
bump to 1.92.0 this missed dependency would be causing
problems. Therefore we do not recommend backporting this to previous
LTS/stable releases.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 4da4a5cd91..10e1f9f811 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -229,6 +229,7 @@ config BR2_PACKAGE_BOOST_LOG
 	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_SERIALIZATION
 	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Logging library.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
