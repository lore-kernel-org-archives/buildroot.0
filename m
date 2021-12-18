Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DC7C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 13:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD32283DF2;
	Sat, 18 Dec 2021 13:16:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dzLbFzI3evh0; Sat, 18 Dec 2021 13:16:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7B3783440;
	Sat, 18 Dec 2021 13:16:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 610EC1BF59F
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 13:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C5A24154E
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 13:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OktFC5EADKsY for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 13:16:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EA67402F7
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 13:16:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:788a:3424:5325:e3c2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C1ADB13F86E;
 Sat, 18 Dec 2021 14:16:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639833397;
 bh=98lDfA6yqSrXo8wWwoibiYebhLIJG2YMPtbFkOZ6lgU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lH15CwFknJVBZVaRbGxdp9V+HbKos4uZwifcgzqPfuI4dJVuKscrTU/M6xh8HzfiM
 ItFhYIMXLpQQeedWMqEKdxzU/Bxqke8/3CgGbQiR29Ii1EcmTtRIjDVE5dci8R98wV
 DlCV4nXHsYdqKL/HkFtYQ/ctX4UPS3kUJQg5yhEZto3ohHRLc7zf169XTg0lUjyTSZ
 vcpdQPU6uHPz6KJ6NivwnAEHf0ZGfdMlpCJqlfSligARubV7U1aa4DSRJYkCSWpJhB
 NbGx1fVaygf5NpGDx3hDWsgHUNVvsLmJ0lfPO/Vm1Bh1d6L6LGTSD8PxI/847YSOQE
 37LIBtQMg8MYw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Dec 2021 14:16:28 +0100
