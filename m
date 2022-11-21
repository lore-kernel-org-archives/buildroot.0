Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810AAC433FE
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 22:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D22C405F7;
	Mon, 21 Nov 2022 22:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D22C405F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D487dQrbhoUZ; Mon, 21 Nov 2022 22:51:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 491C6405F2;
	Mon, 21 Nov 2022 22:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 491C6405F2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 21D931BF3A9
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 22:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E387981E15
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 22:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E387981E15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d02grI1GxX-v for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 22:50:57 +0000 (UTC)
X-Greylist: delayed 00:07:35 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D00F981E11
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D00F981E11
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 22:50:56 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id E71BA5C0113;
 Mon, 21 Nov 2022 17:43:15 -0500 (EST)
Received: from imap50 ([10.202.2.100])
 by compute1.internal (MEProxy); Mon, 21 Nov 2022 17:43:15 -0500
X-ME-Sender: <xms:A_97Ywdr8QGHTsE2ApBfK79BfI7apD4z7NVvlYQZIiubJb2J8BwukA>
 <xme:A_97YyP4XL7xezZOPRRguVIuF84bjE7HVXXQVMRQRRAoVIOHhS17XtOoSHyQInAuc
 IJUNUnyDTNuDyqBdnk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrheejgddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ihhsshgvucetshhtihgvrhdfuceorghnihhsshgvsegrshhtihgvrhdrvghuqeenucggtf
 frrghtthgvrhhnpefhvdeiudeviedvffdutdeugeejieeihfduheelveeikeetffeijefh
 geelgeffhfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnihhsshgvsegrshhtihgvrhdr
 vghu
X-ME-Proxy: <xmx:A_97YxhxKaZKs7XXrFtynoKt4fuYwZ6FfTKw0A_asd-j1SFWE0xCgA>
 <xmx:A_97Y18jRFJ2i06IxPTNam8yhbBOtwxsKtmgfPllTRyvO9laZF6Cxw>
 <xmx:A_97Y8stongQ9okqk-eqGjV1M9kU7FGdnQO4ccy87z8jqOhn4a5spw>
 <xmx:A_97Y17s7FH8wWF4aRyvmmF7z4v2JCeEBUd6ThG0BTtu7NnueD3tEA>
Feedback-ID: iccec46d4:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 461B91700407; Mon, 21 Nov 2022 17:43:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <0e155b6d-1710-49c4-abc1-89d4550c974c@app.fastmail.com>
In-Reply-To: <878rk4g6jz.fsf@tarshish>
References: <20221120181955.851456-1-anisse@astier.eu>
 <878rk4g6jz.fsf@tarshish>
Date: Mon, 21 Nov 2022 23:42:43 +0100
From: "Anisse Astier" <anisse@astier.eu>
To: "Baruch Siach" <baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier.eu; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1669070595; x=
 1669156995; bh=V2d8K9Vn/eU3ZWNrbEeBoqbFS3d66+wOGrIjkzrEt8Q=; b=n
 G1hLR54PGCwDIPHsZQnx5uN7ZZs455r5Ms//URegZZiw+XaK9HvNEfRd3H2NOVjZ
 kgFeUJBAd2qigCPdj2g+pKT1tX3zydPxOMsd3s2vmLsiR1V7iF6jJvDvVY0wPZfJ
 qRQVw7SlM4VLMtNjcE66MJRZqeU9qVmVJo9XaZX1iU2N2S7gDLbRy5ADeFim2e6U
 xXinMqxwn4+fwzqt6zA+YEg6A2Kcw3eaHhNytAs2Hbp62c3KJvXZ055oUIvjyJ1f
 D5GWoOZh68ZELcw5rlEHxmO6lTgAItq1/aPpzLNT0kNpTlGz/k/QwD4eOE7wlE6T
 bZ6RgvqsnZ6GjBeXEhRfQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669070595; x=
 1669156995; bh=V2d8K9Vn/eU3ZWNrbEeBoqbFS3d66+wOGrIjkzrEt8Q=; b=N
 vYlC7F+5jXwWZcyOx2PTP0Zxl4nj9rkwI0iKcRb0teX0EmkHi5Opp/pOco9k+aev
 Hn5arOkpjEYTrATC7IQa/+T62b2XuU14g+a3BbjljsfXjhJQQUJKCk2gjXzo6Ln5
 oaubRw15nhBgR24FFrfq7PomVeJTMITUfRj6T+xVJqO7pe1X2s7XwQcTeYj0uIPh
 b33WAjrI4o3drbfryt4uXhLPAXDzYCmrC62+CNnWTgB39b4yELAVjUIOkJrA9wUS
 oka3ym/a7yUSc+Y4GNyomIoldCVd2LvpC0P0Yok0YBA9kbk47OS4qaMFYzGEQnyX
 tCvdOBz7qC0Dr0jllWowg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=astier.eu header.i=@astier.eu
 header.a=rsa-sha256 header.s=fm1 header.b=nG1hLR54; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=NvYlC7F+
