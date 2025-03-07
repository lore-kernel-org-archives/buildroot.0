Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5268CC19F32
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 14:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E18244067B;
	Fri,  7 Mar 2025 14:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uC0tFSJjoHY4; Fri,  7 Mar 2025 14:19:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FC64406D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FC64406D6;
	Fri,  7 Mar 2025 14:19:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE68B1C9
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 14:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE5A341395
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 14:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KAf__DbAMSJF for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 14:19:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E58924139D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E58924139D
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E58924139D
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 14:19:51 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id CDEF8440EEB;
 Fri,  7 Mar 2025 16:13:57 +0200 (IST)
To: Luc Beaufils <luc.beaufils@savoirfairelinux.com>
Cc: buildroot@buildroot.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Thomas Perrot <thomas.perrot@bootlin.com>
In-Reply-To: <2035865859.922489.1741356572539.JavaMail.zimbra@savoirfairelinux.com>
 (Luc Beaufils's message of "Fri, 7 Mar 2025 09:09:32 -0500 (EST)")
References: <20250307095904.19075-1-luc.beaufils@savoirfairelinux.com>
 <20250307095904.19075-3-luc.beaufils@savoirfairelinux.com>
 <87r039xdqa.fsf@tarshish>
 <2035865859.922489.1741356572539.JavaMail.zimbra@savoirfairelinux.com>
User-Agent: mu4e 1.12.8; emacs 30.1
Date: Fri, 07 Mar 2025 16:19:47 +0200
Message-ID: <87ldtgylbw.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1741356837;
 bh=3tEtMGF0JlAcJnp5k7gnjCW6loqq5Dp9Ns/X7op65mY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=F8O9PvJAi9aRMr5C7ZT7xGQGk2mNpSQQBPCSnkJ0y8KC/NlC7arFc80Gbd6KUUoeu
 DIwJm6dOElFYO9j1gR6Mq+f+CNbr51hF5+XUkqnHlexX7lTw2AMq6gfPbEW+0JDJ1c
 fLwKsu0lzv+hpvLWpLB4a5iRndyOv2nGdNscHXxHe3yux037JZPXIQmeXVlyard10B
 Tpm8kT4X+i5H5pz4ymGO5nfOWwD5DNIuqk70tQBlEAaUH7ISyeBP/TqaDM+W4BorC7
 Gj6B0pV+hVzzqW5+GVG12QhCu3m6m9OVWwmpXzSZdS3uORy3OjmA0SbIJWT4OjCjjL
 Q3sjpH9P2ex4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=F8O9PvJA
Subject: Re: [Buildroot] [PATCH v2 2/2] package/imx-cst: add new package
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTHVjLAoKT24gRnJpLCBNYXIgMDcgMjAyNSwgTHVjIEJlYXVmaWxzIHdyb3RlOgo+IC0tLS0t
IExlIDcgTWFyIDI1LCDDoCAxMjo0OSwgQmFydWNoIFNpYWNoIGJhcnVjaEB0a29zLmNvLmlsIGEg
w6ljcml0IDoKPj4gT24gRnJpLCBNYXIgMDcgMjAyNSwgTHVjIEJFQVVGSUxTIHdyb3RlOgo+Pj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvaW14LWNzdC9pbXgtY3N0Lm1rIGIvcGFja2FnZS9pbXgtY3N0
L2lteC1jc3QubWsKPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+PiBpbmRleCAwMDAwMDAwMDAw
Li5hM2YxY2RmNmE0Cj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysgYi9wYWNrYWdlL2lteC1jc3Qv
aW14LWNzdC5tawo+Pj4gQEAgLTAsMCArMSw1MCBAQAo+Pj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCj4+PiArIwo+Pj4gKyMgaW14LWNzdAo+Pj4gKyMKPj4+ICsjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwo+Pj4gKwo+Pj4gKyMgZGViaWFuLzMuNC4wLWRmc2cKPj4+ICtJTVhfQ1NUX1ZFUlNJT04g
PSAzLjQuMCtkZnNnCj4+PiArSU1YX0NTVF9TT1VSQ0UgPSBpbXgtY29kZS1zaWduaW5nLXRvb2xf
JChJTVhfQ1NUX1ZFUlNJT04pLm9yaWcudGFyLnh6Cj4+PiArSU1YX0NTVF9TSVRFID0gaHR0cHM6
Ly9kZWIuZGViaWFuLm9yZy9kZWJpYW4vcG9vbC9tYWluL2kvaW14LWNvZGUtc2lnbmluZy10b29s
Cj4+IAo+PiBEZWJpYW4gc291cmNlIHBhY2thZ2VzIGFyZSByZW1vdmVkIGZyb20gbWFpbiBvbmNl
IHRoZSByZWxlYXNlIHRoZXkKPj4gYmVsb25nIHRvIGFyZSByZXRpcmVkLiBCdWlsZHJvb3QgdXN1
YWxseSB1c2VzIHRoZSBEZWJpYW4gc25hcHNob3QKPj4gYXJjaGl2ZS4gU2VlIGV4YW1wbGUgaW4g
YWxzYW1peGVyZ3VpLCBjZHJraXQsIGN2cywgYW5kIGEgZmV3IG1vcmUKPj4gcGFja2FnZXMuCj4K
PiBUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCj4KPiBVbmZvcnR1bmF0ZWx5LCBJIGhhdmVuJ3Qg
YmVlbiBhYmxlIHRvIGZpbmQgdGhlIHNvdXJjZXMgb2YgdGhpcyBwYWNrYWdlIGluIHRoZSBEZWJp
YW4gc25hcHNob3QuCgpTZWUgaGVyZToKCiAgaHR0cDovL3NuYXBzaG90LmRlYmlhbi5vcmcvYXJj
aGl2ZS9kZWJpYW4vMjAyNTAzMDdUMDg0NzAxWi9wb29sL21haW4vaS9pbXgtY29kZS1zaWduaW5n
LXRvb2wvaW14LWNvZGUtc2lnbmluZy10b29sXzMuNC4wJTJCZGZzZy5vcmlnLnRhci54egoKPiBB
cyBhbiBhbHRlcm5hdGl2ZSwgSSBwcm9wb3NlIHVzaW5nIHRoZSBBcGVydGlzIEdpdExhYiByZXBv
c2l0b3J5Ogo+Cj4gLUlNWF9DU1RfVkVSU0lPTiA9IDMuNC4wK2Rmc2cKPiAtSU1YX0NTVF9TT1VS
Q0UgPSBpbXgtY29kZS1zaWduaW5nLXRvb2xfJChJTVhfQ1NUX1ZFUlNJT04pLm9yaWcudGFyLnh6
Cj4gLUlNWF9DU1RfU0lURSA9IGh0dHBzOi8vZGViLmRlYmlhbi5vcmcvZGViaWFuL3Bvb2wvbWFp
bi9pL2lteC1jb2RlLXNpZ25pbmctdG9vbAo+ICtJTVhfQ1NUX1ZFUlNJT04gPSBkZWJpYW4vMy40
LjArZGZzZy0yCj4gK0lNWF9DU1RfU0lURSA9IGh0dHBzOi8vZ2l0bGFiLmFwZXJ0aXMub3JnL3Br
Zy9pbXgtY29kZS1zaWduaW5nLXRvb2wKPiArSU1YX0NTVF9TSVRFX01FVEhPRCA9IGdpdAo+Cj4g
RG9lcyB0aGlzIHNvbHV0aW9uIHdvcmsgZm9yIHlvdT8KCkxvb2tzIGxpa2UgYW4gb2xkZXIgQ1NU
IHZlcnNpb24uIEkgZ3Vlc3MgdGhlIERlYmlhbiBzbmFwc2hvdCBpcwpwcmVmZXJyZWQuCgpiYXJ1
Y2gKCj4+PiArSU1YX0NTVF9MSUNFTlNFID0gQlNELTMtQ2xhdXNlCj4+PiArSU1YX0NTVF9MSUNF
TlNFX0ZJTEVTID0gTElDRU5TRS5ic2QzCj4+PiArCj4+PiArSE9TVF9JTVhfQ1NUX0RFUEVOREVO
Q0lFUyA9IGhvc3QtYnlhY2MgaG9zdC1mbGV4IGhvc3Qtb3BlbnNzbAo+Pj4gKwo+Pj4gK2lmbmVx
ICgkKGZpbHRlciAlNjQsJChIT1NUQVJDSCkpLCkKPj4+ICtIT1NUX0lNWF9DU1RfT1NUWVBFID0g
bGludXg2NAo+Pj4gK2Vsc2UKPj4+ICtIT1NUX0lNWF9DU1RfT1NUWVBFID0gbGludXgzMgo+Pj4g
K2VuZGlmCj4+PiArCj4+PiArSE9TVF9DRkxBR1MgKz0gLVduby1lcnJvcj11bnVzZWQtcmVzdWx0
Cj4+PiArCj4+PiArIyBXZSBkb24ndCB1c2UgSE9TVF9DT05GSUdVUkVfT1BUUyB3aGVuIGJ1aWxk
aW5nIGNzdCwgYmVjYXVzZSB3ZSBuZWVkCj4+PiArIyB0byBwcmVzZXJ2ZSB0aGUgQ0ZMQUdTL0xE
RkxBR1MgdXNlZCBieSB0aGVpciBNYWtlZmlsZS4KPj4+ICtkZWZpbmUgSE9TVF9JTVhfQ1NUX0JV
SUxEX0NNRFMKPj4+ICsJJChIT1NUX01BS0VfRU5WKSAkKE1BS0UpIFwKPj4+ICsJCU9TVFlQRT0k
KEhPU1RfSU1YX0NTVF9PU1RZUEUpIFwKPj4+ICsJCU9QRU5TU0xfUEFUSD0kKEhPU1RfRElSKS9p
bmNsdWRlL29wZW5zc2wgXAo+Pj4gKwkJRU5DUllQVElPTj15ZXMgXAo+Pj4gKwkJQVI9IiQoSE9T
VEFSKSIgXAo+Pj4gKwkJQ0M9IiQoSE9TVENDKSIgXAo+Pj4gKwkJTEQ9IiQoSE9TVENDKSIgXAo+
Pj4gKwkJT0JKQ09QWT0iJChIT1NUT0JKQ09QWSkiIFwKPj4+ICsJCVJBTkxJQj0iJChIT1NUUkFO
TElCKSIgXAo+Pj4gKwkJRVhUUkFDRkxBR1M9IiQoSE9TVF9DRkxBR1MpICQoSE9TVF9DUFBGTEFH
UykiIFwKPj4+ICsJCUVYVFJBTERGTEFHUz0iJChIT1NUX0xERkxBR1MpIiBcCj4+PiArCQktQyAk
KEBEKQo+Pj4gKwkkKEhPU1RfTUFLRV9FTlYpICQoTUFLRSkgJChIT1NUX0NPTkZJR1VSRV9PUFRT
KSBcCj4+PiArCQlDT1BUUz0iJChIT1NUX0NGTEFHUykgJChIT1NUX0NQUEZMQUdTKSAkKEhPU1Rf
TERGTEFHUykiIFwKPj4+ICsJCS1DICQoQEQpL2FkZC1vbnMvaGFiX2NzZl9wYXJzZXIKPj4+ICtl
bmRlZgo+Pj4gKwo+Pj4gK2RlZmluZSBIT1NUX0lNWF9DU1RfSU5TVEFMTF9DTURTCj4+PiArCSQo
SU5TVEFMTCkgLUQgLW0gNzU1ICQoQEQpL2NvZGUvb2JqLiQoSE9TVF9JTVhfQ1NUX09TVFlQRSkv
Y3N0Cj4+PiAkKEhPU1RfRElSKS9iaW4vY3N0Cj4+PiArCSQoSU5TVEFMTCkgLUQgLW0gNzU1ICQo
QEQpL2NvZGUvb2JqLiQoSE9TVF9JTVhfQ1NUX09TVFlQRSkvc3JrdG9vbAo+Pj4gJChIT1NUX0RJ
UikvYmluL3Nya3Rvb2wKPj4+ICsJJChJTlNUQUxMKSAtRCAtbSA3NTUgJChARCkvYWRkLW9ucy9o
YWJfY3NmX3BhcnNlci9jc2ZfcGFyc2VyCj4+PiAkKEhPU1RfRElSKS9iaW4vY3NmX3BhcnNlcgo+
Pj4gK2VuZGVmCj4+PiArCj4+PiArJChldmFsICQoaG9zdC1nZW5lcmljLXBhY2thZ2UpKQo+PiAK
Pj4gLS0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIH4uIC5+ICAgVGsgT3BlbiBTeXN0ZW1zCj4+ID19LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tb29PLS1VLS1Pb28tLS0tLS0tLS0tLS17PQo+PiAgIC0g
YmFydWNoQHRrb3MuY28uaWwgLSB0ZWw6ICs5NzIuNTIuMzY4LjQ2NTYsIGh0dHA6Ly93d3cudGtv
cy5jby5pbCAtCgotLSAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB+LiAufiAgIFRrIE9wZW4gU3lzdGVtcwo9fS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLW9vTy0tVS0tT29vLS0tLS0tLS0tLS0tez0KICAg
LSBiYXJ1Y2hAdGtvcy5jby5pbCAtIHRlbDogKzk3Mi41Mi4zNjguNDY1NiwgaHR0cDovL3d3dy50
a29zLmNvLmlsIC0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
