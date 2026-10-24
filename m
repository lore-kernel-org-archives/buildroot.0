Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5503606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 20:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EIM29bO5
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68CF88119F;
	Sat, 24 Oct 2026 20:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emoAHo7wL5us; Sat, 24 Oct 2026 20:42:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7467481195
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792874521;
	b=JSkajZObrCdFKeNHzyzAtbAym8W64ekRlWn+0c8nMjczhPHF+wSeBPehswcNyWsQZfi8
	 OCx20l9uOiEW/e/s3SI5mvvokHyum7YeSAfv/azKThCCoYMjamSn6AXobUzcoeg0v+vkH
	 aNsaFzxauMnOaUzLMtwemdZ7KFGEmD9kKokNY53xX3PnFvqrtedRUIqE4J0XErk2ODLL8
	 oNad5X6vx6vDMzNQQAIYJRqZEf1w3GOus575qDfLx3afoRt4SJFdcXtiRBA/tFHtD4Ivi
	 nNN7jHsGcpCitVjuA8eiahENXzUmtMkLBsGzfYRLdILA21Lx/5TdqM0jMAa2leM6wmA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792874521;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SipN2m/3TemvBfomoUUkRpaF7pSzU4zp1EUMM3BQcu0=;
	b=Rt1T7WnL33vGM+jL+9uoPbi1P681nDJ8xX5YUxGUuZF6xpRYLDq+/2rftQOkAcsKEhgK
	 8m9OgU8DDzRJRf0N+oVU11iO8tcN6cXnBSPKK4z/kHxZAb+ZVNW7u1mNyPvAAnDe1eljn
	 I4oRpP5BDi6QlKJHnrnOwkm7ozjhxwDTW4EYL/1llcX2IpnOzd/k1o/FrPtPrCI/dPwXY
	 uhpnRSbO9jyzlA5DVlyeDNVNADgvr1QADHDI+8qVDoEaS/ljMQvhJmhydhYkk/qvtB4h5
	 KAmNaP46RdD7ZWRMrawXglR71oFu4yxcC+xhx+XGMWz9AL3jhye8+1I5T+r0WNDXKRw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792874521;
	bh=SipN2m/3TemvBfomoUUkRpaF7pSzU4zp1EUMM3BQcu0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EIM29bO5Klvw7+ybpdUb5RdzXXLH4eqsMC98xtB3SaWPIAqdbtpiW+B8tJsc24qLe
	 o4lYUhVL+JD8vqVShQ0yn/LTG3JLmJUPVrqGILTW1pmoIRtOdmArlDiktV4TYHH64L
	 X8AOPOgFrQzrC7ZxDN8rsL4gk5aVM8ci/FSWsLjykOB0motMgTydYV4WUbdAolaDev
	 8BDL0FjCdr2hvgMG0HFxEW5u9m88Qn3oZ2oaaLSFQnrplZW4xVkEqO2Y1ICTQabT6Q
	 fbIRJY8JM4OR+7Cp5omG8aeM2Kfcgz88re7qSOWNtZiewgAnDvoRC4uhivy0OAlw8L
	 RvknsqZYz1+6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7467481195;
	Sat, 24 Oct 2026 20:42:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D00CC380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C19B0406DD
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5at1OmKQEBJ for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 20:41:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 42C53406DA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792874518;
 b=Ds2LbMRilBzGsjN9a3M+WDDuB7heA/Nvdol1WKVDRtzjgqv9Y6/Kcki85fj39swgnTEF
 a3yFlzhTuEf1kVnb7yDlG6cUZkrB9feeffH0HBU7e4DzLQ3PMSrzoKZr9xSndqlc0omoh
 Tux5grCgSPkDa8Ra8kJnuOVf12kteaJ9cBfhkSm+Rj5CIwyR+fDCay0UO0ofLSmeIHTkm
 PAynDz522RmkZUxCXYFmo3ZZNTR2hr7nzgXTaE9UNYme7mbjFvJJ43UpVzPrf/tFws3d1
 gN6azlROHA4bt8gCJ/WM56vhloBKIi2IoHnyViq3qe1TFqqJ44qVc+O/DA0Q4z3OByg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792874518;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=vX7JFuK/3bHlNTGWI7yo1qSGutmRW0fCOtPwqu6sR1U=;
 b=XJI7DphtXVVKOW77Be3agk6ZrVCCoiZhlhHavrPmSbm9pZEMR192IhSP4cuNnzyfLBLd
 zavdT0U+dtP7kt+W5XizsehoiAIDeX0UI1Ge2AOzJV7AoDFC73sQUNpJZb2m8LJ4FK95N
 qvo38Up33ZZpX7JVNJ3U8JgwYgKDkAgWtNwQNGHgspIQYmMdEMIl5txQg4bYbkjvP/NBO
 U+V4iC1wiWkzbg8gpXuHnqs4t2OhBgvFC+YvY1IkNbsxMqlrgutUgP0itaEAgfk+ZEPT5
 qU/wqevHPLxZqNUTbkQvpFKmGfEL7og/8qflphCcXTawEs9p7dTvybFpNs1z47ma75w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=DrYcBqVo; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42C53406DA
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:41:57 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7b6b-1xCisQ3193-009i2P; Sat, 24
 Oct 2026 22:41:55 +0200
