Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18234C0218F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 15:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAB054178B;
	Fri, 31 Jan 2025 15:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TArS_TxnkRrL; Fri, 31 Jan 2025 15:08:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 271E64160F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 271E64160F;
	Fri, 31 Jan 2025 15:08:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DA5C12C
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 15:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 618AC60B79
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 15:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMZW44RLuvzw for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 15:08:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.56.136;
 helo=1.mo582.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0B5B760B45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B5B760B45
Received: from 1.mo582.mail-out.ovh.net (1.mo582.mail-out.ovh.net
 [46.105.56.136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B5B760B45
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 15:08:45 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.25.252])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4YkwSS3KqKz1Q8v
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 12:39:20 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-x9mvf (unknown [10.111.182.49])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id D39041FD53;
 Fri, 31 Jan 2025 12:39:19 +0000 (UTC)
Received: from armadeus.com ([37.59.142.107])
 by ghost-submission-5b5ff79f4f-x9mvf with ESMTPSA
 id lDlzF3fEnGcxHQAA3rxbFg
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Fri, 31 Jan 2025 12:39:19 +0000
X-OVh-ClientIp: 89.85.240.220
Message-ID: <269e2cc8-0e66-482b-844c-a18e2a1a66a1@armadeus.com>
Date: Fri, 31 Jan 2025 13:39:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20250117-add-wlr-randr-package-v1-1-02329e65c76f@armadeus.com>
 <149b15e0-0d95-4dfa-81ce-a4157e42f64a@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Autocrypt: addr=sebastien.szymanski@armadeus.com; keydata=
 xsBNBFNfZLEBCACv1lqSePHJNpRgcnER+3emy+Arjz84zFax3XkogjY/e3ZneihIgWrVKe5M
 ql16pX4KTkzNgMUKz4bG/XwT3kjcrXshxFLlg7KrHMl287C+W+QOUjnjVeRi/su+SPmjz8VD
 yr11h+ZkVLAWhS+uQJ93jy1NwG8M4t1kBLAVHHD5Vw4FJ+3ouaVYIp1X1Cr8bVKQw33Q1aTd
 ro0kMBb96B9vNu7ciJZ3gvlaBzUEKOgNnq9KaywuLnqrqr4HUIn5JuxZjCjJzt9kTAKcTfp2
 cJM8qpp+2FF5qtbkse9fZ6M64qozgOPr9Tk4Amf9fZEUQ6UNw14mmBZuXSzoHe75gI7TABEB
 AAHNN1PDqWJhc3RpZW4gU1pZTUFOU0tJIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVz
 LmNvbT7CwJAEEwEIADoCGyMHCwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgBYhBJwGygpYm/1C
 /GCmwbCaKeiBMmTiBQJdhIHLAAoJELCaKeiBMmTixXIH/2W3kbzRG0UF81jtRRnp0H83rjDT
 v0H+8fgFMRL/7HCJ1QPArkfRJlM2wlJkN+ChP09CCarYfUEHfRCHlTb7At6Yyrz1jziD7ZwX
 8IWHYRXnZkY5eZc5DsiUgq6JH49kt+GPzK8UVP9MTa6zkBpPCUf7LzZ4pD3FihdkT52BU3gI
 d9P49fSI0TYySlb/VKn815aOhvwEr7+Dh3mZUjSh7saofbRmVUOr7p+R3MvvGI19/IJZjeOE
 ZWliODDOt6HnBOtoGSXMcNIFF6snH52D5N5gY88njZjTwhgGGUBix1bsgf/EY0v4R5itZBXB
 B/Ze4Tm++YHaB75hZK6PQu/YRv7OwE0EU19ksQEIALo7jhXddrXBTRu5SAjelV53jyHBJTX/
 vN4nL/VbbW/saca+NJjDSxx5DBmotZbQdWIyZiSIjU/xnTREvtDrl6ZeSsKWd7ZqiuiY4fSR
 zwuQp9rd0yqRuxesrWeyJB1zCSdEvLyKASERt+nxkOA+IzJ4y1qLtvnWr+SL1AXgTMw+Tkyw
 KIDCRWHTIYas11ldGj82gOIpYeXnapeNLHfT4EQwg0NeWYHynJxAQWiX5aPlw0uSpAQSsBXQ
 FIe3fpoveMSnXK+PG2BBOzexYv7r4S70a6sF9sgTTPpfKqUaqqC+u1+bUX6alTAKhGKJywaF
 6ViqLlgY8PfwohSyAlqlTRMAEQEAAcLAdgQYAQgAIAIbDBYhBJwGygpYm/1C/GCmwbCaKeiB
 MmTiBQJdhIHSAAoJELCaKeiBMmTitU8IAK7NQM3fEwaF5XaKtepYWsVka44CD8A9e4r7NVK9
 ugirKvXirIxBSDmN/Db862NmVpITsZ6ERNSNZLm/7k55N+TexKYiFZeU7G92TEfAM6qPElvx
 DLEcrkNMq9r08YZeUloacsq31AL5fK4LW+xdvXudkdiKRMJsdTpmff3x5kIziGOHjwFP9wve
 ZgEH52gpbRsP8Whx/Z2lNX/BBRmFM8OnEXFsjjqDzYThdxTq85wGPpkgvvUGyPNRD7TpbB1C
 pajOUUkPxgj5LKt77HD1afeZNudWhgcdkbtT5PMQTT0WY6wvMEj9S1+bGPeXRGWLYB7gHQ+L
 JNoSD7Kz6Y9qnKo=
