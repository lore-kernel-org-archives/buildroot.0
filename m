Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EA5C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 12:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55D9082135;
	Fri, 24 Jan 2025 12:33:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hoJXwFpfA-ds; Fri, 24 Jan 2025 12:33:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F0C58213D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F0C58213D;
	Fri, 24 Jan 2025 12:33:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EAE394A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 12:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2B416FB8B
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 12:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wl0TiR5pj70F for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 12:33:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2DBAE6FB7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DBAE6FB7F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DBAE6FB7F
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 12:33:10 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.116.19]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MI5Q5-1tg2NQ0u5X-001Z5e; Fri, 24
 Jan 2025 13:33:07 +0100
Message-ID: <149b15e0-0d95-4dfa-81ce-a4157e42f64a@gmx.de>
Date: Fri, 24 Jan 2025 13:33:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
References: <20250117-add-wlr-randr-package-v1-1-02329e65c76f@armadeus.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250117-add-wlr-randr-package-v1-1-02329e65c76f@armadeus.com>
X-Provags-ID: V03:K1:AekqWsTysTbQicEbnzphn5XUPpm40KJSYPXSh/0HJjPcwFyOgXU
 eOrOUtgNnM84xtvQa5v5kuk//99DOye5os/UWMQ9KRAQBOpyvL+PzfxwlZtGug1QzEAY/xC
 qeHEE5sIeI784RLhG7FhR/yq5fUWTGwoHPgpLKjGnrmuRap3ZLa84qzYb86EJ56bPAtxpyv
 b63LYt5A0XGY8mpaF0aKQ==
UI-OutboundReport: notjunk:1;M01:P0:UaZr7ZcYcx4=;QLT9pJNjJGkyARExgE75tG+8vxN
 DUQQtnT0g1zrUhUIKRPoc+lLJBrwXw4h5rb3Gxtu2c+SmHlmyPigRVEgwkZ2AyHi1t8NJnRY9
 u1WgEYcR1avRk1fq+ElHb8R9IwNztvg2k7snAQH07SOYx/XEx3P5U+SrDMzyah160X5h0zksV
 LC6WMHKrSh1UZKa9q1+I3fPMRtqdpK4Dowq4OUiPrSH/NVoMVM0vFZwltgKXLxsjs3n+yRNTD
 v1ufY/5FHh9+MHUM7W+d3YgdNmGX6M/krjNBitefutVCNPx+MyWtwVfp8nPc3pUc2qGpxo1Q9
 ZujK67ZolSCxoM8HawrGzvuPNRmS5dAqUrWupifIBeTfqcax5x2utFXYNyurqdJx05E1Um66m
 CaH10l2bxtCdGpzDxTWa/40o+Yef3bJVy8RfbY6LKiZH/cx0WC17kkKjgnueR6VJN8GZrzSix
 /+ID5Rm8uxP7z0mlPIOAQJHCnf9izGSD9Q4WrvRER3P9WMQjRsJaHBDlwXRYSaxfwkc471sm/
 k3mUzdb8pfwg1762vbj+L4DZ0x15PQsK1hDRv5r0Jk2Wd2oE2pACmQ5u9X9UUtZNgDweaQgOh
 L6IWDYbTba/8rNLmJrd8vfetHb4nLB/8pl9SbXsxu0CNUDkUyYoEVdtr1OpFiw8bD6d7yjSJJ
 PNzaVshWj/hKVj2Ci2x9hzc7rZmR3IBH8HWxEAbOAioLIn4P9c9n64C//QtkLu8Zv1QNFvuMc
 2dIb2vs7p/BZWVuLOqPuNhzVY5C1Ki6oU8/WprozJqTdJ5p8Bx/B9OzQAOqZa99kf7P10fnrZ
 eBRPTFukkJxl5vDu9lGPJmW8MzGqNPIbd6po2e8SZCwQvvE8vmnlns79maxI+oSRSuF6yxtNS
 cjilBRIBN7wzG6rYlI1YtQLX9iz1fc/ZymmKTZCjyc/kczSmCpyLWgQVE/4uByUTu3Y8q4Uc0
 GKQHp6VRkkoJHHeq9z2TGAVL/b3u+FOJCR1XGSUl1HaKzcpF2ogVCzrCt6IiazGINQYkvDHAT
 0ZfvO072gRwynylnxG0qqZHd0ySKb5KsFpRQiBTwcvr0BlpjWna9ZM4qR2YwQT9NzQGSTbR0Z
 cxvVpfaxcvfNlkaczThDfNT5U6VdYj8becNwcvWQywMD57WqHSeDKmuilX7mmNBOAEuklseru
 yEOZBp1ZujF6H7k4wPAg12+PQ7l35qxdJneIXce/ApQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1737721987; x=1738326787; i=fiona.klute@gmx.de;
 bh=syweCWNPEtrfI+WppgWWIEwD4/cXABcPsWGR6y1vF4E=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=nxH3mUhzgfspJ9Qn/2AfvP5nJ9F4g05tn4zIXouuJ6RYmPIBJ9oOrP9z3fucai3W
 LCPNlI6sUrYlPgzCOLeRWnj88PvRxkD+PctQ3f9KxaLksIX7CvUKS3zqG8SGSJgUI
 8ZgIjxI0qAaPoISBUQuZ0LHNJTIGuCt7aqEB70kYKsgaiQTih3OoPXIre4s1ZmOv+
 vN5PFEymDBgw6O9aUdvWYDYgqz+fhDG6wxVt4MqwspCrwHww2prVZWAEMis7DOsW2
 hRkZnqmVqEB2FIQiNuGpZGtc/Xdu7gSPZubISO3ds+gwLM3Jg9B5rYr/8qbiOOBuR
 i9l7yl9/sd7NowXIyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=nxH3mUhz
