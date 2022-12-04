Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397A8C4321E
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 14:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC14060B9A;
	Sun,  4 Dec 2022 14:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC14060B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lWmIVBGiBF2P; Sun,  4 Dec 2022 14:16:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7D9D60AAA;
	Sun,  4 Dec 2022 14:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7D9D60AAA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2388E1BF3A6
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 14:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F348660A9B
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 14:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F348660A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5adG1V9vY0pm for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 14:16:39 +0000 (UTC)
X-Greylist: delayed 00:09:56 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA9D460AAA
Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch
 [45.157.188.10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA9D460AAA
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 14:16:39 +0000 (UTC)
Received: from smtp-2-0000.mail.infomaniak.ch (unknown [10.5.36.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4NQ7lL4LGWzMpnSc;
 Sun,  4 Dec 2022 15:06:38 +0100 (CET)
Received: from [192.168.7.20] (unknown [81.221.82.85])
 by smtp-2-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4NQ7lL1rLmzMpr92;
 Sun,  4 Dec 2022 15:06:38 +0100 (CET)
Message-ID: <5de49ff4-533e-e6ed-61db-70a66f0a64db@ik.me>
Date: Sun, 4 Dec 2022 15:06:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To: buildroot@buildroot.org, "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20221122212002.139494-1-pge@ik.me> <20221203132956.GC3302@scaer>
Content-Language: fr, en-GB
In-Reply-To: <20221203132956.GC3302@scaer>
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ik.me;
 s=20200325; 
 t=1670162798; bh=CoygQA+gY9JSWMKRkPnqqaXUZtuNZvNoDzVIc4XXXYA=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=na7J01v3dksrH3SyoT1Tucr+wKV4FpxJhU3y2Pg+i7JwapQl6Bxrsffr4D04+e6Kk
 Tn9Nz8UO093qWAy1ZMek4jgsyQVpofOnCxn4ySFzFsll3mKO3hR42PBW/GjaWGj5fj
 dpfXZOzVZbY7E0EwHsaNoVRLb9ORDf1gukds9wJs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.a=rsa-sha256
 header.s=20200325 header.b=na7J01v3
Subject: Re: [Buildroot] [PATCH] package/pkg-golang: enable pkg specific go
 env also for download step
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
From: Patrick Gerber via buildroot <buildroot@buildroot.org>
Reply-To: Patrick Gerber <pge@ik.me>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PiBQR0UsIEFsbCwKPgo+IFdlIHJlcXVpcmUgdGhhdCBzdWJtaXR0ZXJzIHVzZSB0aGVpciByZWFs
IGlkZW50aXR5OyBpbml0aWFscyBhcmUgbm90Cj4gZW5vdWdoLgpTb3JyeSBmb3IgdGhhdCwgaXQn
cyBmaXhlZAo+IE9uIDIwMjItMTEtMjIgMjI6MjAgKzAxMDAsIFBHRSB2aWEgYnVpbGRyb290IHNw
YWtlIHRodXNseToKPj4gQ3VycmVudGx5IHBhY2thZ2Ugc2VjaWZpYyBnbyBlbnYgaXMgdXNlZCBv
bmx5IGR1cmluZyBwYWNrYWdlIGJ1aWxkIHN0ZXAuCj4+Cj4+IEdvIHZlbmRlcmluZyBpcyBkb25l
IGR1cmluZyB0aGUgZG93bmxvYWQgc3RlcCBhbmQgaXQncyBzb21ldGltZXMgcmVxdWlyZWQKPj4g
dG8gc3BlY2lmeSBwYWNrYWdlIHNlY2lmaWMgZ28gZW52IGFsc28gZm9yIHRoaXMgc3RlcC4KPj4K
Pj4gRm9yIGV4YW1wbGUsIHdoZW4gaW1wb3J0aW5nIGN1c3RvbSBnbyBtb2R1bGVzIHdobyBhcmUg
aG9zdGVkIG9uIGEgcHJpdmF0ZQo+PiBob3N0LCBpdOKAmXMgcmVxdWlyZWQgdG8gc2V0IEdPUFJJ
VkFURSB0byBhdm9pZCBwdWJsaWMgc3VtIGNoZWNraW5nLgo+IEkgYW0gbm90IHN1cmUgSSBmdWxs
eSB1bmRlcnN0YW5kIHdoYXQgInNldCBHT1BSSVZBVEUgdG8gYXZvaWQgcHVibGljIHN1bQo+IGNo
ZWNraW5nIiBpcyBzdXBwb3NlZCB0byBtZWFuLgo+Cj4gRG9lcyB0aGF0IG1lYW4gdGhhdCBzZXR0
aW5nIEdPUFJJVkFURSAodG8gd2hhdCB2YWx1ZTogYm9vbGVhbj8gbGlzdCBvZgo+IG1vZHVsZXM/
IHNvbWV0aGluZyBlbHNlPykgd291bGQgcHJldmVudCBnbyAodGhlIHByb2dyYW0pIGZyb20gcGVy
Zm9ybWluZwo+IGNoZWNrc3VtIHZlcmlmaWNhdGlvbiBvbiB0aGUgbW9kdWxlcyBpdCBkb3dubG9h
ZHM/CkdPUFJJVkFURSBzaGFsbCBiZSBzZXQgdG8gYSBnbG9iIHBhdHRlcm4gbWF0Y2hpbmcgeW91
ciBwcml2YXRlIHJlcG8gaG9zdCAKbmFtZSwgc28gZ28gdmVuZG9yaW5nIGRvIG5vdCBjaGVjayB0
aGUgc3VtIGZvciB0aGVzZXMgcGFja2FnZXMuIFNlZSAKaHR0cHM6Ly9wa2cuZ28uZGV2L2NtZC9n
byNoZHItQ29uZmlndXJhdGlvbl9mb3JfZG93bmxvYWRpbmdfbm9uX3B1YmxpY19jb2RlIApmb3Ig
bW9yZSBkZXRhaWxzLgo+IEFzIGEgY29uc2VxdWVuY2UsIHdoYXQgaW1wYWN0IGRvZXMgdGhhdCBo
YXZlIG9uIHRoZSByZXByb2R1Y2liaWxpdHkgb2YKPiB0aGUgdmVuZG9yZWQgYXJjaGl2ZT8gQW5k
IHNvLCB3aGF0IGFib3V0IHRoZSBoYXNoZXMgbWFhbmdlZCBieQo+IEJ1aWxkcm9vdD8KSW4gbXkg
dW5kZXJzdGFuZGluZyBpdCBoYXMgc3RyaWN0bHkgbm8gaW1wYWN0IG9uIGJ1aWxkcm9vdCBtYW5h
Z2VkIApoYXNoZXMgYXMgdmVuZG9yaW5nIGlzIHBlcmZvcm1lZCwgZHVyaW5nIGRvd25sb2FkIHN0
ZXAsIGJlZm9yZSAKZ2VuZXJhdGluZyB0aGUgZGwgYXJjaGl2ZSB3aGljaCBpbmNsdWRlIHRoZSB2
ZW5kb3IgZGlyZWN0b3J5LiBTbyBhbGwgCmV4dGVybmFsIHBhY2thZ2UgZG93bmxvYWRlZCBieSBn
byBhcmUgaW5jbHVkZWQgaW4gdGhlIGJ1aWxkcm9vdCBoYXNoCj4gV2UgYWxzbyByZXF1aXJlIHRo
YXQgc3VibWlzc2lvbnMgaW5jbHVkZSBhIHNpZ24tb2ZmIHRhZywgbWF0Y2hpbmcgdGhlCj4gcmVh
bCBpZGVudGl0eS4KPgo+IFBsZWFzZSBzZWU7Cj4gICAgICBodHRwczovL2J1aWxkcm9vdC5vcmcv
ZG93bmxvYWRzL21hbnVhbC9tYW51YWwuaHRtbCNzdWJtaXR0aW5nLXBhdGNoZXMKPgo+PiAtLS0K
Pj4gICBwYWNrYWdlL3BrZy1nb2xhbmcubWsgfCAzICsrLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
cGtnLWdvbGFuZy5tayBiL3BhY2thZ2UvcGtnLWdvbGFuZy5tawo+PiBpbmRleCAwYjNkYzNkMzJm
Li5jZGM2N2IzMmMwIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3BrZy1nb2xhbmcubWsKPj4gKysr
IGIvcGFja2FnZS9wa2ctZ29sYW5nLm1rCj4+IEBAIC04Nyw3ICs4Nyw4IEBAICQoMilfUE9TVF9Q
QVRDSF9IT09LUyArPSAkKDIpX0dFTl9HT01PRAo+PiAgICQoMilfRE9XTkxPQURfUE9TVF9QUk9D
RVNTID0gZ28KPj4gICAkKDIpX0RMX0VOViArPSBcCj4+ICAgCSQkKEhPU1RfR09fQ09NTU9OX0VO
VikgXAo+PiAtCUdPUFJPWFk9ZGlyZWN0Cj4+ICsJR09QUk9YWT1kaXJlY3QgXAo+PiArCSQkKCQo
MilfR09fRU5WKQo+IEN1cnJlbnRseSwgd2UgaGF2ZSB0d28gcGFja2FnZXMgdGhhdCBzZXQgX0dP
X0VOVjoKPgo+ICAgIC0gZG9ja2VyLWNsaTogSSBkb24ndCB0aGluayB0aGlzIHdvdWxkIGhhdmUg
YW4gaW1wYWN0IG9tbiB0aGUgZG93bmxvYWQKPiAgICAgIHN0ZXAgYW5kIHRoZSB2ZW5kb3Jpbmc6
Cj4gICAgICAgICAgRE9DS0VSX0NMSV9HT19FTlYgPSBDR09fRU5CQUxFRD1ubwo+Cj4gICAgLSBt
ZW5kZXItYXJ0aWZhY3RzOiB0aGVyZSB3ZSBkbyBlY3BsaWNpdGx5IHJlZmVyIHRvIGFuIGluY29u
c2lzdGVuY3kKPiAgICAgIGFib3V0IHRoZSB2ZW5kb3Jpbmc6Cj4gICAgICAgICAgSE9TVF9NRU5E
RVJfQVJUSUZBQ1RfR09fRU5WID0gR09GTEFHUz0iLW1vZD12ZW5kb3IiCj4KPiAgICAgIHNvIEkg
d29uZGVyIGhvdyB0aGF0IHdvdWxkIHBsYXkgd2hlbiB3ZSBhbHNvIHBhc3MgdGhpcyBkdXJpbmcg
dGhlCj4gICAgICB2ZW5kb3Jpbmcgc3RlcC4gSSBob3BlIHRoYXQgaXQgd291bGQgaGF2ZSBubyBl
ZmZlY3QsIGJlY2F1c2UKPiAgICAgICd2ZW5kb3InIGlzIGFjdHVhbGx5IHRoZSBwYXRoIHdoZXJl
IHRoZSB2ZW5kb3JpbmcgaGFwcGVucy4KPgo+IERpZCB5b3UgY2hlY2sgaWYgdGhleSB3ZXJlIGlt
cGFjdGVkIGJ5IHRoaXMgY2hhbmdlPwpJIGNoZWNrZWQgZm9yIG1lbmRlci1hcnRpZmFjdCBhbmQg
aXQgaGFzIG5vIGlzc3VlLiBJIGV2ZW4gZG8gdGhpbmsgdGhhdCAKdGhpcyBleHRyYSBnbyBlbnYg
aXMgbm90IHJlcXVpcmVkLCBhcyBhbGwgZ28gcGFja2FnZXMgYnVpbHQgYnkgYnVpbGRyb290IAph
cmUgYnVpbHQgd2l0aCBHT0ZMQUdTPSItbW9kPXZlbmRvciIgKHNlZSBIT1NUX0dPX0NPTU1PTl9F
TlYgaW4gZ28vZ28ubWspLgoKZG93bmxvYWQvZ28tcG9zdC1wcm9jZXNzIGlzIGNoZWNraW5nIHRo
ZSBhYnNlbmNlIG9mIHZlbmRvciBkaXJlY3RvcnkgCmJlZm9yZSBkb2luZyB0aGUgdmVuZG9yaW5n
LiBJZiBwcmVzZW50IHZlbmRvcmluZyBpcyBieXBhc3NlZC4KCkkgdGVzdGVkIHdpdGhvdXQgSE9T
VF9NRU5ERVJfQVJUSUZBQ1RfR09fRU5WID0gR09GTEFHUz0iLW1vZD12ZW5kb3IiIGFuZCAKbWVu
ZGVyLWFydGlmYWN0IGJ1aWxkIHdpdGhvdXQgaXNzdWUKPiBCYXJyaW5nIGFueSBpc3N1ZSB3aXRo
IHRoZSBhYm92ZSBxdWVzdGlvbnMsIEkgdGhpbmsgdGhpcyBpcyBhIGdvb2QKPiBjaGFuZ2UuIFBs
ZWFzZSByZXNwaW4gd2l0aCB5b3VyIHJlYWwgaWRlbnRpdHksIGEgcHJvcGVyIHNpZ24tb2ZmIHRh
Zy4KPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPgo+PiAgICMgRHVlIHRvIHZlbmRvcmlu
ZywgaXQgaXMgcHJldHR5IGxpa2VseSB0aGF0IG5vdCBhbGwgbGljZW5zZXMgYXJlCj4+ICAgIyBs
aXN0ZWQgaW4gPHBrZz5fTElDRU5TRS4KPj4gLS0gCj4+IDIuMjUuMQo+Pgo+PiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApCZXN0IHJlZ2FyZHMKUGF0cmljawpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
