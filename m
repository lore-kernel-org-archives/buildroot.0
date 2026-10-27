Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E613606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 19:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lTwyiL4t
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3B3D6070D;
	Tue, 27 Oct 2026 19:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8UFgKKoBlxO; Tue, 27 Oct 2026 19:08:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 190326068F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793128086;
	b=qxxltoT0TUZU05dBqIhlCD2gIDht5oKa21HBEWsSkEpxshj5LgH2+IdK/dEnm5CyPrbY
	 mfKZfeRmcdwFgDi6TFUyPBjMxHYyhPGFnx0QdeqYFJpvn09UIP9EGUf7pAv30MM+b2hR/
	 KLqPCWV3gaCjR2ZkgOFzbXxUwBVfE6D8cadkPC51DykGbnUog7NgOqQwbqP12Vazn25bs
	 v9DT+RifO2Ma9wLzQk8SGPZiLcIKRfPUhqUK44NLzeAinhneWFSfdZ3vLBzlhGOmi5KOT
	 emCPWH5ZqK++pHKzTRfUtNx5LE6kozFFZ7MZWFMQA0lSVxA4305TXQgj1Yw+WoRUVUA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793128086;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dnxl2aorXXQRqW5GUj4JNd6QjRiz7nic7m0unVQ6xWE=;
	b=GY4ihB6lb+fmcNseBiO7uakJjmJlSRaBIcGAKyS66qPx+qARxvdBKjT+TjY081nCCA1F
	 UFdDhtXEpOeQ+erbNKkO2qAHIBCV4BJVHCVuQ9wvtCToSiU6dCjvMkhV5CmB29taTPns5
	 3ZnkW958zxxiyJnK2o9gf5MzuhoBiV3aMqK2X8MosbvoP6Ly2fFHD3PZZYm/8LpqFek9q
	 g/d9TUEwaCcmarS+hepWmcq1r391ICkbjjgMOWwxwGOGicto+teiPOw316e3x3UPUiJh8
	 B7yQyAOZ/9kHwvy7MveIKiCeAXucJ1V01DCDjnYxyPODYznzNNOoZEHbHEXdcgiXLWg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793128086;
	bh=dnxl2aorXXQRqW5GUj4JNd6QjRiz7nic7m0unVQ6xWE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lTwyiL4tx7uzEedzFPqsqlNWXYAHprTWdrSQwbq5VCVMBNqua45Hir1tAYbVxq4Tf
	 3PiqpV3VIQjvq8bIVS79kaZaAPRBUkd/yL1d0J3eGbfyqFG8+Egn0IdYke3DUSxsp+
	 brU5+NEzQh1UjM83gDnSeH1BjcX8AF5bzqDb22MBtT+zdM1auj5n7BMKhUwan18aOI
	 XqHww2Y1fm9EHH0604QPghf1MotuV0jPYHnJd25q3xNU1SrMRpEseM+lOqSTwM5oz9
	 aZqriiv2OnRuzktrQeiBNbtSOOoFUbgSzADT6zBwpzylnMNipt2mM/9oQQNtFnRSdz
	 tOf53QP0rrWKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 190326068F;
	Tue, 27 Oct 2026 19:08:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A5F90473
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BF756068F
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5XSpaPgDpfB8 for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 19:08:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0FC1D60681
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793128083;
 b=EHIITJDVFvR6JGakJaOfND1F1xM8v8XFoqmoto2QEs8JCUNv2Brab8/R2fI5PNfUfwyN
 rC+4M2747dWRwlMAxeU9pSpKZd3cc+gGbmgApddMzAs5Iya/XwD9CM32K48V1jhQYLjaV
 McwGPo7nq4hkhF9tzl0k9UMhhMJIHRtGQde0kKnFMdrEAItMVtRteeNvVU2yqJuhlZr8O
 Bzdx1PBbnVVIyKo2WBR15hcN8vEULor/CvSONcvLnWWVL5ryi6TiWFghRx7VorRbGHgvP
 ea9vs1uJLFSDDv0wL+95ycM+vbAv3JDqKyKbhOrkw3geXO5gvkv2QVLvS89dMfxruYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793128083;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=NdJS+p6nmz5+INOu23oJBpz6Xz8ckyeMxRYMbfQjjsk=;
 b=Jr4NXXmi8a5q2UZMw1lWnSI07rKqEQmMTmpaXTapdps8gMnUQWV41A1F96wFKi1r+Eq1
 5AJHvSpQCiKsvDwcjaXjWWUYah2Tqduyfq59/ia9wi304ruqznfeJk7J2CrlcT4pw0zVe
 ZEDbXsCcdTCWwQx+Q4P0pVlxIQTFPLAHCX5xtEfEIlsOZC80PwIonxtjQPiPLxGm719IP
 cnM39UWCPuTB3/xBQ2Iaav8gDlGSpvBns1XhEJEr32FjMu1RKwlFPv6Fq3l13EbW/1ZYE
 2a6q3KE60JLP/pJTP+nYiXYo9VGC8mXAavpHgzMHVThiy1TgHCe7ANzEq10MwfP8U6w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=pz5vttfU; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FC1D60681
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:08:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9C9EB4E4134A;
 Tue, 27 Oct 2026 19:07:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 524D1603BD;
 Tue, 27 Oct 2026 19:07:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B20AD10329044; Tue, 27 Oct 2026 20:07:53 +0100 (CET)
