Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B38BC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11B9740C0F;
	Wed,  5 Feb 2025 11:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t9VU4jc8PW9o; Wed,  5 Feb 2025 11:40:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B87F1415B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B87F1415B4;
	Wed,  5 Feb 2025 11:40:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 56AA1CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45DBA415B4
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6DgqRVT_UIud for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:40:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7FC2540C0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FC2540C0F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FC2540C0F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:40:25 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.119.32]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTABZ-1tqrma1nyh-00WZCU; Wed, 05
 Feb 2025 12:40:23 +0100
Message-ID: <8572588d-6e13-4ebe-a1eb-45cc63f07468@gmx.de>
Date: Wed, 5 Feb 2025 12:40:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>, yann.morin@orange.com,
 Thomas Perale <thomas.perale@mind.be>
References: <20250204143227.1233163-1-fiona.klute@gmx.de>
 <f2073884-da55-4f02-8bb4-a39702bc4794@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <f2073884-da55-4f02-8bb4-a39702bc4794@mind.be>
X-Provags-ID: V03:K1:ZR/Wp79KuI7ad8uuC0pvqa6R5bRsmKEjV7gRqFr/exDo0F57awh
 kifUvCHMflMibYBIOJPErJadh9IUFfCFkLSEBnK05FU2rJJUbPB+bLDURe43vKD9nIHgqeN
 XINyCVba+3u9YPoEN9akEh1L52wIZF6/0pX7sxsMIhN3qY+kJUQEt9Wg1we9CHi4ghiKVxF
 J+3km1edZ2OQet8Peu7gw==
UI-OutboundReport: notjunk:1;M01:P0:zgjyHYUCiW4=;uO00CKswI3UDe27wf6Cpdw8YEAY
 qUvErPub/e8qIfnGwbj3mLzePO4Vp6YzGouT7b8nzNyn3LcctW1Gp13yAf0Cr1wYU6548YWmn
 DwPX6ThcVfv1d7oNEM0RdvblLij4BOQVcg0tODPG9nRLcGRC6EvFd9nOmufgxXpW283ht7eJW
 YLlN21ZZ8MAA4eCjHoN/1S4YMQ2yZNTunmd7lMcrCSCkJB/3vTTALReNGK1+DQyuL6s6pWXpG
 XDXXdbD9CQoMXn1QWJheUJGXNjr5Av3rIwGM9htlqPUkmAVMD2FB96tfUPMMpjyo1y6pJowdp
 oQlr7vHc3Ew4FWsWrZmFjRihP0w4wiPuM4sj/x32hQFvb+vCXGEEosuhOhM/qDkVumkaF7DWy
 VqKDSZVZbovCDQIJH3yBz29h7X2ZjUvQm0R2GG7pl4XwWenWJLBptTUCtn/6kUvRBG9Q/Uec6
 4v2Ksj2/2eFrPxQ4qAzgZUN882zAXlSLXkL/3ng9c3W7T+6xBqDo9soM81UPOpZ5z8vngwMke
 MDjKR+34Y5rr/fH4nA6VafxAZYFbPPTtudyid/lYRHKd2Mh1w3ONNse9+MN98zwSrc+3xyBKF
 KnaB23pXSow/4eUyoHjb+LbxQcPyKsrWwZOut7JK7dCcGrQU84MWbcWswLU/eVVhCJLE5lQC3
 xWr1jsp2yC/pnL36N/8XWDaZcr9tTO7pmAK8isXP9KE+GaScSG/fn1B67vuwbVZ4neuCV9IQ5
 se5GB+n0ConZ6PwLFlaoPr9gA3HDVwf8UtB/12sT19tL3McOAEH094TjhAeW2nqbKqCV/Goii
 KdZ/08wiRql+/C/IHnPrqO1gj/LGRYuqrTBrYQfTeDSVsOQojE3WtTmJzzD1iw0XnatVkXTgR
 LIiaatN31KbSGkzrPV3HxhsINq1j+knesj3erCBvmGXsT8371bpZg4aYbhg3bhxHZ9bZRkxft
 DH55LyL8KYlnT9v0LhGv3Jsk8RWq6xKjLU0AcGrhUc/j22yDYz08vrBcZ7w+Q/NuclaOfAwwo
 1eShc53Pkt6hQqS1sXJfFZ8rV7OLMxNEJAaBrRSlBqu/oMmrwSY5fqiFVPBfdV3W7JM6c+d5r
 5AsRcdpqVe00X9ue1+UK60qokACnfkHAb54xq1IXMJiV9qKY7kzE00jAK1K3A1nh43w0srvPz
 Ub9HA7K6Gx3yuM8qU0CjrfQ1mma2kzZCHIrq/oJtd01VWZttgXWfK5m6Ir6a1g85Z58nuLueD
 xw222az7UoxRkvMJw3hKw5Tsg4LW6hxGalJQruVy5ZnubA11fghv8UkNT5//5mKclfBlFpVvu
 XshkUgzE+3Qw25tCZ7PqMuvzXIxKAWC64J1KpoKTFdO12BTVrCRN2Nu51l3F0Ri0RFvopaEYt
 WSVl/92inUrQAmaFl6yjXc35e4Mx5L9LZeFCI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738755623; x=1739360423; i=fiona.klute@gmx.de;
 bh=M12erZMJ1hTcvryAYluY4zPmpGgUkKSwng1Alhjx05w=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=hgaJVDvM6NYWuTJ5Xnd7fd1bT8vmGNfOdIuvhVgqXzzQwZpaxHXsUjZHOlskWxtP
 AemTkQWqustiAmJ+J+wX9aNLGdu++2FpRxKdibWjDnaHgwMiavo98FPF78sg1VzVT
 5clOtROyygccc9lIjtC+wqaacCZfifsw3H/VAp8t1pT5xOvYMIABVRMLPTF4mL1d4
 mDCo5MXDxesrYcjfbCFuzhfgIEIZyJdLzCFL9xBkRz59Ov+n/IDAsN+cJVtdJJEVe
 6dNU3kglt1tJivjkf2R7/BEWRJoLahG5FPf+s64AVnw8D1ikwKjz+NmADzt/PiKNT
 mtufX8QPLQuC2D4yCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=hgaJVDvM
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: fix build with
 toolchain without Gold linker
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

