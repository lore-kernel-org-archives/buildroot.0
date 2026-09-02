Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA66C61DD6
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 20:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6D976072A;
	Wed,  2 Sep 2026 20:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tudb_SsFkRf6; Wed,  2 Sep 2026 20:26:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D14CE60738
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788380806;
	b=P5i12m08YEksd+avD2OfA9aBJFNTHRPuVAXnEujzRiQXe5Y1jMQ55d5QeJbzvkZCb8Kc
	 MTvSU220vOX884QGPBQZbKJA8cq5Dckgth9YAzLTYeBB9ILNA7U1Qrmw7Q6xMkLC/gMx/
	 6tKSlf25pZ2Cyy9ZhtlwEmqVm0fINvjf2WkaEuA4YdCLaPlKZiwaGisbreqG0K59lwixD
	 NgdySLNXTzLX7C9q18haQXRKZReDDJI3o6NnmCyQ8CsQ+TNb8qBhDlS9OCbG7XwzwvyDe
	 c2GgwdM2sqy/ukMy9172IQhVOXxEP/z/RsnwMG9aCQXcMhMc06KKitw2ptMtruHJVlw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788380806;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=faEvjUgy4XRu0459Zz4CY4ofcAn1QtYk769GahpHONs=;
	b=kMQDOqi2sHfrujmhf7Mre6cRm8P/p4SpT4R58gvZaUWFF2JbZNsJMrAFRimBhyKu0RtV
	 vbrCn5+C9U0RXTYAD6kTEAnvV+JrV/XJcve9OxUJ90FIl9fa83ikFB0+Io7+++yYhg8Lm
	 LbcssizYb/EDsfGk/6XyDD3TBqtFnngefqQxSWZsRG8KMkC6bloZHiSUoNlj4iR8QWw/i
	 yuO0mEyRCpOlMwTx3SxtZNK4PlYlh5eoxtexyFpJFwrKBID7mOS4Lh9jj0pJ052LVP1Bd
	 jfGX29bTVxGvAOkolsiuZQ4ko8jEE/S/FJkjJzRDqlUlzqPSIT29nJKk7mjbpsNhM9A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788380806;
	bh=faEvjUgy4XRu0459Zz4CY4ofcAn1QtYk769GahpHONs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IoZxmBVsEY5lCwqI79X0FNeLXt0nhqK0UtkqO+TjLgseiKfSaZXvF9FIGeXLJyi7X
	 7TH7PIOR3YYGlZAHL2U+Npjtqzbb4aYXlV/0Giw8PB3NTZmevO6z7F6b6tlVIQc5oR
	 JRd84CitTKcDOhWoomr0KxnTrY162ls9Rj9K/jG2yImhBrgAXUaK0hK41uvCBGeY0D
	 F3gzlrQkzeAyfJW84mccDKOK+NgY7rSTIk19Am38ORJ0pWZnrVLrfFdb8mCfhImuuw
	 ksR8B4hgsfOsopSU4wDVf5rIvcSGb5vDcVFhtb8EZYZ/WcAULKZY/nF3P3ch6Ewt5q
	 J/d2ihnD/MxYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D14CE60738;
	Wed,  2 Sep 2026 20:26:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 44C852B2
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 20:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3547460738
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 20:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KvJIJ1geVLDd for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 20:26:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CB0176072A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788380804;
 b=S8u9sMPXG+J6BVSr40QI1ZzpWS044vBEDqagWMrPjlZFVoDKEH4ppRGwd2UgRMfa7zqR
 bMvXHyVOpLjOcFPtqM/ZGvDi/RcAK8nTcRopQThm38x8HHgKjoaAVEoG8sEs9FfGMCerT
 tTttId+AGI62aIr9Cit5rL0uVIl3g0Yt5h4jw5+6oNFNERWlBGesCBoIRq6BZux8W+iIG
 wUXAdL32hZkhdNdpEXrdIKmS8I/gqMqdHRNWN+qEZmvAr7pIsrmkZxbt1cJwizmbNUFLr
 6GUKWj6Md0VDOYOmRSEz1BVtmOJJpcwxFOu4tnw4aVCfO6dK0WkMPbVr/Lfs913NSCg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788380804;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=loB8S99un+szgmIV+Y8LvYq4KwZitW+J8MMsZHAfScY=;
 b=eB1yY6DJHRpptudcY2l/foERa8aYt71YfzsNqHtsAf8+6H3GhAqmBURfGAauKExvGGnq
 nOFBeCHgwlTPnfT6TnLatpCOpBNfLcTWeRRMflaXvejjLg9+3xMfXaEJ7ggQJmfhzR33q
 lIw9BVVAYyalRG3sZbZ9T7XXEx6pW85I/EbG+IqBd6FretZbBobWMoAFrWe5n8Gd6cx0O
 jPFYYP4ElRsuMQWMz8Z2HVMLk9oZIMUeR+tO0zGdgFJM+5GLf0VelYWnFtBSubFqZSazl
 56QKEpXeIG16dxYP9ZFI/yfyXG5mtWhq11NAlgVpWlmFO6X0ZkoHKNOUhmcVKiX0/3Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MaCTH4Hg; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB0176072A
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 20:26:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 2DF24B0053E;
 Wed,  2 Sep 2026 22:26:39 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 02 Sep 2026 22:26:39 +0200
