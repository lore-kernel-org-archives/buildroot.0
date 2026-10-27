Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9B8606A31E
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 20:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RXwQw7nK
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF446406CD;
	Tue, 27 Oct 2026 20:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VvZBnXu1McxM; Tue, 27 Oct 2026 20:33:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9973F405E6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793133195;
	b=PYHL6SopCFHmrr6gBRr/XU0Bzw7RSuAYxxRW9qI8sV9pCxehlwve1r+iLNRNPn1gh7c3
	 8ZCSEP0Sa7NBfVgCWeCDjmhQR2JBA29tO1nJwvs0Epa+SqBDEG4j2G30DuTyj1v6gWIFj
	 VcO3GOcSpDeUNUOfUPe6AhMqOb0pzHFfd7LXZ73MzgFEOE/W+CxAK/0CR5qTj/toqmYLq
	 m/9YzTnJ4+/vGWK11PUteCaHXq17ed0k4a6cUSUc/qKf23ksZuTKMoxZ4Hoy2aXdKI9M/
	 2Ps+qfSWIZfcTqG+g20OCBhGXsJEMUMLe9HEGCsCwBX7tOHP7Lk7WtB6mW/v50QSYbQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793133195;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=PMHPO5nvM3yxFSJDHtiLGGx3XrO6RZ+Dx/7DKt3y3UU=;
	b=dNAj77/JtxhpY7JpfEWNzd98AhImLWydKUekHmTBqg4NiSQBoKxNkRXp8X+vzw5heG3A
	 7Y0vMddu89Sqnp9/7FBY2Uaz45SwhHTp+IX2qRvoWsyLS4uzMHjSZnRPoQEmqaU5TebZx
	 4S5IZ0VBwnGOcqdGqBizNzMEIQ/hf0U6CXpu5TUBNu4i4NoDTa+FYvY2U9NwubNtntroD
	 xlIbnPF0+s4t5T1DZr/2CIpIl6keRlGId/H0Iavpj7WjI8ZuNOvw0TKpnuN3QaXE5MrKJ
	 88f/JCbV+8nbNKEHpyQvH7aN3/J2DtlRxcnp4Sh8CDsXcFZLHxtP9uBGOX+ln0G88gg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793133195;
	bh=PMHPO5nvM3yxFSJDHtiLGGx3XrO6RZ+Dx/7DKt3y3UU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RXwQw7nK2XmP+dRE0vQ6HprgcumGlev5PevtL/McK7XyTP29sYAld5qqkfMKTCbNY
	 5QGuw5SNLof7UN/1RbYjHb6nVnsvRMfDTjajS7R7o8hJhtk3nWiFOj9QcmAh7I2MRk
	 igyfUCaBqfeIDskJ6jY0yTO61QZydwHa2v4nVdZ1xqMtSbq6YZaEyHfSeILpVoBmN/
	 Q7epTiq8WhfDRKvKfDjvJJ/XC8MRTKqFnE+Z7UDlFsTHKoY8iQMPXQ/cNUZ+rXb5rW
	 eqlsshBgvNdeWlGKRwgdmNw/DbXCZiSA5WlVrFsJ/V/Ti+zi3NfjEoC2HCD5XymCa6
	 SrWYkiwGn1kfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9973F405E6;
	Tue, 27 Oct 2026 20:33:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F9A2729
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7066760681
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCBlyPA3xrYM for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 20:33:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4BFC860653
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793133193;
 b=UqEeylHuA56anbIgtrYU7L7+3nco7SBRh3XEjfi2mhYIYl/yXA3NTJs8wERlD3p88g3t
 1UxzuQAA3GonfrQsO8Y7gf78VfCYneExkvgeZh6c2AQWVuyqeV7Ij/ZtbOSu+tL1rB+Ss
 C/pGwOG2RpsidzWeeCSOatVhPlhYP21HBEgp/Yv/qOLDJ5QJA0Oq+VKaTP9ASewJcAZpl
 E2IZzSLYr7DYrTcVo0I+dsfWT7R7aNzkqS1xPwH+a74L7isoX3r5vps/pSwEtetks/oi4
 /Cyyp/t75M720YozE7wnYHHEs9xkaGZkK6Riky2QdfySbiboX3Q7DE6XjweJH/smBmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793133193;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=WGTy+zlWtpwDQ8C5S5kqlaEjcKn+K055jpEwBGgVLXI=;
 b=O4g1nGaxQ6yU1Hc5DoX/ENjotjqK6SfUAjT8no51JqtV3Uu8CaXuFmZgC4dTthzt8To8
 ghAEj3pqijz34/8HhSzUkylUpg+7rl43eW2nh7qSG446iONfP+IAdJbcORE6avE7nEYYI
 imQHC05PJowEEG8mYDDalQdwoDUNyrJOam1skYwz4SOBlQMhBHkRMKTDGLfkllYYx8xNL
 UrIsCsqbYrbsLU/r8jzZurcV5JLXtQ3hf8c3bcsd+U2H6wmkAeALGfdug1H9Fc+8tIfdh
 u/zkcdRLTufu5eH35an0TGPaAAFlbwkpvSHvwOMAblZlqwqBqkoVsgaoSCWB5H4spNw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=btU5e5xq; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BFC860653
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:33:10 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkHMZ-1wfta61Pkf-00cwf0; Tue, 27
 Oct 2026 21:32:59 +0100
