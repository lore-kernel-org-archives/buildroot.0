Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EE1CA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 19:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BADD582835;
	Sun, 24 Aug 2025 19:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vAwVHfYC7kvl; Sun, 24 Aug 2025 19:44:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2EEC82AAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2EEC82AAA;
	Sun, 24 Aug 2025 19:44:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3581E19C
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 19:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BAEE40028
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 19:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EwJ_oSKrqKvt for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 19:44:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=dalang@gmx.at; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8414A400AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8414A400AE
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8414A400AE
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 19:44:22 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.8.36] ([213.147.165.25]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3KPg-1uPLph1fPu-010yMD; Sun, 24
 Aug 2025 21:44:19 +0200
Message-ID: <bf4649c3-9180-45d6-9f0d-14cc08619ad6@gmx.at>
Date: Sun, 24 Aug 2025 21:44:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20250823045411.255895-1-dalang@gmx.at>
 <a6515c77e63d83c38f3f99e4d3eef5aa@free.fr>
Content-Language: en-US
In-Reply-To: <a6515c77e63d83c38f3f99e4d3eef5aa@free.fr>
X-Provags-ID: V03:K1:OCbTnSpF6HgBTs4LwSeAuVW9hqHVJ81mj+bDxpGW3k8XCoIHQMy
 reEG2KKYyodDpw8eMNJoORmdYIi6wG/sfM3NaPNjwnDcETiusTZhwV0i0cdYqxUcxzudOK8
 2LntBAbDMgTw2Aus36ucDlcLzC7RoDIxV6A6bxFM5jTD0EeiTzcS29LNKFgrjYWJRHD6uDj
 IgVVr4sDQECFeP6/tKwSQ==
UI-OutboundReport: notjunk:1;M01:P0:hAlvrgJzA60=;fLAkXyxWYNkXfCely80owuBFlhN
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.at; 
 s=s31663417; t=1756064659; x=1756669459; i=dalang@gmx.at;
 bh=v0fmkEEvGOTnCVNH/heCSG8N0HNXJBRLhUeBDXWO6vM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=k64zQk7s/444o/HPvwGzdYTG0cHXQdWufbIxJRP8viIM0/Y949059ap0GyNDJXcE
 yExW4vZBPcdn2Uq7tBgQQG+clCh5ZYxGRWQdiLMXg+MAXQRu5J37rwUjSQz3kyOSq
 LnlEOaddlmaTDM+UO53fgR6kJvuSqtKPuM8tHu3g2WAGishgk2fLMWoV27IsNkDLm
 WCsHrGaNQE6tp66lVaqEWnOJzPi3HY8IpdjYaQAWiUOT2FrQBgtJ6o21muVnssCxD
 mnIWUqGRaAtkXl5AVZdqSmcEWg3478jbGMK8fP9TrTJvUa1Jxv+eu+QyJdiUn8TLE
 Cq6ARkvCeiIzIrVcIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.at
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.at header.i=dalang@gmx.at header.a=rsa-sha256
 header.s=s31663417 header.b=k64zQk7s
Subject: Re: [Buildroot] [PATCH] package/vim: security bump to version
 9.1.1665
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
From: Daniel Lang via buildroot <buildroot@buildroot.org>
Reply-To: Daniel Lang <dalang@gmx.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLAoKT24gOC8yMy8yNSAxNToxNywgSnVsaWVuIE9saXZhaW4gd3JvdGU6Cj4gSGkg
RGFuaWVsLAo+IAo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLgo+IAo+IE9uIDIzLzA4LzIwMjUgMDY6
NTQsIERhbmllbCBMYW5nIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4+IEZpeGVzIHRoZSBmb2xsb3dp
bmcgQ1ZFczoKPj4gLSBDVkUtMjAyNC00MTk1Nwo+PiAtIENWRS0yMDI0LTQxOTY1Cj4+IC0gQ1ZF
LTIwMjQtNDUzMDYKPj4gLSBDVkUtMjAyNC00NzgxNAo+PiAtIENWRS0yMDI1LTEyMTUKPj4gLSBD
VkUtMjAyNS0yMjEzNAo+PiAtIENWRS0yMDI1LTI0MDE0Cj4+IC0gQ1ZFLTIwMjUtMjY2MDMKPj4g
LSBDVkUtMjAyNS0yOTc2OAo+PiAtIENWRS0yMDI1LTUzOTA1Cj4+IC0gQ1ZFLTIwMjUtNTM5MDYK
Pj4KPj4gUkVBRE1FLnR4dCBnb3QgdXBkYXRlZCB0aHJlZSB0aW1lcyBzaW5jZSB0aGUgbGFzdCBi
dW1wOgo+PiAtIFswXSB1cGRhdGVkIHNvbWUgd29yZGluZyByZWdhcmRpbmcgd2hvIHRoZSBkZXZl
bG9wZXJzIGFyZS4KPj4gLSBbMV0gdXBkYXRlZCB0aGUgbGluayB0byB0aGUgcmVsZWFzZSBhcmNo
aXZlcwo+PiAtIFsyXSB1cGRhdGVkIHRoZSBnb2FscyBvZiB0aGUgcHJvamVjdAo+Pgo+PiBbMF06
IGh0dHBzOi8vZ2l0aHViLmNvbS92aW0vdmltL2NvbW1pdC9iNzU4MjVmNzQ5Y2Y4N2ZlYjlhZThl
N2U1MzI3YmQyZWZlNzA3Yzg2Cj4+IFsxXTogaHR0cHM6Ly9naXRodWIuY29tL3ZpbS92aW0vY29t
bWl0LzQyMjVmMjg4NTVjNWQzMDIzNjYyYjNhOTBhNzBiMjJjYWY5YjZhZGUKPj4gWzJdOiBodHRw
czovL2dpdGh1Yi5jb20vdmltL3ZpbS9jb21taXQvMmJmZDFlZTE2MWUyNmVjZThlNWE3MmNkY2E0
ZmZmMjJkMTE3MjhhMgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgTGFuZyA8ZGFsYW5nQGdt
eC5hdD4KPj4gLS0tCj4+IMKgcGFja2FnZS92aW0vdmltLmhhc2ggfCA0ICsrLS0KPj4gwqBwYWNr
YWdlL3ZpbS92aW0ubWvCoMKgIHwgMiArLQo+PiDCoDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS92aW0vdmlt
Lmhhc2ggYi9wYWNrYWdlL3ZpbS92aW0uaGFzaAo+PiBpbmRleCAxOTRiY2I0Mzc4Li5lNDMyZjQw
YTUzIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3ZpbS92aW0uaGFzaAo+PiArKysgYi9wYWNrYWdl
L3ZpbS92aW0uaGFzaAo+PiBAQCAtMSw0ICsxLDQgQEAKPj4gwqAjIExvY2FsbHkgY29tcHV0ZWQK
Pj4gLXNoYTI1NsKgIDAwNTY1MzdjYjU3MTkwYWE0MWMxMmJhNmMyYWQwNGNlMTBlN2Y3MTRjZGU0
YzFmZTcxOTNhMzdlMWM0NGRiNDbCoCB2aW0tOS4xLjAxNDUudGFyLmd6Cj4+ICtzaGEyNTbCoCA1
OTZjNzVhNWEyZDZmOTNjMTI5Y2M1M2M0NmZiZTlmYTBkY2FkMWFhYjY3NDIxZGM3MDdlYjk0NWQy
MmFmYTI0wqAgdmltLTkuMS4xNjY1LnRhci5nego+PiDCoHNoYTI1NsKgIDBiM2YxZjMzMGNiMWIx
NzliYjE3YzdjNjg3ZDRjZWM2MDFlMGFhMzQ2MmJjN2Y4OTBhZDRjMzg4OGQzN2Q3MjDCoCBMSUNF
TlNFCj4+IC1zaGEyNTbCoCA3YTJmNjIxYzg0OTYzOTZkYWU1ZWVjZGNjNGRjY2ZmOWQ1MzRkZmY0
NjI3MTkzZDNlYmY3ZmE2ZDJjYjI3MDQywqAgUkVBRE1FLnR4dAo+PiArc2hhMjU2wqAgZWUxZDA4
ODViYmM0YTk1YTI0ZTQ5ODczYTA3NTM5MWJkZjI2YjY5ZDEzNzU4ZTMwZjNkOTI3MWY4ZjQyYmQy
ZMKgIFJFQURNRS50eHQKPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdmltL3ZpbS5tayBiL3BhY2th
Z2UvdmltL3ZpbS5tawo+PiBpbmRleCA3ZDUxYTZkZGFiLi4zMWVhNjM3YThlIDEwMDY0NAo+PiAt
LS0gYS9wYWNrYWdlL3ZpbS92aW0ubWsKPj4gKysrIGIvcGFja2FnZS92aW0vdmltLm1rCj4+IEBA
IC00LDcgKzQsNyBAQAo+PiDCoCMKPj4gwqAKPj4gIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPj4K
Pj4gLVZJTV9WRVJTSU9OID0gOS4xLjAxNDUKPj4gK1ZJTV9WRVJTSU9OID0gOS4xLjE2NjUKPiAK
PiBXaGVuIHRlc3RpbmcgdGhpcyB2aW0gdmVyc2lvbiBpbiBxZW11X2FhcmNoNjRfdmlydF9kZWZj
b25maWcsCj4gc3RhcnRpbmcgdmltIG5vdyBzaG93IHRoZSBlcnJvcjoKPiAKPiBgYGAKPiBFcnJv
ciBkZXRlY3RlZCB3aGlsZSBwcm9jZXNzaW5nIC91c3Ivc2hhcmUvdmltL3ZpbTkxL3BsdWdpbi9u
ZXRyd1BsdWdpbi52aW06Cj4gbGluZcKgwqDCoCA3Ogo+IEU5MTk6IERpcmVjdG9yeSBub3QgZm91
bmQgaW4gJ3BhY2twYXRoJzogInBhY2svKi9vcHQvbmV0cnciCj4gUHJlc3MgRU5URVIgb3IgdHlw
ZSBjb21tYW5kIHRvIGNvbnRpbnVlCj4gYGBgCj4gCj4gSXMgdGhlcmUgc29tZXRoaW5nIG1pc3Np
bmc/CgpUaGFua3MgZm9yIGJyaW5naW5nIHRoaXMgdG8gbXkgYXR0ZW50aW9uLgpuZXRydyAodGhl
IGZpbGUgbWFuYWdlciBidWlsdCBpbnRvIHZpbSkgd2FzIHJlc3RydWN0dXJlZCAoc2VlIFswXSkK
YW5kIHRoZXJlZm9yZSB3ZSBuZWVkIHRvIGFsc28gcnVuIGluc3RhbGxwYWNrLgpJIHdpbGwgcHJl
cGFyZSB2Mi4KCj4gCj4+IMKgVklNX1NJVEUgPSAkKGNhbGwgZ2l0aHViLHZpbSx2aW0sdiQoVklN
X1ZFUlNJT04pKQo+PiDCoFZJTV9ERVBFTkRFTkNJRVMgPSBuY3Vyc2VzICQoVEFSR0VUX05MU19E
RVBFTkRFTkNJRVMpCj4+IMKgVklNX1NVQkRJUiA9IHNyYwo+IAo+IEl0IHdvdWxkIGJlIHByZWZl
cmFibGUgdGhhdCAidmltIiBjb3VsZCBzdGFydCB3aXRob3V0IGVycm9yLgo+IENvdWxkIHlvdSBo
YXZlIGEgbG9vaywgcGxlYXNlPwo+IAo+IEJlc3QgcmVnYXJkcywKPiAKPiBKdWxpZW4uCgpSZWdh
cmRzLApEYW5pZWwKClswXTogaHR0cHM6Ly9naXRodWIuY29tL3ZpbS92aW0vY29tbWl0LzljZmRh
YmIwNzRmZWVmYzk4NDhlOWY3YTQ1MzhmMjAxZTI4YzdmMDYKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
