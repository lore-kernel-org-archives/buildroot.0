Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E710CCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 16:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28B36613C7;
	Wed,  1 Oct 2025 16:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92Db1VNryak7; Wed,  1 Oct 2025 16:16:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F79A61383
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F79A61383;
	Wed,  1 Oct 2025 16:16:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B86BE26
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D19F83E00
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GECSPjhwHOKg for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 16:16:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.131;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CBE5C83DFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBE5C83DFD
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBE5C83DFD
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:16:46 +0000 (UTC)
Received: from [192.168.0.239] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mow4E-1uWbfi28FC-00gft1; Wed, 01 Oct 2025 18:11:28 +0200
Message-ID: <3a8aa803-51d1-418c-9ab6-7fc6501fb3f3@green-communications.fr>
Date: Wed, 1 Oct 2025 18:11:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Nosthoff <buildroot@heine.tech>, Dylan <ohitsdylan@outlook.com>
Cc: buildroot@buildroot.org
References: <PH3PPFC54E3486195A5EB083A4D386D83E1CBE6A@PH3PPFC54E34861.namprd19.prod.outlook.com>
 <36eaf2d2-2da7-f000-4851-c1129a701b13@heine.tech>
Content-Language: fr
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <36eaf2d2-2da7-f000-4851-c1129a701b13@heine.tech>
X-Provags-ID: V03:K1:ic6jeeUuTqjSnT9WheyqfpXspCIsiNUtjksNJ5ojfzL0kAIfVRc
 EYiWxOMezrLIEElEAjuGOUdJdNaTSMGkVc9vRt9H5xChvPg01XY2qHx0b9qrzZJzP4H99ke
 0H0UVHGAq7ERgOeoRCrOkrV7GM5IQDW8meySjmuWCvgQPJf6rHuy+SeRPsG4NIHRV2wZVcc
 vRwHen0tnqVKZ5McBAUFw==
