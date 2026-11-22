Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2256606A31D
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 22:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=j1kjhCN5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=gNX4OCa5
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5BE0405F4;
	Sun, 22 Nov 2026 22:11:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rMV0U_gkwqVZ; Sun, 22 Nov 2026 22:11:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 02515405ED
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795385504;
	b=JIHBwCgVtfsW2gUHsgBzGXBEHlcOgB4mF5B6fTUPLJ4ntfNqs9zIp+MRvYdXw0sbxara
	 G7MsmvJoLNXkmrgAd1ArGo24ip4kuCIV3Ds3A8LGHhXuXUg7iGI2Nu6mHybDgYcoD9WMy
	 QO0Ua941x563byQuhfkyBuddNWC0iWoKIeJyvEVSsxTGEs9EPv++fZ3YCzfNwQfl6QLsw
	 wvxzNoW1a2WNjIQczF69HCJ7vc4/iCm0jVBFkFYg1hgzp/IySIy18W+FU+zoOP6Mm2Gea
	 NVG0D0pkoAYhr2cLZDKBLIWEN9K8Yq/513+TYuBrsmGQTWa1iMJ3lyNyoiuZgNveEVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795385504;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZREFg+jTaN+s2w0I1/3izaL8l9U5JaEj9Cs/uSB7m84=;
	b=IS0gCzCrrMbkJgxybBX2I9urcCr30KuzJ6Iej2Gex1fh0dVyU4pfqC4FdoT68weJKeOt
	 no3AvIO6IUXZFoQjIbo5TySsmB0Pccr8NTmAb17B4Z3peJmsYnC+Z00JCqGMbEXwxPzD8
	 L0oqTMQ9w+y0jq80bhPNf00P8c28HziufrO77k4/zaQKM5tmXuEX6tynJtZlHynw59daD
	 DcfjNXm26Kv5QnSddYRSqCmkssXAZNg91RthEDTYz0p+aOfS14Y8dkJ1al0Y0pHWin4tq
	 5FsRXG5zYu7K55d53NoNL2eQR0iafNFJqFhwWqj1BhPM0ZEeIqmqK80E1BoPQQFWcWw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795385504;
	bh=ZREFg+jTaN+s2w0I1/3izaL8l9U5JaEj9Cs/uSB7m84=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=j1kjhCN5Olznz1fHdoHatBrVx3MZI7w8lbtXp/sVZC+vZdmF9wci8Uhb0etSjCIvR
	 CJ+jytub2d33XbTSdh/hqaK8ulgi3AyOPFGB5K3KUBJCJI2yJgM+rQMUW9ZEdTQ34S
	 2VD2oB+8xHXZuNJ30ov4PvYoCU1WwVN9swIXL7chpPc+6LuUMQt/7GiCxSEfoVmeWq
	 glNBSRcsrszoND6Pyaj/0zbD2+Pj4As+krMhKgwrQkL5Mhtk2t7/poWJ1tRrH0dEVh
	 bvnChSfzk5n/HncT50VKRo8sm8UOH2JRWmaC1v2U2gxHLBXSQoSr1nyHUjp/eAU6Le
	 JvN8YYFY5/Iqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02515405ED;
	Sun, 22 Nov 2026 22:11:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 69CBC371
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B46560632
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bW0077gPBTDb for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 22:11:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org ACFAF6060B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=gNX4OCa5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ACFAF6060B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795385462;
 bh=DNwvmnRRkW3UiIWWExJUkeU28eXGGTV8DZUfCPIOUF0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gNX4OCa5OOs2JHhXjmeROQN90wxwbOPA2UpoqvlrMcVrOdGoVhBsgjGajaCxhpvzT
 8644MD3rRQmr2A9HVc1Wkoz9ZfMWEATPgtYfx1U/mdI0Czs9tIZArnmBxHr1rodgMA
 We5VD0hsDiXKs8jR/DcHbhlD1oSoJoLyWaONpvqyBAVHKknKTwApe+FKV+e8Q+681X
 ZUt+TcxnF1vHgqTgdq4Z7GzzN/ri+/bTzVKAVtHKY2Uw7CFUz8s/B0Ev2i5FlLi+kO
 ANTihWYDAh1MR/1jKdIVSLcclmPtgH7agLhu49h8f+Oz8oLMxq5JFVRixAAvm26W1y
 LdyZOpbu+WILQ==
X-KAS-Sym: v3:f51bdf72230551df:EH4wQjPla4QHGqFqRN4iUyyvNbNI1uLzAwAhvs7phaINU
 rex5rdM+zlO7tcEyEJVVuXFASyqa0yu9EV27HzaWW0gbLeHZeTleizWs0WVyvysSpCChJmV90YW
 spsK2ByWhUh6ptuQ0VP6hR6UB0AU17e9QMFD+oQf+HHL1eTxZwqzDEZx2D1tqC6Z4qwIkCED6lF
 O6GfkRoI//qwytN/DRQjT5bd/iBDLCeDnp8QfQa+YLpJ8ofHBJYF4kEbFo9JUKrnTjPKvDqpq/v
 GUPuEcPySW0OlB7UJ2Yq9S3cXREzMYsTtUUEeBq/sRXjt7Sh0jPTDam+N9EXEZ240+rFwWDA==:
 uABIaMRgZR8Ja9pGp3eoUgLsu4dJAQfn1F+PGYkxywKtSdDMQPHpAM42u1C2PRnrPWfnHTbtn+h
 1H+Y4biIXhDWyXkVHiEX0eyCZO1rOMGB9iHy74srVzEM464Ea6TA53xocE0QcEBORxPlA13quMH
 g9d2peqEDMb6aRaKUBMZ7SwoeGeW2ZbcgTDGYZozkv2qzxe/A5V70DQuo3gKGgqQA82AceedLmJ
 PiNpmXPQ1ibSsz96G+M5hD/ulpO8+yXvdCD5TCD0ISnEsKiC04dIvPJ0XoXWTXQ2Nux3P0jusfS
 YYBogpjVGU0reqrASokb9hPW/1xy4LplzZTxHHhjiK2P6HcMsz58sV0pQU7wcq9STSntGHu931l
 kVXesZ5H6NYIS+4E6vTEkOKwHAXJFBcA/SZ1Ppche4kdjErhvpidFOwrEFnGPTaA4WUKbdy/YkT
 2tAh2sIvNkUF98lv8deah6RznmXIZ+e83zfb/9WhtIIRBY4wcs+lpaCRAHqkq+jwCaWPC407msS
 bBZALT4j1s5mnob4vJKscZBerG8qyvCe4+nvpNXrWDwiPBeWmmzp6wBTAxrBJqP3n/Fvjhh9gCu
 JKFFS7iDHCCdY9cL5ZRGpPusBHajvdEW3ApM/aBVhhoifg==
Received: from fli4l.lan.fli4l (p5b3a0d5e.dip0.t-ipconnect.de [91.58.13.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 93C68A4C4E64;
 Sun, 22 Nov 2026 23:11:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41694)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xVFlJ-0000000014Y-2LhU;
 Sun, 22 Nov 2026 22:10:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 23:10:01 +0100
Message-ID: <20261122221014.3945599-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122221014.3945599-1-bernd@kuhls.net>
References: <20261122221014.3945599-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 08/20] package/boost: fiber needs exception
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
index 92e5d51464..0ab55631b3 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -127,6 +127,7 @@ config BR2_PACKAGE_BOOST_FIBER
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
