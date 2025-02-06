Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA3AC02199
	for <buildroot@archiver.kernel.org>; Thu,  6 Feb 2025 19:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37014606B4;
	Thu,  6 Feb 2025 19:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JUYlnnCK5_2G; Thu,  6 Feb 2025 19:31:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D0FF6FB0C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D0FF6FB0C;
	Thu,  6 Feb 2025 19:31:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4ECEE2
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 19:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8D1E8477B
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 19:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HO0EsNTQaRer for <buildroot@buildroot.org>;
 Thu,  6 Feb 2025 19:31:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4643884769
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4643884769
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4643884769
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 19:31:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.166.127.53] ([176.5.54.127]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwwZd-1tVbzT1AVv-00rI8I; Thu, 06
 Feb 2025 20:31:32 +0100
Message-ID: <9524fc48-d637-42f9-bce1-29f0df5099a4@gmx.de>
Date: Thu, 6 Feb 2025 20:31:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Stewart <christian@aperture.us>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart via buildroot <buildroot@buildroot.org>,
 Anisse Astier <anisse@astier.eu>
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
 <20240805223152.09ed915b@windsurf>
 <CADvTj4o_CnzCth+QqoxhVovBRinvYfbMf7r+SWnnY0tfVbKgbw@mail.gmail.com>
 <CA+h8R2obsR-CzMhWDpQ-A0oeEPaG-P=aCwF7BS4J-3eShmHJgg@mail.gmail.com>
 <20240806165050.234235b4@windsurf>
 <CADvTj4pOK8-2YXy0POUg1qOKa1MrjsxbnS-r1F7YMk_YXFmEAQ@mail.gmail.com>
 <CA+h8R2reErtSWPO1hGpX7tT5Xejb_SNqiuSCnXvJZKHwhzdcZg@mail.gmail.com>
 <CA+h8R2oJWZw_S08XXhjE--_So0UJohVLWSoj30PpR9z66x8U1A@mail.gmail.com>
 <CADvTj4r5ZAFkyqMctj4fV=vnkqDn2g+oG3g2PjTHJKSkVLQNVQ@mail.gmail.com>
 <CA+h8R2pup4sse2R-6oMV0=uKL6WyV3o6fyerQeYopv57ZJWCVA@mail.gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <CA+h8R2pup4sse2R-6oMV0=uKL6WyV3o6fyerQeYopv57ZJWCVA@mail.gmail.com>
X-Provags-ID: V03:K1:VhkkbYqT+iZrMnPVP2eTCTC+T6cFJaOjDhqbT0Q2xupajdvzgCB
 gCNNNsrtN/M6P3Qmgc3tN29EYGIWBFbWZso7wvqpHsXaS/w5A1o+GRWXs+44ITCUki2SW8y
 yrnTSiuECaZuqpGmkn/iS7PO2WN3zIdgXey7baDGHpZdo8Zfi17I9CJfe+VOop5qWie3m0e
 KbPX4hvY04/XSwfy89KCg==
UI-OutboundReport: notjunk:1;M01:P0:OgtHSxBKAV4=;6WQ0rdGc8mxTBktp4hYrKf9YmOA
 V57Co3AHBsRR5m+7hfUjLTlCzUSb56IQVAlmKoJeUAuoMAJEVk+nZqhDefnNwfWmy4XOHrMDF
 +sDYmPyEGnyoqHgShD11FRXtccveEv2RCtfdKHPp0Q9d60J8X2zmyM8cR4HV5L6+70ZTEUSjr
 IybVJ0HaemE1vHUMo6SMfZgHx29DGq5duL9QydQYvH3UmN+k+xtC/J0r1MJz3pFCCQT01sGeT
 AGuAJqkxbjm46lXwamhmnBPFbLWFfiewzVQCAXtIZRsUh7R8Qi3fQkQIFSmuW58+aQ38p3Jln
 Q/4l67i4kaeM21wI/44c/SRW8LTxDqduonm3OpD63UjgHh8ar+Lh38hPvNiiIlko1/tggxiyI
 7mgD2bnP8FNVn+JZKqQoQ5iVjWNFNENLeMnwicXyMthrmFhUcUN2+QCt6b+qNMmGZKbd89iee
 xQxFzItHX5/3LxZvg6f9xDDxvoFitbXr3DFXbcvNMEdK9WINt0vmKIDqC9mK+7mEHHrCrfOQf
 7E3BpuPawlE8taUTG4oNgk5t1ZIS+a2gDoMnvRaaa6KrgxeiqvulYvPhrsXaDPbxWoGeweA9A
 1VqZxBYTURd0lUNbmo6YstoHlqCF0YNHZ5ODe+P7W5soh/pwjyi7Yn4vHamabNtF4FK8KL8X6
 pcunwvCNZ/HY1bj2ZI8NeaDqvhRp9Ja4f3a0ZKvNv3ETzQGyWIjbm0pijICsakx+FKwr0sjG8
 IhS0FKsBETlXA1kb8tvL5gjYJTGf6akIua5+DBITC0gFtxkf90onA8qwKFUMU2KHP3YyfrIqH
 VpExdvZDysF2SMBl6ADYGyvL+55BjtJkLbYVJFEEFAYgkVuanZNle6CtnIRCvmCLtjpNuFeQg
 xOrfMETzYhYZ8ZLSgIXmLeW1/nkHg5qmiY7Ru8CUiGJg4cpahUwIKY9zB1EUrtmJqLVLjo05l
 jGv/wan2/oHfZJIfPW7yZUKl1uEK/r0QZzGTTPLojaBBG0Xi6vWBQKI30WZ9BlEyLRDyvLJr2
 poBnV4l3kN4pdlevJpJkw5N91nbBItuMs7OeMPtmJCZRQtPUb2UH6mp50mhFHFkBBZKbJIwmO
 u6Ov28yVLIQ0AylwaLV8huViiNtRUWangGDFJ+PJXXKNFLLdcB9/aCumBTdaebPiLjnQ1BGwc
 JIUvJWbcMq/C6LLIZdsBC1/1UqD95DswlS5SOHTtJG1qlTcbhgHyUyL9Jp5TUW/0uh4PU8DE3
 6o+gemIPS0JWXB2YSKUGXSMNABDaAVPhs2AesEbuPtMkoZfZLd/tPEWUBhgMekhrjz4DDADQ4
 zKysbomXMQCc4A+y6F8VBR1jt8eurkk62/iJosPuhqK7CREzxfnBetV1FQBNSMf1pxl8knXmv
 MTBVtKPunPQaPy8GUPm3KDrSz92z6Uu69LaphzFab5aw13fTYXdT87DPoRJr/WzRHyyFRfbtW
 rgfMKeVrxfOByh4cjs8F5T1U5l3Xq9IlgWrMUqvNlnkXFwgbS
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738870292; x=1739475092; i=fiona.klute@gmx.de;
 bh=QlJWVQNOIlxjqjSuRvLl8bBl0ojAwrlcbqP2HcZ5Ue8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=I0uWcWtwV/fpTfDEQSDwofloQh0IK6+/SNb0N/yZ+hTKpu3s8dS3ejT9jzRQKlD9
 4rW3+w5aOGT2T7i4Y6tOWAU/N/KuLopGcXxf00VCQEZrlLUjxyi9AHLUvJriUQFgv
 GnqwAQRMSozmnvyzUsdEa0vy/Xfz6QrrXpUegW4UlzhYisNgcEVuefjgivZoBLEEB
 f6UazWqoTDwW2Bl8xwa5jNWDArAeTvkk1jGELYR0e3lG6RrNQvxPmZljsMaTEgpQG
 eOAijRCe6QZGA1ZXcNZxDVdzDBW76lp958kxgDUMPW/+eyZEfVx0y0fJi4DRqQrRp
 Lnw9ItFvZjUCx0CgwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=I0uWcWtw
Subject: Re: [Buildroot] Fwd: [PATCH v4 1/2] package/pkg-golang.mk: allow
 packages to override download GOPROXY
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgZXZlcnlvbmUhCgpBbSAwNS4wMi4yNSB1bSAxODo1NiBzY2hyaWViIENocmlzdGlhbiBTdGV3
YXJ0IHZpYSBidWlsZHJvb3Q6Cj4gSGkgSmFtZXMsIEFybm91dCwKPgo+IEkgd291bGQgbGlrZSB0
byBhZGQgdGhhdCB0aGVyZSBpcyBhbiBvcGVuIGlzc3VlIHdoZXJlIHRoZSBnb2RvY3MKPiB3ZWJz
aXRlIGlzIGRpc3BsYXlpbmcgdGhlIGNhY2hlZCBwcm94eSB2ZXJzaW9uIGFuZCBub3QgdGhlIEdp
dEh1Ygo+IHZlcnNpb24sIHdoaWNoIGlzIGNvbnNpZGVyZWQgYW5vdGhlciBwb3RlbnRpYWwgbWFs
d2FyZSB2ZWN0b3IuCj4KPiBPcGVuIGlzc3VlIHdpdGggYWN0aXZpdHkgaW4gdGhlIGxhc3QgY291
cGxlIGRheXM6Cj4KPiBodHRwczovL2dpdGh1Yi5jb20vZ29sYW5nL2dvL2lzc3Vlcy82NjY1MyNp
c3N1ZWNvbW1lbnQtMjYzNjM1ODQwMQo+Cj4gT24gV2VkLCBGZWIgNSwgMjAyNSBhdCA2OjAy4oCv
QU0gSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+PiBP
biBXZWQsIEZlYiA1LCAyMDI1IGF0IDI6NTHigK9QTSBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0
aWFuQGFwZXJ0dXJlLnVzPiB3cm90ZToKPj4+IEJlbG93IEkgbWVudGlvbiBhIHBvdGVudGlhbCBz
ZWN1cml0eSBpc3N1ZSB3aGVyZSBzb21lb25lIHVwbG9hZHMgYSBtYWxpY2lvdXMgcGFja2FnZSB2
ZXJzaW9uIHRvIHRoZSBwcm94eSBhbmQgdGhlbiBjaGFuZ2VzIHRoZSBnaXQgdGFnIHRvIHJlbW92
ZSB0aGUgbWFsd2FyZS4gSW4gdGhpcyBhdHRhY2sgbW9kZSB0aGUgbWFpbnRhaW5lcnMgbWlnaHQg
Y2hlY2sgdGhlIGdpdCB0YWcsIHNlZSBubyBtYWx3YXJlLCBhbmQgYWRkIGEgcGFja2FnZSB3aXRo
IHRoYXQgdGFnLgo+Pj4KPj4+IFRoZSBwcm9ibGVtIGlzIHRoYXQgR28gZmV0Y2hlcyBmcm9tIEdP
UFJPWFkgYW5kIHNpbGVudGx5IGlnbm9yZXMgdGhlIG1pc21hdGNoLgo+Pgo+PiBBcyBpdCBzYXlz
IGluIHRoZSBhcnRpY2xlIHRoaXMgaXMgaG93IGl0J3MgZGVzaWduZWQgdG8gd29yazoKPj4KPj4g
IkdvIG1vZHVsZXMgYXJlIGludGVudGlvbmFsbHkgaW1tdXRhYmxlIG9uY2UgcHVibGlzaGVkIGFu
ZCBmZXRjaGVkIGJ5Cj4+IHRoZSBwcm94eSBbc25pcF0KPgo+IENvcnJlY3QsIGJ1dCB0aGlzIGNh
biBsZWFkIHRvIGEgc2VjdXJpdHkgaXNzdWUgd2hlbiB0aGUgY29kZSBpbiB0aGUKPiBwcm94eSBp
cyBtYWxpY2lvdXMuCj4KPj4+IFRoaXMgd2FzIHRoZSByZWFzb24gd2h5IEkgaGF2ZSBhbHdheXMg
bG9iYmllZCB0byBrZWVwIHRoZSBkZWZhdWx0IGFzIEdPUFJPWFk9ZGlyZWN0IGluIGJ1aWxkcm9v
dCwgYXMgdGhpcyBhdm9pZHMgdGhlIGNhc2Ugd2hlcmUgdGhlIGdpdCByZXBvIG1pc21hdGNoZXMg
dGhlIHByb3h5IHdpdGhvdXQgdmlzaWJpbGl0eSBhdCB0aGUgZ2l0IGxldmVsLgo+Pgo+PiBBcyBp
dCBzYXlzIGluIHRoZSBhcnRpY2xlOgo+Pgo+PiAiV2hpbGUgaW1tdXRhYmlsaXR5IGNhbiBiZSBh
YnVzZWQgYnkgbWFsaWNpb3VzIGFjdG9ycyDigJQgYWxsb3dpbmcKPj4gaGFybWZ1bCBjb2RlIHRv
IHBlcnNpc3Qgb25jZSBjYWNoZWQg4oCUIGl0IHJlbWFpbnMgYSBuZXQgc2VjdXJpdHkKPj4gYmVu
ZWZpdC4gU2luY2UgdGhlIEdvIG1vZHVsZSBzeXN0ZW0gaXMgZnVuY3Rpb25pbmcgYXMgaW50ZW5k
ZWQsIGFuZAo+PiB0aGlzIGlzIG5vdCBhIHNlY3VyaXR5IHZ1bG5lcmFiaWxpdHksIHRoZXJlIGlz
IG5vIHBhdGNoIG9yIHN3aXRjaCB0bwo+PiB0dXJuIG9mZiBpbW11dGFiaWxpdHk7IGluc3RlYWQs
IGRldmVsb3BlcnMgbXVzdCByZWNvZ25pemUgdGhhdCBvbmNlIGEKPj4gbWFsaWNpb3VzIHZlcnNp
b24gaXMgcHVibGlzaGVkLCBpdCB3aWxsIHJlbWFpbiBtYWxpY2lvdXMgaW4gdGhlCj4+IGNhY2hl
LiIKPgo+IFllcy4gQnV0IGl0IGlzIG5vdCBhY2NlcHRhYmxlIGZvciB1cyB0byBzaGlwIG1hbGlj
aW91cyBjb2RlLgo+Cj4gQ29kZSBpbiB0aGUgcHJveHkgbWlzbWF0Y2hpbmcgdGhlIGNvZGUgZG93
bmxvYWRlZCB3aXRoIEdPUFJPWFk9ZGlyZWN0Cj4gaXMgYSBnb29kIGluZGljYXRvciB0aGF0IHNv
bWV0aGluZyBzdXNwaWNpb3VzIGlzIGdvaW5nIG9uIGFuZCB3b3J0aAo+IGZ1cnRoZXIgaW52ZXN0
aWdhdGlvbi4KVGhpcyBpcyB0aGUgY3JpdGljYWwgcGFydCBpbiBteSBvcGluaW9uOiBmYWlsaW5n
IHNhZmUuIEFzIGFubm95aW5nIGFzCnNlZW1pbmdseSByYW5kb21seSBmYWlsaW5nIGJ1aWxkcyBh
cmUsIHRoZXkncmUgbm90IGdvaW5nIHRvIGRvIGRhbWFnZQpiZXlvbmQgdGltZSBzcGVudCB0byBp
bnZlc3RpZ2F0ZSBhbmQgZml4IHdoYXRldmVyIHRoZSBjYXVzZSBpcywgd2hldGhlcgppdCdzIGEg
bWlzdGFrZSBvciAocmFyZWx5KSBtYWxpY2lvdXMgYWN0aW9uLiBPbmNlIHdlIGhhdmUgYSB0cnVz
dGVkCnZhbHVlIGluIHBhY2thZ2UuaGFzaCB0aGUgZG93bmxvYWQgc291cmNlIGRvZXNuJ3QgbWF0
dGVyIG11Y2gsIGJ1dCBJCmFncmVlIHRoYXQgcmVxdWlyaW5nIGRvd25sb2FkcyB0byBtYXRjaCB3
aGVuIGludHJvZHVjaW5nL3VwZGF0aW5nIGEKcGFja2FnZSBpcyBhIHNlY3VyaXR5IGZlYXR1cmUu
CgpCZXN0IHJlZ2FyZHMsCkZpb25hCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
