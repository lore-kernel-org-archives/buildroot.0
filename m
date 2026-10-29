Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04AC606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YwIJ7ICG
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB594816D5;
	Fri, 30 Oct 2026 14:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OjRffH9i-i7Z; Fri, 30 Oct 2026 14:19:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BF0EF8169E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369991;
	b=lmioWym9yPl4fB/gEfL3EO1TQ58EPTirD3lbPuitqdg2vKWOI1Uvl7ts12yioR8PdwsJ
	 DGaNoCQO0nRpKsQW177CqlqnrNOPohFzesuJhH9DpQID8yVS0TMbMsJM1aEzNqpSnHFA+
	 Eg5X9TzYjtnzbwsU6ZylCN6LVf33viOZK6IDWY1lUYifFOTk5iClA8rghdOZcDGgZDFm7
	 fitNdYhhU3OvNBN4Sgvy0Wc/F+x6my2hhuN0srHlJV+DV0wwtd5mRvP9UVNEwhdwZsfI6
	 obYwfra+Vhnkm2OCryUHfa1nsFt6Khh+SsBJGVjQW2A3ux3q2Mq70iOIAmwYzqF5GJA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369991;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=EFuLffRBV0bJtDWa2EFh31Hvpp5R+8zW7BKjfHUR1sw=;
	b=tWVYLyhATH+PHOfnvBwgAhPReTRDtjDc3uoL6LF2DsXatAEweJTUJAI1+L9nbLjPL8Ma
	 owLdE+DACRvw1cbemsON3rnVHvWf7FHAl+hTOPND8S0nkYrZ/V8eZ0MF3gyKS1gJ8n4Qe
	 XR0WikeC16xcWX5IsjDXXDRrwF5WqFu77Y0pF4x0iPDc5OaBt9IFCueuBfxHcwmAHlnnq
	 taMvKSeYG64lL2s1nSkiGtQmhNsqk4Z3ffuqQ4AOV3vXl/GPugvHTcqe9uRGJclvJBcy3
	 lLWXukZkKesOOX7sVAfx301QcakX7X3a/4e1qdDpBWiQzRlHCqRQ915+fhMMAwz5SCQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369991;
	bh=EFuLffRBV0bJtDWa2EFh31Hvpp5R+8zW7BKjfHUR1sw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YwIJ7ICGxRBl2uZkFUzSnfbgSCo7GUWMB1AKxfvSxjgR7ZFHuHRpBUObKNVU24lat
	 oQYu1URw+KoLVMa3N6BvtbH/VWbULKZfC3C9SnnMyNCX90IcV7tfhlgCh3SYesyaKr
	 51T/rqNsnzNCh26wdhpLPStjpb3R6GwcpuEBcjhaVAlzcGTLN5lEMREIQOef4nmMbh
	 HfKh7kRIk/niwm0mj+b1Ep/4zd9WkLN23pb9bICcdUiabOcHxi6P8jaxw9XbinJzr/
	 PlZHvdo6AVpOe9Fq9X5GkTRg/APvtp49uHi4wYStZeZwcAn0AQly31fPzwSFR8Ag0B
	 TIL3XRHyV49/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF0EF8169E;
	Fri, 30 Oct 2026 14:19:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C8FEF362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD3ED81283
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPm0i3ukqrsH for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E33B6812D4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369893;
 b=rIu88D1Yl+XFHM0X3WyyzDhEuWsn/3JowhmePgjjD3ojo8mInk1jc78fqO5pXIG+j6a6
 BTzcOyLkGtmfwPf4gWaGZ1xWPGZOxH4nWKZ1SsX4akaFZFOxyLB93SumMzt9wlk8F4qQI
 ISkDqSm0yEzRy3ITCikIBoj4eKgHCOUWM1lVixXuMoGXGYqFT5GkiHzOhVeVrYLPTOXyn
 m5isRC/qEXkHXe76AL2/EE9u6nZwSmGnOlaK3hzRCinYMZNrltNwy5FfWcqyZh6H7o8e+
 ySia7tkKHnu4ck/c9LwbeUfD7aXsKjytv/lpS3Hz6zNMpdZng3Fe52F4T5Rbgqaf7+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369893;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=bQ4QOyewPnDqXJL5aZVpXYS8CAm6tjzeLQXdiFEIU3g=;
 b=jKCGUoXPnoUIeCxYXjxzUFHFBvZ1Jmm8w6UL0/VKHhnksRaBawyVCxSFHGdHahiOBV7y
 3AXXps167W67KRfd0WwL2FvKARkqBJOR77MlQtiUwpRq5g/Tq0saFEzX0wEt1h5F8w/hm
 mKV8VObN6zqfO5pnxa982J1ihqu82pyHVWvF3xL8DDRewVMk9tSYy3flcuMBcYvfpMWlX
 LKjD/tyH0kT/YLDk//3AP6otGGNuYB8tL2DY4ys9Pn1ik3bxxGYfPeNd/tOQTHNx4g84F
 KwzVHoqP+7LbSb3nd5gZnEiqUv0lhsaK77LxCKs6WNLEeluhOQts0zabV6S7psZDrzw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E33B6812D4
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C8FF9D388; Fri, 30 Oct 2026 14:16:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:09 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: fb3144a2a1ea5743f89a0cf741f5cb20058f645e
X-Git-Newrev: 99980185ddd134c0caef6f68974fa8cd4c5555a8
X-Patchwork-Hint: ignore
Message-Id: <20261030141646.0C8FF9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/brotli: use
 github macro
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2039611015620226051=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2039611015620226051==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/99980185ddd134c0caef6f68974fa8cd4c5555a8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

For consistency and to end up with a nicer filename.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a370fbaa27bdb23c5ab27846b49168b2f5856751)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/brotli/brotli.hash | 2 +-
 package/brotli/brotli.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/brotli/brotli.hash b/package/brotli/brotli.hash
index a777737338..c851d7fad1 100644
--- a/package/brotli/brotli.hash
+++ b/package/brotli/brotli.hash
@@ -1,5 +1,5 @@
 # Locally generated:
-sha512  460591287d428c8b5a8a2766b5b424d14501fcda12c7118b8f3cc4bfae44b90ac75ca156557f07b6e22542612724d904533e5f70019be07dbbb604c46f03ab69  v1.2.1.tar.gz
+sha512  460591287d428c8b5a8a2766b5b424d14501fcda12c7118b8f3cc4bfae44b90ac75ca156557f07b6e22542612724d904533e5f70019be07dbbb604c46f03ab69  brotli-1.2.1.tar.gz
 
 # Hash for license files:
 sha512  bae78184c2f50f86d8c727826d3982c469454c42b9af81f4ef007e39036434fa894cf5be3bf5fc65b7de2301f0a72d067a8186e303327db8a96bd14867e0a3a8  LICENSE
diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
index c040878c36..47e2f8e57c 100644
--- a/package/brotli/brotli.mk
+++ b/package/brotli/brotli.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 BROTLI_VERSION = 1.2.1
-BROTLI_SOURCE = v$(BROTLI_VERSION).tar.gz
-BROTLI_SITE = https://github.com/google/brotli/archive
+BROTLI_SITE = $(call github,google,brotli,v$(BROTLI_VERSION))
 BROTLI_LICENSE = MIT
 BROTLI_LICENSE_FILES = LICENSE
 BROTLI_CPE_ID_VENDOR = google

--===============2039611015620226051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2039611015620226051==--