Date: Tue, 27 Oct 2026 20:07:52 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <auD2H0OMhmukAv4h@windsurf>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 01/14] package/boost: fix asio.hpp
 compile errors with gcc >= 15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGVsbG8sCgpPbiBUdWUsIE9jdCAyNywgMjAyNiBhdCAwNTozOTo1OFBNICswMTAwLCBBZGFtIER1
c2tldHQgd3JvdGU6Cj4gVGhpcyBjb21taXQgdW5pbnRlbnRpb25hbGx5IGZpeGVkIGEgY29tcGls
ZSBlcnJvciB3aGVuIHByb2dyYW1zCj4gaW5jbHVkZSB0aGUgYXNpby5ocHAgaGVhZGVyIHdpdGgg
Z2NjIHZlcnNpb25zID49IDE1Lgo+IAo+IGBgYAo+IEluIGZ1bmN0aW9uIOKAmHZvaWQqIG1lbWNw
eSh2b2lkKiwgY29uc3Qgdm9pZCosIHNpemVfdCnigJksCj4gCj4gaW5saW5lZCBmcm9tIOKAmHN0
YXRpYyBib29zdDo6YXNpbzo6aXA6OmJhc2ljX3Jlc29sdmVyX3Jlc3VsdHM8SW50ZXJuZXRQcm90
b2NvbD4KPiAgICAgYm9vc3Q6OmFzaW86OmlwOjpiYXNpY19yZXNvbHZlcl9yZXN1bHRzPEludGVy
bmV0UHJvdG9jb2w+OjpjcmVhdGUoYm9vc3Q6OmFzaW86OmRldGFpbDo6YWRkcmluZm9fdHlwZSos
Cj4gICAgIGNvbnN0IHN0ZDo6c3RyaW5nJiwgY29uc3Qgc3RkOjpzdHJpbmcmKSBbd2l0aCBJbnRl
cm5ldFByb3RvY29sID0gYm9vc3Q6OmFzaW86OmlwOjp0Y3Bd4oCZCj4gICAgIGF0IC91c3IvaW5j
bHVkZS9ib29zdC9hc2lvL2lwL2Jhc2ljX3Jlc29sdmVyX3Jlc3VsdHMuaHBwOjE0NzoxNToKPiAK
PiAvdXNyL2luY2x1ZGUvYml0cy9zdHJpbmdfZm9ydGlmaWVkLmg6Mjk6MzM6Cj4gICAgIGVycm9y
OiDigJh2b2lkKiBfX2J1aWx0aW5fX19tZW1jcHlfY2hrKHZvaWQqLCBjb25zdCB2b2lkKiwgdW5z
aWduZWQgaW50LCB1bnNpZ25lZCBpbnQp4oCZCj4gICAgIGZvcm1pbmcgb2Zmc2V0IFsyOCwgMTI4
XSBpcyBvdXQgb2YgdGhlIGJvdW5kcyBbMCwgMjhdIG9mIG9iamVjdCDigJhlbmRwb2ludOKAmSB3
aXRoIHR5cGUKPiAgICAg4oCYYm9vc3Q6OmFzaW86OmlwOjp0Y3A6OmVuZHBvaW504oCZIHtha2Eg
4oCYYm9vc3Q6OmFzaW86OmlwOjpiYXNpY19lbmRwb2ludDxib29zdDo6YXNpbzo6aXA6OnRjcD7i
gJl9Cj4gICAgIFstV2Vycm9yPWFycmF5LWJvdW5kcz1dCj4gYGBgCj4gCj4gQmFja3BvcnQgVVJM
OiBodHRwczovL2dpdGh1Yi5jb20vYm9vc3RvcmcvYXNpby9jb21taXQvYjI0NzhhOWJhOWVkNzZk
N2M4NTg0MTllM2Y2NzdjYzQ1NDU5MWQ0NQo+IAo+IEZpeGVzOiBOb25lIHJlcG9ydGVkCj4gU2ln
bmVkLW9mZi1ieTogQWRhbSBEdXNrZXR0IDxhZGFtLmR1c2tldHRAYW1hcnVsYXNvbHV0aW9ucy5j
b20+CgpUaGFua3MsIEkndmUgYXBwbGllZCwgYWZ0ZXIgZG9pbmcgbWlub3IgdHdlYWtzIHRvIHRo
ZSBwYXRjaCwgc2VlCmJlbG93LgoKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ib29zdC8wMDAyLXJl
bW92ZS1GT1JUSUZZX1NPVVJDRS13b3JrYXJvdW5kLnBhdGNoIGIvcGFja2FnZS9ib29zdC8wMDAy
LXJlbW92ZS1GT1JUSUZZX1NPVVJDRS13b3JrYXJvdW5kLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5kMDQ0YjYyNjc2Cj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL3BhY2thZ2UvYm9vc3QvMDAwMi1yZW1vdmUtRk9SVElGWV9TT1VSQ0Utd29ya2Fyb3VuZC5w
YXRjaAo+IEBAIC0wLDAgKzEsNzUgQEAKPiArRnJvbSBiM2Q4N2RhNWY4N2UyOTA3ZWQwMDRlZGYx
YzcyYWQzOTQyZmYxMTY1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBDaHJpc3Rv
cGhlciBLb2hsaG9mZiA8Y2hyaXNAa29obGhvZmYuY29tPgo+ICtEYXRlOiBXZWQsIDUgQXVnIDIw
MjYgMTY6MDc6MTkgKzAyMDAKPiArU3ViamVjdDogW1BBVENIXSBSZW1vdmUgX0ZPUlRJRllfU09V
UkNFIHdvcmthcm91bmQuCj4gKwo+ICtUaGlzIGNvbW1pdCB1bmludGVudGlvbmFsbHkgZml4ZWQg
YSBjb21waWxlIGVycm9yIHdoZW4gcHJvZ3JhbXMKPiAraW5jbHVkZSB0aGUgYXNpby5ocHAgaGVh
ZGVyIHdpdGggZ2NjIHZlcnNpb25zID49IDE1Lgo+ICsKPiArYGBgCj4gK0luIGZ1bmN0aW9uIOKA
mHZvaWQqIG1lbWNweSh2b2lkKiwgY29uc3Qgdm9pZCosIHNpemVfdCnigJksCj4gKwo+ICtpbmxp
bmVkIGZyb20g4oCYc3RhdGljIGJvb3N0Ojphc2lvOjppcDo6YmFzaWNfcmVzb2x2ZXJfcmVzdWx0
czxJbnRlcm5ldFByb3RvY29sPgo+ICsgICAgYm9vc3Q6OmFzaW86OmlwOjpiYXNpY19yZXNvbHZl
cl9yZXN1bHRzPEludGVybmV0UHJvdG9jb2w+OjpjcmVhdGUoYm9vc3Q6OmFzaW86OmRldGFpbDo6
YWRkcmluZm9fdHlwZSosCj4gKyAgICBjb25zdCBzdGQ6OnN0cmluZyYsIGNvbnN0IHN0ZDo6c3Ry
aW5nJikgW3dpdGggSW50ZXJuZXRQcm90b2NvbCA9IGJvb3N0Ojphc2lvOjppcDo6dGNwXeKAmQo+
ICsgICAgYXQgL3Vzci9pbmNsdWRlL2Jvb3N0L2FzaW8vaXAvYmFzaWNfcmVzb2x2ZXJfcmVzdWx0
cy5ocHA6MTQ3OjE1Ogo+ICsKPiArL3Vzci9pbmNsdWRlL2JpdHMvc3RyaW5nX2ZvcnRpZmllZC5o
OjI5OjMzOgo+ICsgICAgZXJyb3I6IOKAmHZvaWQqIF9fYnVpbHRpbl9fX21lbWNweV9jaGsodm9p
ZCosIGNvbnN0IHZvaWQqLCB1bnNpZ25lZCBpbnQsIHVuc2lnbmVkIGludCnigJkKPiArICAgIGZv
cm1pbmcgb2Zmc2V0IFsyOCwgMTI4XSBpcyBvdXQgb2YgdGhlIGJvdW5kcyBbMCwgMjhdIG9mIG9i
amVjdCDigJhlbmRwb2ludOKAmSB3aXRoIHR5cGUKPiArICAgIOKAmGJvb3N0Ojphc2lvOjppcDo6
dGNwOjplbmRwb2ludOKAmSB7YWthIOKAmGJvb3N0Ojphc2lvOjppcDo6YmFzaWNfZW5kcG9pbnQ8
Ym9vc3Q6OmFzaW86OmlwOjp0Y3A+4oCZfQo+ICsgICAgWy1XZXJyb3I9YXJyYXktYm91bmRzPV0K
PiArYGBgCj4gKwo+ICsKPiArT3JpZ2luYWwgcGF0Y2ggY29tbWl0IG1lc3NhZ2U6Cj4gK2BgYAo+
ICtUaGUgcHJldmlvdXMgd29ya2Fyb3VuZCBmb3IgX0ZPUlRJRllfU09VUkNFIHdhcm5pbmdzIGlu
Y3JlYXNlZCB0aGUgc2l6ZQo+ICtvZiBhbGwgSVAgZW5kcG9pbnQgb2JqZWN0cy4gSW5zdGVhZCwg
dHJ5IGZpeGluZyB0aGUgd2FybmluZyBhdCB0aGUgcG9pbnQKPiArd2hlcmUgaXQgb2NjdXJzLCBi
eSBsaW1pdGluZyB0aGUgbGVuZ3RoIG1lbWNweS1lZCB3aGlsZSBwcm9jZXNzaW5nIHRoZQo+ICth
ZGRyaW5mbyByZXN1bHRzIGZyb20gZ2V0YWRkcmluZm8uCj4gK2BgYAo+ICsKPiArVXBzdHJlYW06
IEJhY2twb3J0IFtodHRwczovL2dpdGh1Yi5jb20vYm9vc3RvcmcvYXNpby9jb21taXQvYjI0Nzhh
OWJhOWVkNzZkN2M4NTg0MTllM2Y2NzdjYzQ1NDU5MWQ0NV0KCkp1c3Q6CgpVcHN0cmVhbTogaHR0
cHM6Ly9naXRodWIuY29tL2Jvb3N0b3JnL2FzaW8vY29tbWl0L2IyNDc4YTliYTllZDc2ZDdjODU4
NDE5ZTNmNjc3Y2M0NTQ1OTFkNDUKCmlzIGVub3VnaC4KCj4gK1NpZ25lZC1vZmYtYnk6IEFkYW0g
RHVza2V0dCA8YWRhbS5kdXNrZXR0QGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ICtTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RvcGhlciBLb2hsaG9mZiA8Y2hyaXNAa29obGhvZmYuY29tPgoKWW91ciBTb0Ig
c2hvdWxkIGJlIGJlbG93IHRoZSBvbmUgb2YgdGhlIGF1dGhvci4gQnV0IGluIHRoaXMgY2FzZSwg
dGhlCm9yaWdpbmFsIHBhdGNoIGRvZXMgbm90IGhhdmUgYW4gU29CIGZyb20gdGhlIGF1dGhvciAo
ZnJvbSB3aGF0IEkgY291bGQKc2VlKSwgc28geW91IGNhbm5vdCBhZGQgaXQgYnkgeW91cnNlbGYg
KGl0J3MgbGlrZSBmYWtpbmcgYSBzaWduYXR1cmUKYXQgdGhlIGVuZCBvZiBhbiBpbXBvcnRhbnQg
cGllY2Ugb2YgcGFwZXJ3b3JrISkuIEhvd2V2ZXIsIHlvdSBtdXN0IGFkZAp5b3VyIG93biBTb0Ig
dG8gaW5kaWNhdGUgdGhhdCB0aGUgcGF0Y2ggd2FzIGNvbnZleWVkIHRocm91Z2ggeW91LgoKVGhh
bmtzIQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290
bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0
dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
