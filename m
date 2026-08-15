Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F43C5DF67
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 14:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AFE44080E;
	Sat, 15 Aug 2026 14:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNwBjgO2Feyx; Sat, 15 Aug 2026 14:39:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EC4D408A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786804778;
	bh=U52851mCEzNzR9YXzv9+nw/JwnlrXzn9mZQVSKxlUvc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p5QuGKGDzEW2/L7Lep3SHYXu+5Dq/SRdydy9cgbObq47mHsTHYjx+QeCbpVgKYakk
	 sF4clXSQAniVwf9dYFeJME72S0HD6u9G/rU7J0acqz8Vy91g4J0iQwiSEN4NXLuOva
	 thKMSPlw6m9U0E3itsFChngXojZQY+Y57/aaaVZSJj5UmgJXYoVHsq81eYmxUlDbJM
	 ln7Jalyl5jgW94Bam/kqhcomyWJgfX2UKAeDQlgu4ogj3ellZG5E8Cnpc/hc6I5jAX
	 phMxYfO1VEuF8nGaKFziisBei6h614JTd86ceJhHKNlcsPSQTIiyRFKymwMul58Ypw
	 prauuntW4jwcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EC4D408A5;
	Sat, 15 Aug 2026 14:39:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D7EFF2BB
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9F38606A6
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6NjrohQA9Cd for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 14:39:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D81FB6067B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D81FB6067B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D81FB6067B
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:39:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 94AAF2003C6;
 Sat, 15 Aug 2026 16:39:31 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Aug 2026 16:39:31 +0200
MIME-Version: 1.0
Date: Sat, 15 Aug 2026 16:39:31 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20260815140041.100370-1-bernd@kuhls.net>
References: <20260815140041.100370-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <5c4f65e1223e2e17fd150cef73415a42@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: security bump
 version to 18.6
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/08/2026 16:00, Bernd Kuhls wrote:
> https://www.postgresql.org/about/news/postgresql-186-1711-1615-1519-1424-and-19-beta-3-released-3365/
> "This release skips PostgreSQL 18 versions from PostgreSQL 18.4 to 
> 18.6.
>  18.5 was not shipped due to a regression."
> 
> Fixes the following CVEs:
> 
> CVE-2026-6464: psql COPY FROM STDIN early failure processes data lines 
> as psql commands (CVSS v3.1: 8.1)
> CVE-2026-6469: ALTER TABLE ALTER TYPE resets extended statistics 
> ownership (CVSS v3.1: 3.8)
> CVE-2026-6470: Fails to check type USAGE privilege (CVSS v3.1: 4.3)
> CVE-2026-6471: Logical decoding can dlopen arbitrary file (CVSS v3.1: 
> 7.2)
> CVE-2026-14662: tsvector and tsquery undersize allocations, via integer 
> wraparound (CVSS v3.1: 8.8)
> CVE-2026-14663: pgcrypto, for OpenSSL-disabled ciphers, silently 
> encrypts to and decrypts from cleartext (CVSS v3.1: 6.5)
> CVE-2026-14664: Regexp heap buffer overflow executes arbitrary code 
> (CVSS v3.1: 8.8)
> CVE-2026-14666: Row security caching disregards role modifications 
> (CVSS v3.1: 4.2)
> CVE-2026-14668: ctid type confusion in selectivity estimator discloses 
> derivative of arbitrary read (CVSS v3.1: 8.1)
> CVE-2026-14669: to_char heap buffer overflow executes arbitrary code 
> (CVSS v3.1: 8.8)
> CVE-2026-14670: plperl tied object heap buffer overflow executes 
> arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-14671: refint plan cache type confusion executes arbitrary 
> code (CVSS v3.1: 8.8)
> CVE-2026-14672: Observable response discrepancy with non-default 
> scram_iterations provides user existence oracle (CVSS v3.1: 5.3)
> CVE-2026-14673: amcheck does not clear untrusted search path (CVSS 
> v3.1: 3.8)
> CVE-2026-14676: pg_stat_statements heap buffer overflow executes 
> arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-14677: 32-bit pltcl and plperl undersize allocations, via 
> integer wraparound (CVSS v3.1: 8.8)
> CVE-2026-14678: pg_trgm picksplit reads past end of buffer (CVSS v3.1: 
> 4.3)
> CVE-2026-14679: Stack buffer overflow in argument match writes 0x0 and 
> 0x1 to server memory (CVSS v3.1: 8.2)
> CVE-2026-14680: Type confusion via "internal" arguments (CVSS v3.1: 
> 8.8)
> CVE-2026-14681: Improper enforcement of GSSAPI encryption when coupled 
> with SSL (CVSS v3.1: 4.2)
> CVE-2026-15741: Expression deparse allows SQL injection via EXTRACT 
> argument (CVSS v3.1: 8.8)
> CVE-2026-15742: fuzzystrmatch writes effectively-arbitrary addresses, 
> via integer wraparound (CVSS v3.1: 8.8)
> CVE-2026-16238: Type confusion in pg_restore_attribute_stats() executes 
> arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-16239: Type confusion in cursor CLOSE + DECLARE executes 
> arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-16241: ECPG integer underflow can crash the client (CVSS v3.1: 
> 3.8)
> CVE-2026-18024: ascii() function reads past end of buffer (CVSS v3.1: 
> 4.3)
> CVE-2026-18408: psql \unrestrict lets superuser of pg_dump origin 
> server execute arbitrary code in psql client (CVSS v3.1: 8.8)
> CVE-2026-19385: pg_dump heap buffer overflow executes arbitrary code 
> (CVSS v3.1: 8.8)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