In-Reply-To: <149b15e0-0d95-4dfa-81ce-a4157e42f64a@gmx.de>
X-Ovh-Tracer-Id: 14157065431169493877
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfesthekredttddvjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhephfegudegveelleejudefteehleefgeekudfggefgleejvedtffehkefhjeefleetnecuffhomhgrihhnpehsrhdrhhhtnecukfhppeduvdejrddtrddtrddupdekledrkeehrddvgedtrddvvddtpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkedvmgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=sBR1it2n1NCFViclIX75gz1tgnAHcvoFT6CRHYdq/Yo=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738327160; v=1;
 b=D3mTqYYPKVu3gPbsST8OMoVUlAKUYZVDzcuektfj9rs9iTwNx9QcLrtYAimWwaDG4D658fOv
 A7EVBAj+0FqBV6/PdDbD9BZ1pSnV78Iy/pYa60trUxVUva4buz0YKQflwc8bEB7BuM+G/EoAihF
 BHK+o3StcNXSBXfJj7KPjce4rBNLXMjV1SgsFIFekfUc8fa+x2qV1tFnGFKtMzj/POlsgvacZ8L
 2+PD9Vcg7pkHlA12GiDNvj2nGweI2RzbGg+ctZrARxgM3qi4v4SAvKYb6HFI05jkOBOxzjbccpe
 PkXw11NhWd7vXbgpKZ7yjzRX4Pw4F6xs0jesF740V2G5g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=D3mTqYYP
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001dbfb39a1-1566-4f29-9308-ec5cd9a6da4b,
 A753F2F03190AFFFA0B706D5F1E8190A5B9835AD)
 smtp.auth=sebastien.szymanski@armadeus.com
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRmlvbmEsCgpPbiAxLzI0LzI1IDE6MzMgUE0sIEZpb25hIEtsdXRlIHdyb3RlOgo+IEhpIFPD
qWJhc3RpZW4sCj4gCj4gdGhhbmtzIGZvciBwYWNrYWdpbmcgd2xyLXJhbmRyISBPbmUgbml0IGJl
bG93LCBidXQgZWl0aGVyIHdheToKPiAKPiBUZXN0ZWQtYnk6IEZpb25hIEtsdXRlIChXSVdBKSA8
ZmlvbmEua2x1dGVAZ214LmRlPgoKVGhhbmsgeW91ciBmb3IgdGVzdGluZyB0aGUgcGFja2FnZSEK
Cj4gCj4gQmVzdCByZWdhcmRzLAo+IEZpb25hCj4gCj4gQW0gMTcuMDEuMjUgdW0gMjM6MTYgc2No
cmllYiBTw6liYXN0aWVuIFN6eW1hbnNraToKPj4gVXRpbGl0eSB0byBtYW5hZ2Ugb3V0cHV0cyBv
ZiBhIFdheWxhbmQgY29tcG9zaXRvci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBT
enltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgo+PiAtLS0KPj4gwqAg
REVWRUxPUEVSU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oCAxICsKPj4gwqAgcGFja2FnZS9Db25maWcuaW7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDEgKwo+PiDCoCBwYWNrYWdlL3dsci1yYW5kci9Db25maWcuaW7CoMKgwqDCoMKgIHzC
oCA3ICsrKysrKysKPj4gwqAgcGFja2FnZS93bHItcmFuZHIvd2xyLXJhbmRyLmhhc2ggfMKgIDUg
KysrKysKPj4gwqAgcGFja2FnZS93bHItcmFuZHIvd2xyLXJhbmRyLm1rwqDCoCB8IDE0ICsrKysr
KysrKysrKysrCj4+IMKgIDUgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPj4gaW5kZXggCj4+IDJkOGFlODI4
OWI3NmEzMjIwOWFlY2FhM2ZlNTc1YTE1YzRhODdhNzMuLjEyOTI3OTBlYzYwMGFjNjVjYTJmYzU2
OWMwZmRmM2QwNzhkOWRmNmUgMTAwNjQ0Cj4+IC0tLSBhL0RFVkVMT1BFUlMKPj4gKysrIGIvREVW
RUxPUEVSUwo+PiBAQCAtMjkyNCw2ICsyOTI0LDcgQEAgRjrCoMKgwqAgY29uZmlncy9hcm1hZGV1
cyoKPj4gwqAgRjrCoMKgwqAgcGFja2FnZS9tbWMtdXRpbHMvCj4+IMKgIEY6wqDCoMKgIHBhY2th
Z2UvcHl0aG9uLWZsYXNrLWpzb25ycGMvCj4+IMKgIEY6wqDCoMKgIHBhY2thZ2UvcHl0aG9uLWZs
YXNrLWxvZ2luLwo+PiArRjrCoMKgwqAgcGFja2FnZS93bHItcmFuZHIvCj4+IMKgIEY6wqDCoMKg
IHBhY2thZ2UvcXQ1L3F0NWNoYXJ0cy8KPj4KPj4gwqAgTjrCoMKgwqAgU2VteW9uIEtvbGdhbm92
IDxzZW1lbmFrOTRAbWFpbC5ydT4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIv
cGFja2FnZS9Db25maWcuaW4KPj4gaW5kZXggCj4+IDQwMDE4MzUxNmU2NTllYzk4Y2FjYzAxZDkz
OWViOTZlZTcxNWFiMmQuLmExYTI4NzE0OTE4NjkwMjIzNTNjZDkyMTc0NTdjMjQ1NWJkMTMwMjIg
MTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCj4+ICsrKyBiL3BhY2thZ2UvQ29uZmln
LmluCj4+IEBAIC0yNzgzLDYgKzI3ODMsNyBAQCBjb21tZW50ICJVdGlsaXRpZXMiCj4+IMKgwqDC
oMKgwqAgc291cmNlICJwYWNrYWdlL3RtdXgvQ29uZmlnLmluIgo+PiDCoMKgwqDCoMKgIHNvdXJj
ZSAicGFja2FnZS90dHlkL0NvbmZpZy5pbiIKPj4gwqDCoMKgwqDCoCBzb3VyY2UgInBhY2thZ2Uv
d2hpY2gvQ29uZmlnLmluIgo+PiArwqDCoMKgIHNvdXJjZSAicGFja2FnZS93bHItcmFuZHIvQ29u
ZmlnLmluIgo+IAo+IFRoaXMgcHV0cyB3bHItcmFuZHIgaW50byB0aGUgIlRhcmdldCBwYWNrYWdl
cyA+IFNoZWxsIGFuZCB1dGlsaXRpZXMiCj4gc2VjdGlvbi4gSSB0aGluayBpdCdkIGJlIGJldHRl
ciBwbGFjZWQgaW4gIlRhcmdldCBwYWNrYWdlcyA+IEdyYXBoaWMKPiBsaWJyYXJpZXMgYW5kIGFw
cGxpY2F0aW9ucyAoZ3JhcGhpYy90ZXh0KSIuCgpJbmRlZWQhIEZpeGVkIGluIHYyLgoKUmVnYXJk
cywKCj4gCj4+IMKgwqDCoMKgwqAgc291cmNlICJwYWNrYWdlL3d0ZnV0aWwvQ29uZmlnLmluIgo+
PiDCoMKgwqDCoMKgIHNvdXJjZSAicGFja2FnZS94bWxzdGFybGV0L0NvbmZpZy5pbiIKPj4gwqDC
oMKgwqDCoCBzb3VyY2UgInBhY2thZ2UveHhoYXNoL0NvbmZpZy5pbiIKPj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2Uvd2xyLXJhbmRyL0NvbmZpZy5pbiBiL3BhY2thZ2Uvd2xyLXJhbmRyL0NvbmZpZy5p
bgo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAKPj4gMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uNDU2Yzg0NTQ5YjY1OTdmNTUxNmU4MWEyM2Y0ZGE5MzI5
MTE5Y2I4OAo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3BhY2thZ2Uvd2xyLXJhbmRyL0NvbmZp
Zy5pbgo+PiBAQCAtMCwwICsxLDcgQEAKPj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9XTFJfUkFORFIK
Pj4gK8KgwqDCoCBib29sICJ3bHItcmFuZHIiCj4+ICvCoMKgwqAgZGVwZW5kcyBvbiBCUjJfUEFD
S0FHRV9XQVlMQU5EICMgd2F5bGFuZC1jbGllbnQKPj4gK8KgwqDCoCBoZWxwCj4+ICvCoMKgwqDC
oMKgIFV0aWxpdHkgdG8gbWFuYWdlIG91dHB1dHMgb2YgYSBXYXlsYW5kIGNvbXBvc2l0b3IuCj4+
ICsKPj4gK8KgwqDCoMKgwqAgaHR0cHM6Ly9naXQuc3IuaHQvfmVtZXJzaW9uL3dsci1yYW5kcgo+
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93bHItcmFuZHIvd2xyLXJhbmRyLmhhc2ggYi9wYWNrYWdl
L3dsci1yYW5kci93bHItIAo+PiByYW5kci5oYXNoCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+
IGluZGV4IAo+PiAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwLi44MGNm
ZGUwNjMzODM2ZTRlZmZhMmQ1MmI0MTc3MzFhOTM3NDYzYWIyCj4+IC0tLSAvZGV2L251bGwKPj4g
KysrIGIvcGFja2FnZS93bHItcmFuZHIvd2xyLXJhbmRyLmhhc2gKPj4gQEAgLTAsMCArMSw1IEBA
Cj4+ICsjIEhhc2ggZnJvbSBodHRwczovL2dpdC5zci5odC9+ZW1lcnNpb24vd2xyLXJhbmRyL3Jl
ZnMvdjAuNC4xCj4+ICtzaGEyNTYgIAo+PiBmZDU3ODMwMDJjMTNkMzcyNjc4OThlNTcxZjAzYjYx
ODM2M2QxMzk1MmEyNjRjZjNkNjFhMzUzODM4NjlkNjMxwqAgd2xyLSAKPj4gcmFuZHItMC40LjEu
dGFyLmd6Cj4+ICsKPj4gKyMgSGFzaCBmb3IgbGljZW5zZSBmaWxlczoKPj4gK3NoYTI1NiAgCj4+
IDdmM2U4NDRhNTUwZGE3NGQ1ZjBhNjM1YWUxMjYzY2I3ZGFmZGE3YmQxNWFjMzczNjRkZGRlODVk
ZTgzYTc4YzfCoCBMSUNFTlNFCj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dsci1yYW5kci93bHIt
cmFuZHIubWsgYi9wYWNrYWdlL3dsci1yYW5kci93bHItIAo+PiByYW5kci5tawo+PiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAKPj4gMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMC4uMjI3OWUyMjkyNjhlM2Y1OTI4NTAyZTJmNTkxNjUyZGIxZWIxZWI0NQo+PiAt
LS0gL2Rldi9udWxsCj4+ICsrKyBiL3BhY2thZ2Uvd2xyLXJhbmRyL3dsci1yYW5kci5tawo+PiBA
QCAtMCwwICsxLDE0IEBACj4+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+PiArIwo+PiArIyB3
bHItcmFuZHIKPj4gKyMKPj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4+ICsKPj4gK1dMUl9S
QU5EUl9WRVJTSU9OID0gMC40LjEKPj4gK1dMUl9SQU5EUl9TSVRFID0gaHR0cHM6Ly9naXQuc3Iu
aHQvfmVtZXJzaW9uL3dsci1yYW5kci9yZWZzL2Rvd25sb2FkLyAKPj4gdiQoV0xSX1JBTkRSX1ZF
UlNJT04pCj4+ICtXTFJfUkFORFJfTElDRU5TRSA9IE1JVAo+PiArV0xSX1JBTkRSX0xJQ0VOU0Vf
RklMRVMgPSBMSUNFTlNFCj4+ICsjIGhvc3Qtd2F5bGFuZCBpcyBmb3Igd2F5bGFuZC1zY2FubmVy
Cj4+ICtXTFJfUkFORFJfREVQRU5ERU5DSUVTID0gaG9zdC1wa2djb25mIGhvc3Qtd2F5bGFuZCB3
YXlsYW5kCj4+ICsKPj4gKyQoZXZhbCAkKG1lc29uLXBhY2thZ2UpKQo+Pgo+PiAtLS0KPj4gYmFz
ZS1jb21taXQ6IGNmZTBlOTQ1YjMwZWM2MWVkZGM2YjhlYTU3MjExODYzMGNmZDFjYjEKPj4gY2hh
bmdlLWlkOiAyMDI1MDExNy1hZGQtd2xyLXJhbmRyLXBhY2thZ2UtYWQ2MTc4MTFhM2EyCj4+Cj4+
IEJlc3QgcmVnYXJkcywKPiAKCgotLSAKU8OpYmFzdGllbiBTenltYW5za2ksIEFybWFkZXVzIFN5
c3RlbXMKU29mdHdhcmUgZW5naW5lZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
