Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3F2C28B23
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 15:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AFB381A18;
	Fri,  7 Mar 2025 15:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3KxDe9jdJLM; Fri,  7 Mar 2025 15:32:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00BAF81A30
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00BAF81A30;
	Fri,  7 Mar 2025 15:32:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A5644944
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 15:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8869840EC1
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 15:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RX4XCQOhdc8o for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 15:32:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=208.88.110.44;
 helo=mail.savoirfairelinux.com;
 envelope-from=luc.beaufils@savoirfairelinux.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C1931409EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1931409EE
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1931409EE
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 15:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id 289269C8A58;
 Fri,  7 Mar 2025 10:32:12 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id UXySjOjmmYL3; Fri,  7 Mar 2025 10:32:11 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id 42DF99C8A77;
 Fri,  7 Mar 2025 10:32:11 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 42DF99C8A77
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id LkuHcKx-8uu9; Fri,  7 Mar 2025 10:32:11 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [192.168.48.237])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id 1DFCB9C8A58;
 Fri,  7 Mar 2025 10:32:11 -0500 (EST)
Date: Fri, 7 Mar 2025 10:32:11 -0500 (EST)
From: Luc Beaufils <luc.beaufils@savoirfairelinux.com>
To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot <buildroot@buildroot.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Thomas Perrot <thomas.perrot@bootlin.com>
Message-ID: <1410095564.929994.1741361531063.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <87ldtgylbw.fsf@tarshish>
References: <20250307095904.19075-1-luc.beaufils@savoirfairelinux.com>
 <20250307095904.19075-3-luc.beaufils@savoirfairelinux.com>
 <87r039xdqa.fsf@tarshish>
 <2035865859.922489.1741356572539.JavaMail.zimbra@savoirfairelinux.com>
 <87ldtgylbw.fsf@tarshish>
MIME-Version: 1.0
X-Mailer: Zimbra 10.1.1_GA_0424 (ZimbraWebClient - FF136
 (Linux)/10.1.1_GA_0424)