Subject: Re: [Buildroot] [PATCH] package/wlr-randr: new package
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

SGkgU8OpYmFzdGllbiwKCnRoYW5rcyBmb3IgcGFja2FnaW5nIHdsci1yYW5kciEgT25lIG5pdCBi
ZWxvdywgYnV0IGVpdGhlciB3YXk6CgpUZXN0ZWQtYnk6IEZpb25hIEtsdXRlIChXSVdBKSA8Zmlv
bmEua2x1dGVAZ214LmRlPgoKQmVzdCByZWdhcmRzLApGaW9uYQoKQW0gMTcuMDEuMjUgdW0gMjM6
MTYgc2NocmllYiBTw6liYXN0aWVuIFN6eW1hbnNraToKPiBVdGlsaXR5IHRvIG1hbmFnZSBvdXRw
dXRzIG9mIGEgV2F5bGFuZCBjb21wb3NpdG9yLgo+Cj4gU2lnbmVkLW9mZi1ieTogU8OpYmFzdGll
biBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgo+IC0tLQo+ICAg
REVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gICBwYWNrYWdlL0NvbmZp
Zy5pbiAgICAgICAgICAgICAgICB8ICAxICsKPiAgIHBhY2thZ2Uvd2xyLXJhbmRyL0NvbmZpZy5p
biAgICAgIHwgIDcgKysrKysrKwo+ICAgcGFja2FnZS93bHItcmFuZHIvd2xyLXJhbmRyLmhhc2gg
fCAgNSArKysrKwo+ICAgcGFja2FnZS93bHItcmFuZHIvd2xyLXJhbmRyLm1rICAgfCAxNCArKysr
KysrKysrKysrKwo+ICAgNSBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPiBpbmRleCAyZDhhZTgyODliNzZhMzIy
MDlhZWNhYTNmZTU3NWExNWM0YTg3YTczLi4xMjkyNzkwZWM2MDBhYzY1Y2EyZmM1NjljMGZkZjNk
MDc4ZDlkZjZlIDEwMDY0NAo+IC0tLSBhL0RFVkVMT1BFUlMKPiArKysgYi9ERVZFTE9QRVJTCj4g
QEAgLTI5MjQsNiArMjkyNCw3IEBAIEY6CWNvbmZpZ3MvYXJtYWRldXMqCj4gICBGOglwYWNrYWdl
L21tYy11dGlscy8KPiAgIEY6CXBhY2thZ2UvcHl0aG9uLWZsYXNrLWpzb25ycGMvCj4gICBGOglw
YWNrYWdlL3B5dGhvbi1mbGFzay1sb2dpbi8KPiArRjoJcGFja2FnZS93bHItcmFuZHIvCj4gICBG
OglwYWNrYWdlL3F0NS9xdDVjaGFydHMvCj4KPiAgIE46CVNlbXlvbiBLb2xnYW5vdiA8c2VtZW5h
azk0QG1haWwucnU+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9D
b25maWcuaW4KPiBpbmRleCA0MDAxODM1MTZlNjU5ZWM5OGNhY2MwMWQ5MzllYjk2ZWU3MTVhYjJk
Li5hMWEyODcxNDkxODY5MDIyMzUzY2Q5MjE3NDU3YzI0NTViZDEzMDIyIDEwMDY0NAo+IC0tLSBh
L3BhY2thZ2UvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiBAQCAtMjc4Myw2
ICsyNzgzLDcgQEAgY29tbWVudCAiVXRpbGl0aWVzIgo+ICAgCXNvdXJjZSAicGFja2FnZS90bXV4
L0NvbmZpZy5pbiIKPiAgIAlzb3VyY2UgInBhY2thZ2UvdHR5ZC9Db25maWcuaW4iCj4gICAJc291
cmNlICJwYWNrYWdlL3doaWNoL0NvbmZpZy5pbiIKPiArCXNvdXJjZSAicGFja2FnZS93bHItcmFu
ZHIvQ29uZmlnLmluIgoKVGhpcyBwdXRzIHdsci1yYW5kciBpbnRvIHRoZSAiVGFyZ2V0IHBhY2th
Z2VzID4gU2hlbGwgYW5kIHV0aWxpdGllcyIKc2VjdGlvbi4gSSB0aGluayBpdCdkIGJlIGJldHRl
ciBwbGFjZWQgaW4gIlRhcmdldCBwYWNrYWdlcyA+IEdyYXBoaWMKbGlicmFyaWVzIGFuZCBhcHBs
aWNhdGlvbnMgKGdyYXBoaWMvdGV4dCkiLgoKPiAgIAlzb3VyY2UgInBhY2thZ2Uvd3RmdXRpbC9D
b25maWcuaW4iCj4gICAJc291cmNlICJwYWNrYWdlL3htbHN0YXJsZXQvQ29uZmlnLmluIgo+ICAg
CXNvdXJjZSAicGFja2FnZS94eGhhc2gvQ29uZmlnLmluIgo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3dsci1yYW5kci9Db25maWcuaW4gYi9wYWNrYWdlL3dsci1yYW5kci9Db25maWcuaW4KPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAuLjQ1NmM4NDU0OWI2NTk3ZjU1MTZlODFhMjNmNGRhOTMyOTExOWNiODgKPiAtLS0g
L2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS93bHItcmFuZHIvQ29uZmlnLmluCj4gQEAgLTAsMCAr
MSw3IEBACj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9XTFJfUkFORFIKPiArCWJvb2wgIndsci1yYW5k
ciIKPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfV0FZTEFORCAjIHdheWxhbmQtY2xpZW50Cj4g
KwloZWxwCj4gKwkgIFV0aWxpdHkgdG8gbWFuYWdlIG91dHB1dHMgb2YgYSBXYXlsYW5kIGNvbXBv
c2l0b3IuCj4gKwo+ICsJICBodHRwczovL2dpdC5zci5odC9+ZW1lcnNpb24vd2xyLXJhbmRyCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd2xyLXJhbmRyL3dsci1yYW5kci5oYXNoIGIvcGFja2FnZS93
bHItcmFuZHIvd2xyLXJhbmRyLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjgwY2ZkZTA2MzM4MzZlNGVm
ZmEyZDUyYjQxNzczMWE5Mzc0NjNhYjIKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS93
bHItcmFuZHIvd2xyLXJhbmRyLmhhc2gKPiBAQCAtMCwwICsxLDUgQEAKPiArIyBIYXNoIGZyb20g
aHR0cHM6Ly9naXQuc3IuaHQvfmVtZXJzaW9uL3dsci1yYW5kci9yZWZzL3YwLjQuMQo+ICtzaGEy
NTYgIGZkNTc4MzAwMmMxM2QzNzI2Nzg5OGU1NzFmMDNiNjE4MzYzZDEzOTUyYTI2NGNmM2Q2MWEz
NTM4Mzg2OWQ2MzEgIHdsci1yYW5kci0wLjQuMS50YXIuZ3oKPiArCj4gKyMgSGFzaCBmb3IgbGlj
ZW5zZSBmaWxlczoKPiArc2hhMjU2ICA3ZjNlODQ0YTU1MGRhNzRkNWYwYTYzNWFlMTI2M2NiN2Rh
ZmRhN2JkMTVhYzM3MzY0ZGRkZTg1ZGU4M2E3OGM3ICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2Uvd2xyLXJhbmRyL3dsci1yYW5kci5tayBiL3BhY2thZ2Uvd2xyLXJhbmRyL3dsci1yYW5k
ci5tawo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMC4uMjI3OWUyMjkyNjhlM2Y1OTI4NTAyZTJmNTkxNjUyZGIxZWIx
ZWI0NQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3dsci1yYW5kci93bHItcmFuZHIu
bWsKPiBAQCAtMCwwICsxLDE0IEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiAr
IyB3bHItcmFuZHIKPiArIwo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsKPiArV0xSX1JB
TkRSX1ZFUlNJT04gPSAwLjQuMQo+ICtXTFJfUkFORFJfU0lURSA9IGh0dHBzOi8vZ2l0LnNyLmh0
L35lbWVyc2lvbi93bHItcmFuZHIvcmVmcy9kb3dubG9hZC92JChXTFJfUkFORFJfVkVSU0lPTikK
PiArV0xSX1JBTkRSX0xJQ0VOU0UgPSBNSVQKPiArV0xSX1JBTkRSX0xJQ0VOU0VfRklMRVMgPSBM
SUNFTlNFCj4gKyMgaG9zdC13YXlsYW5kIGlzIGZvciB3YXlsYW5kLXNjYW5uZXIKPiArV0xSX1JB
TkRSX0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZiBob3N0LXdheWxhbmQgd2F5bGFuZAo+ICsK
PiArJChldmFsICQobWVzb24tcGFja2FnZSkpCj4KPiAtLS0KPiBiYXNlLWNvbW1pdDogY2ZlMGU5
NDViMzBlYzYxZWRkYzZiOGVhNTcyMTE4NjMwY2ZkMWNiMQo+IGNoYW5nZS1pZDogMjAyNTAxMTct
YWRkLXdsci1yYW5kci1wYWNrYWdlLWFkNjE3ODExYTNhMgo+Cj4gQmVzdCByZWdhcmRzLAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
