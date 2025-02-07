Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55398C02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 01:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B00F6FA94;
	Fri,  7 Feb 2025 01:18:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qA3eTZ4_v9Gc; Fri,  7 Feb 2025 01:17:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EEF860BE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EEF860BE3;
	Fri,  7 Feb 2025 01:17:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F280CF
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 01:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E860405D2
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 01:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zY-jouKthGiy for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 01:17:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DA452405C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA452405C2
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA452405C2
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 01:17:52 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.1.210.218]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHGCo-1tbpGv2IfA-00BbyL; Fri, 07
 Feb 2025 02:17:49 +0100
Date: Fri, 7 Feb 2025 02:17:48 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, j.neuschaefer@gmx.net
Message-ID: <Z6VfPMQrB_i1hCaS@probook>
References: <20240704-snooze-v1-1-f9e845f0d813@gmx.net>
 <da1a07c5-c7bf-42dd-bbce-efbef6bce080@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <da1a07c5-c7bf-42dd-bbce-efbef6bce080@korsgaard.com>
X-Provags-ID: V03:K1:KPPrGxg7yBjV/ATN8HxuyYeK1LL+B5Sz8hXKKZ94FiFr7ajPqEj
 Zk/FKDT0d3JNca/5EaUqhEoqVateN8A03QuxZ3c6tFtnBEsTHJnJYLon/LyGhGHy4xuYGey
 pWkNHQD5A+RiQS1xP6D6LK8IoE6YaavLkldnKQDPOjiuOYHyMfKW1kQt9AkwZTvA3yPYOXx
 /vcu03Ypj+osWTHw2k3/A==
UI-OutboundReport: notjunk:1;M01:P0:5tWsR3acOW8=;+gZAz3d5QU6kqQxtAwosotWz6Lp
 ZHC8cFBNckSu8BN8icmKSJ7894PcDBkA6N6ARrrE4o+rZ2AKtm69JG4ZRv+K91+KNXNVcwTPf
 WAl8UrX8aLcSL62LkoiLdtJGK6/f6sfeSun5u1BPW8tPJER0T273XwbfNuAbXp9fBCKebNtkA
 fnmkKdLcacO02UfrzuARx6NxUjp3wwXZ3kJ+164/72qSZ+xxsdSOqsvAHZvDy+frwC/8OFcyA
 aJLzmXyfZr1FY+rrA8aoRNZKoHDJn+V0OFHMvC5Un52yoNisM5U6sDqxlG0cp0lmx5pmghX1R
 422hK5SLFqYRApNenVAMx0m3Vatbjh6A3IwaACWLOfxMD3ER7FcgtimeWLy2rKnz0jkkrh5rY
 uP0l4dlXOm2Nmv3eYSZkn09PcvYPFnZOFqddGYidZKObCBTsRbNRyNrQSHaPuu9jbK3377vEe
 ODLWUmsR0GG0tVQwJwfeY4sIvLEKsKtdILxYP5HgcWfxQUYUngGHCNkZJOWUDoTGTVcNCfg25
 srMR+b+GXUCpvSWm5IjAhWBciqtrDe3fTzxXujIXwbrNbgJBQ13x+nflc8J0zr2Qze6LsDdxl
 E2eoHWZfRp8pNJZmCDrBdvMoSb/MWaB+UgUp/I3Y6hBFVv9XzV4Zv7fhP962PBrZ0QD9IO2d2
 U4n++It3CWQZpnOP5SThM3d+RH2wwTCxBzjynH9zgJS+cISDanEWIUC5gm+BlC4blmU3bRPVW
 QevfZJ8stMAzbCQkz4DCOW8//PCGqL0BKcz+woW7j4s+vghzdZ4o8eq5JMD9vihhJwZgKn1mN
 DrKe+vrakHUwsO+Xr7vvI9kLcA0Q9dC9oDtmO3z8E+o+mkIO6X8nKRqUXznXFC5q0Zocnbk8k
 LoPvDOWFyADYqcaPraDh77X/tRcN/DEtmO58+a4oiovWOEOG0ZOuwsJVD+ztvX+Qq+V6zMeE0
 1EBjzaBY84w5oz7ed4p2Cqz6mGqGFoDpE4K/51p7JDhJ+bW1suZWYf/+Htp4mhk5GqtmxDVXs
 olxjRI/pymf2+pdm/XczrqBtCdJjdoqSy6DZc71bLukxLL0B6M9z578PuiLF8yRC2HZwLU1Z4
 Vpw+5gtVMt456RyAYi9wQh3u3XphmGEIr8hqWfgB0usJHLzoEbW85XV3o4wQQPoAuWevyZ0xZ
 Oev327KfEAc4BHFVDgAD86wlODVVUW0i8o7Ti/9QoYk+H9LjnyVLUeG4xBN4YT4XNqaVoBE8R
 Srvan1YPAdAS5vUgiwZwrthAS5fHEqp4AP/K0R6pgqaKookiJpRXd1+UK7Xz+D5G4X7sm6fU4
 Fy4Ri/BxvBJiUPAAcfIE1JYHctzA45DVOk90+9HaOWj04GaLwdwQ1mfeol+JnbuHh574ZA1jY
 lquYcF8mT62CCKN2jwLMhMLFv0yVJdAlrcbbMZu4Abo9qKTIgEostfbA4zrmWZL5r438Xd73Z
 lDY5lwg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1738891069; x=1739495869; i=j.neuschaefer@gmx.net;
 bh=rr36R3mprwJnTHYr8DpQZ5e3heYXZ3AO6Q1zsp9WjkI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=QnhWZ0uc5CPE4nLtmRaSm+saiZWpGLrP+MJmr5pZ1ooj5Qnsj2dMk3/v2L4KFcF+
 uDoUfSHfWwfk53vPqEGRfryYBdAAsJtqtpofYMPUuwWBLF2OvslWbNNNdRylgQ2lA
 TwqHwxdYehAUOIaZK0QWuQqxSuMf8pXMhPq7FP7k4Lu4ZdX69tOwk3vSYO2pod4lm
 x2kkKg2TBjVXRaS2RN99AFng7F3w7eEz5/n9yYVpRumtPkCiEjvin3GECQf6z5smn
 TwzUhCkx3dnbnbuvGwRG9fydOvnolWHvlxQlauZDW1va9QKLk5L8anEKxrhccGouT
 WAUCst4Zdymial5vcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=QnhWZ0uc
