Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44761C7EE2A
	for <buildroot@archiver.kernel.org>; Fri, 27 Jun 2025 15:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AC3040862;
	Fri, 27 Jun 2025 15:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUcwNsKE_chl; Fri, 27 Jun 2025 15:47:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30523408C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30523408C4;
	Fri, 27 Jun 2025 15:47:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F2FFD11A
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 15:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7237606E3
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 15:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_WntzjOtF8s for <buildroot@buildroot.org>;
 Fri, 27 Jun 2025 15:47:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 79EEE606B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79EEE606B9
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79EEE606B9
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 15:47:27 +0000 (UTC)
Received: from [192.168.2.2] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id VBISufz6mtr9dVBITuZYUq; Fri, 27 Jun 2025 17:47:25 +0200
Message-ID: <d42fbff7-1429-4691-ab57-8bded5c1fc3d@benettiengineering.com>
Date: Fri, 27 Jun 2025 17:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20250624204604.2199246-1-giulio.benetti@benettiengineering.com>
 <e588cb906285e712ff53b179c01b3621@free.fr>
Content-Language: en-US, it
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <e588cb906285e712ff53b179c01b3621@free.fr>
X-CMAE-Envelope: MS4xfHG1dy3lxXI4wYfCi39wEHKYalf5qGS2dwdT1puCWLQNrBHzc/TGkGcH6srTcAZ3TL+ekxE6yMrZpthhXlSgqBWh4hQuYKixkQn67kTaJEvev0bVjPQK
 yWuue3fj8AMt74rI49FrCsUC9zysHoWPhd8uU+3vMMCA8Jl7w6d1ZOCB/Mmldk8YW9rW789J8hCl7DYEr2//QXV6R5Uv1PhCFzLg9qF4/1tAYTntIMDhuO15
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1751039246; bh=eg2+fz87Z9hFyilxTp5OtHkKnCHZJEoHoU7FQinqxHs=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=J2FPbobHIJ4uhy9gC35GwzbXl1i/1aK8pmqr2wDjC55kV6cmLFy0n8bxzrZpTrrb9
 zz2gbgbNxPNwqjWFEPsvOa+1YN29yG8yusaxPONEFD3Kt9oN78XIvoRwTw6GUtbwdi
 2pJct3S5eLx73MAP6biodK48vtMnfdXFbIW7EScJh25BN2JhFXXgevfTGnqmN3bxJV
 T8d61NNOfLqZqSdhA/XHHQ49r48lMSDlv6GyeTsZaJnKDjsAeMGMDnEwQ4LRFtCZm8
 Bqnqje9tuahX/Qc1epMO6R9ItzC/b0UD4BeOPDiniYx8EwC6UBLNfDy3wjwi4ch6VX
 9E/9rxmGZCwuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=J2FPbobH
Subject: Re: [Buildroot] [PATCH] board/freescale/mxs: fix Linux booting
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

