Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E44C5B572
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 04:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 107D1606CC;
	Mon, 17 Aug 2026 04:13:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fh9gtvB8kG_E; Mon, 17 Aug 2026 04:13:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4016606D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786940026;
	bh=qAwrIfeXwT/cfFuARPZkTU9Cm5tLAwQfSk8VjaOjYeQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=YcYLoaeOVVhKpSEEnYM1RrQRw21Ec8BbBGZ9atUDUYo9KKUWM7S/dWJBagWtlQEUM
	 stJyOsvJwyqLpXT1KCYlXBW3zTSumB6S1T3udSFc6aXeqj4iVzMNbBk/pauWIAuVHK
	 4FpIItgXY4hIUK5gTOl2ZkirJ1TYEARU4ugQmuECSEZI7vf2GYyiOmHiZ/TrLwZVLS
	 O/CNkm+yhPCrXqUhFrIa7seKL3BIMelUluXwGa5HLaWP3Wgvl7IWfakBuaKKdF3RNs
	 Y0QPIqKUqNq5xc7gaJVnWjmrcudy3Ah+hM6OtD4ClKfyeNsyLCan6y1lfEeCeUZuSP
	 CfCVVkGJB1W9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4016606D4;
	Mon, 17 Aug 2026 04:13:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C7758147
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 04:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACF0940566
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 04:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nbxoE27Aa04I for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 04:13:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.155;
 helo=send60.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 085C8404C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 085C8404C9
Received: from send60.i.mail.ru (send60.i.mail.ru [89.221.237.155])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 085C8404C9
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 04:13:43 +0000 (UTC)
Received: by exim-smtp-848884f6cb-lj4dd with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1wvojD-00000000Iy8-25xU; Mon, 17 Aug 2026 07:13:39 +0300
Message-ID: <ea698fdc-c2b9-46a3-bd1b-3e63200a6a6e@inbox.ru>
Date: Mon, 17 Aug 2026 07:13:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260815140041.100370-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260815140041.100370-1-bernd@kuhls.net>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD95DAF57E302A5299C40966F27D38929CDF44C517335AE80DF182A05F538085040CA0C17A2195475253DE06ABAFEAF6705AAD0D103B074614E86E34E6EE61F4E88BDDFA93EA4B3182B
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7D77100FFB2844417EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566915EB6444AA4888D59DFEEABC941A70E29379CEE37C23CA3FF7C38A2517E6FD58EEF46B7454FC60B9742502CCDD46D0DEDCF5861DED71B2F389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C015BBC38BE64FE4678941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B6CDE59DDCCE53AF2BCC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF17B107DEF921CE791DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3335407143AA9223635872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A50088E2F9ABE2CBEE5002B1117B3ED696ED8B854908B006CE92212597CCBD6D77823CB91A9FED034534781492E4B8EEAD5DF1C2DF01CE7211BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34CAB70F9BE574AE9C625B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659BFCE7DFEDA082F31496B0408A7D6071C86DA523C9AB069840ED40E66D0DF2B16ABB0D8BE643E79D9B8341EE9D5BE9A0ABC64C9617D94CB3139E79827DF73E726AE859F5CBD822A868CD93680B12512CF4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVQHpos7JM5NNZ2uETStwiu8=
X-Mailru-Sender: 689FA8AB762F7393520AF17B8A65FDE2F8048C309CE6D96D6A683F1330F1F0E4F5D3BDD6C31E177790DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

15.08.2026 17:00, Bernd Kuhls wrote:
> https://www.postgresql.org/about/news/postgresql-186-1711-1615-1519-1424-and-19-beta-3-released-3365/
> "This release skips PostgreSQL 18 versions from PostgreSQL 18.4 to 18.6.
>   18.5 was not shipped due to a regression."
> 
> Fixes the following CVEs:
> 
> CVE-2026-6464: psql COPY FROM STDIN early failure processes data lines as psql commands (CVSS v3.1: 8.1)
> CVE-2026-6469: ALTER TABLE ALTER TYPE resets extended statistics ownership (CVSS v3.1: 3.8)
> CVE-2026-6470: Fails to check type USAGE privilege (CVSS v3.1: 4.3)
> CVE-2026-6471: Logical decoding can dlopen arbitrary file (CVSS v3.1: 7.2)
> CVE-2026-14662: tsvector and tsquery undersize allocations, via integer wraparound (CVSS v3.1: 8.8)
> CVE-2026-14663: pgcrypto, for OpenSSL-disabled ciphers, silently encrypts to and decrypts from cleartext (CVSS v3.1: 6.5)
> CVE-2026-14664: Regexp heap buffer overflow executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-14666: Row security caching disregards role modifications (CVSS v3.1: 4.2)
> CVE-2026-14668: ctid type confusion in selectivity estimator discloses derivative of arbitrary read (CVSS v3.1: 8.1)
> CVE-2026-14669: to_char heap buffer overflow executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-14670: plperl tied object heap buffer overflow executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-14671: refint plan cache type confusion executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-14672: Observable response discrepancy with non-default scram_iterations provides user existence oracle (CVSS v3.1: 5.3)
> CVE-2026-14673: amcheck does not clear untrusted search path (CVSS v3.1: 3.8)
> CVE-2026-14676: pg_stat_statements heap buffer overflow executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-14677: 32-bit pltcl and plperl undersize allocations, via integer wraparound (CVSS v3.1: 8.8)
> CVE-2026-14678: pg_trgm picksplit reads past end of buffer (CVSS v3.1: 4.3)
> CVE-2026-14679: Stack buffer overflow in argument match writes 0x0 and 0x1 to server memory (CVSS v3.1: 8.2)
> CVE-2026-14680: Type confusion via "internal" arguments (CVSS v3.1: 8.8)
> CVE-2026-14681: Improper enforcement of GSSAPI encryption when coupled with SSL (CVSS v3.1: 4.2)
> CVE-2026-15741: Expression deparse allows SQL injection via EXTRACT argument (CVSS v3.1: 8.8)
> CVE-2026-15742: fuzzystrmatch writes effectively-arbitrary addresses, via integer wraparound (CVSS v3.1: 8.8)
> CVE-2026-16238: Type confusion in pg_restore_attribute_stats() executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-16239: Type confusion in cursor CLOSE + DECLARE executes arbitrary code (CVSS v3.1: 8.8)
> CVE-2026-16241: ECPG integer underflow can crash the client (CVSS v3.1: 3.8)
> CVE-2026-18024: ascii() function reads past end of buffer (CVSS v3.1: 4.3)
> CVE-2026-18408: psql \unrestrict lets superuser of pg_dump origin server execute arbitrary code in psql client (CVSS v3.1: 8.8)
> CVE-2026-19385: pg_dump heap buffer overflow executes arbitrary code (CVSS v3.1: 8.8)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
