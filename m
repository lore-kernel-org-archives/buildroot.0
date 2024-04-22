Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1E8C4345F
	for <buildroot@archiver.kernel.org>; Mon, 22 Apr 2024 13:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 212A781E3F;
	Mon, 22 Apr 2024 13:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QM1MMuhTtNoQ; Mon, 22 Apr 2024 13:26:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 251D581E42
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 251D581E42;
	Mon, 22 Apr 2024 13:26:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9899A1BF33F
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 13:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 855E1405FB
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 13:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UBiaEDDTaVmb for <buildroot@lists.busybox.net>;
 Mon, 22 Apr 2024 13:26:22 +0000 (UTC)
X-Greylist: delayed 862 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 22 Apr 2024 13:26:21 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CC9C8405F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC9C8405F6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC9C8405F6
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 13:26:21 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([212.114.183.37]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5fIQ-1s4yUC1Ara-007Ec3; Mon, 22
 Apr 2024 15:26:18 +0200
Date: Mon, 22 Apr 2024 15:26:17 +0200
To: Peter Seiderer via buildroot <buildroot@buildroot.org>
Message-ID: <20240422152617.7c201eb0@gmx.net>
In-Reply-To: <20240422151155.28acd5df@gmx.net>
References: <CAGm1_kv4F+h1KZOiYTJ2ZActM6FMekfUc-OSQYt+ABEjdCsncA@mail.gmail.com>
 <20240422141405.10ed2e21@gmx.net>
 <CAGm1_ks=J-wT0QrPxMFO+DrXsRXYCLGnUdGJhaHUwOLaqPER+Q@mail.gmail.com>
 <CAGm1_kudsdPfm+++_ZTXz2D23ezUJSxGaKaGpxC_ac45eK8sgQ@mail.gmail.com>
 <20240422151155.28acd5df@gmx.net>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:P9KqBc481rIHWHxEr3svaXt8hlZ8mgrGqxoozpOd8S+sIfdpNhI
 4U4ioEmKCM/Dv2gFNtTBKj2agreO1j6CeKkmjBbc/R5IBw9dNjyizap6B91Qm86ansf224K
 8tNbZqbezHDOnKLxh4N2ENPGwcgcasFCBP4Z7LRD+ez4KElKqpikhwE1FjwPU7FzGWaNWZF
 beI0ZwvY9MBBYR0gFcYBw==
UI-OutboundReport: notjunk:1;M01:P0:baSnfgiYayw=;GBKx1YiEuUSjmpiAIfqy5lizdbP
 vdUn641ZwZu+ArpRUbiQkbR7xEeTLKplwoDh8JJ4aaN2nVDDivcRhDCGeZzF1xInT1RkhbBuk
 DUup/OcCcjbLVHFECA9WW//JQWBLUfcVgwFDtV77anmfrKLcIdPfGd8OMojIRCW3c0M9Se2De
 fCOjlL886lSlIr1nRRRIukJ+RgHsmm7WdHEirDtKntFDty7XuHkYDbdSkeyEDv8DtiRxKFsiC
 6vzYZp2GpXtajN7LaQDyGcgIk5a6B1zOlglte3fNTI/vF2aH3UqWykONHujLpZvoYHCgGqheL
 Zrn1bw5gsqUrhse1KqHVs6O+5eXuqPHWrftQK67k9r7da7/5IAiAGA89xUtJF2Mbc9pEKQTM6
 DTJpNZNf1DXsDaq2IfDr6ak0LiRMLMzl3hSnZwd0G7CNHStfd0ut+G7Uf8M1IsRPzW2rqgi75
 ETGMhcfdwk6KawhccibaCO107p/ZdCpR3YAP3qNzMtRl6uHV0jg025sUnySiGZLvp/0GVK3IK
 3EWKpqIYqeomWLlXqVs/MRJR/H8b3mNR+aKiaon0Wo1H0gNjWOSGuqF8o6LwK/5rgZpe60ZGT
 4I+TLTLdBCv2upnjmytOWwg3TN93pJX3QQ/CgQ3oQKlX/izAzwae9j1JXLYF+RP68BokbPNjz
 u/iuf1v0LC5//f0JXTrvwsnXy4OdIQ7lCjZaP9pB1aF47vZJiGweoqAU2YGlI807NbEPiOnaj
 M/RnGxJ73YaPLouH9L0ABNkZNuPTvROOUYT9zGq+HbQMqpe5jgsWR1xXa4Nim+6Rf6pw7y7BD
 pb6J/Nalrpcpdpqurg3O4/83WA4pNeM4Xafec3bPk21uE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1713792378; x=1714397178; i=ps.report@gmx.net;
 bh=B+MLC/+zTSvButkStpZCWaVhv4jcMXlKUMyrE8nY0Zw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Mtw1NixnGdfhr3rL2HnwV7mggOhu/kp3ytcC3EhTBoqSLn1/or3DX/vqHp/BYL7z
 LmyGkdDZssom3TJ1nUP3/J5+MgRDXApb2WjoFw5I4r+3ZwTbZ864ZM1AmtugpCm52
 UbD/qh7WCvk9MZRHSuTNfD3BMcfeFRiyP58YV7g2HVP52AxG1bBya913C30eEILCf
 Vxphh/fkLuh9090aC0/9GoUntfsyC9TD/l0MqsJZh5RkoCcsDGlHJpDwcPSOzIqN/
 Zx2bwqVdDnCMqiRDtcIISSoC1Zqlb2R1qUiqzrevBAJR3Uvb23SH7LM/w5KYYr8Y4
 /8Kn976wPviSqtDEHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=Mtw1Nixn
Subject: Re: [Buildroot] pkg-meson.mk: support for the host python packages
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAyMiBBcHIgMjAyNCAxNToxMTo1NSArMDIwMCwgUGV0ZXIgU2VpZGVyZXIgdmlhIGJ1
aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoKPiBPbiBNb24sIDIyIEFw
ciAyMDI0IDE0OjI5OjQyICswMjAwLCBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xl
bWFpbC5jb20+IHdyb3RlOgo+IAo+ID4gT24gTW9uLCBBcHIgMjIsIDIwMjQgYXQgMjoyOOKAr1BN
IFllZ29yIFllZnJlbW92Cj4gPiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOiAg
Cj4gPiA+Cj4gPiA+IE9uIE1vbiwgQXByIDIyLCAyMDI0IGF0IDI6MTnigK9QTSBQZXRlciBTZWlk
ZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+IHdyb3RlOiAgICAKPiA+ID4gPgo+ID4gPiA+IE9uIE1v
biwgMjIgQXByIDIwMjQgMTI6NDY6MDQgKzAyMDAsIFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0
c0Bnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4gICAgCj4gPiA+ID4gPiBsaWJnbGliMiAy
LjgwLjAgcmVxdWlyZXMgaG9zdC1weXRob24tcGFja2FnaW5nIHRvIGJ1aWxkIHRoZSBsaWJyYXJ5
IFsxXS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBXaGF0IGlzIHRoZSBiZXN0IHdheSB0byB0ZWxsIG1l
c29uL25pbmphIHdoZXJlIHRvIGxvb2sgZm9yIG91ciBob3N0Cj4gPiA+ID4gPiBweXRob24gcGFj
a2FnZXM/Cj4gPiA+ID4gPgo+ID4gPiA+ID4gWzFdIGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9H
Tk9NRS9nbGliLy0vY29tbWl0L2ZjNmYwNjEyN2NmZjlmZTNlNDY0YjViZThjOTJlYTA4YTY3OWI2
MjAgICAgCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJnbGliMi9saWJn
bGliMi5tayBiL3BhY2thZ2UvbGliZ2xpYjIvbGliZ2xpYjIubWsKPiA+ID4gPiBpbmRleCBjMDZk
ZWQyYTViLi44MTkyODI5MTBhIDEwMDY0NAo+ID4gPiA+IC0tLSBhL3BhY2thZ2UvbGliZ2xpYjIv
bGliZ2xpYjIubWsKPiA+ID4gPiArKysgYi9wYWNrYWdlL2xpYmdsaWIyL2xpYmdsaWIyLm1rCj4g
PiA+ID4gQEAgLTM0LDkgKzM0LDExIEBAIEhPU1RfTElCR0xJQjJfQ09ORl9PUFRTID0gXAo+ID4g
PiA+Cj4gPiA+ID4gIExJQkdMSUIyX0RFUEVOREVOQ0lFUyA9IFwKPiA+ID4gPiAgICAgICAgIGhv
c3QtcGtnY29uZiBob3N0LWxpYmdsaWIyIFwKPiA+ID4gPiArICAgICAgIGhvc3QtcHl0aG9uMyBo
b3N0LXB5dGhvbi1wYWNrYWdpbmcgXAo+ID4gPiA+ICAgICAgICAgbGliZmZpIHBjcmUyIHpsaWIg
JChUQVJHRVRfTkxTX0RFUEVOREVOQ0lFUykKPiA+ID4gPgo+ID4gPiA+ICBIT1NUX0xJQkdMSUIy
X0RFUEVOREVOQ0lFUyA9IFwKPiA+ID4gPiArICAgICAgIGhvc3QtcHl0aG9uMyBob3N0LXB5dGhv
bi1wYWNrYWdpbmcgXAo+ID4gPiA+ICAgICAgICAgaG9zdC1nZXR0ZXh0IFwKPiA+ID4gPiAgICAg
ICAgIGhvc3QtbGliZmZpIFwKPiA+ID4gPiAgICAgICAgIGhvc3QtcGNyZTIgXCAgICAKPiA+ID4K
PiA+ID4gVGhpcyBqdXN0IGJ1aWxkcyB0aGUgcGFja2FnZSBidXQgbWVzb24gd29uJ3QgbG9vayBp
bgo+ID4gPiBob3N0L2xpYi9weXRob24zLjExL3NpdGUtcGFja2FnZXMvIGZvciByZWdleC4gICAg
Cj4gCj4gU29ycnksIHdvcmtzIGZvciBtZSAoYW5kIGFkZGl0aW9uYWwgcmVtb3ZlZCB0aGUgbG9j
YWwgcHl0aG9uMzExLXBhY2thZ2luZyBvbiB0aGUKPiBidWlsZCBzeXN0ZW0sIGJ1dCB3b3JrcyBv
dGhlcndpc2UgdG9vKToKPiAKPiAJJCBybSAtcmYgYnVpbGQvaG9zdC1saWJnbGliMi0yLjgwLjAg
JiYgcm0gLXJmIGJ1aWxkL2xpYmdsaWIyLTIuODAuMCAmJiBzdHJhY2UgLWZvIG91dC5sb2cgbWFr
ZSBsaWJnbGliMgo+IAo+IAkkIGdyZXAgcGFja2FnaW5nIGJ1aWxkL2xpYmdsaWIyLTIuODAuMC9i
dWlsZC9tZXNvbi1sb2dzL21lc29uLWxvZy50eHQgCj4gCVByb2dyYW0gcHl0aG9uMyAocGFja2Fn
aW5nKSBmb3VuZDogWUVTICg8bXlfbG9jYWxfYnVpbGRfcGF0aD4vaG9zdC9iaW4vcHl0aG9uMykg
bW9kdWxlczogcGFja2FnaW5nCj4gCj4gCSQgZ3JlcCBwYWNrYWdpbmcgb3V0LmxvZwo+IAlbLi4u
XQo+IAkyMTkyOSBuZXdmc3RhdGF0KEFUX0ZEQ1dELCAiPG15X2xvY2FsX2J1aWxkX3BhdGg+L2hv
c3QvbGliL3B5dGhvbjMuMTEvc2l0ZS1wYWNrYWdlcy9wYWNrYWdpbmcvX19pbml0X18ucHkiLCB7
c3RfbW9kZT1TX0lGUkVHfDA2NDQsIHN0X3NpemU9NDk2LCAuLi59LCAwKSA9IDAKPiAJMjE5Mjkg
bmV3ZnN0YXRhdChBVF9GRENXRCwgIjxteV9sb2NhbF9idWlsZF9wYXRoPi9ob3N0L2xpYi9weXRo
b24zLjExL3NpdGUtcGFja2FnZXMvcGFja2FnaW5nL19faW5pdF9fLnB5Iiwge3N0X21vZGU9U19J
RlJFR3wwNjQ0LCBzdF9zaXplPTQ5NiwgLi4ufSwgMCkgPSAwCj4gCTIxOTI5IG9wZW5hdChBVF9G
RENXRCwgIjxteV9sb2NhbF9idWlsZF9wYXRoPi9ob3N0L2xpYi9weXRob24zLjExL3NpdGUtcGFj
a2FnZXMvcGFja2FnaW5nL19fcHljYWNoZV9fL19faW5pdF9fLmNweXRob24tMzExLnB5YyIsIE9f
UkRPTkxZfE9fQ0xPRVhFQykgPSAzCgpBbmQgaG9zdC1weXRob24tcGFja2FnaW5nIGlzIGFscmVh
ZHkgYW4gKGluZGlyZWN0KSBkZXBlbmRlbmN5IG9mCmhvc3QtbGliZ2xpYjIvbGliZ2xpYjIgKG1h
a2UgZ3JhcGgtZGVwZW5kcyk6CgoJbGliZ2xpYjIgLS0+IGhvc3QtbGliZ2xpYjIgLS0+IGhvc3Qt
bWVzb24gLS0+IGhvc3QtcHl0aG9uLXNldHVwdG9vbHMgLS0+CgkJaG9zdC1weXRob24td2hlZWwg
LS0+IGhvc3QtcHl0aG9uLXB5cGEtYnVpbGQgLS0+IGhvc3QtcHl0aG9uLXBhY2thZ2luZwoKUmVn
YXJkcywKUGV0ZXIKCgo+IAo+IFJlZ2FyZHMsCj4gUGV0ZXIKPiAKPiA+IAo+ID4gcy9yZWdleC9w
YWNrYWdlCj4gPiAgIAo+ID4gPgo+ID4gPiBTaG91bGQgb25lIGp1c3QgYWRkIGEgUFlUSE9OUEFU
SCBwb2ludGluZyB0bwo+ID4gPiBob3N0L2xpYi9weXRob24zLjExL3NpdGUtcGFja2FnZXMgYmVm
b3JlIGludm9raW5nIG1lc29uL25pbmphIGFzIHdlIGRvCj4gPiA+IHdpdGggUFlUSE9OTk9VU0VS
U0lURT8KPiA+ID4KPiA+ID4gWWVnb3IgICAgCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