SGkgSnVsaWVuLAoKT24gNi8yNS8yNSAxOTo0NywgSnVsaWVuIE9saXZhaW4gd3JvdGU6Cj4gSGkg
R2l1bGlvLAo+IAo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoISAoYW5kIGdvb2QgY2F0Y2ghKQo+IAo+
IFVuZm9ydHVuYXRlbHksIGl0IGlzIG5vdCBmaXhpbmcgdGhlIGlzc3VlIGluIGl0cyBjdXJyZW50
IHN0YXRlLiBTZWUgYmVsb3cuCgpoYWQgdG8gdGVzdCBiZXR0ZXIgOi0vIGFuZC4uLgoKPiBPbiAy
NC8wNi8yMDI1IDIyOjQ2LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPj4gQWN0dWFsbHkgRFRCX0xJ
U1QgYWNjZXB0cyBvbmx5IGZpbGUgYW5kIG5vdCBmaWxlcyB3aXRoIHJlbGF0aXZlIHBhdGgKPj4g
cHJlcHJlbmRlZC4gVGhpcyBsZWFkcyB0byBoYXZlIHZmYXQgd2l0aG91dCAuZHRiIGZpbGVzIGFu
ZCBzbyBMaW51eAo+PiBkb2Vzbid0IHN0YXJ0LiBMZXQncyBmaXggdGhpcyBieSBpbmNsdWRpbmcg
c2xhc2ggaW4gc2VkIGNvbW1hbmQgYXMgZG9uZQo+PiBmb3IgbXhjLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNv
bT4KPj4gLS0tCj4+IMKgYm9hcmQvZnJlZXNjYWxlL2NvbW1vbi9teHMvcG9zdC1pbWFnZS5zaCB8
IDIgKy0KPj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pj4KPj4gZGlmZiAtLWdpdCBhL2JvYXJkL2ZyZWVzY2FsZS9jb21tb24vbXhzL3Bvc3QtaW1hZ2Uu
c2ggYi9ib2FyZC8gCj4+IGZyZWVzY2FsZS9jb21tb24vbXhzL3Bvc3QtaW1hZ2Uuc2gKPj4gaW5k
ZXggMGJmYjgzNWM2ZS4uNjUxNTRmYThlMCAxMDA3NTUKPj4gLS0tIGEvYm9hcmQvZnJlZXNjYWxl
L2NvbW1vbi9teHMvcG9zdC1pbWFnZS5zaAo+PiArKysgYi9ib2FyZC9mcmVlc2NhbGUvY29tbW9u
L214cy9wb3N0LWltYWdlLnNoCj4+IEBAIC03LDcgKzcsNyBAQAo+PiDCoCMKPj4gwqBkdGJfbGlz
dCgpCj4+IMKgewo+PiAtwqDCoMKgIGxvY2FsIERUQl9MSVNUPSIkKHNlZCAtbiAncy8gCj4+IF5C
UjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0iXChbYS16MC05IFwtXSpcKSIkL1wxL3An
IAo+PiAke0JSMl9DT05GSUd9KSIKPj4gK8KgwqDCoCBsb2NhbCBEVEJfTElTVD0iJChzZWQgLW4g
J3MvIAo+PiBeQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9IlwoW1wvYS16MC05IFwt
XSpcKSIkL1wxL3AnIAo+PiAke0JSMl9DT05GSUd9KSIKPiAKPiBXaXRoIHRoaXMgcGF0Y2ggYXBw
bGllZCwgd2hlbiB0ZXN0aW5nIHdpdGggaW14MjNldmtfZGVmY29uZmlnLCB0aGlzCj4gc2NyaXB0
IGdlbmVyYXRlcyBhbiBlcnJvcjoKPiAKPiAgwqDCoMKgIHNlZDogLWUgZXhwcmVzc2lvbiAjMSwg
Y2hhciAxNzogdW5rbm93biBvcHRpb24gdG8gYHMnCj4gCj4gd2hpY2ggaXMgaGlkZGVuIGJ5IHRo
ZSBzdWJzZXF1ZW50IGNvbW1hbmRzIHN1Y2NlZWRpbmcuIE1heWJlIGl0IHdvdWxkCj4gYmUgYmV0
dGVyIGlmIHRoZSBzY3JpcHQgd2FzIGFkZGluZyBhICJzZXQgLWUiIGF0IHRoZSBiZWdpbm5pbmc/
CgpBZGRlZCBvbiB2MiBhbmQuLi4KCj4gCj4gVGhlbiwgc2luY2UgdGhlIERUUyBmaWxlIG5hbWUg
Y2FuIGNvbnRhaW4gYSBzbGFzaCAiLyIgY2hhcmFjdGVyLCB0aGUKPiBzZWQgZXhwcmVzc2lvbiBz
aG91bGQgYmUgcmV3cml0dGVuIHVzaW5nIGFub3RoZXIgY2hhcmFjdGVyIChlLmcuCj4gInMjLi4u
Iy4uLiNwIikuCgpJbiBteGMgdGhleSBoYXZlIHJld29ya2VkIHVzaW5nIGRvdWJsZSBxdW90ZXMg
YW5kIHRoYXQgc2VlbXMgdG8gZG8gdGhlIAp0cmljay4gSXQgd29ya3MgZm9yIG1lIG5vdy4KCj4g
Cj4gRmluYWxseSwgdGhlIERUUyBmaWxlIG5hbWUgbWF5IGNvbnRhaW4gZGlyZWN0b3JpZXMgaW4g
dGhlIEtlcm5lbCB0cmVlLAo+IGJ1dCB0aGUgZmlsZSBpcyBjb3BpZWQgYXMgaXMgaW4gIm91dHB1
dC9pbWFnZXMvIi4gU28gb25seSB0aGUgYmFzZW5hbWUKPiBzaG91bGQgYmUga2VwdC4KPiAKPj4K
Pj4gwqDCoMKgwqAgZm9yIGR0IGluICREVEJfTElTVDsgZG8KPj4gwqDCoMKgwqDCoMKgwqDCoCBl
Y2hvIC1uICJcIiRkdC5kdGJcIiwgIgoKQWRkZWQgYmFzZW5hbWUgYXMgZG9uZSBpbiBteGMKCj4+
IC0tIAo+PiAyLjM5LjUKPiAKPiBDb3VsZCB5b3Ugc2VuZCBhbiB1cGRhdGVkIHBhdGNoIGFkZHJl
c3NpbmcgdGhvc2UgaXNzdWVzLCBwbGVhc2U/CgpKdXN0IGRvbmUsIGxldCBtZSBrbm93IGlmIGl0
IHdvcmtzIGZvciB5b3UuCgpLaW5kIHJlZ2FyZHMKLS0gCkdpdWxpbyBCZW5ldHRpCkNFTyZDVE9A
QmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKaHR0cHM6Ly93d3cubGlua2VkaW4uY29tL2NvbXBhbnkv
YmVuZXR0aS1lbmdpbmVlcmluZy1zYXMvCmh0dHBzOi8vd3d3LmxpbmtlZGluLmNvbS9pbi9naXVs
aW8tYmVuZXR0aS03OTk3NTk1MS8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
