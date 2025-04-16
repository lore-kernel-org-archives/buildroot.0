Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB60C369C5
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 19:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD20F81EBF;
	Wed, 16 Apr 2025 19:44:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsT1nzNfEIuM; Wed, 16 Apr 2025 19:44:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED73C83661
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED73C83661;
	Wed, 16 Apr 2025 19:44:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 831D46B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68B33416B5
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TaBYyJsvMOw7 for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 19:44:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7A815414F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A815414F4
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A815414F4
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:44:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EFF521C1049; Wed, 16 Apr 2025 21:44:45 +0200 (CEST)
Message-ID: <cef1ab8c-3b09-4433-934c-23b532a5c700@rnout.be>
Date: Wed, 16 Apr 2025 21:44:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Robert Smigielski <ptdropper@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
References: <CABWt4euwWJ=D11Rm4rkXhccnm7x7EguHeyy2AmBJRNMnrneziA@mail.gmail.com>
 <87plhdanus.fsf@dell.be.48ers.dk>
Content-Language: en-GB
In-Reply-To: <87plhdanus.fsf@dell.be.48ers.dk>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744832686; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=bCUJJXQSkXSIAcVMzM1cOchaygsUSf2/NLiNgnu5cKs=;
 b=Z6iJ/TS9miL3wMGHp1AN/2umFgtKX3qvxFrFoGY5ByXDNOlFVhh6CaJWX6DzaBNH/0hWZi
 xzYOSXDXgg+sHpNIg5Rhb/qwPGrJ9mPbN/MSy+zlPlLqfSWZ4j6eXFX/uaE6AyPQnxFEUj
 qr3kBDB+Za7AMb6DUoFVzgXT3Z9Ju+u0nBbAvNYL4FvqQtGM5z5cbSU85a6lCzIytZPxeW
 vfkhA0m/qki8jE9GA9Cu9UAIpdJzPOHSJM2jn/ZYyShfIdlGy07iyAClrslkEF9O1Fqn6q
 0ZLILoM86Fe9I2JsgQJIWKhVWjitu7WGOdpMjK8Eo1mRzuIIZbvo50Rg3fr87Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] Buildroot 2025.02 released
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDE1LzA0LzIwMjUgMDk6MjQsIFBldGVyIEtvcnNnYWFyZCB3cm90ZToKPj4+Pj4+ICJSb2Jl
cnQiID09IFJvYmVydCBTbWlnaWVsc2tpIDxwdGRyb3BwZXJAZ21haWwuY29tPiB3cml0ZXM6Cj4g
SGkgUm9iZXJ0LAo+Cj4gICA+IEhpIEJ1aWxkcm9vdCB0ZWFtCj4gICA+IEkgcnVuIGEgdGlueSBv
cGVuIHNvdXJjZSBwcm9qZWN0IHRoYXQgYWxzbyBzdXBwb3J0cyBDeWNsb25lRFggU0JPTQo+ICAg
PiBnZW5lcmF0aW9uIGZvciBCdWlsZHJvb3QuIEkgd2FzIHBhcnQgb2YgdGhpcyBlbWFpbCBjaGFu
bmVsIGJ1dCBoYWQgdG8KPiAgID4gZHJvcCBmb3Igd29yayByZWFzb25zLgo+ICAgPiBHbGFkIHRv
IGJlIGJhY2sgYW5kIG9mZmVyIHN1cHBvcnQuIFRoZSBwcm9qZWN0IEkgcGFydGljaXBhdGUgd2l0
aCBpcwo+ICAgPiBodHRwczovL2dpdGh1Yi5jb20vQ3ljbG9uZURYL2N5Y2xvbmVkeC1idWlsZHJv
b3QvIGFuZCB3b3VsZCBsaWtlIHRvCj4gICA+IGNvb3JkaW5hdGUgd2l0aCB5b3UuCj4KPiBTb3Jy
eSBmb3IgdGhlIHNsb3cgcmVzcG9uc2UsIHRoaW5ncyBoYXZlIGJlZW4ga2luZCBvZiBidXN5IGhl
cmUuCj4KPiBUaGFua3MgZm9yIHJlYWNoaW5nIG91dCEgSSBoYXZlIHVzZWQgY3ljbG9uZWR4LWJ1
aWxkcm9vdCBpbiB0aGUgcGFzdAo+IG15c2VsZi4gUmVnYXJkaW5nIGNvb3JkaW5hdGlvbiwgY2Fu
IHlvdSBnaXZlIGFuIG92ZXJ2aWV3IG9mIHdoYXQgdGhlCj4gZGVsdGEgaXMgaW4gdGhlIG91dHB1
dCBmcm9tIGN5Y2xvbmVkeC1idWlsZHJvb3QgYW5kIG91cgo+IHV0aWxzL2dlbmVyYXRlLWN5Y2xv
bmVkeCBzY3JpcHQ/IEkgaGF2ZSBhZGRlZCBUaG9tYXMsIGF1dGhvciBvZgo+IGdlbmVyYXRlLWN5
Y2xvbmVkeCBoZXJlIGFzIHdlbGwuCgogwqBJIGNvbXBhcmVkIHRoZSB0d28gYmVmb3JlIGFwcGx5
aW5nIHRoZSBnZW5lcmF0ZS1jeWNsb25lZHggY29kZS4gVGhlIHVzYWdlIGlzIApzbGlnaHRseSBk
aWZmZXJlbnQgLSBnZW5lcmF0ZS1jeWNsb25lZHggZXhwZWN0cyBzaG93LWluZm8gb3V0cHV0IGFz
IGlucHV0LCB3aGlsZSAKY3ljbG9uZWR4LWJ1aWxkcm9vdCBjYWxscyBpdCBpbnRlcm5hbGx5LgoK
IMKgSUlSQywgdGhlIG1haW4gZGlmZmVyZW5jZXMgaW4gdGhlIG91dHB1dCBhcmU6CgotIENWRSBl
eGNsdXNpb25zIGFyZSBoYW5kbGVkIGRpZmZlcmVudGx5IChvciBub3QgYXQgYWxsIGluIGN5Y2xv
bmVkeC1idWlsZHJvb3Q/KQoKLSBnZW5lcmF0ZS1jeWNsb25lZHggaW5jbHVkZXMgdGhlIHBhdGNo
IGNvbnRlbnRzLCBjeWNsb25lZHgtYnVpbGRyb290IGp1c3QgbmFtZXMgCnRoZW0KCi0gZ2VuZXJh
dGUtY3ljbG9uZWR4IGRvZXNuJ3QgYWRkIGEgUFVSTCAoYnV0IFRob21hcyBwb3N0ZWQgYSBzZXJp
ZXMgZm9yIHRoYXQpLgoKCj4KPiBGb3IgQnVpbGRyb290LCBoYXZpbmcgYSBzb2xpZCBTQk9NIHN0
b3J5IG91dCBvZiB0aGUgYm94IGlzIHF1aXRlIG5pY2UsCj4gc28gSSB3b3VsZCBwZXJzb25hbGx5
IHByZWZlciB0byBleHRlbmQgZ2VuZXJhdGUtY3ljbG9uZWR4IGlmIGFueXRoaW5nIGlzCj4gbWlz
c2luZy4KCiDCoFllcywgSSBhbHNvIGxvb2tlZCBhdCBqdXN0IGludGVncmF0aW5nIGN5Y2xvbmVk
eC1idWlsZHJvb3QuIEhvd2V2ZXIsIHRoYXQgaGFzIApxdWl0ZSBhIGZldyBQeVBJIGRlcGVuZGVu
Y2llcywgd2hpY2ggd2UgZG9uJ3QgbGlrZSB0byBoYXZlIGZvciBpbi10cmVlIHRvb2xzLiAKZ2Vu
ZXJhdGUtY3ljbG9uZWR4IHdvcmtzIHdpdGggcHVyZSBKU09OIGluc3RlYWQgb2YgdGhlIGN5Y2xv
bmVkeCBweXRob24gbGlicmFyeS4KCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