SGkgQXJub3V0IQoKQW0gMDUuMDIuMjUgdW0gMTE6MzMgc2NocmllYiBBcm5vdXQgVmFuZGVjYXBw
ZWxsZToKPiAgwqBIaSBGaW9uYSwKPgo+IE9uIDA0LzAyLzIwMjUgMTU6MzIsIEZpb25hIEtsdXRl
IHdyb3RlOgo+PiBGcm9tOiAiRmlvbmEgS2x1dGUgKFdJV0EpIiA8ZmlvbmEua2x1dGVAZ214LmRl
Pgo+Pgo+PiBHbyBmb3JjZXMgdXNlIG9mIHRoZSBHb2xkIGxpbmtlciBvbiBhYXJjaDY0IGR1ZSB0
byBhIGJ1ZyBpbiBCRkQgKHRoZQo+PiBkZWZhdWx0IEdOVSBsaW5rZXIpIHRoYXQgaXMgZml4ZWQg
aW4gQmludXRpbHMgPj0gMi40MSBbMV0uIEFsbAo+PiB0b29sY2hhaW5zIHByb3ZpZGVkIGJ5IEJ1
aWxkcm9vdCBoYXZlIHRoZSBmaXgsIGFuZCBub25lIG9mIHRoZW0KPj4gcHJvdmlkZSBHb2xkLCBz
byB0aGUgZm9yY2VkIHNldHRpbmcgYnJlYWtzIGR5bmFtaWMgbGlua2luZyBpbgo+PiBCdWlsZHJv
b3QuIFNldCBFWFRMREZMQUdTIHRvIHVzZSBCRkQgaW5zdGVhZC4KPj4KPj4gQWRkaXRpb25hbGx5
IGRpc2FibGUgUElFIG9uIG11c2wgdG8gZml4ICJyZWFkLW9ubHkgc2VnbWVudCBoYXMgZHluYW1p
Ywo+PiByZWxvY2F0aW9ucyIgZXJyb3JzIGR1cmluZyBsaW5raW5nIFsyXS4KPj4KPj4gWzFdIGh0
dHBzOi8vZ2l0aHViLmNvbS9nb2xhbmcvZ28vaXNzdWVzLzIyMDQwCj4+IFsyXSBodHRwczovL2dp
dGh1Yi5jb20vZ29sYW5nL2dvL2lzc3Vlcy8xNzg0Nwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBGaW9u
YSBLbHV0ZSAoV0lXQSkgPGZpb25hLmtsdXRlQGdteC5kZT4KPj4gLS0tCj4+IFRoaXMgcGF0Y2gg
cmVxdWlyZXMgWWFubiBFLiBNb3JpbidzIHBhdGNoIHRoYXQgaW50cm9kdWNlcwo+PiBQQUNLQUdF
X0VYVExERkxBR1M6Cj4+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWls
ZHJvb3QvCj4+IHBhdGNoLzg3NmYzYTdiYjZhMjM3NTE5M2ZjOGYwNmFiODU2ZDI0NDlmODM3Mjcu
MTY5OTU0Nzk5My5naXQueWFubi5tb3JpbkBvcmFuZ2UuY29tLwo+Cj4gIMKgQWZ0ZXIgYWxsIHRo
aXMgZGlzY3Vzc2lvbiwgY291bGQgeW91IHJlc3BpbiB0aGlzIGFzOgo+Cj4gLSBhIHNlcmllcyB3
aGVyZSBZYW5uJ3MgcGF0Y2ggaXMgMS8yLiBJdCdzIHF1aXRlIGNvbmZ1c2luZyBmb3IgdXMKPiBt
YWludGFpbmVycyB0byBoYXZlIGEgcGF0Y2ggdGhhdCBkZXBlbmRzIG9uIGFub3RoZXIgcGF0Y2gs
IHVubGVzcyB3aGVuCj4gaXQncyBwYXJ0IG9mIGEgc2VyaWVzLiBZb3UgY2FuIGp1c3QgYXBwbHkg
dGhhdCBwYXRjaCBvbiB5b3VyIGJyYW5jaCwgYWRkCj4geW91ciBvd24gc2lnbmVkLW9mZi1ieSwg
YW5kIGluY2x1ZGUgaXQgaW4geW91ciBvd24gc2VyaWVzOwo+IC0gYWRkIHRoZSB1c2UtbGQ9YmZk
IGFzIHBhcnQgb2YgdGhlIGdvbGFuZyBpbmZyYXN0cnVjdHVyZTsKPiAtIEknbSBub3Qgc3VyZSBh
Ym91dCB0aGUgUElFIHBhcnQgeWV0LCBidXQgeW91IGNhbiB0cnkgYnVpbGRpbmcgYW55Cj4gb3Ro
ZXIgQ0dPIHBhY2thZ2Ugd2l0aCBhIG11c2wgdG9vbGNoYWluIGFuZCBpZiBpdCBmYWlscyBhcyB3
ZWxsIGl0IG5lZWRzCj4gdG8gYmUgaW4gdGhlIGluZnJhLgoKVGhhbmtzLCBJJ3ZlIGp1c3Qgc2Vu
dCB0aGUgdXBkYXRlZCBzZXJpZXM6Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVj
dC9idWlsZHJvb3QvbGlzdC8/c2VyaWVzPTQ0MjkzOQoKSSd2ZSB0ZXN0ZWQgYnVpbGRpbmcgZG9j
a2VyLWVuZ2luZSwgZG9ja2VyLWNsaSwgYW5kIHJ1bmMsIGFuZCB0aGV5IGJ1aWxkCmZpbmUgd2l0
aG91dCB0aGUgLS1uby1waWUgb3ZlcnJpZGUsIHNvIEkndmUga2VwdCB0aGF0IHRvIGNvbnRhaW5l
cmQgb25seS4KCkJlc3QgcmVnYXJkcywKRmlvbmEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