Thread-Topic: package/imx-cst: add new package
Thread-Index: 1hI7avk3DuTVv3owhFhkUfiHv0/iTg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
 t=1741361531; bh=57+qQ5L3f8TE6WTfXFxNknRD2cckvRnKEAGC6BFXZGk=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=wjKQiV0MZyTR4Q4HP+cUXCDNH6o5x41QD2VZdj+nH6INVsJB2DUk6jwEwwENfZ0Gf
 gZnqCYh5FnlwM2FGmF84FJcESmYhFTZB8aaWhWJNB4r/E9pfHVaV7rexby2sNwETP3
 b50r+7bg1NBH7cva0iLrG+/iRFk1DUBWEiiWrJclef2siPe2jpp+hXog0hFNhkHS67
 zbvwuslFVKMkF5YW4Q2IKL94JS7FlOzdXVm/+DzPE4GTZWSQkuh5fEgk2A/150TfRJ
 fnL1JIhcbGJJRj7VgIFdO/TcrWBYFXuprdESHbYT8tsXLj8x++BC34yJfV7iPhYgO+
 c0enM4dDXbteg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=savoirfairelinux.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=wjKQiV0M
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LS0tLS0gTGUgNyBNYXIgMjUsIMOgIDE1OjE5LCBCYXJ1Y2ggU2lhY2ggYmFydWNoQHRrb3MuY28u
aWwgYSDDqWNyaXQgOgoKPiBIaSBMdWMsCj4gCj4gT24gRnJpLCBNYXIgMDcgMjAyNSwgTHVjIEJl
YXVmaWxzIHdyb3RlOgo+PiAtLS0tLSBMZSA3IE1hciAyNSwgw6AgMTI6NDksIEJhcnVjaCBTaWFj
aCBiYXJ1Y2hAdGtvcy5jby5pbCBhIMOpY3JpdCA6Cj4+PiBPbiBGcmksIE1hciAwNyAyMDI1LCBM
dWMgQkVBVUZJTFMgd3JvdGU6Cj4+Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvaW14LWNzdC9pbXgt
Y3N0Lm1rIGIvcGFja2FnZS9pbXgtY3N0L2lteC1jc3QubWsKPj4+PiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+Pj4+IGluZGV4IDAwMDAwMDAwMDAuLmEzZjFjZGY2YTQKPj4+PiAtLS0gL2Rldi9udWxs
Cj4+Pj4gKysrIGIvcGFja2FnZS9pbXgtY3N0L2lteC1jc3QubWsKPj4+PiBAQCAtMCwwICsxLDUw
IEBACj4+Pj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4+Pj4gKyMKPj4+PiArIyBpbXgtY3N0
Cj4+Pj4gKyMKPj4+PiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPj4+PiArCj4+Pj4gKyMgZGVi
aWFuLzMuNC4wLWRmc2cKPj4+PiArSU1YX0NTVF9WRVJTSU9OID0gMy40LjArZGZzZwo+Pj4+ICtJ
TVhfQ1NUX1NPVVJDRSA9IGlteC1jb2RlLXNpZ25pbmctdG9vbF8kKElNWF9DU1RfVkVSU0lPTiku
b3JpZy50YXIueHoKPj4+PiArSU1YX0NTVF9TSVRFID0gaHR0cHM6Ly9kZWIuZGViaWFuLm9yZy9k
ZWJpYW4vcG9vbC9tYWluL2kvaW14LWNvZGUtc2lnbmluZy10b29sCj4+PiAKPj4+IERlYmlhbiBz
b3VyY2UgcGFja2FnZXMgYXJlIHJlbW92ZWQgZnJvbSBtYWluIG9uY2UgdGhlIHJlbGVhc2UgdGhl
eQo+Pj4gYmVsb25nIHRvIGFyZSByZXRpcmVkLiBCdWlsZHJvb3QgdXN1YWxseSB1c2VzIHRoZSBE
ZWJpYW4gc25hcHNob3QKPj4+IGFyY2hpdmUuIFNlZSBleGFtcGxlIGluIGFsc2FtaXhlcmd1aSwg
Y2Rya2l0LCBjdnMsIGFuZCBhIGZldyBtb3JlCj4+PiBwYWNrYWdlcy4KPj4gCj4+IFRoYW5rIHlv
dSBmb3IgeW91ciByZXBseS4KPj4gCj4+IFVuZm9ydHVuYXRlbHksIEkgaGF2ZW4ndCBiZWVuIGFi
bGUgdG8gZmluZCB0aGUgc291cmNlcyBvZiB0aGlzIHBhY2thZ2UgaW4gdGhlCj4+IERlYmlhbiBz
bmFwc2hvdC4KPiAKPiBTZWUgaGVyZToKPiAKPiBodHRwOi8vc25hcHNob3QuZGViaWFuLm9yZy9h
cmNoaXZlL2RlYmlhbi8yMDI1MDMwN1QwODQ3MDFaL3Bvb2wvbWFpbi9pL2lteC1jb2RlLXNpZ25p
bmctdG9vbC9pbXgtY29kZS1zaWduaW5nLXRvb2xfMy40LjAlMkJkZnNnLm9yaWcudGFyLnh6CgpN
eSBiYWQsIEkgd2FzIHNlYXJjaGluZyBhdCBpbXgtY3N0IHBhY2thZ2UgbmFtZS4KPiAKPj4gQXMg
YW4gYWx0ZXJuYXRpdmUsIEkgcHJvcG9zZSB1c2luZyB0aGUgQXBlcnRpcyBHaXRMYWIgcmVwb3Np
dG9yeToKPj4gCj4+IC1JTVhfQ1NUX1ZFUlNJT04gPSAzLjQuMCtkZnNnCj4+IC1JTVhfQ1NUX1NP
VVJDRSA9IGlteC1jb2RlLXNpZ25pbmctdG9vbF8kKElNWF9DU1RfVkVSU0lPTikub3JpZy50YXIu
eHoKPj4gLUlNWF9DU1RfU0lURSA9IGh0dHBzOi8vZGViLmRlYmlhbi5vcmcvZGViaWFuL3Bvb2wv
bWFpbi9pL2lteC1jb2RlLXNpZ25pbmctdG9vbAo+PiArSU1YX0NTVF9WRVJTSU9OID0gZGViaWFu
LzMuNC4wK2Rmc2ctMgo+PiArSU1YX0NTVF9TSVRFID0gaHR0cHM6Ly9naXRsYWIuYXBlcnRpcy5v
cmcvcGtnL2lteC1jb2RlLXNpZ25pbmctdG9vbAo+PiArSU1YX0NTVF9TSVRFX01FVEhPRCA9IGdp
dAo+PiAKPj4gRG9lcyB0aGlzIHNvbHV0aW9uIHdvcmsgZm9yIHlvdT8KPiAKPiBMb29rcyBsaWtl
IGFuIG9sZGVyIENTVCB2ZXJzaW9uLiBJIGd1ZXNzIHRoZSBEZWJpYW4gc25hcHNob3QgaXMKPiBw
cmVmZXJyZWQuCj4gCj4gYmFydWNoCgpZZXMsIEkgd2lsbCBzZW5kIGEgdjMgcGF0Y2ggd2l0aCB0
aGUgZGViaWFuIHNuYXBzaG90IHBhY2thZ2UsCnRoYW5rcwoKTHVjCj4gCj4+Pj4gK0lNWF9DU1Rf
TElDRU5TRSA9IEJTRC0zLUNsYXVzZQo+Pj4+ICtJTVhfQ1NUX0xJQ0VOU0VfRklMRVMgPSBMSUNF
TlNFLmJzZDMKPj4+PiArCj4+Pj4gK0hPU1RfSU1YX0NTVF9ERVBFTkRFTkNJRVMgPSBob3N0LWJ5
YWNjIGhvc3QtZmxleCBob3N0LW9wZW5zc2wKPj4+PiArCj4+Pj4gK2lmbmVxICgkKGZpbHRlciAl
NjQsJChIT1NUQVJDSCkpLCkKPj4+PiArSE9TVF9JTVhfQ1NUX09TVFlQRSA9IGxpbnV4NjQKPj4+
PiArZWxzZQo+Pj4+ICtIT1NUX0lNWF9DU1RfT1NUWVBFID0gbGludXgzMgo+Pj4+ICtlbmRpZgo+
Pj4+ICsKPj4+PiArSE9TVF9DRkxBR1MgKz0gLVduby1lcnJvcj11bnVzZWQtcmVzdWx0Cj4+Pj4g
Kwo+Pj4+ICsjIFdlIGRvbid0IHVzZSBIT1NUX0NPTkZJR1VSRV9PUFRTIHdoZW4gYnVpbGRpbmcg
Y3N0LCBiZWNhdXNlIHdlIG5lZWQKPj4+PiArIyB0byBwcmVzZXJ2ZSB0aGUgQ0ZMQUdTL0xERkxB
R1MgdXNlZCBieSB0aGVpciBNYWtlZmlsZS4KPj4+PiArZGVmaW5lIEhPU1RfSU1YX0NTVF9CVUlM
RF9DTURTCj4+Pj4gKyAkKEhPU1RfTUFLRV9FTlYpICQoTUFLRSkgXAo+Pj4+ICsgT1NUWVBFPSQo
SE9TVF9JTVhfQ1NUX09TVFlQRSkgXAo+Pj4+ICsgT1BFTlNTTF9QQVRIPSQoSE9TVF9ESVIpL2lu
Y2x1ZGUvb3BlbnNzbCBcCj4+Pj4gKyBFTkNSWVBUSU9OPXllcyBcCj4+Pj4gKyBBUj0iJChIT1NU
QVIpIiBcCj4+Pj4gKyBDQz0iJChIT1NUQ0MpIiBcCj4+Pj4gKyBMRD0iJChIT1NUQ0MpIiBcCj4+
Pj4gKyBPQkpDT1BZPSIkKEhPU1RPQkpDT1BZKSIgXAo+Pj4+ICsgUkFOTElCPSIkKEhPU1RSQU5M
SUIpIiBcCj4+Pj4gKyBFWFRSQUNGTEFHUz0iJChIT1NUX0NGTEFHUykgJChIT1NUX0NQUEZMQUdT
KSIgXAo+Pj4+ICsgRVhUUkFMREZMQUdTPSIkKEhPU1RfTERGTEFHUykiIFwKPj4+PiArIC1DICQo
QEQpCj4+Pj4gKyAkKEhPU1RfTUFLRV9FTlYpICQoTUFLRSkgJChIT1NUX0NPTkZJR1VSRV9PUFRT
KSBcCj4+Pj4gKyBDT1BUUz0iJChIT1NUX0NGTEFHUykgJChIT1NUX0NQUEZMQUdTKSAkKEhPU1Rf
TERGTEFHUykiIFwKPj4+PiArIC1DICQoQEQpL2FkZC1vbnMvaGFiX2NzZl9wYXJzZXIKPj4+PiAr
ZW5kZWYKPj4+PiArCj4+Pj4gK2RlZmluZSBIT1NUX0lNWF9DU1RfSU5TVEFMTF9DTURTCj4+Pj4g
KyAkKElOU1RBTEwpIC1EIC1tIDc1NSAkKEBEKS9jb2RlL29iai4kKEhPU1RfSU1YX0NTVF9PU1RZ
UEUpL2NzdAo+Pj4+ICQoSE9TVF9ESVIpL2Jpbi9jc3QKPj4+PiArICQoSU5TVEFMTCkgLUQgLW0g
NzU1ICQoQEQpL2NvZGUvb2JqLiQoSE9TVF9JTVhfQ1NUX09TVFlQRSkvc3JrdG9vbAo+Pj4+ICQo
SE9TVF9ESVIpL2Jpbi9zcmt0b29sCj4+Pj4gKyAkKElOU1RBTEwpIC1EIC1tIDc1NSAkKEBEKS9h
ZGQtb25zL2hhYl9jc2ZfcGFyc2VyL2NzZl9wYXJzZXIKPj4+PiAkKEhPU1RfRElSKS9iaW4vY3Nm
X3BhcnNlcgo+Pj4+ICtlbmRlZgo+Pj4+ICsKPj4+PiArJChldmFsICQoaG9zdC1nZW5lcmljLXBh
Y2thZ2UpKQo+Pj4gCj4+PiAtLQo+Pj4gfi4gLn4gVGsgT3BlbiBTeXN0ZW1zCj4+PiA9fS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLW9vTy0tVS0tT29vLS0t
LS0tLS0tLS0tez0KPj4+IC0gYmFydWNoQHRrb3MuY28uaWwgLSB0ZWw6ICs5NzIuNTIuMzY4LjQ2
NTYsIGh0dHA6Ly93d3cudGtvcy5jby5pbCAtCj4gCj4gLS0KPiB+LiAufiBUayBPcGVuIFN5c3Rl
bXMKPiA9fS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLW9v
Ty0tVS0tT29vLS0tLS0tLS0tLS0tez0KPiAtIGJhcnVjaEB0a29zLmNvLmlsIC0gdGVsOiArOTcy
LjUyLjM2OC40NjU2LCBodHRwOi8vd3d3LnRrb3MuY28uaWwgLQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
