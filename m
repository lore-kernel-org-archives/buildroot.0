Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A953C83F23
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 10:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1E8E40FCC;
	Thu, 10 Jul 2025 10:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BMWDWE8mczK0; Thu, 10 Jul 2025 10:14:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C256640FB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C256640FB8;
	Thu, 10 Jul 2025 10:14:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62814114
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 10:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4887B83B57
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 10:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nv2gQ4IAhg3y for <buildroot@buildroot.org>;
 Thu, 10 Jul 2025 10:14:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.157;
 helo=fhigh-b6-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F01D783B4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F01D783B4D
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F01D783B4D
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 10:14:36 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id F2E4A7A01E9;
 Thu, 10 Jul 2025 06:14:35 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
 by phl-compute-06.internal (MEProxy); Thu, 10 Jul 2025 06:14:36 -0400
X-ME-Sender: <xms:i5JvaBA2eUqUW9hWq0CwvXRrUZn2RfS9SnIG6TSUZLaZj6nZxIbJwA>
 <xme:i5JvaPiA5JqFFhA9qaaOcSS3Wz4HhGs5gMhTR3LG-cLbD70kuCXRvnqxH4nkfdrD2
 M6TEBnR0D2Mm1xqrls>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegtddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecuogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjug
 hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdflihgrgihu
 nhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpedtvdelieektdduueffveeftdekleeigefgheekkeeltdffffff
 teelkeefiedvteenucffohhmrghinhepghhithhhuhgsrdhiohdpkhgvrhhnvghlrdhorh
 hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhi
 rgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghpthhtohepfedpmh
 houggvpehsmhhtphhouhhtpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughr
 ohhothdrohhrghdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhope
 igrhihudduudesgihrhiduuddurdhsihhtvg
X-ME-Proxy: <xmx:i5JvaLJzArnGQLRbvbR6IHnedXPGwGebvyI6ONYsBtBw4uuZmUi4WQ>
 <xmx:i5JvaCY3kzI8aPdUsmWF1nk1dOyPiKI1gzZcNwyGFE8AGU0FOdlifQ>
 <xmx:i5JvaNIiDYClJ-PiERG56biCRC1FInSyXghy2LDyVnNDOzelTd1U2Q>
 <xmx:i5JvaAD72fJwshsC9oWVtDYr9qcAbFwfk7I4sWgLLu5y-3eFL7_BhA>
 <xmx:i5JvaOYSJdJXqDrayMiaU_mUDOdDudg1uuu36CdE4WW5RToiJYGhAjkq>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 8FB1D2CE0071; Thu, 10 Jul 2025 06:14:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tedb66250f162d13a
Date: Thu, 10 Jul 2025 11:14:15 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Julien Olivain" <ju.o@free.fr>, "Xi Ruoyao" <xry111@xry111.site>
Cc: buildroot@buildroot.org
Message-Id: <2af1b47c-8192-4d46-88b1-7998780356a6@app.fastmail.com>
In-Reply-To: <e17da108d1fb4e6abda26445dc053b35@free.fr>
References: <20250708-loongarch-fabi-v1-1-1c9b4df3dee9@flygoat.com>
 <e17da108d1fb4e6abda26445dc053b35@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1752142475;
 x=1752228875; bh=f/5CFckZ7mROjpRYqvUgIH9TMWE8id6enL3vxmjcvUI=; b=
 GLyukN5PUOOinhb//yqz5msTeki2dl2XZScvSidCMDgWof5XwOk7f4mI+ahdt1Zo
 QyQSxJBepFHphVMMUxLk332QabM0kyniOw+KvrOJzDw3SluNmY/fZApe7mxhJo+3
 iQmB+rCZiy8QYM4SVzdzAhmKz4DNnhxc3jM6qOlQashFqLPhy871aQQQ+feZU+Mz
 LeILjGluzNO6OU6jOdwp7vCP6EkyBAii/2qPz63GEbEQr3HPQ56SKA5nlyCJMtoB
 I+nR66o/ybPUvJe5EDTuTyfggpa8oOWmdFBRjl6tSX+unMRTucAtEZfinThjMgJp
 qa3nEZfk8KxrdHtyHRE4dg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752142475; x=
 1752228875; bh=f/5CFckZ7mROjpRYqvUgIH9TMWE8id6enL3vxmjcvUI=; b=K
 GMssfZAA8w35Z9TWWhPE7zlNm5ytXci6KgA6RqjF2fZXfWu4jtFE5pWtwLADiik/
 9GM9RQOGn6xda83GTTZ1O5rop420h2QR3fzG7GzEvikVwZGoxQja7ceLXTkDaU8s
 sgilMpxkfG6S2dobcDLhIoPCHRRNVSJvoGdVaskI12KUs65cZWf+DdhppueojTN8
 DgWk0/9aGR9ZfrlNASrl0jmHpI3l7MHi4MoCtIBtChyzDiVLZa+XzBMnzTacGHBv
 oyMgFo/xN7KsHRCGWYstMfwene/kqmFbdnN0g+Advie3OfhbkHwp3yg2RDCLl+D7
 8wrjeDDJHLh/YPeX21oRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=GLyukN5P; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=KGMssfZA
