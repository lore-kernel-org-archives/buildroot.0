Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848B3606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 08:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PLf63BHX
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 382EA60714;
	Mon, 26 Oct 2026 08:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nXl_IoFWbZ_x; Mon, 26 Oct 2026 08:23:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 03196606CE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793003010;
	b=g2iOs43fVnufevwyfD/IACqFe+94HWQWNhCUpFSbzLI8rH2ak904uNCtjsIghrOiGbL8
	 1YyyUFBD1KZTl2AR42915tUHJXDGUKXT5LSkvenUakD2t5SSAu07bRhZyK/ZWyPHW3Yxo
	 HYOv2skKPyQyBQEcOBtmuA99AYWcrAOCCVA+g0TOs7RSCOS0yzOcg9IcbW6lsxvDuwT78
	 HQ91oDWreGIV7wZIHNmN1WhJ40lNyRYeUBTU92ImodmqyMKDKljgYaz+kqDTccyCki0ST
	 yvg/HQ0Xtmy1ZvHWNe0huzyA+LWR5eCQVQAGk/B8DAZ69cnOvlrcAOeFsoAcYgZEu1g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793003010;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=3NAXuEZMoaoXK+2Jh/OAlctk7vjKyfDJbCZeuXdYNmM=;
	b=nWs6Tz42JEDdYHjeoNVG6Q4VQG9YwvMhKGYnGBOOATn3OI+ns9mx0ubnDchuBe2xDg9M
	 y9XmQslOh5o+CbE4esKq+XIy4kkHk20PuvKzsp1h55KMnvjdrVLodgode6eOwX8mLMW5i
	 U6G4Ctz033A5Bwly1zBfKX2DKHMjiJdXrPzWGoMLuP/Z56AIK1yJR+v1U96bwqOFCvuf2
	 k97ORSpke+6ImkPc1TPiCf1donVOOpM6MFpgzDcNe2TMGbab5srLx05R2FSiX9HmdrJ/r
	 oJlQk8x21mWeljKM7IZ53tO/uVfCi/HVgKoKNnPGceIZTJ+WGdzjMOyveSwdDw3mOPQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793003010;
	bh=3NAXuEZMoaoXK+2Jh/OAlctk7vjKyfDJbCZeuXdYNmM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PLf63BHXXGIzz4/5ZAVmPIsOp4vLR3u118rboW0vBs7+BmVL0OW03Hb/kHRRkg+lJ
	 XUjklGbSGqrOMY4ROFSuxuh6ZvyMeazXtN5tKt9GiEZOkateBQrPfDD8Ia+/+nFWqT
	 pXDvzSrSiFh4hzoF+gJUvd+BhVrU1+Vp63rX4n9Fq4TyAxHXFuEfkclDezMekoBo/F
	 JcMRkxpt9/XgU88311b7XOOBHS7Bc6Ixw+INMiTBrkH+e+S9Iy9OJCcj+/PL/hKOBc
	 VnYoStxrCtt3EFZOq05LeRHvZAyoNB7RJ04WrhkvzA1a18L6Kpy6ioeZti4PpMiqdL
	 QcXgvGG43C09w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03196606CE;
	Mon, 26 Oct 2026 08:23:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FB38235
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 08:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51A3A405E3
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 08:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gzVxStrGNz45 for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 08:23:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 61F3E405DF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793003008;
 b=ZDktJGIjLXVuvZLn1ka1WnsElkqmsafOZiIE5d14gVf8A8macKm6Tu6U+i6U10mq119M
 8khlSXSuJMDNiQecBQI5VIrRgitsb68aYw2siTfvo8KmxEB6327p4C7cxsvCoILKjPAds
 lmG/iwv4p45+OxFNfZfKlDO+s01baAxm3bRJsv8kDJENL9WqAI74gxuZ68hdVD5jwVCFF
 MshWVSFLQQWdyo071TEg1FEiQbWon7mRAQrI8F0CpcWevunp3S67FAT006OqhPrhKm+sB
 DRljpYy/N5XKRrqtS9Ua7KwzTMNy89rC4EQ27UWpeKJ7g/cKzTsFK1GEUsY6sxctf6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793003008;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=SsPoE9Vi6BnP30HKc/BE/B+c651FXUFb/QTE50Vq3rk=;
 b=cTdghOUiTp91tsPcmNJ7gIxwQWNLIzkw2yHnhZmplcWeF6v2BaDS8uzl3h3ObRJJJkQW
 4MIjtd8F2QmOppydWYZhc/ISChFsSrn7m4HjTt0Nd0wBVJCcwN91pWThmArinuhX70Sad
 fUsJaM8FlRUu1gy+qHcsAjCxPvu5zxsKj7kGdAQywPOMBXP6g9/41wo+ggulhlLutY8mS
 dFSdFEEwRyCxukgJtkQKr2b5qxefIq/RMy4NX5ge5IlU50Vgz33J/kx2BIwadn2o9pRcf
 f0eiVvYQTGtCNgte/pmfEoIC53dmyVuGqSCs8cXB+u+Kr1Rax7/s7ekgDGzTwx6kNpQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=kerqoE20; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61F3E405DF
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 08:23:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B8585B97A739; Mon, 26 Oct 2026 09:23:24 +0100 (CET)
Message-ID: <255e4bd5-e384-4ac9-95fe-1a61f9c3207a@rnout.be>
Date: Mon, 26 Oct 2026 09:23:22 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Quentin Schulz <quentin.schulz@cherry.de>
References: <0e85bd1c-3122-440e-b366-7863384e19f1@gmx.de>
 <20261025111420.79613-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20261025111420.79613-1-thomas.perale@mind.be>
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