Subject: Re: [Buildroot] [PATCH RFC] package/go: disable cgo support with
 static libs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQmFydWNoLAoKTHVuIDIxIG5vdiAyMDIyLCDDoCAwNzoyNywgQmFydWNoIFNpYWNoIHZpYSBi
dWlsZHJvb3QgYSDDqWNyaXTigK86Cj4gSGkgQW5pc3NlLAo+IAo+IE9uIFN1biwgTm92IDIwIDIw
MjIsIEFuaXNzZSBBc3RpZXIgd3JvdGU6Cj4gPiBUaGUgZ28gc3RkbGliICJwbHVnaW4i4oCvcGFj
a2FnZSByZWxpZXMgb24gZGxmY24uaCB3aGljaCBpc24ndCBhdmFpbGFibGUKPiA+IHdoZW4gd2Ug
aGF2ZSBCUjJfU1RBVElDX0xJQlM9eS4KPiA+Cj4gPiBUaGlzIHNob3VsZCBmaXggdGhpcyBidWls
ZCBlcnJvciBmcm9tIGF1dG9idWlsZGVyczoKPiA+Cj4gPiAvYnVpbGRyb290L2k2ODYtaG9zdGdv
LWZhaWwvYnVpbGQvaG9zdC1nby0xLjE5LjMvc3JjL3BsdWdpbi9wbHVnaW5fZGxvcGVuLmdvOjEx
OjEwOiBmYXRhbCBlcnJvcjogZGxmY24uaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+ID4g
ICAgMTEgfCAjaW5jbHVkZSA8ZGxmY24uaD4KPiA+Cj4gPiBUaGUgbW9yZSBsb25ndGVybSBhcHBy
b2FjaCB3b3VsZCBiZSB0byBhc2sgdXBzdHJlYW0gZm9yIGEgYnVpbGQgdGFnIHRvCj4gPiBkaXNh
YmxlIHRoZSBwbHVnaW4gcGFja2FnZSwgYWtpbiB0byB0aGUgb3N1c2VyZ28gb3IgbmV0Z28gdGFn
czoKPiA+Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vZ29sYW5nL2dvL2lzc3Vlcy8yMzI2NQo+ID4K
PiA+IFdoaWxlIGl0IHdvdWxkIGJlIHF1aXRlIHNpbXBsZSwgSSBkb24ndCB0aGluayBhIGJ1aWxk
cm9vdCBwYXRjaCBmb3IgdGhpcwo+ID4gd2l0aG91dCB1cHN0cmVhbSBzdXBwb3J0IHdvdWxkIGJl
IGlkZWFsLgo+IAo+IFlvdXIgc2lnbi1vZmYgaGVyZSBpcyBtaXNzaW5nLgo+IAo+ID4gLS0tCj4g
PiAgcGFja2FnZS9nby9nby5tayB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nby9nby5t
ayBiL3BhY2thZ2UvZ28vZ28ubWsKPiA+IGluZGV4IGZkNGNhYTJlNWEuLjFjM2NmYTk0ZDQgMTAw
NjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL2dvL2dvLm1rCj4gPiArKysgYi9wYWNrYWdlL2dvL2dvLm1r
Cj4gPiBAQCAtODcsNyArODcsNyBAQCBIT1NUX0dPX1RBUkdFVF9FTlYgPSBcCj4gPiAgIyBzZXQs
IGJ1aWxkIGluIGNnbyBzdXBwb3J0IGZvciBhbnkgZ28gcHJvZ3JhbXMgdGhhdCBtYXkgbmVlZCBp
dC4gIE5vdGUgdGhhdAo+ID4gICMgYW55IHRhcmdldCBwYWNrYWdlIG5lZWRpbmcgY2dvIHN1cHBv
cnQgbXVzdCBpbmNsdWRlCj4gPiAgIyAnZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJF
QURTJyBpbiBpdHMgY29uZmlnIGZpbGUuCj4gPiAtaWZlcSAoJChCUjJfVE9PTENIQUlOX0hBU19U
SFJFQURTKSx5KQo+ID4gK2lmZXEgKCQoQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUykkKEJSMl9T
VEFUSUNfTElCUykseW4pCj4gCj4gVGhpcyB3aWxsIG5vdCB3b3JrIGFzIHlvdSBpbnRlbmQuICQo
QlIyX1NUQVRJQ19MSUJTKSByZXNvbHZlIHRvIGFuIGVtcHR5Cj4gc3RyaW5nIHdoZW4gQlIyX1NU
QVRJQ19MSUJTIGlzIG5vdCBzZXQuIFlvdSB3YW50IHNvbWV0aGluZyBsaWtlOgo+IAo+IGlmZXEg
KCQoQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyk6JChCUjJfU1RBVElDX0xJQlMpLHk6KQo+IAo+
IGJhcnVjaAo+IAoKVGhhbmtzIGZvciB5b3VyIHJldmlldywgdGhpcyB3aWxsIGJlIGluIHYyLgoK
UmVnYXJkcywKCkFuaXNzZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