Message-ID: <d32b0f06-9105-4ee5-99ef-84a6fdda0e41@gmx.de>
Date: Tue, 27 Oct 2026 21:32:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>, buildroot@buildroot.org,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jezz@sysmic.org>, Bernd Kuhls <bernd@kuhls.net>,
 Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <at0YSHfI0gcUfMtX@windsurf>
 <fceb1e19-e9d3-4342-b1c3-d10e175dc47d@broadcom.com>
 <auCcCZK-kGH25_uM@windsurf> <092b4771-dc93-49eb-9803-ccfcf9ccea2b@rnout.be>
 <8605bc8e-8711-4764-8262-f37a1f32adeb@broadcom.com>
 <auD5d-yrritLxAfN@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <auD5d-yrritLxAfN@windsurf>
X-Provags-ID: V03:K1:OlHd5qOuw9+JQlzaFP8zTuMWbBHqwZLWK0OL4vysIBqMg6AsfgO
 se/OgrHk2eJsx+G2tbqIP7Ij38rxuRCxDoNQVNW0kT2R1QL89ofZvwX1Bb8+nkfurKVpUP9
 ykgcjGliqtkQNimcTJNtYn6uvvPJA99SUK+UO741ccacWQXiea54WRAmJS+IoSxKARaWAJ7
 wR2qHXNHqgxksWFsERKmQ==
UI-OutboundReport: notjunk:1;M01:P0:LcL92BoqKYU=;/QKqxTanH/t/UTA8LsA4g6GF0Hs
 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
Subject: Re: [Buildroot] [PATCH 00/23] Support building the Linux kernel out
 of tree with LINUX_OVERRIDE_SRCDIR
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