Date: Sat, 18 Dec 2021 14:16:28 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211218131628.GJ2603@scaer>
References: <20211215180021.274991-1-thierry.bultel@linatsea.fr>
 <20211215180021.274991-3-thierry.bultel@linatsea.fr>
 <966fe55d-c5d7-7f5a-63ec-f68be64a38c6@mind.be>
 <f5028ffa-5461-ae87-ad4c-227605361ddf@linatsea.fr>
 <28def8c0-8d05-015e-e9b2-a25b31d9237b@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <28def8c0-8d05-015e-e9b2-a25b31d9237b@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 3/3] fs/dracut: new fs type
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thierry Bultel <thierry.bultel@linatsea.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXJub3V0LCBUaGllcnJ5LCBBbGwsCgpPbiAyMDIxLTEyLTE3IDE5OjA1ICswMTAwLCBBcm5vdXQg
VmFuZGVjYXBwZWxsZSBzcGFrZSB0aHVzbHk6Cj4gPj4+K2lmIEJSMl9UQVJHRVRfUk9PVEZTX0RS
QUNVVAo+ID4+Pitjb25maWcgQlIyX1RBUkdFVF9ST09URlNfRFJBQ1VUX0NPTkZfRklMRQo+ID4+
PivCoMKgwqAgc3RyaW5nICJjb25maWd1cmF0aW9uIGZpbGUiCj4gPj7CoElzIHRoZXJlIGEgcG9z
c2liaWxpdHkgZm9yIGEgZGVmYXVsdCBjb25maWd1cmF0aW9uIGZpbGU/Cj4gPldvdWxkIHRoYXQg
cmVhbGx5IG1ha2Ugc2Vuc2UgPyBXaGF0IHdvdWxkIGJlIGRlZmF1bHQgdGhlIGV4cGVjdGVkIHBh
Y2thZ2VzCj4gPmluIHRoZSByYW0gZGlzayA/Cj4gIFllYWgsIE9LLCBnb29kIHBvaW50Li4uCgpB
Z3JlZWQsIHRoZXJlIGNhbid0IGJlIGEgcmVhc29uYWJsZSBkZWZhdWx0LgoKPiA+Tm90aWNlIHRo
YXQgdGhlIGNvbnRlbnQgb2YgdGhlIGNvbmZpZyBmaWxlIHN0cm9uZ2x5IGRlcGVuZHMgb24gdGhl
IGluaXQKPiA+c3lzdGVtIChkcmFjdXQgYmVpbmcgbW9zdGx5Cj4gPnRob3VnaHQgZm9yIHN5c3Rl
bWQsIGJ1dCBJIHVzZSBpdCB3aXRoIGJ1c3lib3gvaW5pdC5kIGluIG15IGNhc2UpLgo+ID5CdXQg
SSBhZ3JlZSB0aGF0IEkgbXVzdCBhZGQgYW4gZXJyb3IgaW4gdGhlIC5tayB3aGVuIHRoZSBmaWxl
IGlzIG5vdAo+ID5zcGVjaWZpZWQvZG9lcyBub3QgZXhpc3QKClllcywgY2F0Y2hpbmcgdGhhdCBu
aWNlbHkgd291bGQgYmUgYmV0dGVyLiBXaGF0IHdlIHVzdWFsbHkgZG8gaXM6CgogICAgaWZlcSAo
JChCUl9EVUlMRElORykuJChCUjJfVEFSR0VUX1JPT1RGU19EUkFDVVRfQ09ORl9GSUxFKSx5LikK
ICAgICQoZXJyb3IgTm8gZmlsZSBzcGVjaWZpZWQgaW4gQlIyX1RBUkdFVF9ST09URlNfRFJBQ1VU
X0NPTkZfRklMRSkKICAgIGVuZGlmCgpBbmQgaWYgdGhlIGZpbGUgaXMgbWlzc2luZywgdGhlbiBw
cmVzdW1hYmx5IGRyYWN1dCB3aWxsIGV4aXQgaW4gZXJyb3IsCndoaWNoIGlzIHN1ZmZpY2llbnQg
Zm9yIG1lLgoKPiBbc25pcF0KPiA+Pj4rIyBkZXZ0bXBmcyBkb2VzIG5vdCBnZXQgYXV0b21vdW50
ZWQgd2hlbiBpbml0cmFtZnMgaXMgdXNlZC4KPiA+Pj4rIyBBZGQgYSBwcmUtaW5pdCBzY3JpcHQg
dG8gbW91bnQgaXQgYmVmb3JlIHJ1bm5pbmcgaW5pdAo+ID4+PisjIFdlIG11c3QgaGF2ZSAvZGV2
L2NvbnNvbGUgdmVyeSBlYXJseSwgZXZlbiBiZWZvcmUgL2luaXQgcnVucywKPiA+Pj4rIyBmb3Ig
c3RkaW4vc3Rkb3V0L3N0ZGVycgo+ID4+PitkZWZpbmUgUk9PVEZTX0RSQUNVVF9BRERfSU5JVAo+
ID4+PivCoMKgwqAgaWYgWyAhIC1lICQoVEFSR0VUX0RJUikvaW5pdCBdOyB0aGVuIFwKPiA+Pj4r
wqDCoMKgwqDCoMKgwqAgJChJTlNUQUxMKSAtbSAwNzU1IGZzL2NwaW8vaW5pdCAkKFRBUkdFVF9E
SVIpL2luaXQ7IFwKPiA+Pj4rwqDCoMKgIGZpCj4gPj4+K8KgwqDCoCBta2RpciAtcCAkKFRBUkdF
VF9ESVIpL2Rldgo+ID4+PivCoMKgwqAgbWtub2QgLW0gMDYyMiAkKFRBUkdFVF9ESVIpL2Rldi9j
b25zb2xlIGMgNSAxCj4gPj4+K2VuZGVmCj4gPj4+Kwo+ID4+PitlbmRpZiAjIEJSMl9ST09URlNf
REVWSUNFX0NSRUFUSU9OX1NUQVRJQwo+ID4+Cj4gPj7CoFRoZSBhYm92ZSBpcyB0aGUgc2FtZSBs
b2dpYyBhcyBpbiBjcGlvLm1rLiBJdCB3b3VsZCBiZSBiZXR0ZXIgaWYgd2UKPiA+PmNvdWxkIHJl
ZmFjdG9yIHRoYXQgdG8gYSBjb21tb24gcGxhY2UuCj4gPgo+ID5JIGRlZmluaXRpdmVseSBhZ3Jl
ZSwgdGhhdCBpcyB3aGF0IEkgc2FpZCBteXNlbGYuIEJ1dCB3aGF0IGlzIHRoZSBtb3N0Cj4gPmFw
cHJvcHJpYXRlIHBsYWNlIHRvIHB1dCBpdCA/Cj4gCj4gIEkgd291bGRuJ3QgYmUgb3Bwb3NlZCB0
byBwdXR0aW5nIGl0IGluIGZzL2NvbW1vbi5tay4gWWFubiwgd2hhdCBkbyB5b3UgdGhpbms/CgpO
b3Qgc3VyZS4gVXN1YWxseSwgd2UgdHJ5IG5vdCB0byBjb21vbmFsaXNlIHRoaW5ncyB1bnRpbCB3
ZSBoYXZlIGF0CmxlYXN0IGEgZmV3IHVzZXJzLgoKSW4gIHRoaXMgY2FzZSwgaXQgaXMgdmVyeSBp
bXByb2JhYmx5IHRoYXQgd2UgaGF2ZSBlbm91Z2ggdXNlcnMgdG8Kd2FycmFudCBjb21tb24gY29k
ZSwgc28gZHVwbGljYXRpb24gaXMgc3RpbGwgT0sgaW4gbXkgb3Bpbmlvbi4KCkhvd2V2ZXIuLi4K
Cj4gIEkgYW0sIGhvd2V2ZXIsIHRoaW5raW5nIHNvbWV0aGluZyBlbHNlIGFzIHdlbGwuIFdoYXQg
ZG9lcyB0aGUgZHJhY3V0IGZzCj4gcHJvZHVjZT8gSXMgaXQgYSBjcGlvIGltYWdlPyBJZiBzbywg
dGhlbiBpdCBtaWdodCBiZSBhIGdvb2QgaWRlYSB0byBpbnN0ZWFkCj4gbWFrZSB0aGlzIGEgc3Vi
b3B0aW9uIG9mIGNwaW8uIFRoaXMsIGluIHR1cm4sIHdvdWxkIG1ha2UgaXQgcG9zc2libGUgdG8g
dXNlCj4gZHJhY3V0IGZvciBhbiBpbml0cmFtZnMuCgpUaGlzIHdhcyB0byBiZSBteSBwcm9wb3Nh
bCB0b286IGV4dGVuZHMgdGhlIGV4aXN0aW5nIGZzL2NwaW8gdG8Kb3B0aW9uYWxseSB1c2UgZHJh
Y3V0IHRvIHByZXBhcmUgdGhlIGZpbGUgbGlzdC4KCkkgd2FzIHdvbmRlcmluZyB3aHkgd2UgZGlk
IG5vdCBqdXN0IGhhbmQgb3ZlciBzdWNoIGEgbGlzdCB0byBjcGlvCihyZXBsYWNpbmcgdGhlIGV4
aXN0aW5nICdmaW5kJykuIEJ1dCBkcmFjdXQgaXMgbW9yZSB0aGFuIGpzdXQgYSBmaWxlCmxpc3Q6
IGl0IHByZXN1bWFibHkga25vd3MgaG93IHRvIGhhbmRsZSBsaWJyYXJ5IGRlcGVuZGVuY2llcyAo
TkVFREVEKQphbmQgZm9sbG93cyByZWN1cnNpdmVseSwgYW5kIHNpbWlsYXJseSBmb3Iga2VybmVs
IG1vZHVsZXMuIE90aGVyd2lzZSwKZHJhY3V0IHdvdWxkIGJlIG9mIHZlcnkgbGl0dGxlIGludGVy
ZXN0Li4uCgooSSBzZWUgdGhhdCBUaGllcnJ5IGFsc28gcmVwbGllZCwgYnV0IEkgd2FzIG5vdCBv
biBDYyBzbyBJIG5lYXJseSBtaXNzZWQKaXQuLi4gSSdsbCByZXBseSBmdXJ0aGVyIHRvIFRoaWVy
cnkgbWVzc2FnZSBpbiBhIG1vbWVudC4uLikKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAK
Li0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1i
ZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYy
IDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAg
ICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAg
WCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlz
LWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFj
eS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
