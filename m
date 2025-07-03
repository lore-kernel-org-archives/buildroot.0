Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D665DC77B7C
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 10:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D46681975;
	Thu,  3 Jul 2025 10:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQv0u5xxRYtY; Thu,  3 Jul 2025 10:34:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38575817FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38575817FD;
	Thu,  3 Jul 2025 10:34:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 967D4128
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 10:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88C0F40D28
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 10:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id koJhmiaBDgca for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 10:34:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1193840D07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1193840D07
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1193840D07
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 10:34:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91BEA431BA;
 Thu,  3 Jul 2025 10:34:00 +0000 (UTC)
Date: Thu, 3 Jul 2025 12:33:59 +0200
To: Thomas Perale <thomas.perale@mind.be>
Message-ID: <20250703123359.5bca4a98@bootlin.com>
In-Reply-To: <20250630072423.1126928-1-thomas.perale@mind.be>
References: <20250630072423.1126928-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -110
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvtddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlqddutddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtffefgfdtueelfeeuiefhvddvuefhgeeivdejteejfeegffegveejhfdvueeugfenucffohhmrghinhepnhhishhtrdhgohhvpdhgihhthhhusgdrtghomhenucfkphepvdgrtddumegvtdgrmedvkeehmegsleektdemvgegtdgtmeeitgegfeemsgehsggsmegrgedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdekheemsgelkedtmegvgedttgemiegtgeefmegshegssgemrgegvdekpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehthhhomhgrshdrphgvrhgrlhgvsehmihhnugdrsggvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtp
 hhtthhopehnihgtohhlrghsrdgtrghrrhhivghrsehorhholhhirgdrtghomh
X-GND-Sasl: herve.codina@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1751538840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wSyXjLM3oOPIGgUQtfyj/0DDhj/oiSOBf4w7WhfY4EA=;
 b=fU8cUDYcR8laqf3gigvhYykrB74zMdEMJNe7vfM7NgrSULWQmoLHephjluhxSG1xzp6EOD
 5IPOAfVLGipFQpyggkHxhH/3E0YS82k2DztaYR7c45oDU3tSXa6j/XNI5yg6cwptl1aRGw
 5jnBXP7AxYlDbJzmrcMjkYKANulOs1qT7MddJsoWoc4yn+iGTE/pfl3XZHNVkDTzvKykx4
 qDKGJzkj3qbrJxxTzkEefytxzy3+PSUhuELIwFEf6Xibus2mGI/Jp837zzcS1HmuTK4lkE
 XjRKlKqI3y4VcwkBXuP4zbTemRtX5bjb8hFXieVucC4ExPQWu3PPBAKDsSMxFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fU8cUDYc