UI-OutboundReport: notjunk:1;M01:P0:pgYX0HcVQ3c=;WVZF7D6cIsc6BUXnpHYaMnhWKyQ
 GiL2ehBFpQLuyiExlIpuqY2aEvWULQE0/tB9Tqe4aoCgNqUJSWcRwIFo482NeYMzEaEKT875V
 cntQn3DLbsertInYROTTbKWHA/yrbgQEA2AQovMlnoaD0WAteGlEdDj0I5LSZ6JCYE0ihgNc3
 8bAvYPwdCDj7mMB4ogVFemHRiPukP851n3wkBeAIDWWQUe2HXkfb/k8mrrBhBiZoJHYzVInZJ
 rQGQRaKr3CEJoc4HMcPUyV7kW+uwvyazjL3C1/HkzlGcFtzfVI5qgBWlSFRBmsG3TTdwpKtG0
 NOmABPk92SoTvcUWotSpdJpWSyKzMjMh8yPUZTUpbrNLoU8e6oWhAStjvlRos0nSrIzIO/NoC
 SlkSgmdbjuQC9Dn4c6wDUKWBiwsZOenooDJO2KPKPyS0iV/HqURH2NfKu0XSVUi+9w0Tcbpms
 lYuzMxKPKAMADNu9WI+K0OdkeX1KcjUkJvm3vl0WzskZ2Y6Wi/EiSTJcICFuSTYVR9+sOkY5K
 EZWntCorNc09G9ofMVuaoh462dauevN6NJGJ4oLYuOGOSRnDQrJVzSBA1aK4waPMOBZD0JgiD
 7DqT4OPGfJ/UPQFs3rvy0mN1S+7MNcFX0LH/TkR4Kgn0DaBa7+jWeFEypVLvvZsr1dvBKoWpw
 h9MPLkmPT5U1mw5tdThSJSxaTFP1zHIFf0cDRt3E1uQD2OoKJvnMJH2DGqU/hZOu3/HYS64AN
 qvV6K29VpZmuTgv+FmPCb5C2Dpee/u7rX3gKN+lZhpuSTPvkBhYvHmRwaiTz537dQKBRtPS1P
 TCyvfV/ZI5/HO65ceYhftv+SUXelWGYPRDejHwlltHiprOyPJa0JYTyL7KZkJe8AERmD3Rw76
 +7PG3+fX6jgC91E1nrEOQ8QgPG+DYUO9+WdnT9djLOU5Af4Qo/tX4kNSBSNpOuXimB46y7QI1
 yF0F86dPKefCPsfHjNH1DnabvEoUjNI/f3zoTFr65mTGcfTFf4sKL8/6oTYnik1eoxT+EqrEy
 uTo6FgYf7/IPRGsdZ6I/oXIWrqKlFj7GcKDZDQZbZ0sf+rt4DjCmQWRdD62529M5V3/wl2JT7
 za8rcBx+w8RuVYQa4RESdVU1WkFdiDwsSENct+oQmv2c1QA1sSNiriyIz4lPKqkv9QvSP8K1e
 qn02mDHLOm56SzXkO8Mn63FU6xuqXpTGJNkx3HSXltfTdn3qnmSZm3OLzJPsHCLk/KR9wXmL4
 7g2UFEa+PqRrgq3tl1zKiHmcM4kZi6ikOzE2CzMjXBk2Y5gocBci4DmccdvrTsGPQfQ1o6bUK
 iEhQyaSchWeicXbigF870Uvm6KDD4wAzj8hxyLaCfwLRsnt+m7BpIzihx9Em5YpenRu6+Aw/7
 tnCVpvECG90CtoHYlc4Ks/3f7ZciwI05A8AWgrIIextBebn7jpQHY4ckVVM+s7yH/deoZROH7
 Gnm+77HJ535SLVEFyR7QmPDq34KPngUfhKUcsJS5HmBolz/5O0wd1Os3ORm4IsYCSxv5gjBso
 /EpJlUk+Ad3+eir2aK8Jt7eXR6puvHJbsCp3v9nXBAtAO40nVJKyfYVAgC1f6Q3anwWxiM4x0
 G3cF73fQ3i3KsqzD+Ils26IwpoLj7JKKGjrGGv0vgmyYqMj6wqyzC+6nVc/avTxAUTLl00G4y
 w=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: Re: [Buildroot] Issue Applying Patches to Package
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTAvMS8yNSAxNjoxMSwgTWljaGFlbCBOb3N0aG9mZiB2aWEgYnVpbGRyb290IHdyb3RlOgo+
IEhpIER5bGFuLAo+IAo+IE9uIFdlZG5lc2RheSwgT2N0b2JlciAwMSwgMjAyNSAxNTo1NSBDRVNU
LCBEeWxhbiA8b2hpdHNkeWxhbkBvdXRsb29rLmNvbT4gd3JvdGU6Cj4gCj4+IEhlbGxvLAo+Pgo+
PiBJIGFtIHRyeWluZyB0byBwYXRjaCB0aGUgcHNwbGFzaCBwYWNrYWdlLiBJJ3ZlIGZvbGxvd2Vk
IHRoZSBCdWlsZHJvb3QKPj4gZG9jdW1lbnRhdGlvbiBhbmQgc2V0IHVwIGEgZ2xvYmFsIHBhdGNo
IGRpcmVjdG9yeSB3aXRoIHRoZSBwYWNrYWdlIG5hbWUKPj4gYW5kIHRoZSBwYXRjaGVzIHdpdGhp
bjoKPj4KPj4gL2hvbWUvZHlsYW4vcHJvamVjdF9uYW1lL2V4dGVybmFsL2JvYXJkL215X2JvYXJk
L3BhdGNoZXMKPj4g4pSU4pSA4pSAIHBzcGxhc2gKPj4gICDCoCDCoCDilJzilIDilIAgMDAwMS1w
c3BsYXNoLWNvbmZpZy5wYXRjaAo+PiAgIMKgIMKgIOKUnOKUgOKUgCAwMDAyLXBzcGxhc2gtY29s
b3JzLnBhdGNoCj4+ICAgwqAgwqAg4pSc4pSA4pSAIHBzcGxhc2gtY29sb3JzLmgKPj4gICDCoCDC
oCDilJzilIDilIAgcHNwbGFzaC1jb2xvcnMuaC5vcmlnCj4+ICAgwqAgwqAg4pSc4pSA4pSAIHBz
cGxhc2gtY29uZmlnLmgKPj4gICDCoCDCoCDilJTilIDilIAgcHNwbGFzaC1jb25maWcuaC5vcmln
Cj4+Cj4gCj4gSSBkb24ndCBzZWUgd2h5IHlvdSBpbmNsdWRlIHRoZSAuaCBhbmQgLmgub3JpZyBm
aWxlcyBpbnRvIHRoZSBwYXRjaCBkaXIuIFRoZSBjaGFuZ2VzIGFyZSBpbiB0aGUgLnBhdGNoIGZp
bGVzCj4gc28gb25seSB0aG9zZSBmaWxlcyBhcmUgcmVsZXZhbnQuCj4gCj4+IFdoZW4gQnVpbGRy
b290IHRyaWVzIHRvIHBhdGNoIHRoZSBwc3BsYXNoIHBhY2thZ2UsIGl0IHJldHVybnMgYW4gZXJy
b3IKPj4gbWVzc2FnZSwgImNhbid0IGZpbmQgZmlsZSB0byBwYXRjaCBhdCBpbnB1dCBsaW5lIDMi
Lgo+PiBJJ3ZlIGluY2x1ZGVkIHRoZSBvdXRwdXQgb2YgIm1ha2UgcHNwbGFzaC1wYXRjaCBWPTEi
IGluIHRoZSBwYXN0ZWJpbgo+PiBoZXJlOiBodHRwczovL3Bhc3RlLmFjay50Zi9jZTI2NzgKPj4K
Pj4gSSdtIG5vdCBzdXJlIHdoYXQgSSdtIGRvaW5nIHdyb25nIGhlcmU7IGl0IHNlZW1zIHRvIG1l
IHRoYXQgZXZlcnl0aGluZwo+PiBpcyBzZXQgdXAgY29ycmVjdGx5Lgo+Pgo+PiBJJ3ZlIGF0dGFj
aGVkIHRoZSBwYXRjaCBmaWxlcyBoZXJlLCBhcyB3ZWxsLgo+IAo+IFRoZSBpc3N1ZSBpcyBpbiB5
b3VyIHBhdGNoIGZpbGVzLgo+IAo+IC0tLSBwc3BsYXNoLWNvbmZpZy5oLm9yaWcgICAgICAgMjAy
NS0wOS0wMyAxNTowMToyMS4yODI1MzE3NjYgLTA0MDAKPiArKysgcHNwbGFzaC1jb25maWcuaCAg
ICAyMDI1LTA5LTAzIDE1OjEwOjE4LjQ0NTExNjA2NiAtMDQwMAo+IAo+IHNob3VsZCBiZQo+IAo+
IC0tLSBwc3BsYXNoLWNvbmZpZy5oICAgICAgIDIwMjUtMDktMDMgMTU6MDE6MjEuMjgyNTMxNzY2
IC0wNDAwCj4gKysrIHBzcGxhc2gtY29uZmlnLmggICAgMjAyNS0wOS0wMyAxNToxMDoxOC40NDUx
MTYwNjYgLTA0MDAKCkFjdHVhbGx5LCBidWlsZHJvb3QgdXNlcyAtcCAxLCBzbyBpdCBzaG91bGQg
YmUgZS5nLgoKLS0tIGEvcHNwbGFzaC1jb25maWcuaAorKysgYi9wc3BsYXNoLWNvbmZpZy5oCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