Subject: Re: [Buildroot] [PATCH] snooze: new package
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBGZWIgMDUsIDIwMjUgYXQgMDQ6MDA6MDdQTSArMDEwMCwgUGV0ZXIgS29yc2dhYXJk
IHdyb3RlOgo+IE9uIDcvNC8yNCAyMTo0OSwgSi4gTmV1c2Now6RmZXIgdmlhIGJ1aWxkcm9vdCB3
cm90ZToKPgo+IEhlbGxvLCBhbmQgc29ycnkgZm9yIHRoZSBzbG93IHJlc3BvbnNlLgo+Cj4gPiAr
KysgYi9wYWNrYWdlL3Nub296ZS8wMDAxLWZpeC1zbm9vemUtbi1mb3JtYXQtc3RyaW5nLnBhdGNo
Cj4gPiBAQCAtMCwwICsxLDM4IEBACj4gPiArRnJvbSA1ZjllNjE2YjI5ZmUyNzJmZmZiYjMxZTRi
N2VhOGZmNjFmNzgxNjAxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ID4gK0Zyb206IExlYWgg
TmV1a2lyY2hlbiA8bGVhaEB2dXh1Lm9yZz4KPiA+ICtEYXRlOiBXZWQsIDI5IE1heSAyMDI0IDE5
OjQyOjI3ICswMjAwCj4gPiArU3ViamVjdDogW1BBVENIXSBmaXggInNub296ZSAtbiIgZm9ybWF0
IHN0cmluZwo+ID4gKwo+ID4gK0ZpeGVzICMyMi4KPiA+ICsKPgo+IFBhdGNoZXMgbmVlZCBzaWdu
ZWQtb2ZmLWJ5IHRhZ3MgYXMgZmxhZ2dlZCBieSAuL3V0aWxzL2NoZWNrLXBhY2thZ2UuIEkgaGF2
ZQo+IGFkZGVkIHlvdXJzIGZyb20gYWJvdmUuCj4KPiA+ICsrKyBiL3BhY2thZ2Uvc25vb3plL3Nu
b296ZS5tawo+ID4gQEAgLTAsMCArMSwyOSBAQAo+ID4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Cj4gPiArIwo+ID4gKyMgc25vb3plCj4gPiArIwo+ID4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Cj4gPiArCj4gPiArU05PT1pFX1ZFUlNJT04gPSAwLjUKPiA+ICtTTk9PWkVfU0lURSA9ICQoY2Fs
bCBnaXRodWIsbGVhaG5ldWtpcmNoZW4sc25vb3plLHYkKFNOT09aRV9WRVJTSU9OKSkKPiA+ICtT
Tk9PWkVfTElDRU5TRSA9IENDMC0xLjAKPiA+ICsKPiA+ICsjIFVuZm9ydHVuYXRlbHksIHNub296
ZSBkb2Vzbid0IGhhdmUgYSBkZWRpY2F0ZWQgZmlsZSBmb3IgdGhlIGxpY2Vuc2UsIGJ1dCBpdAo+
ID4gKyMgaXMgbWVudGlvbmVkIGluIHRoZSBSRUFETUUgYW5kIGluIHRoZSBtYW5wYWdlLgo+ID4g
K1NOT09aRV9MSUNFTlNFX0ZJTEVTID0gUkVBRE1FLm1kCj4gPiArCj4gPiArU05PT1pFX01BS0Vf
T1BUUyA9IFwKPiA+ICsJCSAgIFBSRUZJWD0vIFwKPgo+IFRoZSBkZWZhdWx0IGlzIC91c3IvbG9j
YWwuIEFueSBzcGVjaWZpYyByZWFzb24gdG8gbWFrZSBpdCAvIGluc3RlYWQgb2YgL3Vzcj8KPiBJ
IGhhdmUgbWFkZSBpdCAvdXNyIGZvciBjb25zaXN0ZW5jeS4KPgo+ID4gKwkJICAgREVTVERJUj0k
KFRBUkdFVF9ESVIpIFwKPgo+IERFU1RESVIgaXMgdXNlZCBhdCBpbnN0YWxsYXRpb24gdGltZSBh
bmQgbm90IGJ1aWxkIHRpbWUsIHNvIEkgbW92ZWQgaXQgdG8KPiBfSU5TVEFMTF9UQVJHRVRfQ01E
UyBzaW1pbGFyIHRvIGhvdyBpdCBpcyBkb25lIGZvciBhdXRvdG9vbHMgcGFja2FnZXMuCj4KPgo+
ID4gKwkJICAgQ0M9JChUQVJHRVRfQ0MpIFwKPiA+ICsJCSAgIExEPSQoVEFSR0VUX0xEKQo+Cj4g
VGhlIE1ha2VmaWxlIGRvZXMgbm90IHVzZSBMRCwgc28gSSBoYXZlIGRyb3BwZWQgdGhhdC4gSW5z
dGVhZCB3ZSBuZWVkIHRvCj4gcGFzcyBUQVJHRVRfQ0ZMQUdTIGFuZCBUQVJHRVRfTERGTEFHUywg
c28gSSBoYXZlIGFkZGVkIHRob3NlLgo+Cj4KPiBGaW5hbGx5IHlvdSBmb3Jnb3QgdG8gYWRkIHRo
ZSBwYWNrYWdlIHRvIHlvdXIgREVWRUxPUEVSUyBlbnRyeS4KPgo+IENvbW1pdHRlZCB3aXRoIHRo
ZXNlIGZpeGVzLCB0aGFua3MuCgpJdCBzZWVtcyBJIGZvcmdvdCBxdWl0ZSBhIGZldyB0aGluZ3Mu
Li4KClRoYW5rIHlvdSB2ZXJ5IG11Y2ghCgpKLiBOZXVzY2jDpGZlcgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
