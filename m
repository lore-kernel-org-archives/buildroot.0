Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39829C5B56C
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 15:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A253C6072A;
	Mon, 10 Aug 2026 15:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RicRS72Etmdt; Mon, 10 Aug 2026 15:42:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AE2C60724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786376536;
	bh=UZuA8I5zSBaB3gNhGVscUWDRqbu2EMD4H0Aw6GJAmlg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZDmxJTopb4rMGmoLGvpKd6ESEXgGoM+F4iwbYMdVuQs8AVXi7a1OpFyA/eKJO8ky4
	 /u41pbfED0gx4M5SxsFM/JeunEHEOHuh4ZQaTnW+MTIQV+SeIZo4BcY3yt62mAK/W4
	 vkva2eYZfMP8qrcxxClTSmHFl9kd9wd5PNtDETUJT2D47wznLiOGAzAso8/RK74CeO
	 DRUP93I9aXNCs1aZIAKkUYWF87LvWiblGjjSEVO1IFLAQUsVvVTL9BpylDVlT3xyqG
	 vAQoKpPjzanEORKb3a1JU/QAUC9kDkZKuENukokvzkaQCtO6JyX/t88018x7KW+R1D
	 dWEUSTveXNDCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AE2C60724;
	Mon, 10 Aug 2026 15:42:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id B544323F
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 15:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id A7C7340154
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 15:42:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id s56PiqtICZdP for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 15:42:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31;
 helo=sea.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B38F140153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B38F140153
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id B38F140153
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 15:42:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with UTF8SMTP id C5683400D4;
 Mon, 10 Aug 2026 15:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 216C91F000E9;
 Mon, 10 Aug 2026 15:42:12 +0000 (UTC)
Date: Mon, 10 Aug 2026 18:42:10 +0300
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
Message-ID: <annxUmPe5G8WQgGy@kernel.org>
References: <20260611105434.3164134-1-jarkko@kernel.org>
 <72898e54-5d9d-4b31-bd9a-66136f21ea52@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <72898e54-5d9d-4b31-bd9a-66136f21ea52@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel.org; s=k20260515; t=1786376533;
 bh=/o2+RNpWaqqSY/930nO03QUrZ+hfO32o9YtKQWG6D5I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=CQNSu1pPQmEqHmmsPwau/yvBo6PN5FOSdb3vI6HhAEuICuhvulHYCWyZsOGohRpoS
 WMvV0yOxl0GhkUz6M8i6cjM4Eb7x7j5Yn4+zKx8ExWTyW4N58jQXaDiDhyk0jh/oWw
 iePh6AdXW6GhC0SdqeTELhor2oIYErRYVvoEi09XWko0HBeP3MF/MKLOQuC4BmhFDx
 nzjqfAxFjUR//qKLPiFFkfX8oucWP5UxSyikuXho2j2jbaCq0UGJYK/lSFuNagdMK/
 nKM9QNId3sBCYL5QL5JrHFqqQld2O9i906ezBe1kQ7qXZxYR8DJdXdXRzgGA42xWs+
 3BnOm7rX0OHuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20260515 header.b=CQNSu1pP