Subject: Re: [Buildroot] [PATCH] package/modsecurity2: security bump to
 v2.9.10
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
From: Herve Codina via buildroot <buildroot@buildroot.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAzMCBKdW4gMjAyNSAwOToyNDoyMyArMDIwMApUaG9tYXMgUGVyYWxlIDx0aG9tYXMu
cGVyYWxlQG1pbmQuYmU+IHdyb3RlOgoKPiBGaXhlcyB0aGUgZm9sbG93aW5nIHNlY3VyaXR5IGlz
c3VlczoKPiAKPiAtIENWRSAyMDI1LTQ3OTQ3OiBWZXJzaW9ucyB1cCB0byBhbmQgaW5jbHVkaW5n
IDIuOS44IGFyZSB2dWxuZXJhYmxlIHRvCj4gICBkZW5pYWwgb2Ygc2VydmljZSBpbiBvbmUgc3Bl
Y2lhbCBjYXNlIChpbiBzdGFibGUgcmVsZWFzZWQgdmVyc2lvbnMpOgo+ICAgd2hlbiB0aGUgcGF5
bG9hZCdzIGNvbnRlbnQgdHlwZSBpcyBhcHBsaWNhdGlvbi9qc29uLCBhbmQgdGhlcmUgaXMgYXQK
PiAgIGxlYXN0IG9uZSBydWxlIHdoaWNoIGRvZXMgYSBzYW5pdGlzZU1hdGNoZWRCeXRlcyBhY3Rp
b24uIEEgcGF0Y2ggaXMKPiAgIGF2YWlsYWJsZSBhdCBwdWxsIHJlcXVlc3QgMzM4OSBhbmQgZXhw
ZWN0ZWQgdG8gYmUgcGFydCBvZiB2ZXJzaW9uCj4gICAyLjkuOS4gTm8ga25vd24gd29ya2Fyb3Vu
ZHMgYXJlIGF2YWlsYWJsZS4KPiAKPiBGb3IgbW9yZSBpbmZvcm1hdGlvbiwgc2VlOgo+ICAgLSBo
dHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyNS00Nzk0Nwo+ICAgLSBodHRw
czovL2dpdGh1Yi5jb20vb3dhc3AtbW9kc2VjdXJpdHkvTW9kU2VjdXJpdHkvcHVsbC8zMzg5Cj4g
Cj4gLSBDVkUtMjAyNS00ODg2NjogVmVyc2lvbnMgcHJpb3IgdG8gMi45LjEwIGNvbnRhaW4gYSBk
ZW5pYWwgb2Ygc2VydmljZQo+ICAgdnVsbmVyYWJpbGl0eSBzaW1pbGFyIHRvIEdIU0EtODU5ci12
dnY4LXJtOHIvQ1ZFLTIwMjUtNDc5NDcuIFRoZQo+ICAgYHNhbml0aXNlQXJnYCAoYW5kIGBzYW5p
dGl6ZUFyZ2AgLSB0aGlzIGlzIHRoZSBzYW1lIGFjdGlvbiBidXQgYW4KPiAgIGFsaWFzKSBpcyB2
dWxuZXJhYmxlIHRvIGFkZGluZyBhbiBleGNlc3NpdmUgbnVtYmVyIG9mIGFyZ3VtZW50cywKPiAg
IHRoZXJlYnkgbGVhZGluZyB0byBkZW5pYWwgb2Ygc2VydmljZS4gVmVyc2lvbiAyLjkuMTAgZml4
ZXMgdGhlIGlzc3VlLgo+ICAgQXMgYSB3b3JrYXJvdW5kLCBhdm9pZCB1c2luZyBydWxlcyB0aGF0
IGNvbnRhaW4gdGhlIGBzYW5pdGlzZUFyZ2AgKG9yCj4gICBgc2FuaXRpemVBcmdgKSBhY3Rpb24u
Cj4gCj4gRm9yIG1vcmUgaW5mb3JtYXRpb24sIHNlZToKPiAgIC0gaHR0cHM6Ly9udmQubmlzdC5n
b3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjUtNDg4NjYKPiAgIC0gaHR0cHM6Ly9naXRodWIuY29tL293
YXNwLW1vZHNlY3VyaXR5L01vZFNlY3VyaXR5L2NvbW1pdC8zYTU0Y2NlYTYyZDNmNzE1MWJiMDhj
Yjc4ZDYwYzVlOTBiNTNjYTJlCj4gCj4gRm9yIG1vcmUgZGV0YWlscyBvbiB0aGUgdmVyc2lvbiBi
dW1wLCBzZWU6Cj4gICAtIGh0dHBzOi8vZ2l0aHViLmNvbS9vd2FzcC1tb2RzZWN1cml0eS9Nb2RT
ZWN1cml0eS9yZWxlYXNlcy90YWcvdjIuOS44Cj4gICAtIGh0dHBzOi8vZ2l0aHViLmNvbS9vd2Fz
cC1tb2RzZWN1cml0eS9Nb2RTZWN1cml0eS9yZWxlYXNlcy90YWcvdjIuOS45Cj4gICAtIGh0dHBz
Oi8vZ2l0aHViLmNvbS9vd2FzcC1tb2RzZWN1cml0eS9Nb2RTZWN1cml0eS9yZWxlYXNlcy90YWcv
djIuOS4xMAo+IAo+IEFsc28gdGhpcyBwYXRjaCBjaGFuZ2UgdGhlIF9TT1VSQ0UgdmFyaWFibGUg
dGhhdCBub3cgaW5jbHVkZSBhICd2Jwo+IHByZWZpeGluZyB0aGUgdmVyc2lvbi4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgUGVyYWxlIDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+Cj4gLS0tCj4g
IHBhY2thZ2UvbW9kc2VjdXJpdHkyL21vZHNlY3VyaXR5Mi5oYXNoIHwgMiArLQo+ICBwYWNrYWdl
L21vZHNlY3VyaXR5Mi9tb2RzZWN1cml0eTIubWsgICB8IDQgKystLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9tb2RzZWN1cml0eTIvbW9kc2VjdXJpdHkyLmhhc2ggYi9wYWNrYWdlL21vZHNlY3VyaXR5
Mi9tb2RzZWN1cml0eTIuaGFzaAo+IGluZGV4IGZiYjdmYWJiM2EuLmNkOGE5NmFhMDAgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9tb2RzZWN1cml0eTIvbW9kc2VjdXJpdHkyLmhhc2gKPiArKysgYi9w
YWNrYWdlL21vZHNlY3VyaXR5Mi9tb2RzZWN1cml0eTIuaGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+
ICAjIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL293YXNwLW1vZHNlY3VyaXR5L01vZFNlY3VyaXR5
L3JlbGVhc2VzL2Rvd25sb2FkL3YyLjkuNy9tb2RzZWN1cml0eS0yLjkuNy50YXIuZ3ouc2hhMjU2
CgpDYW4geW91IHVwZGF0ZSB0aGlzIGNvbW1lbnQgd2l0aCB0aGUgZm9sbG93aW5nOgogIEZyb20g
aHR0cHM6Ly9naXRodWIuY29tL293YXNwLW1vZHNlY3VyaXR5L01vZFNlY3VyaXR5L3JlbGVhc2Vz
L2Rvd25sb2FkL3YyLjkuMTAvbW9kc2VjdXJpdHktdjIuOS4xMC50YXIuZ3ouc2hhMjU2CgpGb3Ig
aW5mb3JtYXRpb24sIEkgaGF2ZSBkb3dubG9hZGVkIHRoaXMgLnNoYTI1NiBmaWxlIGFuZCBoYXZl
IGNoZWNrZWQgdGhlCnNoYSB2YWx1ZSBhZ2FpbnN0IHRoZSBzaGEyNTYgcHJvdmlkZWQgYmVsb3cu
IFRoZXkgbWF0Y2ggcGVyZmVjdGx5LgoKPiAtc2hhMjU2ICAyYTI4ZmNmY2NmZWYyMTU4MTQ4NmY5
OGQ4ZDVmZTAzOTc0OTk3NDliODM4MGY2MGVjN2JiMWMwODQ3OGUxODM5ICBtb2RzZWN1cml0eS0y
LjkuNy50YXIuZ3oKPiArc2hhMjU2ICAwODFjZGE1Mjk3NTQ5NDEzOTkyMmZhNGI1NGY0NzRmZWQ4
YTZkYjRiN2Y1ODZjYjBkM2FlZWM2MzVmN2E0ZDUzICBtb2RzZWN1cml0eS12Mi45LjEwLnRhci5n
egoKQmVzdCByZWdhcmRzLApIZXJ2w6kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