Subject: Re: [Buildroot] [PATCH] arch/loongarch: Fix toolchain triple ABI
 suffix
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgrlnKgyMDI15bm0N+aciDnml6XlkajkuIkg5LiL5Y2IMTA6MjbvvIxKdWxpZW4gT2xpdmFpbuWG
memBk++8mgo+IEhpIEppYXh1biwKPgo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoIQoKSGkgSnVsaWVu
LAoKT2ggc29ycnkgZm9yIG5vdCB0ZXN0IGl0IHByb3Blcmx5IGJlZm9yZSBzZW5kaW5nIG91dCwg
SSB3YXMgdHJhdmVsbGluZwpzbyBJIG9ubHkgZGlkIHNtb2tlIHRlc3Qgb2YgZ2VuZXJhdGVkIHRy
aXBsZSBvbiBteSBsYXB0b3AsIHdpbGwgbWFrZQpzdXJlIGl0J3MgYnVpbGQgdGVzdGVkIG5leHQg
dGltZSA6LSkKCk1lYW53aGlsZSwgSSdsbCBtYXJrIHRoZXNlIHR3byBvcHRpb25zIGRlcGVuZHMg
b24gQlIyX0JST0tFTiBhdCB0aGUgbW9tZW50CndoaWxlIHRvb2xjaGFpbiBmb2xrcyBsb29raW5n
IGludG8gaXQuCgpAWGkgUnVveWFvLCBzaW5jZSB5b3UgYXJlIHRoZSBHQ0MgZ3VydSwgY2FuIHlv
dSBoZWxwIHVzIHRvIGludmVzdGlnYXRlPwoKVGhhbmtzCgo+Cj4gT24gMDkvMDcvMjAyNSAwMDo1
NiwgSmlheHVuIFlhbmcgd3JvdGU6Cj4+IExvb25nQXJjaCBHQ0MgaW5mZXJzIEFCSSBmcm9tIHRy
aXBsZSBzdWZmaXgsIHRodXMgaXQncyBuZWNlc2Vzc2FyeQo+PiB0byBzZXQgdXAgcHJvcGVyIHRy
aXBsZSBBQkkgc3VmZml4ZXMgZm9yIGRpZmZlcmVudCBBQkkgdHlwZXMuCj4+IAo+PiBBZGp1c3Qg
QUJJIHN1ZmZpeCBhcyBwZXIgVGFibGUgMTAuIExpc3Qgb2YgcG9zc2libGUgPGZhYmktc3VmZml4
Pgo+PiBpbiAiTG9vbmdBcmNoIFRvb2xjaGFpbiBDb252ZW50aW9ucyBWZXJzaW9uIDEuMDAiLgo+
PiAKPj4gTGluazogCj4+IGh0dHBzOi8vbG9vbmdzb24uZ2l0aHViLmlvL0xvb25nQXJjaC1Eb2N1
bWVudGF0aW9uL0xvb25nQXJjaC10b29sY2hhaW4tY29udmVudGlvbnMtRU4uaHRtbAo+PiBMaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA3MDYxMDU4NTkuMjkyOTA4LTEtanUu
b0BmcmVlLmZyLwo+PiBTdWdnZXN0ZWQtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+
Cj4+IFNpZ25lZC1vZmYtYnk6IEppYXh1biBZYW5nIDxqaWF4dW4ueWFuZ0BmbHlnb2F0LmNvbT4K
Pj4gLS0tCj4+ICBwYWNrYWdlL01ha2VmaWxlLmluIHwgOCArKysrKysrKwo+PiAgMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+PiAKPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvTWFrZWZp
bGUuaW4gYi9wYWNrYWdlL01ha2VmaWxlLmluCj4+IGluZGV4IAo+PiA4Mjk2MzY5MDBiYTk1MGY0
ZTJhZjRlMDcwYjdmOTc5NjQ2NjAwYmNjLi41ZWJiNWY5YmE4YWJkNTVjZjk1MTljZjNlYjJhOWE3
NzRlZjllMjcxIAo+PiAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9NYWtlZmlsZS5pbgo+PiArKysg
Yi9wYWNrYWdlL01ha2VmaWxlLmluCj4+IEBAIC04Myw2ICs4MywxNCBAQCBBQkkgOj0gJChBQkkp
aGYKPj4gIGVuZGlmCj4+ICBlbmRpZgo+PiAKPj4gKyMgTG9vbmdBcmNoIEZsb2F0IEFCSSBzdWZm
aXhlcwo+PiAraWZlcSAoJChCUjJfTE9PTkdBUkNIX0FCSV9MUDY0RikseSkKPj4gK0FCSSA9IGYz
Mgo+PiArZW5kaWYKPj4gK2lmZXEgKCQoQlIyX0xPT05HQVJDSF9BQklfTFA2NFMpLHkpCj4+ICtB
QkkgPSBzZgo+PiArZW5kaWYKPj4gKwo+Cj4gVW5mb3J0dW5hdGVseSwgd2hpbGUgdGhpcyBwYXRj
aCBmaXhlcyB0aGUgY29uZmlndXJlIGVycm9yIGFuZCBnb2VzIGEgYml0Cj4gZnVydGhlciwgaXQg
aXMgbm90IHN1ZmZpY2llbnQgZm9yIGEgY29tcGxldGUgYSBidWlsZCBmb3IgdGhlIGxwNjRmIGFu
ZAo+IGxwNjRzIEFCSXMuCj4KPiBUaGUgZm9sbG93aW5nIGNvbmZpZyB0byB0ZXN0ICJscDY0ZCIg
QUJJIHdvcmtzCj4gKHNhbWUgYXMgd2l0aG91dCB3aXRoIHBhdGNoKS4KPgo+ICAgICAgY2F0ID4u
Y29uZmlnIDw8RU9GCj4gICAgICBCUjJfbG9vbmdhcmNoNjQ9eQo+ICAgICAgQlIyX0xJTlVYX0tF
Uk5FTD15Cj4gICAgICBCUjJfTElOVVhfS0VSTkVMX1VTRV9BUkNIX0RFRkFVTFRfQ09ORklHPXkK
PiAgICAgIEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NMPXkKPiAgICAgIEJSMl9M
SU5VWF9LRVJORUxfTkVFRFNfSE9TVF9MSUJFTEY9eQo+ICAgICAgQlIyX1RBUkdFVF9ST09URlNf
RVhUMj15Cj4gICAgICAjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0Cj4gICAgICBC
UjJfVEFSR0VUX0VESzI9eQo+ICAgICAgQlIyX1RBUkdFVF9HUlVCMj15Cj4gICAgICBCUjJfVEFS
R0VUX0dSVUIyX0xPT05HQVJDSDY0X0VGST15Cj4gICAgICBFT0YKPiAgICAgIG1ha2Ugb2xkZGVm
Y29uZmlnCj4gICAgICBtYWtlCj4KPiBUZXN0aW5nIHRoZSAibHA2NGYiIEFCSSB3aXRoIGNvbW1h
bmRzOgo+Cj4gICAgICBjYXQgPi5jb25maWcgPDxFT0YKPiAgICAgIEJSMl9sb29uZ2FyY2g2ND15
Cj4gICAgICBCUjJfTE9PTkdBUkNIX0ZQVV8zMj15Cj4gICAgICBCUjJfTElOVVhfS0VSTkVMPXkK
PiAgICAgIEJSMl9MSU5VWF9LRVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUc9eQo+ICAgICAg
QlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX09QRU5TU0w9eQo+ICAgICAgQlIyX0xJTlVYX0tF
Uk5FTF9ORUVEU19IT1NUX0xJQkVMRj15Cj4gICAgICBCUjJfVEFSR0VUX1JPT1RGU19FWFQyPXkK
PiAgICAgICMgQlIyX1RBUkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQKPiAgICAgIEVPRgo+ICAg
ICAgbWFrZSBvbGRkZWZjb25maWcKPiAgICAgIG1ha2UKPgo+IGZhaWxzIGluIGhvc3QtZ2NjLWlu
aXRpYWwgd2l0aCBvdXRwdXQ6Cj4KPiAgICAgIEFzc2VtYmxlciBtZXNzYWdlczoKPiAgICAgIC90
bXAvY2NFa3dTc0QuczoyODogRXJyb3I6IHJlZ2lzdGVyIHNhdmUgb2Zmc2V0IG5vdCBhIG11bHRp
cGxlIG9mIDgKPiAgICAgIC90bXAvY2NFa3dTc0QuczozMDogRXJyb3I6IHJlZ2lzdGVyIHNhdmUg
b2Zmc2V0IG5vdCBhIG11bHRpcGxlIG9mIDgKPiAgICAgIC90bXAvY2NFa3dTc0Quczo1MDogRXJy
b3I6IHJlZ2lzdGVyIHNhdmUgb2Zmc2V0IG5vdCBhIG11bHRpcGxlIG9mIDgKPgo+IFRlc3Rpbmcg
dGhlICJscDQ2cyIgQUJJIHdpdGggY29tbWFuZHM6Cj4KPiAgICAgIGNhdCA+LmNvbmZpZyA8PEVP
Rgo+ICAgICAgQlIyX2xvb25nYXJjaDY0PXkKPiAgICAgIEJSMl9MT09OR0FSQ0hfRlBVX05PTkU9
eQo+ICAgICAgQlIyX0xJTlVYX0tFUk5FTD15Cj4gICAgICBCUjJfTElOVVhfS0VSTkVMX1VTRV9B
UkNIX0RFRkFVTFRfQ09ORklHPXkKPiAgICAgIEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9P
UEVOU1NMPXkKPiAgICAgIEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9MSUJFTEY9eQo+ICAg
ICAgQlIyX1RBUkdFVF9ST09URlNfRVhUMj15Cj4gICAgICAjIEJSMl9UQVJHRVRfUk9PVEZTX1RB
UiBpcyBub3Qgc2V0Cj4gICAgICBFT0YKPiAgICAgIG1ha2Ugb2xkZGVmY29uZmlnCj4gICAgICBt
YWtlCj4KPiBmYWlscyBpbiBob3N0LWdjYy1maW5hbCB3aXRoIG91dHB1dDoKPgo+ICAgICAgL2J1
aWxkcm9vdC9vdXRwdXQvaG9zdC9sb29uZ2FyY2g2NC1idWlsZHJvb3QtbGludXgtZ251c2YvYmlu
L2xkOiAKPiBjYW5ub3QgZmluZCBjcnRpLm86IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiAg
ICAgIC9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvbG9vbmdhcmNoNjQtYnVpbGRyb290LWxpbnV4LWdu
dXNmL2Jpbi9sZDogCj4gY2Fubm90IGZpbmQgLWxjOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5
Cj4gICAgICAvYnVpbGRyb290L291dHB1dC9ob3N0L2xvb25nYXJjaDY0LWJ1aWxkcm9vdC1saW51
eC1nbnVzZi9iaW4vbGQ6IAo+IGNhbm5vdCBmaW5kIGNydG4ubzogTm8gc3VjaCBmaWxlIG9yIGRp
cmVjdG9yeQo+Cj4gTm90ZSwgdGhlIGNydCBmaWxlcyBhcmUgaW4gInNmIiBzdWJkaXJlY3Rvcnk6
Cj4gb3V0cHV0L2hvc3QvbG9vbmdhcmNoNjQtYnVpbGRyb290LWxpbnV4LWdudXNmL3N5c3Jvb3Qv
dXNyL2xpYi9zZi9jcnRpLm8KPgo+IENvdWxkIHlvdSBoYXZlIGEgbG9vaywgcGxlYXNlPwo+Cj4g
QmVzdCByZWdhcmRzLAo+Cj4gSnVsaWVuLgoKLS0gCi0gSmlheHVuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