Subject: Re: [Buildroot] [PATCH] package/tpm2sh: new package tpm2sh 0.17.2
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
From: Jarkko Sakkinen via buildroot <buildroot@buildroot.org>
Reply-To: Jarkko Sakkinen <jarkko@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBBdWcgMDYsIDIwMjYgYXQgMTA6NDI6MDdQTSArMDIwMCwgRmlvbmEgS2x1dGUgd3Jv
dGU6Cj4gSGkgSmFya2tvIQo+IAo+IEFtIDExLjA2LjI2IHVtIDEyOjU0IHNjaHJpZWIgSmFya2tv
IFNha2tpbmVuIHZpYSBidWlsZHJvb3Q6Cj4gPiB0cG0yc2ggaXMgYSBUUE0gMi4wIGNvbW1hbmQt
bGluZSBzaGVsbCBhbmQgdHJvdWJsZXNob290aW5nIHRvb2wgZm9yIExpbnV4Cj4gPiB3aXRoIGxv
dyBkZXBlbmRlbmNpZXMuIEl0IGNvbW11bmljYXRlcyBkaXJlY3RseSB3aXRoIC9kZXYvdHBte3Jt
fTAuIEl0Cj4gPiBpcyBtb3N0IHVzZWZ1bCBpbiBrZXJuZWwgdGVzdGluZy4KPiA+IAo+ID4gQW1v
bmcgb3RoZXIgdGhpbmdzIGl0IGNhbiBiZSB1c2VkIHRvIHF1ZXJ5IGFuZCBtYW5pcHVsYXRlIHRo
ZSBjaGlwCj4gPiBtZW1vcnk6Cj4gPiAKPiA+IH4gbWFpbgo+ID4g4p2vIHRwbTJzaCBtZW1vcnkK
PiA+IEhBTkRMRSAgICAgQ0xBU1MgICAgICBERVRBSUxTCj4gPiAwMWMwMDAwMiAgIG52LWluZGV4
ICAgcnNhLTIwNDg6c2hhMjU2Cj4gPiAwMWMwMDAwYSAgIG52LWluZGV4ICAgZWNjLW5pc3QtcDI1
NjpzaGEyNTYKPiA+IAo+ID4gfiBtYWluCj4gPiDina8gdHBtMnNoIG1lbW9yeSAwMWMwMDAwYQo+
ID4gLS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCj4gPiBbQ0VOU09SRURdCj4gPiAtLS0tLUVO
RCBDRVJUSUZJQ0FURS0tLS0tCj4gPiAKPiA+IEFuZCBhbGwgdGhpcyBtYWtlcyBpdCBhbHNvIHNv
cnQgb2YgdXNlZnVsIGVtYmVkZGVkIGRlYnVnZ2luZyB0b29sIHRvby4KPiA+IAo+ID4gU2lnbmVk
LW9mZi1ieTogSmFya2tvIFNha2tpbmVuIDxqYXJra29Aa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4g
U29ycnkgaWYgSSBtaXNzZWQgc29tZSBkZXRhaWwuIFRyaWVkIHRvIGNoZWNrIGJ1dCB0aGlzIGlz
IG15IGZpcnN0IFJ1c3QKPiA+IHBhY2thZ2UgZm9yIEJSMiBzbyBhbnl0aGluZyBpcyBwb3NzaWJs
ZS4KPiAKPiBMb29rcyBtb3N0bHkgZ29vZCwgdGhyZWUgY29tbWVudHMgYmVsb3cuIEFsc28sIHdo
ZW4gYWRkaW5nIGEgbmV3IHBhY2thZ2UsCj4gcGxlYXNlIGFkZCB5b3Vyc2VsZiB0byBERVZFTE9Q
RVJTIGZvciB0aGF0IHBhY2thZ2UuIDotKQo+IAo+ID4gICBwYWNrYWdlL0NvbmZpZy5pbiAgICAg
ICAgICB8ICAxICsKPiA+ICAgcGFja2FnZS90cG0yc2gvQ29uZmlnLmluICAgfCAxOCArKysrKysr
KysrKysrKysrKysKPiA+ICAgcGFja2FnZS90cG0yc2gvdHBtMnNoLmhhc2ggfCAgMiArKwo+ID4g
ICBwYWNrYWdlL3RwbTJzaC90cG0yc2gubWsgICB8IDE0ICsrKysrKysrKysrKysrCj4gPiAgIDQg
ZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS90cG0yc2gvQ29uZmlnLmluCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L3RwbTJzaC90cG0yc2guaGFzaAo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS90cG0y
c2gvdHBtMnNoLm1rCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3Bh
Y2thZ2UvQ29uZmlnLmluCj4gPiBpbmRleCA2MzA2NjI0NzdiLi4wNWI1MDYwNjUxIDEwMDY0NAo+
ID4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4KPiA+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj4g
PiBAQCAtMjg4OCw2ICsyODg4LDcgQEAgbWVudSAiU3lzdGVtIHRvb2xzIgo+ID4gICAJc291cmNl
ICJwYWNrYWdlL3RwbS10b29scy9Db25maWcuaW4iCj4gPiAgIAlzb3VyY2UgInBhY2thZ2UvdHBt
Mi1hYnJtZC9Db25maWcuaW4iCj4gPiAgIAlzb3VyY2UgInBhY2thZ2UvdHBtMi10b29scy9Db25m
aWcuaW4iCj4gPiArCXNvdXJjZSAicGFja2FnZS90cG0yc2gvQ29uZmlnLmluIgo+IAo+IFRoaXMg
c2hvdWxkIGdvIGFmdGVyIHBhY2thZ2UvdHBtMi10b3RwIHRvIGtlZXAgdGhlIGFscGhhYmV0aWNh
bCBvcmRlcmluZy4KPiAKPiA+ICAgCXNvdXJjZSAicGFja2FnZS90cG0yLXRvdHAvQ29uZmlnLmlu
Igo+ID4gICAJc291cmNlICJwYWNrYWdlL3VnZXR0eS9Db25maWcuaW4iCj4gPiAgIAlzb3VyY2Ug
InBhY2thZ2UvdW5zY2QvQ29uZmlnLmluIgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdHBtMnNo
L0NvbmZpZy5pbiBiL3BhY2thZ2UvdHBtMnNoL0NvbmZpZy5pbgo+ID4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAuLjUyNjhkMGRmNmUKPiA+IC0tLSAvZGV2L251bGwK
PiA+ICsrKyBiL3BhY2thZ2UvdHBtMnNoL0NvbmZpZy5pbgo+ID4gQEAgLTAsMCArMSwxOCBAQAo+
ID4gK2NvbmZpZyBCUjJfUEFDS0FHRV9UUE0yU0gKPiA+ICsJYm9vbCAidHBtMnNoIgo+ID4gKwlk
ZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX0FSQ0hfU1VQUE9SVFMKPiA+
ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0hPU1RfUlVTVEMKPiA+ICsJc2VsZWN0IEJSMl9QQUNLQUdF
X0hPU1RfUEtHQ09ORgo+ID4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfT1BFTlNTTAo+ID4gKwlzZWxl
Y3QgQlIyX1BBQ0tBR0VfT1BFTlNTTF9GT1JDRV9MSUJPUEVOU1NMCj4gPiArCXNlbGVjdCBCUjJf
UEFDS0FHRV9MSUJPUEVOU1NMCj4gPiArCWhlbHAKPiA+ICsJICBUUE0gMi4wIGNvbW1hbmQtbGlu
ZSBpbnRlcmZhY2UuCj4gPiArCj4gPiArCSAgdHBtMnNoIGlzIGEgY29tbWFuZC1saW5lIGludGVy
ZmFjZSBmb3IgaW50ZXJhY3Rpbmcgd2l0aCBUUE0gMi4wIGNoaXBzCj4gPiArCSAgZGlyZWN0bHkg
dGhyb3VnaCAvZGV2L3RwbTAgb3IgL2Rldi90cG1ybTAuCj4gPiArCj4gPiArCSAgaHR0cHM6Ly9n
aXRsYWIuY29tL3RwbS1wcm90b2NvbC90cG0yc2gKPiA+ICsKPiA+ICtjb21tZW50ICJ0cG0yc2gg
bmVlZHMgYSB0b29sY2hhaW4gd2l0aCBSdXN0IHN1cHBvcnQiCj4gPiArCWRlcGVuZHMgb24gIUJS
Ml9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX0FSQ0hfU1VQUE9SVFMKPiA+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3RwbTJzaC90cG0yc2guaGFzaCBiL3BhY2thZ2UvdHBtMnNoL3RwbTJzaC5oYXNo
Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uNTY3YTc3NTFm
OQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvcGFja2FnZS90cG0yc2gvdHBtMnNoLmhhc2gK
PiA+IEBAIC0wLDAgKzEsMiBAQAo+ID4gK3NoYTI1NiAgOTBiNTU3YjZkNmE2YThmOGUyYmY5NDZl
ZGY1ZGIxOGNkMzNiMDkyNDVjMTFkMzhlODU0M2ZmMGY0ODZmNmE0MCAgdHBtMnNoLTAuMTcuMi1n
aXQ0LWNhcmdvNS50YXIuZ3oKPiAKPiBUd28gZGF5cyBhZnRlciB5b3Ugc2VudCB0aGlzIHBhdGNo
LCBSdXN0IHdhcyB1cGRhdGVkIHRvIDEuOTcuMCAoY29tbWl0Cj4gZThjOGJkOWJjNTZhODI3ZGI5
MGMzYmIyZTcxZTQ2MTNhNWEyYzczMCkgc3dpdGNoaW5nIHRvIGNhcmdvNiBmb3JtYXQsIHNvCj4g
eW91J2xsIG5lZWQgdG8gdXBkYXRlIGZvciB0aGF0Lgo+IAo+ID4gK3NoYTI1NiAgMzk3MmRjOTc0
NGY2NDk5ZjBmOWIyZGJmNzY2OTZmMmFlN2FkOGFmOWIyM2RkZTY2ZDZhZjg2YzlkZmIzNjk4NiAg
TElDRU5TRQo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdHBtMnNoL3RwbTJzaC5tayBiL3BhY2th
Z2UvdHBtMnNoL3RwbTJzaC5tawo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAw
MDAwMDAwMDAuLjU3M2ViODhhZDUKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3BhY2thZ2Uv
dHBtMnNoL3RwbTJzaC5tawo+ID4gQEAgLTAsMCArMSwxNCBAQAo+ID4gKyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjCj4gPiArIwo+ID4gKyMgdHBtMnNoCj4gPiArIwo+ID4gKyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjCj4gPiArCj4gPiArVFBNMlNIX1ZFUlNJT04gPSAwLjE3LjIKPiAKPiBJIHNlZSB5
b3UndmUgcmVsZWFzZWQgYW4gMS4wLjAgc2luY2Ugc2VuZGluZyB0aGlzIHBhdGNoLCBJIHN1cHBv
c2UgdXBkYXRpbmcKPiB3aGlsZSBmaXhpbmcgdGhlIG90aGVyIGlzc3VlcyB3b3VsZCBtYWtlIHNl
bnNlPwoKWWVzLCBpdCBkb2VzLiBUaGFua3MgZm9yIHRoZSByZXZpZXcuIEl0IHdpbGwgdGFrZSBz
b21lIHRpbWUgYnV0IEknbGwKZml4IHRoZSBpc3N1ZXMsIHVwZ3JhZGUgdG8gMS4wIGFuZCBwdXQg
dGhpcyB0byBzaGFwZS4KCldoeSB0aGlzIGlzIHVzZWZ1bCBpbiBnZW5lcmFsIGZvciBCdWlsZHJv
b3QgaXMgdGhhdCBpbiBnZW5lcmFsIGZvciBhbnkKcGVhY2Ugb2YgaGFyZHdhcmUsICJzdGFja2xl
c3MiIHRlc3RpbmcgdG9vbCBpcyB1c2VmdWwgOi0pCgo+IAo+IEJlc3QgcmVnYXJkcywKPiBGaW9u
YQo+IAo+ID4gK1RQTTJTSF9TSVRFID0gaHR0cHM6Ly9naXRsYWIuY29tL3RwbS1wcm90b2NvbC90
cG0yc2gKPiA+ICtUUE0yU0hfU0lURV9NRVRIT0QgPSBnaXQKPiA+ICtUUE0yU0hfTElDRU5TRSA9
IEdQTC0zLjAtb3ItbGF0ZXIKPiA+ICtUUE0yU0hfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiA+
ICtUUE0yU0hfREVQRU5ERU5DSUVTID0gaG9zdC1wa2djb25mIG9wZW5zc2wKPiA+ICsKPiA+ICsk
KGV2YWwgJChjYXJnby1wYWNrYWdlKSkKPiAKCkJSLCBKYXJra28KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
