Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC778C636D6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 11:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71C6D81FA9;
	Thu, 23 Feb 2023 11:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71C6D81FA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MqrCVrZBMEPa; Thu, 23 Feb 2023 11:14:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E6BA81E65;
	Thu, 23 Feb 2023 11:14:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E6BA81E65
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 485911BF57C
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 11:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 222EA403F9
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 11:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 222EA403F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YYOmDeX7Lzpc for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 11:14:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A8CA40137
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A8CA40137
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 11:14:11 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id V9Y9pJvtsG6s8V9Y9p5DWh; Thu, 23 Feb 2023 12:14:09 +0100
Message-ID: <5bce1e75-8d41-1275-d599-e95aca1c1c1e@benettiengineering.com>
Date: Thu, 23 Feb 2023 12:14:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230208230721.3269610-1-giulio.benetti@benettiengineering.com>
 <20230208230721.3269610-3-giulio.benetti@benettiengineering.com>
 <b0c85d89-b51d-0c73-c6ea-7a09834d0827@benettiengineering.com>
 <CAPi7W809PQ3rwCF0pWSzL7V8RZef_Z2i+BVhecj+G+GY5zc7dQ@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CAPi7W809PQ3rwCF0pWSzL7V8RZef_Z2i+BVhecj+G+GY5zc7dQ@mail.gmail.com>
X-CMAE-Envelope: MS4xfJf7BPI7OMj8M+zFc/r8Eu0J5ZwykTMyhaYKleoi/gf0kOk6MHv2R5SqEkrEmkb5eikKk7hb3M0co8VqKNo/iu+IQp7qs5UKHANlR5eoQob5CZHVtbW4
 TAWMHnFGyxPH8gM0PP0tvbrez07ASpfFxY1AysQxz8QivAH9OAypH+uNFMK1cyDBjlpzNY5hLmcKj4IB1DhoLHAjm1HdU0K3Z2l+MXBbJcj9KCKgLRv+ytaE
 SCqPO2ggG2kSsU2tA+BEXUrYs/IFfEgNCkF6soJgQyDdFxHwAxvaWV7zEnqWa4GCMZJ1bgF6NKq/WCtnsGnvfA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1677150849; bh=6cLaqYsb/IldGnFVUbVYn3Nk0BXB6FH1pzf6+woBOjo=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=TDzGSbTkJfbGkr51iKtpH1Qboqzc7LgdpDuzNDU4grnO2BjuCqCuHTfXzI8uP4UFX
 kiU/2mZCpiyIZtgs4x11gAd6oBUzHp+3l1PHzBcT+O4G1nEw+LLnlO0a2bLyfx0zlD
 7uQSyrc4LHleKOdcAiGYk1+qL+zNTGSKyO+qTf9DW2uwJLkRhwNujK3GUJVk3cIi2g
 XLrOECjheB1hgViYTssTEPCUuGCrBnlaIies9FzZKiqvgkJLWrpMrGFmwuafY7fknp
 mEBRjRf4aj9xJqRnck0O9j711T/A6Tha3VGcNy5On81FzddEMQ2PqSBFsiUOUC/IZZ
 I8zlKWrJim64A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=TDzGSbTk
