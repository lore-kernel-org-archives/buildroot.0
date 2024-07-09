Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264FCC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 19:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC6D140EE7;
	Tue,  9 Jul 2024 19:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K2TkxeqSZcsg; Tue,  9 Jul 2024 19:31:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B892640453
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B892640453;
	Tue,  9 Jul 2024 19:31:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 220FC1BF5DE
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 19:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B60740453
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 19:31:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJMPk6m8Pw19 for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 19:31:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB58C40026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB58C40026
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB58C40026
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 19:31:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([5.145.135.151]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwfWa-1sCLzk46G2-00rEi7; Tue, 09
 Jul 2024 21:30:59 +0200
Date: Tue, 9 Jul 2024 21:30:57 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zo2P8Z4LbGD-HGqz@probook>
References: <20240704-tipidee-v1-0-5ef0942b2025@gmx.net>
 <20240704-tipidee-v1-8-5ef0942b2025@gmx.net>
 <20240708232440.56e59da4@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240708232440.56e59da4@windsurf>
X-Provags-ID: V03:K1:0TDrtX20/h8MeklTCh4/UlA/2NuJFuYfcTEsZKkAc3uyXT2218M
 YMfDDhYKqjLm1M8UU0e7ZX0vHXPHHrJxYf808L1cbtvxjDjsZuaSzlGjbILrO4doM1kHUeI
 Ifvp3OaXJGzIzKEVtPpie2QdYCrnv5aFSjUzeBP3n+iI7Pq6Cd81FYTsn+p1/xjz1xmi6kE
 gDXHzU9fBiDJ3InUhs5Zw==
UI-OutboundReport: notjunk:1;M01:P0:X/ROwsy1A3Q=;m+YYYktX3IKOu+lyos7HdG9y5aI
 hLpLoxBt48rUrWXMSbRhoDpVeJrHB1OuN0TJTxJDrYKLcbJhhcsPOEvftp8DNWnYtUcKrxigQ
 ks2Ue8tcsGKCN5eF3arHE3iabwSZ9FoNP6B4dpmQTxoU2ohbxiI0snLdppq0+Mq6UIzXaC83G
 bjJE0WAjYysQHSFOcCao6UxxjMzAAxPUcmuUurkHcdd63LM7oaVyqsVGBvvCfZ0qxHLaVgUNe
 K2qt5SaU3m/8jFnWYqd+raccYIMzzVsuOzMRiBU2wPPD6MpvoNYNj+yjy0CWuR5vnaP31QP+u
 1ogt9ef6CBnaodvXKBRXF3Qap3B1ui0wpovFxG01RamOFXbegPgfVxaQ+UcuabdMvYJPi/VLn
 WWz90hbo6ixwD8vKZPrzSXt6zKXJhXjKoabMK7CP49TgsQUZZGODcs6yziMqvcTLQjrZMAWVH
 OzJYvDEIsU7NS1D/dU6sizdaZZls+yl0Ldx7Dl2FWHHhMTYSYp/vcaY+XMHD96HJc7+HUTNaB
 FLl3KoKhC/knvKKRpaJv1C5rqDPfovd+ZcHB9La0/qjcNt19ZxoD24iVm3+4UUIjWghh8e4Bf
 MhyN5RG5Ais5EMB0hqg4FgiewTjoTZbK3wM+Fm5Bu5sBPEs+0+kPdR1FughyarXiDaQ+0ulgv
 nx53tbJ+xxt8s6290RTmgvtkkWit9hMDTB/5tEreACn8EEO2y6OgJccHUgOJWfkKq3hVkg72o
 7SJQTkIZFbFr8Qo7x7WN0JwHhiTUHUsExadsTVZdRL+gUFIAD4Te+srk3dukDqDdByWA0KzeK
 aF7jw62wjIszc2B7SN8432EVqWzaHDts2i5WiZyJDCfjI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720553459; x=1721158259; i=j.neuschaefer@gmx.net;
 bh=bJZZic2M8Sn+6dyO2qci9B9bET8HSCktCDxjtx8VrL8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=kSDVVssvMiOsXqUbh4JaVuhzPR/c30n5phfoGhTTfm+J70e8qFfaforJAXYV32c0
 BEYxcGkQCiItk8kTBnQkY3atMsOzrR20Q7iZBGaZrbba7tJKHn3V1E1FtheqUPAnv
 eEVLmIU5rrpNtVpqhWfaEl/fYsOCZqx6E/L+zNJ6sQuwv++Es8rA0r4MlNvOLg1Om
 UKxYkp90vzHpidUIrtgl/8ksJbc66lhyYlM5k1h9+QFVOwnITNnMhyc9kuUsDJncW
 48Dmh0FC5S7AENb7lPIM07Kbk9f/PeYJcUpSEtlVIEU4HT+iP6XK9B96cPNSh2xQj
 4kXCP4FdwAgX2Aa90A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=kSDVVssv
Subject: Re: [Buildroot] [PATCH 8/8] tipidee: new package
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 =?utf-8?Q?J=2E_Neusch=C3=A4fer?= via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBKdWwgMDgsIDIwMjQgYXQgMTE6MjQ6NDBQTSArMDIwMCwgVGhvbWFzIFBldGF6em9u
aSB3cm90ZToKPiBIZWxsbywKPgo+IE9uIFRodSwgMDQgSnVsIDIwMjQgMjE6NDA6MzQgKzAyMDAK
PiBKLiBOZXVzY2jDpGZlciB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4g
d3JvdGU6Cj4KPiA+IFNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVy
QGdteC5uZXQ+Cj4KPiBUaGFua3MgZm9yIHRoaXMgY29udHJpYnV0aW9uIQo+Cj4gPiAraWYgQlIy
X1BBQ0tBR0VfVElQSURFRQo+ID4gKwo+ID4gK2NvbmZpZyBCUjJfUEFDS0FHRV9USVBJREVFX0NP
TkZJR1VSQVRJT04KPiA+ICsJYm9vbCAiaW5zdGFsbCBhIGNvbmZpZ3VyYXRpb24gZmlsZSB0byAv
ZXRjL3RpcGlkZWUuY29uZi5jZGIiCj4gPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX1RJUElE
RUUKPiA+ICsJaGVscAo+ID4gKwkgIEJ1aWxkIGEgdGlwaWRlZSBjb25maWd1cmF0aW9uIGFuZCBp
bnN0YWxsIGl0IHRvIHRoZSB0YXJnZXQuCj4gPiArCj4gPiArY29uZmlnIEJSMl9QQUNLQUdFX1RJ
UElERUVfQ09ORklHVVJBVElPTl9GSUxFCj4gPiArCXN0cmluZyAiY29uZmlndXJhdGlvbiBzb3Vy
Y2UgZmlsZSIKPiA+ICsJZGVmYXVsdCAiJChDT05GSUdfRElSKS90aXBpZGVlLmNvbmYiCj4gPiAr
CWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfVElQSURFRV9DT05GSUdVUkFUSU9OCj4gPiArCWhlbHAK
PiA+ICsJICBUaGUgY29uZmlndXJhdGlvbiBmaWxlIGluIHNvdXJjZSAodGV4dCkgZm9ybWF0LCBk
b2N1bWVudGVkIGF0Ogo+ID4gKwo+ID4gKwkgIGh0dHBzOi8vc2thcm5ldC5vcmcvc29mdHdhcmUv
dGlwaWRlZS90aXBpZGVlLmNvbmYuaHRtbAo+Cj4gSSdtIG5vdCBzdXJlIHRob3NlIGNvbmZpZ3Vy
YXRpb24gb3B0aW9ucyBhcmUgcmVhbGx5IG5lZWRlZC4gV2UgdXN1YWxseQo+IGRvbid0IG1ha2Ug
dGhlIGNvbmZpZ3VyYXRpb24gZmlsZSBjb25maWd1cmFibGUsIGFuZCBsZWF2ZSB0aGF0IHVwIHRv
IGEKPiByb290ZnMtb3ZlcmxheS4gSSB1bmRlcnN0YW5kIHRoYXQgdGhlIGNvbmZpZ3VyYXRpb24g
aXMgYXBwYXJlbnRseQo+ICJjb21waWxlZCIsIGJ1dCBJIHdvdWxkIHBlcmhhcHMgbGVhdmUgdGhh
dCB1cCB0byBiZSBvdmVycmlkZGVuIGJ5IGEKPiBwb3N0LWJ1aWxkIHNjcmlwdD8gT3IgcGVyaGFw
cyB3ZSBzaG91bGQgZG8gdGhpcyBjb25maWd1cmF0aW9uIGZpbGUKPiAiY29tcGlsYXRpb24iIGFz
IGEgVEFSR0VUX0ZJTkFMSVpFX0hPT0tTIHNvIHRoYXQgaXQgaGFwcGVucyBhZnRlcgo+IHJvb3Rm
cy1vdmVybGF5IGFyZSBjb3BpZWQsIGFsbG93aW5nIHRoZSB1c2VyIHRvIG92ZXJyaWRlIHRoZQo+
IGNvbmZpZ3VyYXRpb24gZmlsZSwgd2hpbGUgc3RpbGwgc2VlaW5nIGl0ICJjb21waWxlZCI/CgpJ
J20gbm90IHN1cmUgYWJvdXQgdGhlIGRpZmZlcmVudCBvcHRpb25zIGZvciBob29rcywgZXRjLiwg
aW4gYnVpbGRyb290LApidXQgbXkgcmVhc29uaW5nIHdhcyB0aGF0IEkgZmluZCBpdCBlYXNpZXIg
dG8gc2V0IGFuIG9wdGlvbiB0aGFuIHRvCndyaXRlIGEgY3VzdG9tIHNjcmlwdC4KCj4gPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS90aXBpZGVlL0NvbmZpZy5pbi5ob3N0IGIvcGFja2FnZS90aXBpZGVl
L0NvbmZpZy5pbi5ob3N0Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAw
MDAwMC4uOTNlNTQ4ZGYxZQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvcGFja2FnZS90aXBp
ZGVlL0NvbmZpZy5pbi5ob3N0Cj4gPiBAQCAtMCwwICsxLDggQEAKPiA+ICtjb25maWcgQlIyX0hP
U1RfUEFDS0FHRV9USVBJREVFCj4gPiArCWJvb2wgImhvc3QgdGlwaWRlZSIKPiA+ICsJZGVwZW5k
cyBvbiBCUjJfVVNFX01NVSAjIHNrYWxpYnMKCkkganVzdCBub3RpY2VkIHRoaXMgZGVwZW5kZW5j
eSBvbmx5IG1ha2VzIHNlbnNlIGZvciB0aGUgdGFyZ2V0IHBhY2thZ2UsCkknbGwgcmVtb3ZlIGl0
IGZvciB2ZXJzaW9uIDMuCgo+ID4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfU0tBTElCUwo+ID4gKwlo
ZWxwCj4gPiArCSAgVGhpcyBwYWNrYWdlIGJ1aWxkcyB0aGUgdGlwaWRlZS1jb25maWcgdG9vbCBm
b3IgdGhlIGhvc3QuCj4gPiArCj4gPiArCSAgaHR0cHM6Ly9za2FybmV0Lm9yZy9zb2Z0d2FyZS90
aXBpZGVlLwo+Cj4gSSdtIG5vdCBzdXJlIHdlIHJlYWxseSBuZWVkIGEgdmlzaWJsZSBjb25maWcg
b3B0aW9uIGZvciB0aGlzLAo+IGhvc3QtdGlwaWRlZSBpcyBnb2luZyB0byBiZSBhIGRlcGVuZGVu
Y3kgb2YgdGlwaWRlZSBhbnl3YXkuCgpJJ2xsIHJlbW92ZSB0aGUgbmFtZSBzbyBpdCdzIGhpZGRl
biBmcm9tIG1hbnVhbCBzZWxlY3Rpb24uCgpIb3dldmVyLCB0aGlzIG9ubHkgbWFrZXMgc2Vuc2Ug
aWYgdGhlIGN1cnJlbnQgYXBwcm9hY2gKKEJSMl9QQUNLQUdFX1RJUElERUVfQ09ORklHVVJBVElP
TikgaXMga2VwdCBvciBpZgpCUjJfUEFDS0FHRV9USVBJREVFIHVuY29uZGl0aW9uYWxseSBzZWxl
Y3RzIEJSMl9IT1NUX1BBQ0tBR0VfVElQSURFRS4KCj4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3RpcGlkZWUvdGlwaWRlZS5tayBiL3BhY2thZ2UvdGlwaWRlZS90aXBpZGVlLm1rCj4gPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uMmZkZTc1Yjg3ZAo+ID4gLS0t
IC9kZXYvbnVsbAo+ID4gKysrIGIvcGFja2FnZS90aXBpZGVlL3RpcGlkZWUubWsKPiA+IEBAIC0w
LDAgKzEsNzIgQEAKPiA+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4gKyMKPiA+ICsjIHRp
cGlkZWUKPiA+ICsjCj4gPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiA+ICsKPiA+ICtUSVBJ
REVFX1ZFUlNJT04gPSAwLjAuNS4wCj4gPiArVElQSURFRV9TSVRFID0gaHR0cHM6Ly9za2FybmV0
Lm9yZy9zb2Z0d2FyZS90aXBpZGVlCj4gPiArVElQSURFRV9MSUNFTlNFID0gSVNDCj4gPiArVElQ
SURFRV9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ID4gK1RJUElERUVfSU5TVEFMTF9TVEFHSU5H
ID0gWUVTCj4gPiArVElQSURFRV9ERVBFTkRFTkNJRVMgPSBza2FsaWJzCj4gPiArCj4gPiArVElQ
SURFRV9DT05GX09QVFMgPSBcCj4gPiArCS0tcHJlZml4PS8gXAo+Cj4gVGhpcyBsb29rcyBvZGQs
IHdoeSBub3QgLS1wcmVmaXg9L3VzciA/CgpJIGNvcGllZCB0aGlzIGZyb20gb3RoZXIgc2thcm5l
dC5vcmcgcGFja2FnZXMsIGJ1dCAtLXByZWZpeD0vdXNyIHdvdWxkCndvcmsgdG9vLgoKPiBUaGUg
cmVzdCByZWFsbHkgbG9va3Mgc3VwZXIgcmVhc29uYWJsZSB0byBtZSwgZ29vZCB3b3JrIQoKVGhh
bmtzIGZvciB5b3VyIHJldmlldyEKam4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
