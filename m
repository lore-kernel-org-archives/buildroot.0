Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0DE60A2602
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 15:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qlVA5sXl
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A90481397;
	Thu, 19 Nov 2026 15:09:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2RJs9g-cttlk; Thu, 19 Nov 2026 15:09:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0BCF98139F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795100964;
	b=Ep9s4GiAcAeUZCld8//tVVpgfAS1RjhtoZVKmnQVB6ViWls7OzPF9t+7WIk3FAn1DGL8
	 Tjn0qFRq947B4cKO1CIshWHlQqCQXhv0Kp5hCB7Dn9yMJQT/7xUoiOzS0dELFYzP4OEGR
	 i4bDdxyz8apN0Zk32AKw/rrH2nt0vlzBxKHdecKFT2Pmjorl360fpBvQo7fq5a/gbCcqh
	 i3kMTHgGds+pLnUi/QtEfxm9PGviEvLfghq+UuQmE1BlCMF8StJKWbcOZLsX9i0nPTJd9
	 HB6WOtdvIQRj82WvU26wonWCEJlV1jWP9/fl38cfRzO2oEze7dM0fHgYr8O7CNMpLSA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795100964;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=jqrC5hk0CTu8aWEvM5lx98yjcxuvl4EM6Ze8XzQFjzs=;
	b=Wpn6pSO0G1s03C8b2Y6xXYy3gHIrafRAUgrozA91JdfeD7Xc/Jxf6suzdGCt6QZpzgfT
	 X4FhN6IKnxyUCuvz2FBOBkQaKuD2XRwFhZQBZd2ToByWCM5/GS0+4F6Fc+YE43L9Hx29M
	 q+O9XGcvFX/4qI2m2SRM92IATJtDckAWi5EdL+bnIhBp0T5mMAUOMTpQgEKEx9tqD7g44
	 60i3DDmLeKt5uHS4J96IjHZzU0HrtqZti6x1KlgPp0F5tuV7KuaMR4MJLZPQ7Endmhs3P
	 nbQ829NQ2C7g2n6L9iJUWKXqbkwtBvm9T2put4B9Ol9NlArUYBTeerJKa5bED0c1h2A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795100964;
	bh=jqrC5hk0CTu8aWEvM5lx98yjcxuvl4EM6Ze8XzQFjzs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qlVA5sXlrJIqkIzPA4axZZB0OO5p8/JypZbs8T8lOMf5JGorzEqjUKJ+HKeaK02RP
	 oeX9bxH0fTRFb8v0942kz8RygI/4dB3zUbjZ48gpBAgjQYJj3tEiJN9mh7g0dWyyuQ
	 HS4NAhEw9K0+9vM9QJ/yyhiD98LjGcwLvmbEgaxqe+G7JiPuTY5tmzat8kCxgIWHqq
	 NBfHJmvEVmAX1w4J9koSzv1DPkpMzVVhCItWCbpNnCFO9yPXT3Ge3uH25V/hdSroL1
	 LNnddPPm3xBGKyesRVbIWGNdHojW0nXqYIX0mckwP1so/0nPY6ei8XDl1qzGLK5mgg
	 SJyjUHc/fO05A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BCF98139F;
	Thu, 19 Nov 2026 15:09:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 893B1465
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 15:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EFB240B12
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 15:09:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zYvw4tVH_bwP for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 15:09:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4313740B00
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4313740B00
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 15:09:20 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 5017E2C84E9E;
 Thu, 19 Nov 2026 16:09:18 +0100 (CET)
Message-ID: <bea4d0a1-9feb-454a-aaff-d3299703c253@bubu1.eu>
Date: Thu, 19 Nov 2026 16:09:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>
References: <20261119150604.534395-1-peter@korsgaard.com>
Content-Language: en-US
In-Reply-To: <20261119150604.534395-1-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH] package/php: security bump to version 5.1.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/19/26 16:06, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> CVE-2026-15353: SOAP information disclosure through malformed array
> dimensions
> https://github.com/php/php-src/security/advisories/GHSA-q23r-hr55-xmpg
> 
> CVE-2026-115560: Session serializer mismatch can lead to remote code
> execution
> https://github.com/php/php-src/security/advisories/GHSA-658j-r8rw-q6mx
> 
> CVE-2026-127960: Denial of service through folded HTTP response headers
> https://github.com/php/php-src/security/advisories/GHSA-mmf9-xm3v-hg2x
> 
> CVE-2026-128064: Mixed-case HTTPS and FTPS URLs can expose data in plaintext
> https://github.com/php/php-src/security/advisories/GHSA-f6gg-rchx-xw8j
> 
> CVE-2026-128090: PHAR OpenSSL signature bypass via algorithm downgrade
> https://github.com/php/php-src/security/advisories/GHSA-68fq-fh7h-f8gr
> 
> CVE-2026-129182: Use-after-free via repopulation of
> last_fatal_error_backtrace global after shutdown
> https://github.com/php/php-src/security/advisories/GHSA-2fjv-p558-g82m
> 
> CVE-2026-129289: PHP-FPM request smuggling through an unread HTTP request
> body
> https://github.com/php/php-src/security/advisories/GHSA-qc49-hpvq-g2w6
> 
> CVE-2026-129291: PHP-FPM epoll use-after-free can lead to local privilege
> escalation
> https://github.com/php/php-src/security/advisories/GHSA-jm4m-qfqx-967m
> 
> CVE-2026-129292: PHP-FPM status endpoint XSS via unescaped user and script
> fields
> https://github.com/php/php-src/security/advisories/GHSA-3mg3-cr28-46gc
> 
> CVE-2026-129438: Incorrect RFC 3986 URI serialization for oversized input
> https://github.com/php/php-src/security/advisories/GHSA-mg3p-mxj9-g2mm
> 
> CVE-2026-129474: Use-after-free in magic method backtraces can lead to
> remote code execution
> https://github.com/php/php-src/security/advisories/GHSA-8mjj-2r7p-4hg2
> 
> CVE-2026-129481: Use-after-free after interrupted session shutdown
> https://github.com/php/php-src/security/advisories/GHSA-g3vh-838c-65v7
> 
> CVE-2026-129496: Timezone cache use-after-free can lead to remote code
> execution
> https://github.com/php/php-src/security/advisories/GHSA-gr4f-wgx5-jpfv
> 
> CVE-2026-129501: Double free during DOM XML serialization
> https://github.com/php/php-src/security/advisories/GHSA-x8r7-mg3g-74hg
> 
> CVE-2026-129506: SOAP use-after-free when processing DTD entity references
> https://github.com/php/php-src/security/advisories/GHSA-4646-p932-gw34
> 
> CVE-2026-129538: PHP-CGI out-of-bounds read and write during PATH_INFO
> correction
> https://github.com/php/php-src/security/advisories/GHSA-5j3f-64r7-f564
> 
> CVE-2026-126714: Partially overwritten session files can lead to remote code
> execution
> https://github.com/php/php-src/security/advisories/GHSA-fm2m-fjf5-v3cp
> 
> Changelog:
> https://www.php.net/ChangeLog-8.php#8.5.13
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
Applied to master, thanks!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
