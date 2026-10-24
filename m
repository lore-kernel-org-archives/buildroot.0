Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB92E606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 19:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oytc0Bng
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2A5B406CD;
	Sat, 24 Oct 2026 19:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UZpIuGLujtsU; Sat, 24 Oct 2026 19:51:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C1A36406B0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792871464;
	b=mi/Hhvg3R1lG2x22E4MMQpz8nlpCrPXIT98PufKkhYU1Tnox8SWjzOv48iLqIStleR/E
	 euZhTQUL5x16qDpdSWXL8G27vn6cTgqHApWrv9ae7B2S2JR5Q4phmOlQcCsLDKB0FRTks
	 SFrscqa2cIpKjPiwRwSuhwbb89h59LCrxrpktaHPvbW7jQd/BA4fnMQ9z4KVT1Zimhgz8
	 f2thDZARTvriElaNoXPPancDE7mrZBKsGH5tcZO9w9BzfTIsS6lJtYg1ZY07KGJmIq9pF
	 NQ0x9sco7HVORyvPibqbetWbdwGzomKwajf+wPdCfPknVuhg/sofnl+hmZKvQNO1gtw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792871464;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=wpNCtFEFqyJiCthoZz0aZZnm3lZn3e1qCtPSitWH93w=;
	b=giiJ4TL+ra5irk/sKrHPfvXD5DgX2dTO+17J7J1LxJ43c4c8hGE9j1vgTVlFccFNtw4y
	 0edkJq8L8tNBDiCNlZB6B6qV9X+xUnw39AyYOTa+6GfF/wus3e2KnOwS1Awc8EzLmP8hN
	 hBIfcW3EfPb8lrrjNPQM+eCABy1dT2FuJSPUZndUoKKrkCaPIx8bKsWjlNvSegRqN6UWO
	 LDDTbd+sy+fKBDFXsNPZs83BDm5DSjkX7LdA01WYIF4wn9Yd85LhEfvE9iKtUWUt/3HzN
	 7qvCxgpba65RPp72S7GHGhEWFDzwNatUm3BXgEG8qBpLjLKqkTXi9/2dj/OkQ0QJV4A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792871464;
	bh=wpNCtFEFqyJiCthoZz0aZZnm3lZn3e1qCtPSitWH93w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oytc0BngwZ8nIVYtoz1kyK6qqfIeNlbRbjfrJ54Ku4VksIBVerkvnbhwh7qI6p6Ad
	 d9E6L6Z5XH6jd9mx10OOKrxEbbFpwQQfV2ZT6xGu7B0uR0GdzCUgpILvlzwULgR446
	 8g+Y0Zj++67nt7z03LN7Lta1IxpXykzyfa0iKVX30qttJUAYKQ+Malp+5I3tKRkXQj
	 f1fyAKl7wedeVDCOoVncqE/gRoOJSkECVUY6GigXf3E6q5HoBdUaQK+T6jwrlkLDO8
	 L4avOQzrzP1Gr4Nehm9W66bho4BE9rvDDzvhRfuc3XAeh8NCB7oMl/25fHEWIC4OPc
	 FpqffokpDg5qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1A36406B0;
	Sat, 24 Oct 2026 19:51:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D1603356
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6F98406B0
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lDBDSMtSOsvX for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 19:51:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CB36D406A8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792871463;
 b=GCDslrBWKky+XnWZYTeR6dmkHyQ67/n5y4E+tiHc8hLd4L1TKcMNgpeyuLqEdUw/ornV
 vnhDsxm4abKhI0Tc/axnDMv4aYm2ZFv/DAU2MCk/SI0fEcCS0MkzZpPKga93ApVhuf9Cv
 ONAoxjp3riyWvafTprWjvKJ1JXYDXf+0rudJxSSqY4W31FMxYlyS7fbtSLgtsEBAiOenD
 F5G6vl8Sxig/KaM281/yUxxunoQshiM6CAPT6Z6KbA7cjnSNynLivuUaxW4IiJ7lSzgun
 CxsUnHO6+/7FPI1voB2ktO+SlH2lVkCOUa5UpX1h6ILsUKzE7rTNYE+bi/DpFKG628g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792871463;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=z1E0eFPamD1jwR971BRQlvTp29vxkZFhQ/t/YAwI8E8=;
 b=G263Ub+JamsODufZmhk1NHRZKtUP8JXauxsBe3fn/onIhQCWBSbG/sO8dNe063WZ5fTT
 cAM6pIcnTCgs0o5oeM0yOjBp+ZT2RDzEA0mxMsXGymjaF3iqQ/19uH/4j4TrtJzpFZYlz
 ZHupIIIAWHfBq/RQUPAMYmjcFsSrwABn8F5CcRG3TwfHeFEB4mN+tD6pvcUOu685aVhar
 di9GcDN75W5P1tDq/3JjBlTSt0aBqPeuTZfehW+GCzvO98D8ghgNC5t2gq8iCQ/9yjn/O
 THeay+s3ja4IIuTi+m5bCXddHU9YEFj4mNTBRqMWX5RMJVpjarvGPqiqrwGouY3vpNg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=k6hBQnKO; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB36D406A8
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:51:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4350DB97A652; Sat, 24 Oct 2026 21:51:00 +0200 (CEST)
Message-ID: <6918de1f-22ed-419a-b706-c4b253ccfa35@rnout.be>
Date: Sat, 24 Oct 2026 21:50:58 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Quentin Schulz <quentin.schulz@cherry.de>
References: <baaef26b-36cb-4c0f-8b90-32fca12548f5@gmx.de>
 <20261012183436.83398-1-thomas.perale@mind.be>
 <1e670090-2e09-465e-b7d6-317b7d46881b@rnout.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <1e670090-2e09-465e-b7d6-317b7d46881b@rnout.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v5 2/2] utils/generate-cyclonedx: include
 external tree information
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgpPbiAyNC8xMC8yMDI2IDIxOjM5LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB2aWEgYnVpbGRyb290
IHdyb3RlOgo+ICDCoEhpIGFsbCwKCj4gIMKgSSBkb24ndCBoYXZlIGEgc29sdXRpb24gdW5mb3J0
dW5hdGVseS4uLgogIEFjdHVhbGx5IEkgZm91bmQgc29tZXRoaW5nOiBjb21wb3NpdGlvbnMgWzFd
LiBJdCdzIG5vdCBfZXhhY3RseV8gd2hhdCB3ZSBuZWVkIAotIEkgdGhpbmsgaXQncyBtb3JlIGZv
ciB0cmFja2luZyB2ZW5kb3JlZCBwYWNrYWdlcy4gQnV0IGl0J3MgYmV0dGVyIHRoYW4gdGhlIAph
bHRlcm5hdGl2ZXMgSSB0aGluay4KCiAgUmVnYXJkcywKICBBcm5vdXQKClsxXSBodHRwczovL2N5
Y2xvbmVkeC5vcmcvZG9jcy8xLjcvanNvbi8jY29tcG9zaXRpb25zX2l0ZW1zX2Fzc2VtYmxpZXMK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