Subject: Re: [Buildroot] [PATCH 2/2] package/harfbuzz: bump to version 6.0.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRmFicmljZSwgVGhvbWFzLAoKT24gMjIvMDIvMjMgMTY6NTUsIEZhYnJpY2UgRm9udGFpbmUg
d3JvdGU6Cj4gSGksCj4gCj4gTGXCoG1lci4gMjIgZsOpdnIuIDIwMjMgw6DCoDE2OjM3LCBHaXVs
aW8gQmVuZXR0aSAKPiA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbSAKPiA8
bWFpbHRvOmdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+PiBhIMOpY3JpdMKg
Ogo+IAo+ICAgICBUaGlzIHBhdGNoIGlzIHN1cGVyc2VkZWQgYnkgdGhpcyBvbmU6Cj4gICAgIGh0
dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMzAy
MjIxNDUwNTkuMTkzOTA5NC0xLWdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20v
IDxodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIw
MjMwMjIyMTQ1MDU5LjE5MzkwOTQtMS1naXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcu
Y29tLz4KPiAKPiAKPiBUaGlzIGJ1bXAgc2hvdWxkIGJlIHRhZ2dlZCBhcyBhIHNlY3VyaXR5IGJ1
bXAgYXMgaXQgaW5jbHVkZXMgYSBmaXggZm9yIAo+IENWRS0yMDIzLTI1MTkzIChvciB5b3UgY291
bGQgYmFja3BvcnQgZml4IG9uIG1hc3RlcikuCgpUaGFua3MgYSBsb3QgZm9yIHBvaW50aW5nLiBJ
J3ZlIGZvdW5kIHRoYXQgdGhlIENWRSBpcyBwcmVzZW50IGluIHZlcnNpb24KNi4wLjAgb25seS4g
U28gYXMgZGlzY3Vzc2VkIG9uIElSQyB3aXRoIFRob21hcyB3ZSdyZSBnb2luZyB0byBrZWVwCnZl
cnNpb24gNS4zLjEgZm9yIEJ1aWxkcm9vdCAyMDIzLjAyIGFuZCBhcHBseSB0aGUgcGF0Y2ggdG8g
YnVtcCBoYXJmYnV6egp0byA3LjAuMSB0byBuZXh0LgoKQmVzdCByZWdhcmRzCi0tIApHaXVsaW8g
QmVuZXR0aQpDRU8vQ1RPQEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCgo+IAo+IAo+IAo+ICAgICBC
ZXN0IHJlZ2FyZHMKPiAgICAgLS0gCj4gICAgIENFTy9DVE9AQmVuZXR0aSBFbmdpbmVlcmluZyBz
YXMKPiAKPiAgICAgT24gMDkvMDIvMjMgMDA6MDcsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+ICAg
ICAgPiBTaW5jZSB0aGUgbWFqb3IgcmVsZWFzZSBjaGFuZ2VkIGFsbCB0aGUgcGFja2FnZXMgdGhh
dCBoYXZlIGRpcmVjdAo+ICAgICAgPiBkZXBlbmRlbmN5IHRvIGhhcmZidXp6IGhhcyBiZWVuIHN1
Y2Nlc2Z1bGx5IGJ1aWx0Ogo+ICAgICAgPiAtIGVmbAo+ICAgICAgPiAtIGxpYmFzcwo+ICAgICAg
PiAtIG11cGRmCj4gICAgICA+IC0gcGFuZ28KPiAgICAgID4gLSBxdDViYXNlCj4gICAgICA+IC0g
cXQ1d2ViZW5naW5lCj4gICAgICA+IC0gcXQ2YmFzZQo+ICAgICAgPiAtIHNkbDJfdHRmCj4gICAg
ICA+IC0gc3VwZXJ0dXhrYXJ0Cj4gICAgICA+IC0gdmxjCj4gICAgICA+IC0gd2Via2l0Z3RrCj4g
ICAgICA+IC0gd3Bld2Via2l0Cj4gICAgICA+Cj4gICAgICA+IFNpZ25lZC1vZmYtYnk6IEdpdWxp
byBCZW5ldHRpCj4gICAgIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tCj4g
ICAgIDxtYWlsdG86Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4+Cj4gICAg
ICA+IC0tLQo+ICAgICAgPsKgIMKgcGFja2FnZS9oYXJmYnV6ei9oYXJmYnV6ei5oYXNoIHwgMiAr
LQo+ICAgICAgPsKgIMKgcGFja2FnZS9oYXJmYnV6ei9oYXJmYnV6ei5tayA8aHR0cDovL2hhcmZi
dXp6Lm1rPsKgIMKgfCAyICstCj4gICAgICA+wqAgwqAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAgICAgID4KPiAgICAgID4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvaGFyZmJ1enovaGFyZmJ1enouaGFzaAo+ICAgICBiL3BhY2thZ2UvaGFyZmJ1enovaGFy
ZmJ1enouaGFzaAo+ICAgICAgPiBpbmRleCA5NDg5ZjI1YzZhLi5mYWFlN2I5MWUzIDEwMDY0NAo+
ICAgICAgPiAtLS0gYS9wYWNrYWdlL2hhcmZidXp6L2hhcmZidXp6Lmhhc2gKPiAgICAgID4gKysr
IGIvcGFja2FnZS9oYXJmYnV6ei9oYXJmYnV6ei5oYXNoCj4gICAgICA+IEBAIC0xLDMgKzEsMyBA
QAo+ICAgICAgPsKgIMKgIyBMb2NhbGx5IGNvbXB1dGVkCj4gICAgICA+IC1zaGEyNTYgCj4gICAg
IDRhNmNlMDk3Yjc1YTgxMjFmYWNjNGJhODNiNWIwODNiZmVjNjU3ZjQ1YjAwM2NkNWEzNDI0ZjJh
ZTZiNDQzNGQgCj4gICAgIGhhcmZidXp6LTUuMy4xLnRhci54ego+ICAgICAgPiArc2hhMjU2IAo+
ICAgICAxZDEwMTBhMTc1MWQwNzZkNTI5MWU0MzNjMTM4NTAyYTc5NGQ2NzlhNzQ5OGQxMjY4ZWUy
MWUyZDRhMTQwZWI0IAo+ICAgICBoYXJmYnV6ei02LjAuMC50YXIueHoKPiAgICAgID7CoCDCoHNo
YTI1NiAKPiAgICAgNDM0NWUxNzM1ZjhiYzZkODEyZmVkNTE4MGNhYmI1YTVlODhhNDEwOWQzMzI2
NTJmMmE0NWMxM2NmYTVlZTY5MiAKPiAgICAgQ09QWUlORwo+ICAgICAgPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9oYXJmYnV6ei9oYXJmYnV6ei5tayA8aHR0cDovL2hhcmZidXp6Lm1rPgo+ICAgICBi
L3BhY2thZ2UvaGFyZmJ1enovaGFyZmJ1enoubWsgPGh0dHA6Ly9oYXJmYnV6ei5taz4KPiAgICAg
ID4gaW5kZXggYjAxMTIxNjhlMS4uMDJmZTRlY2VjMyAxMDA2NDQKPiAgICAgID4gLS0tIGEvcGFj
a2FnZS9oYXJmYnV6ei9oYXJmYnV6ei5tayA8aHR0cDovL2hhcmZidXp6Lm1rPgo+ICAgICAgPiAr
KysgYi9wYWNrYWdlL2hhcmZidXp6L2hhcmZidXp6Lm1rIDxodHRwOi8vaGFyZmJ1enoubWs+Cj4g
ICAgICA+IEBAIC00LDcgKzQsNyBAQAo+ICAgICAgPsKgIMKgIwo+ICAgICAgPiAKPiAgICAgIMKg
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgICAgID4KPiAgICAgID4gLUhBUkZCVVpaX1ZFUlNJ
T04gPSA1LjMuMQo+ICAgICAgPiArSEFSRkJVWlpfVkVSU0lPTiA9IDYuMC4wCj4gICAgICA+wqAg
wqBIQVJGQlVaWl9TSVRFID0KPiAgICAgaHR0cHM6Ly9naXRodWIuY29tL2hhcmZidXp6L2hhcmZi
dXp6L3JlbGVhc2VzL2Rvd25sb2FkLyQoSEFSRkJVWlpfVkVSU0lPTikgPGh0dHBzOi8vZ2l0aHVi
LmNvbS9oYXJmYnV6ei9oYXJmYnV6ei9yZWxlYXNlcy9kb3dubG9hZC8kKEhBUkZCVVpaX1ZFUlNJ
T04pPgo+ICAgICAgPsKgIMKgSEFSRkJVWlpfU09VUkNFID0gaGFyZmJ1enotJChIQVJGQlVaWl9W
RVJTSU9OKS50YXIueHoKPiAgICAgID7CoCDCoEhBUkZCVVpaX0xJQ0VOU0UgPSBNSVQsIElTQyAo
dWNkbiBsaWJyYXJ5KQo+IAo+IAo+IEJlc3QgUmVnYXJkcywKPiAKPiBGYWJyaWNlCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
