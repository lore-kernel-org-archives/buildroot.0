Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9664FCA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B78F40708;
	Tue,  6 Oct 2026 16:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g8pjTSGngWzy; Tue,  6 Oct 2026 16:31:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8B7904062E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304290;
	b=YDEsnPrebTkcPUEiTuJiOEmF4Y/OeNmfy/PQhxPNrpsDjLst/pyZn7FQR5d8AlKxKt9J
	 4sXHxGn226xHQEjppyw6QiinRq6u7a+JHbP4teSTd58518D+Ui7rpTuwikN92IqyA0Z9E
	 LNy/q57Gp8fxG9YnCJdP4voM8EOQhGndsOMA0Mr5GZ5R6tqkt3wK6pOLwANfhREsYGQpb
	 /k2xbi9mzL/vCg77lhMVLlZ7AqMnnlSi4YeXk16KwDGq64bQW6cmAJI5vd3Y10fX4Lv76
	 bJoVZ+zYFYm+dSiGizfyGBDqCtTZ1QVG+jbT5igbLMaP6hK5ZRzo/Gfe+AL0o+/JLTg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304290;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=psxCyJsOoPQBaNaDsjLgk2N8LRb7iYUy3lMmm3gnKBw=;
	b=A3Z/bW9WDNGFLXz+FjV739il8P7bmJzwcIjyeUPM5gm6llsKe0lMHW/9u+n2IYHcaCZO
	 o6106qMvWR2K/w6my8D3akypJ/zsLgEyLexbLPba34h35fHZOQxRknvmrwNMpuwpVrVjh
	 diChzbHP9hCqJQd27IL3EM0v3Ot1AZkzD1pC7JbjWeFonSSVBFyxJcoccftZfymef5srU
	 4Ga++/v0Tsieg9m6i2cPgQCLSIU2NsSqRNUoncazwlHzmX90Mz/Wo4Vei2T39F8Uigyov
	 ONsvi81U3RgfojRKP6IpJpDla0IuYlXa4Z24FNFUiKRSJ7qNbbBtwPOcCYuyRlwtNgA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304290;
	bh=psxCyJsOoPQBaNaDsjLgk2N8LRb7iYUy3lMmm3gnKBw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PxXRca2LgtB4HimNQjJJvb3PDVucSvXGPMYdGOlvj2aa9cQxM+9+59zFLa69OOTOl
	 5KatMWryzu6e++RgBssY6X6QdllrIhkdmkC2XelvIyrLdsNEta0GbPAqDxCLA+XD0v
	 M8t/j4EFMrAMaeNdX52Q0zsg9mIG/Bnx80xX0RGQ2On3AX+lqyN/Cu43UtlmCz0ysm
	 Ran4RHoxQIU9koVRbfzRiFhVhdm+K9UMQyzX87UnBInW5xHPQIRxA0H0edR82nMtSX
	 55STJ2EeEo8hsLwBjGZH5nAAT245w0/239IFQGn0/24o/bHJlpRBQOd4qs5fb7tVNM
	 sOS4uXfhIh2hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B7904062E;
	Tue,  6 Oct 2026 16:31:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18A29341
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09E3880A8C
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aC-uD8RRZwNE for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:29:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5D10F80A4A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304145;
 b=CogbPeff4sO9fOYLGhRbc3xcBy8iFTlQl7aDMh0UvP8l14wJKz7qrT6R0KxIBfvvnVKc
 cE2TRHNMu7GaM7QUrSeoklNX/5qojQ9moBNvBJ7z3dckNhLqC4BgM9pMVOnna+LrfW8nL
 m7Ah+vbkfI7VBTT42Tm1jncXCyG6Q3azg+xqbWRMPstUhpcDWZApnpKlQj//oyjixrGGc
 n8Y+A585a+J+Sbw0XSwOvKA3WyiwlmJEWEpejr92ToDEj9esBleITGmAfdTYd4CWDPrSq
 qas6b+dUj1U32dmpKYwdHLaBHI0Lxxz2jd8tsqw3C3ykHBCzYk1ffhhWQqPeWkM9EIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304145;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=TpIRgXsZr+de/HgCRWGzNekWVv4B6cQZqpVZ9ZPIofM=;
 b=DKlxI53+gSfTo8SvbyzBweje59z2xMpdP5+k44nVuUbF0Aoknj+UB/rnnPQtEGB+stH1
 e2MbqfAPH5FpY72WaxSzxk2oLVROxKVct5WVkoJrgmaNMuSkhNhodVQaYwf1JXnVcpKcO
 uNvyOT3vClxrh5YdLDT7LemAKYQeG0okp7ANRsHXzbn2FeXq3hufWOi7qZGQBFNHEwTA7
 MsJkWcErHTN38HJTp1UFFA52QZgdJJtJVLkLZx1peOGupdcx9EU8jq7Zg7Oh1ROjwVxd0
 98zcuyTCg1FGf3tVGTBHbCacf+EIrdq/Lk1kUL/TuM2vBfJvMu02O4BOUaJVYa/2h9g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=WnhkHrx+; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=WnhkHrx+
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D10F80A4A
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303707;
 bh=TpIRgXsZr+de/HgCRWGzNekWVv4B6cQZqpVZ9ZPIofM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=WnhkHrx+aE0vpxsq3+EE5sqo9Y/GfpAnO1MxNOaQdlc5CzI5isHQxE1gkUBjRoVhK
 KEDe0vCiz5jNba8ublY08+UVLMLUzVS7nik4fJq6BIHzzhnGtBmqEPvzCa+VpPY/J6
 gTC5w/3V1yHsMwSKjukMQ9EIqobAUyqkOpNHI1Axo6NVZcFq8aZiooGNAzMDGGxOVg
 6t860A5EkP7Kz7/WrsNkygU0XXNMmcPBRcx0ADkfXuGal5lPNv7M4UYzV2BGoiE5Pl
 1VrstJ//SUyiRjYxqA5s5x9H4JxufqbE8Lr0N9YV02jO5TPAWPoeYJP7+5Z5Kx32fv
 HWeeyPX1vz6GA==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 foWQqqF4yqNbV6qmUt44N4wQZzxuQbPGHk7NN1En5ytiZkF6L+itMgp77YzOwMmxshyBwWK7jyi
 h0aJEHDeBsKBSk/Y68a/wKMya5GurtU5Zws9sdx4LH3zLhaYjH5H0kYfpHweIQw2HlZGFOb9Gsb
 8EvE/AGePh57LPVeAujEEWGZeopd7OFEH65Ok/Ujqs9Vyv7mfLwVbL/t5hozub+xZAiBIlndNfx
 B1GBztENPle6cAaiTN6a7qbq/bBdvjY/OsstMgnxLDfpO4fyclY6cQ5h7N9edhW2prFePzrV0aq
 BtdwoDW90eoI+V9JMtaeMj7TttJ8wG2HDHZ7XhaSNsb+JMvMQEnE4wTTDzVojqjPN0Mfb5wT/RW
 A+zY0r5Wg2ov+4A2o4ruN6LpV72wAcOwJmoG0IGW8INSh9cHHeokFGylolVOKj9LZqc1tuR/mI5
 OwELfLz3z8P2UXgl4zPG9X+1gGq48lpZSyWfwoN5SVkd9lGy/VvcUsrDsPhUiHbVXTg2ZcDBcj8
 sAvz7Hu2QjGtfZvH0OG6OgJyAngXDVOkc49bR/ciQLW9SAz9bJtYqCDuVxGWyuKrH+t0IM93qg7
 B6UPG5tgtkStbeCU3nsteglJLPtZgeMgKs2UylZY2D1BeCg=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 162A8A4C5411;
 Tue,  6 Oct 2026 18:21:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uh-000000000ir-2LDZ;
 Tue, 06 Oct 2026 16:21:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:19:55 +0200
Message-ID: <20261006162106.3439373-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v8 14/84] package/boost: update graph
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

needs match, serialization and thread

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 362cd6c95c..63c50d9835 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -170,7 +170,12 @@ config BR2_PACKAGE_BOOST_FILESYSTEM
 
 config BR2_PACKAGE_BOOST_GRAPH
 	bool "boost-graph"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	select BR2_PACKAGE_BOOST_MATH
 	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_SERIALIZATION
+	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  The BGL graph interface and graph components are generic, in
 	  the same sense as the the Standard Template Library (STL).
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