MIME-Version: 1.0
Date: Wed, 02 Sep 2026 22:26:39 +0200
To: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260830-alacritty-v1-1-a4965888e281@gmail.com>
References: <20260830-alacritty-v1-1-a4965888e281@gmail.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <de0534fd002f0672c206820051607641@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/alacritty: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUmFwaGHDq2wsCgpUaGFua3MgZm9yIHRoZSBwYXRjaC4gSSBoYXZlIGZldyBjb21tZW50cywg
c2VlIGJlbG93LgoKT24gMzAvMDgvMjAyNiAyMDo1MywgUmFwaGHDq2wgR2FsbGFpcy1Qb3Ugd3Jv
dGU6Cj4gQWxhY3JpdHR5IGlzIGEgbW9kZXJuIHRlcm1pbmFsIGVtdWxhdG9yIHRoYXQgY29tZXMg
d2l0aCBzZW5zaWJsZQo+IGRlZmF1bHRzLCBidXQgYWxsb3dzIGZvciBleHRlbnNpdmUgY29uZmln
dXJhdGlvbi4gIEJ5IGludGVncmF0aW5nIHdpdGgKPiBvdGhlciBhcHBsaWNhdGlvbnMsIHJhdGhl
ciB0aGFuIHJlaW1wbGVtZW50aW5nIHRoZWlyIGZ1bmN0aW9uYWxpdHksIGl0Cj4gbWFuYWdlcyB0
byBwcm92aWRlIGEgZmxleGlibGUgc2V0IG9mIGZlYXR1cmVzIHdpdGggaGlnaCBwZXJmb3JtYW5j
ZS4KPiAKPiBBbHRob3VnaCB0aGlzIHByb2plY3Qgd29ya3MgYm90aCBvbiBXYXlsYW5kIGFuZCBY
MTEsIGl0IGlzIGZvciBub3cgb25seQo+IGVuYWJsZWQgd2l0aCBXYXlsYW5kIHN1cHBvcnQuCj4g
Cj4gUHJvamVjdCBtYWlucGFnZTogaHR0cHM6Ly9naXRodWIuY29tL2FsYWNyaXR0eS9hbGFjcml0
dHkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBHYWxsYWlzLVBvdSA8cmdhbGxhaXNwb3VA
Z21haWwuY29tPgo+IC0tLQpbLi4uXQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2FsYWNyaXR0eS9D
b25maWcuaW4gYi9wYWNrYWdlL2FsYWNyaXR0eS9Db25maWcuaW4KPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uZjhmNzcxNjE2M2ZiCj4gLS0tIC9kZXYvbnVsbAo+
ICsrKyBiL3BhY2thZ2UvYWxhY3JpdHR5L0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsMjAgQEAKPiAr
Y29uZmlnIEJSMl9QQUNLQUdFX0FMQUNSSVRUWQo+ICsJYm9vbCAiYWxhY3JpdHR5Igo+ICsJZGVw
ZW5kcyBvbiBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRTCj4gKwlk
ZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hBU19VREVWCj4gKwlkZXBlbmRzIG9uICFCUjJfU1RBVElD
X0xJQlMgIyB3YXlsYW5kCj4gKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMg
IyB3YXlsYW5kCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQwo+ICsJc2VsZWN0IEJS
Ml9QQUNLQUdFX1dBWUxBTkQKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9XQVlMQU5EX1BST1RPQ09M
Uwo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlhLQkNPTU1PTgo+ICsJc2VsZWN0IEJSMl9QQUNL
QUdFX0ZSRUVUWVBFCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfRk9OVENPTkZJRwoKQ291bGQgeW91
IHNvcnQgcGFja2FnZSBzZWxlY3Rpb24gYWxwaGFiZXRpY2FsbHksIHBsZWFzZT8KCj4gKwloZWxw
Cj4gKwkgIEFsYWNyaXR0eSBpcyBhIG1vZGVybiB0ZXJtaW5hbCBlbXVsYXRvciB0aGF0IGNvbWVz
IHdpdGgKPiArCSAgc2Vuc2libGUgZGVmYXVsdHMsIGJ1dCBhbGxvd3MgZm9yIGV4dGVuc2l2ZSBj
b25maWd1cmF0aW9uLgo+ICsJICBCeSBpbnRlZ3JhdGluZyB3aXRoIG90aGVyIGFwcGxpY2F0aW9u
cywgcmF0aGVyIHRoYW4KPiArCSAgcmVpbXBsZW1lbnRpbmcgdGhlaXIgZnVuY3Rpb25hbGl0eSwg
aXQgbWFuYWdlcyB0byBwcm92aWRlIGEKPiArCSAgZmxleGlibGUgc2V0IG9mIGZlYXR1cmVzIHdp
dGggaGlnaCBwZXJmb3JtYW5jZS4KPiArCj4gKwkgIGh0dHBzOi8vZ2l0aHViLmNvbS9hbGFjcml0
dHkvYWxhY3JpdHR5LmdpdAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2FsYWNyaXR0eS9hbGFjcml0
dHkuaGFzaCAKPiBiL3BhY2thZ2UvYWxhY3JpdHR5L2FsYWNyaXR0eS5oYXNoCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjc0Njk4MDY5NWJhYQo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9wYWNrYWdlL2FsYWNyaXR0eS9hbGFjcml0dHkuaGFzaAo+IEBAIC0wLDAg
KzEsNCBAQAo+ICsjIExvY2FsbHkgY29tcHV0ZWQKPiArc2hhMjU2ICAKPiBjMTAxN2ExOTJkNjA2
Yzk2OGU0NzFiODM2M2MyOWMyNTk4NDdiYjg0Yzk3MDAwNDRhNTIxODU2ZWRkN2FiYTA3ICAKPiBh
bGFjcml0dHktMC4xNy1jYXJnbzYudGFyLmd6Cj4gK3NoYTI1NiAgCj4gNjUxOTk5MzE5YzI3ZTky
ZmU4ZWFmNzY0NTFmMTgyMzcxMDcyMzBiMjdjZDZkNTgwYTBhYjk5ZjFjNjIyZDE2NyAgCj4gTElD
RU5TRS1BUEFDSEUKPiArc2hhMjU2ICAKPiA1Njc1Y2E4YWNkZDI4MDYyMmY5M2M2ZmY2NGMzYTI3
MTRkOTMyMmRhNDMzN2MyMDI4ZDRkYmIwNDc1Njg2ZmYyICAKPiBMSUNFTlNFLU1JVAoKUnVubmlu
ZyB0aGUgY29tbWFuZCAibWFrZSBhbGFjcml0dHktbGVnYWwtaW5mbyIKcmVwb3J0cyBsaWNlbnNl
IGhhc2ggZmFpbHVyZXMuCgpDb3VsZCB5b3UgZml4IHRob3NlIGxpY2Vuc2UgaGFzaCBwbGVhc2U/
Cgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2FsYWNyaXR0eS9hbGFjcml0dHkubWsgCj4gYi9wYWNr
YWdlL2FsYWNyaXR0eS9hbGFjcml0dHkubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAwMC4uNjU2NzVhNDUyNGEyCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2th
Z2UvYWxhY3JpdHR5L2FsYWNyaXR0eS5tawo+IEBAIC0wLDAgKzEsMzMgQEAKPiArIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKPiArIwo+ICsjIGFsYWNyaXR0eQo+ICsjCj4gKyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjCj4gKwo+ICtBTEFDUklUVFlfVkVSU0lPTiA9IDAuMTcKClRlc3RpbmcgdGhpcyBw
YWNrYWdlIHdpdGggInRlc3QtcGtnIC1hIC1wIGFsYWNyaXR0eSIgcmVwb3J0cyBmZXcgYnVpbGQg
CmZhaWx1cmVzLiBTZWU6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9qb2xpdmFpbi9idWlsZHJvb3QvLS9w
aXBlbGluZXMvMjgxNDUzODYyNgoKQ291bGQgeW91IGhhdmUgYSBsb29rIHBsZWFzZT8KCj4gK0FM
QUNSSVRUWV9TSVRFID0gJChjYWxsIAo+IGdpdGh1YixhbGFjcml0dHksYWxhY3JpdHR5LHYkKEFM
QUNSSVRUWV9WRVJTSU9OKSkKPiArQUxBQ1JJVFRZX0xJQ0VOU0UgPSBBcGFjaGUtMi4wLCBNSVQK
PiArQUxBQ1JJVFRZX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLUFQQUNIRSBMSUNFTlNFLU1JVAo+
ICtBTEFDUklUVFlfREVQRU5ERU5DSUVTID0gd2F5bGFuZCB3YXlsYW5kLXByb3RvY29scyBsaWJ4
a2Jjb21tb24gCj4gZnJlZXR5cGUgZm9udGNvbmZpZwoKQ291bGQgeW91IHNvcnQgdGhvc2UgZGVw
ZW5kZW5jaWVzIGFscGhhYmV0aWNhbGx5LCBwbGVhc2U/Cgo+ICsKPiArQUxBQ1JJVFRZX1NVQkRJ
UiA9IGFsYWNyaXR0eQo+ICtBTEFDUklUVFlfQ0FSR09fQlVJTERfT1BUUyA9IC0tbm8tZGVmYXVs
dC1mZWF0dXJlcyAtLWZlYXR1cmVzPXdheWxhbmQKPiArQUxBQ1JJVFRZX0NBUkdPX0lOU1RBTExf
T1BUUyA9IC0tbm8tZGVmYXVsdC1mZWF0dXJlcyAKPiAtLWZlYXR1cmVzPXdheWxhbmQKPiArCj4g
K2RlZmluZSBBTEFDUklUVFlfSU5TVEFMTF9BRERJVElPTkFMX0ZJTEVTCj4gKwkjIENyZWF0ZSBk
ZXN0aW5hdGlvbiBmb2xkZXJzIGlmIHRoZSBkbyBub3QgZXhpc3QKPiArCSQoSU5TVEFMTCkgLWQg
LW0gMDc1NSAkKFRBUkdFVF9ESVIpL3Vzci9zaGFyZS9hcHBsaWNhdGlvbnMKPiArCSQoSU5TVEFM
TCkgLWQgLW0gMDc1NSAkKFRBUkdFVF9ESVIpL3Vzci9zaGFyZS9waXhtYXBzCj4gKwo+ICsJIyBJ
bnN0YWxsIC5kZXNrdG9wIGZpbGUKPiArCSQoSU5TVEFMTCkgLUQgLW0gMDY0NCAkKEBEKS9leHRy
YS9saW51eC9BbGFjcml0dHkuZGVza3RvcCBcCj4gKwkJJChUQVJHRVRfRElSKS91c3Ivc2hhcmUv
YXBwbGljYXRpb25zL0FsYWNyaXR0eS5kZXNrdG9wCj4gKwo+ICsJIyBJbnN0YWxsIFNWRyBpY29u
Cj4gKwkkKElOU1RBTEwpIC1EIC1tIDA2NDQgJChARCkvZXh0cmEvbG9nby9hbGFjcml0dHktdGVy
bS5zdmcgXAo+ICsJCSQoVEFSR0VUX0RJUikvdXNyL3NoYXJlL3BpeG1hcHMvQWxhY3JpdHR5LnN2
Zwo+ICtlbmRlZgo+ICsKPiArQUxBQ1JJVFRZX1BPU1RfSU5TVEFMTF9UQVJHRVRfSE9PS1MgKz0g
Cj4gQUxBQ1JJVFRZX0lOU1RBTExfQURESVRJT05BTF9GSUxFUwo+ICsKPiArJChldmFsICQoY2Fy
Z28tcGFja2FnZSkpCj4gCj4gLS0tCj4gYmFzZS1jb21taXQ6IGUxZWM5MzZjZjczMmU1MGJkZGI1
ODg5ODVhOGQ2NzM4YjQzZGEzYWMKPiBjaGFuZ2UtaWQ6IDIwMjYwODMwLWFsYWNyaXR0eS02YTNj
OGEzZWRlZTcKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gLS0KPiBSYXBoYcOrbCBHYWxsYWlzLVBvdSA8
cmdhbGxhaXNwb3VAZ21haWwuY29tPgoKQ291bGQgeW91IHNlbmQgYW4gdXBkYXRlZCBwYXRjaCBh
ZGRyZXNzaW5nIHRob3NlIGlzc3VlcywgcGxlYXNlPwoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