Message-ID: <0e85bd1c-3122-440e-b366-7863384e19f1@gmx.de>
Date: Sat, 24 Oct 2026 22:41:54 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@rnout.be>,
 Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Quentin Schulz <quentin.schulz@cherry.de>
References: <baaef26b-36cb-4c0f-8b90-32fca12548f5@gmx.de>
 <20261012183436.83398-1-thomas.perale@mind.be>
 <1e670090-2e09-465e-b7d6-317b7d46881b@rnout.be>
 <6918de1f-22ed-419a-b706-c4b253ccfa35@rnout.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <6918de1f-22ed-419a-b706-c4b253ccfa35@rnout.be>
X-Provags-ID: V03:K1:K8mvf0rjvkkU49MATAYOc5DRDES/ml/nxmcfDSZwza8KYc1ke4s
 Lb4HInwqznMw28guIDL5oCDtlP6iicmx9pHh/RpRfE5mj+KWFJlO+/2aa/5LNsWbueLvTY0
 q8qLCeL+j3AQN3fj+2YRdLujUcLWqjuXZY/PjAlzlaYeI3fg5DuzG4xgerjeBDdRbpd733n
 nNBR7zSapchuxJO2HeTtw==
UI-OutboundReport: notjunk:1;M01:P0:eHQVP3FHvfY=;zMb2Wd8eytO+uv8VaqgGmIn7jdn
 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
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QW0gMjQuMTAuMjYgdW0gMjE6NTAgc2NocmllYiBBcm5vdXQgVmFuZGVjYXBwZWxsZToKPiAKPiAK
PiBPbiAyNC8xMC8yMDI2IDIxOjM5LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB2aWEgYnVpbGRyb290
IHdyb3RlOgo+PiDCoMKgSGkgYWxsLAo+IAo+PiDCoMKgSSBkb24ndCBoYXZlIGEgc29sdXRpb24g
dW5mb3J0dW5hdGVseS4uLgoKVGhhdCdzIHdoeSBteSBwYXRjaCB0aGF0IHN0YXJ0ZWQgdGhpcyBk
aXNjdXNzaW9uIChpbiBjYXNlIHRoZSB0aHJlYWQgCmJyb2tlOiBbMl0pIGRlZmluZXMgYSBwcm9w
ZXJ0eSB0byBjYXJyeSB0aGF0IGluZm9ybWF0aW9uLiBUaGF0IHdheSBpdCdzIAp1bmFtYmlndW91
cy4gU3VyZSwgZXhpc3RpbmcgQ3ljbG9uZURYIHRvb2xpbmcgd29uJ3QgdW5kZXJzdGFuZCB0aGF0
IAptZWFuaW5nLCBidXQgc28gZmFyIHdlJ3ZlIG1vc3RseSBhZ3JlZWQgdGhlcmUncyBubyBleGlz
dGluZyBlbGVtZW50IHRoYXQgCmNvcnJlY3RseSBjYXJyaWVzIHRoZSBtZWFuaW5nLgoKPiAgwqBB
Y3R1YWxseSBJIGZvdW5kIHNvbWV0aGluZzogY29tcG9zaXRpb25zIFsxXS4gSXQncyBub3QgX2V4
YWN0bHlfIHdoYXQgCj4gd2UgbmVlZCAtIEkgdGhpbmsgaXQncyBtb3JlIGZvciB0cmFja2luZyB2
ZW5kb3JlZCBwYWNrYWdlcy4gQnV0IGl0J3MgCj4gYmV0dGVyIHRoYW4gdGhlIGFsdGVybmF0aXZl
cyBJIHRoaW5rLgoKSG93IHdvdWxkIHRoYXQgbG9vaz8gRnJvbSBsb29raW5nIGF0IHRoZSBzY2hl
bWEgSSBjYW4ndCBpbWFnaW5lIGhvdyAKeW91J2QgdXNlIGl0IHRvIGRlc2NyaWJlICJ0aGlzIHBh
Y2thZ2UgY29tZXMgZnJvbSB0aGF0IGV4dGVybmFsIHRyZWUiLCAKb3IgdGhlIG1ldGFkYXRhIG9m
IHRoZSBleHRlcm5hbCB0cmVlLgoKQmVzdCByZWdhcmRzLApGaW9uYQoKWzJdIApodHRwczovL3Bh
dGNod29yay5idWlsZHJvb3Qub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjYxMDExMjAz
MjMwLjIwNzIxMjctMy1maW9uYS5rbHV0ZUBnbXguZGUvCgo+ICDCoFJlZ2FyZHMsCj4gIMKgQXJu
b3V0Cj4gCj4gWzFdIGh0dHBzOi8vY3ljbG9uZWR4Lm9yZy9kb2NzLzEuNy9qc29uLyNjb21wb3Np
dGlvbnNfaXRlbXNfYXNzZW1ibGllcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