QW0gMjcuMTAuMjYgdW0gMjA6MjIgc2NocmllYiBUaG9tYXMgUGV0YXp6b25pIHZpYSBidWlsZHJv
b3Q6Cj4gT24gVHVlLCBPY3QgMjcsIDIwMjYgYXQgMDk6NTM6MDdBTSAtMDcwMCwgRmxvcmlhbiBG
YWluZWxsaSB3cm90ZToKPiAKPj4+ICAgwqBUaGUgb25seSBpbmNvbnNpc3RlbmN5IHRoYXQgRk9P
X1NVUFBPUlRTX09VVF9PRl9UUkVFIGlzIG9ubHkgdXNlZCBpZgo+Pj4gRk9PX09WRVJSSURFX1NS
Q0RJUiBpcyBhbHNvIHNldCwgbm90IGZvciAibm9ybWFsIiBidWlsZHMuCj4+Cj4+IFRoYXQgaXMg
YSBnb29kIHBvaW50LCBGT09fU1VQUE9SVFNfT1VUX09GX1RSRUUgaXMgY2FwYWJpbGl0eSBiZWlu
Zwo+PiBhZHZlcnRpc2VkLCBpdCBzaG91bGQgYmUgdW5jb25kaXRpb25hbC4KPj4KPj4gSXMgdGhl
IGRpcmVjdGlvbiB3ZSB3YW50IHRvIGJlIHB1dHRpbmcgdGhlIHNvdXJjZXMgaW4gYSBzZXBhcmF0
ZSBkaXJlY3RvcnkKPj4gYWxsIG9mIHRoZSB0aW1lPwo+IAo+IFRoYXQgd2FzIHRoZSBkaXJlY3Rp
b24gSSBpbml0aWFsbHkgd2FudGVkIHRvIHRha2Ugd2l0aCB0aGlzCj4gb3V0LW9mLXRyZWUgYnVp
bGQgd29yay4gSSdtIG5vdCBzYXlpbmcgd2UgbXVzdCBhYnNvbHV0ZWx5IHN0aWNrIHRvCj4gdGhp
cyBpbml0aWFsIGRpcmVjdGlvbiwganVzdCBzdGF0aW5nIHdoYXQgbXkgaW5pdGlhbCBpbnRlbnRp
b24gd2FzLgo+IAo+IEkgcmVhbGx5IGxpa2Ugd2hlbiB0aGluZ3MgYXJlIGNvbnNpc3RlbnQsIGFu
ZCBzbyBmb3IgbWUgdGhpcwo+IG91dC1vZi10cmVlIHRoaW5nIGhhZCB0byBiZSBhbiBhbGwgb3Ig
bm90aGluZyB0aGluZy4gQnV0IG1heWJlIEknbSB0b28KPiBwc3ljaG9yaWdpZCA6LSkKSSBsaWtl
IGNvbnNpc3RlbmN5IHRvbywgYnV0IGFsc28gcmVhbCBwYWNrYWdlcyBhcmUgYSBtZXNzLiBBcyB5
b3Uga25vdyAKSSd2ZSBiZWVuIHdvcmtpbmcgb24gcGFja2FnZS9kcmFjdXQgbGF0ZWx5LiBJdCdz
IGJ1aWx0IGFzIAoiaG9zdC1hdXRvdG9vbHMtcGFja2FnZSIuIEF1dG90b29scyBoYXMgb3V0LW9m
LXRyZWUgYnVpbGQgc3VwcG9ydCAoaXQncyAKYmVlbiBhIHdoaWxlIHNpbmNlIEkgdGVzdGVkIHRo
YXQsIGJ1dCBpdCB3b3JrZWQgd2VsbCkuIEV4Y2VwdOKApiBEcmFjdXQgCmlzbid0IGFjdHVhbGx5
IGFuIGF1dG90b29scyBwYWNrYWdlLiBKdXN0IGNsb3NlIGVub3VnaCB0aGF0IGl0IG1vc3RseSAK
d29ya3MgdGhhdCB3YXkgKGkuZS4gaXQgaGFzIGEgLi9jb25maWd1cmUgc2NyaXB0OyBidXQgaXQg
ZG9lc24ndCAKcHJlc2VydmUgYWxsIHRoZSBmbGFncywgc2VlIDQ1YWNiMjgxY2FhOWZhMzA3OTk0
MjZiYTdlZjQ2OTRjMGI2MWZhODUgCiJwYWNrYWdlL2RyYWN1dDogcGFzcyBIT1NUX0NPTkZJR1VS
RV9PUFRTIHRvIG1ha2UiKS4KCkkgZmVhciB3ZSBtaWdodCBzdHVtYmxlIHVwb24gbW9yZSBvZiB0
aGF0IGtpbmQgaWYgd2UgdHJ5IHRvIG1ha2UgYWxsIAphdXRvdG9vbHMgcGFja2FnZXMgYnVpbGQg
b3V0IG9mIHRyZWUsIHdoZXRoZXIgIm5vdCBhY3R1YWxseSBhdXRvdG9vbHMiIApvciAiYXV0b3Rv
b2xzIHdpdGggd2VpcmQgY3VzdG9tIGhhY2tzIi4gRG9lc24ndCBtZWFuIEknbSBmdW5kYW1lbnRh
bGx5IAphZ2FpbnN0IHRyeWluZywgYnV0IHdlIG5lZWQgdG8gYmUgcHJlcGFyZWQgZm9yIGlzc3Vl
cyBsaWtlIHRoYXQuIElmIHlvdSAKZG9uJ3QgbGlrZSBtYWtpbmcgaXQgb3B0LWluLCBtYXliZSBv
cHQtb3V0IHNvIHRoZXJlIGlzIGEgcXVpY2sgZml4IGZvciAKdHJvdWJsZXNvbWUgcGFja2FnZXM/
IEV4Y2VwdCBmb3IgImdlbmVyaWMiLCBpcm9uaWNhbGx5LiBJIGRvbid0IHNlZSBhbnkgCmdlbmVy
aWMgc29sdXRpb24gdGhlcmUuCgpCZXN0IHJlZ2FyZHMsCkZpb25hCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