CgpPbiAyNS8xMC8yMDI2IDEyOjE0LCBUaG9tYXMgUGVyYWxlIHdyb3RlOgo+IEhlbGxvIEZpb25h
LCBBcm5vdXQsCj4gCj4gSW4gcmVwbHkgb2Y6Cj4+IEFtIDI0LjEwLjI2IHVtIDIxOjUwIHNjaHJp
ZWIgQXJub3V0IFZhbmRlY2FwcGVsbGU6Cj4+Pj4+IE9uIDI0LzEwLzIwMjYgMjE6MzksIEFybm91
dCBWYW5kZWNhcHBlbGxlIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4+Pj4gIMKgwqBIaSBhbGwsCj4+
Pj4+ICDCoMKgSSBkb24ndCBoYXZlIGEgc29sdXRpb24gdW5mb3J0dW5hdGVseS4uLgo+Pgo+PiBU
aGF0J3Mgd2h5IG15IHBhdGNoIHRoYXQgc3RhcnRlZCB0aGlzIGRpc2N1c3Npb24gKGluIGNhc2Ug
dGhlIHRocmVhZCBicm9rZTogWzJdKSBkZWZpbmVzIGEgcHJvcGVydHkgdG8gY2FycnkgdGhhdCBp
bmZvcm1hdGlvbi4gVGhhdCB3YXkgaXQncyB1bmFtYmlndW91cy4gU3VyZSwgZXhpc3RpbmcgQ3lj
bG9uZURYIHRvb2xpbmcgd29uJ3QgdW5kZXJzdGFuZCB0aGF0IG1lYW5pbmcsIGJ1dCBzbyBmYXIg
d2UndmUgbW9zdGx5IGFncmVlZCB0aGVyZSdzIG5vIGV4aXN0aW5nIGVsZW1lbnQgdGhhdCBjb3Jy
ZWN0bHkgY2FycmllcyB0aGUgbWVhbmluZy4KPj4KPj4+ICAgwqBBY3R1YWxseSBJIGZvdW5kIHNv
bWV0aGluZzogY29tcG9zaXRpb25zIFsxXS4gSXQncyBub3QgX2V4YWN0bHlfIHdoYXQgPiB3ZSBu
ZWVkIC0gSSB0aGluayBpdCdzIG1vcmUgZm9yIHRyYWNraW5nIHZlbmRvcmVkIHBhY2thZ2VzLiBC
dXQgaXQncyA+IGJldHRlciB0aGFuIHRoZSBhbHRlcm5hdGl2ZXMgSSB0aGluay4KPj4KPj4gSG93
IHdvdWxkIHRoYXQgbG9vaz8gRnJvbSBsb29raW5nIGF0IHRoZSBzY2hlbWEgSSBjYW4ndCBpbWFn
aW5lIGhvdyB5b3UnZCB1c2UgaXQgdG8gZGVzY3JpYmUgInRoaXMgcGFja2FnZSBjb21lcyBmcm9t
IHRoYXQgZXh0ZXJuYWwgdHJlZSIsIG9yIHRoZSBtZXRhZGF0YSBvZiB0aGUgZXh0ZXJuYWwgdHJl
ZS4KPiAKPiBObyBjb21wb3NpdGlvbiBpcyBmb3Igc29tZXRoaW5nIGVsc2Ugc2VlIFsxXSBzZWN0
aW9uOgo+IAo+IGBFc3RhYmxpc2hpbmcgcmVsYXRpb25zaGlwcyBpbiBDeWNsb25lRFhgCj4gICAg
LT4gYENvbXBvc2l0aW9uIENvbXBsZXRlbmVzcyBhbmQgIktub3duIFVua25vd25zImAKPiAKPiBU
aGlzIHNlY3Rpb24gIlRoaXMgYWxsb3dzIEJPTSBhdXRob3JzIHRvIGRlc2NyaWJlIGhvdyBjb21w
bGV0ZSB0aGUgQk9NIGlzIG9yIGlmCj4gdGhlcmUgYXJlIGNvbXBvbmVudHMgaW4gdGhlIEJPTSB3
aGVyZSBjb21wbGV0ZW5lc3MgaXMgdW5rbm93biBvciBoYXMgYmVlbgo+IHJlZGFjdGVkIi4gU28g
aWYgeW91IGhhdmUgcGFydCBvZiB5b3VyIGJvbSB3aGVyZSB0aGUgZGVwZW5kZW5jaWVzIGFyZSB1
bmtub3duCj4geW91IGNvdWxkIHVzZSB0aGlzIHNlY3Rpb24gdG8gZG9jdW1lbnQgaXQgaWYgSSB1
bmRlcnN0YW5kIGNvcnJlY3RseS4KICBJbiB0aGF0IGNhc2UgdGhlcmUgaXNuJ3QgYW55dGhpbmcg
dGhhdCBmaXRzLiBJIHRoaW5rIHRoZSBjdXN0b20gcHJvcGVydGllcyBhcmUgCmJldHRlciB0aGFu
IGFidXNpbmcgZGVwZW5kZW5jaWVzIGluIHRoYXQgY2FzZS4KCgogIFJlZ2FyZHMsCiAgQXJub3V0
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
