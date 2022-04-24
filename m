Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C11C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 16:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2975240145;
	Sun, 24 Apr 2022 16:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K6PdB4SM6aXW; Sun, 24 Apr 2022 16:34:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D98640292;
	Sun, 24 Apr 2022 16:34:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2AECA1BF417
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 16:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0008F60B35
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 16:34:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZMzIij6n08I for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 16:34:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F1ED60A6F
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 16:34:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:657d:21bd:cb37:8719])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 296FE7802BE;
 Sun, 24 Apr 2022 18:33:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1650818051;
 bh=jWEY/kAFeiOP5wLkPlIAvvcvnKSr2+rpDeD+YnAuPv8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DT5kw6JZTw+vinjtI3qoxmFRv1S6eotbOu1xfsJi0s8FiQekMv8yf8Ih7yMIw0+UX
 ljPwjaplnCRlh3UANHI//Kh9IYpkmfDJId/g+n8HxK1umkyKVOAe25klTdQIdIVCLC
 PRIYVlTPpZdTF7KmYrMjjIaZ4asE4/oX1/URxss335ECRWKDjb8aAR+glgl7hJOOxE
 s4fOJZMGUq5NxL3RToLK3dKNzNqwGuCz/sOnGI7Gi2hLSNJ1uTXkkNCV40yGGPMn4d
 gc5NhkQ1DCEWOii8dQX2WcDm1QDKGo7iGDqfKoYwllVp6tHWQf8kJfzg7FRc8EZzFP
 YSU2loRSrTCqw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Apr 2022 18:33:50 +0200
Date: Sun, 24 Apr 2022 18:33:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220424163350.GX2730@scaer>
References: <20220416211323.3200669-1-fontaine.fabrice@gmail.com>
 <8e85d9ce-f8d9-6f76-37f2-664b9c0db08a@mind.be>
 <CAPi7W83CD7gBa+ZY5vTBOfeq7MMhZPqkrYLY6=dpqcP9_ikMmA@mail.gmail.com>
 <dc26f0ab-bf60-2c3b-6f79-f6c816cc3bec@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc26f0ab-bf60-2c3b-6f79-f6c816cc3bec@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] Removing BR2_SHARED_STATIC_LIBS [was: [PATCH 1/1]
 package/pkgconf: fix BR2_SHARED_STATIC_LIBS build]
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas De Schampheleire <patrickdepinguin@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 =?utf-8?B?SsO2cmc=?= Krause <joerg.krause@embedded.rocks>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXJub3V0LCBBbGwsCgpPbiAyMDIyLTA0LTI0IDE3OjAzICswMjAwLCBBcm5vdXQgVmFuZGVjYXBw
ZWxsZSBzcGFrZSB0aHVzbHk6Cj4gT24gMjMvMDQvMjAyMiAxODo0OSwgRmFicmljZSBGb250YWlu
ZSB3cm90ZToKPiA+TGUgc2FtLiAyMyBhdnIuIDIwMjIgw6AgMTY6NDAsIEFybm91dCBWYW5kZWNh
cHBlbGxlIDxhcm5vdXRAbWluZC5iZT4gYSDDqWNyaXQgOgo+ID4+T24gMTYvMDQvMjAyMiAyMzox
MywgRmFicmljZSBGb250YWluZSB3cm90ZToKPiA+Pj5BZGQgLS1zdGF0aWMgd2hlbiBjYWxsaW5n
IHBrZy1jb25maWcgd2l0aCBCUjJfU0hBUkVEX1NUQVRJQ19MSUJTIHRvCj4gPj4+YXZvaWQgdGhl
IGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIGlmIGEgcGFja2FnZSAoZS5nLiBkYXNoIG9yIHphYmJp
eCkKPiA+Pj5kZWNpZGUgdG8gdXNlIHRoZSBzdGF0aWMgbGlicmFyeSBvZiBvZiBpdHMgZGVwZW5k
ZW5jeSBpbnN0ZWFkIG9mIHRoZQo+ID4+PnNoYXJlZCBsaWJyYXJ5IChlLmcuIGVkaXQgb3Igb3Bl
bnNzbCkgcmVzdWx0aW5nIGluIHRoZSBmb2xsb3dpbmcgYnVpbGQKPiA+Pj5mYWlsdXJlczoKPiBb
c25pcF0KPiA+Pj4taWZlcSAoJChCUjJfU1RBVElDX0xJQlMpLHkpCj4gPj4+LUhPU1RfUEtHQ09O
Rl9QT1NUX0lOU1RBTExfSE9PS1MgKz0gSE9TVF9QS0dDT05GX1NUQVRJQwo+ID4+Pi1lbHNlCj4g
Pj4+K2lmZXEgKCQoQlIyX1NIQVJFRF9MSUJTKSx5KQo+ID4+PiAgIEhPU1RfUEtHQ09ORl9QT1NU
X0lOU1RBTExfSE9PS1MgKz0gSE9TVF9QS0dDT05GX1NIQVJFRAo+ID4+PitlbHNlCj4gPj4+K0hP
U1RfUEtHQ09ORl9QT1NUX0lOU1RBTExfSE9PS1MgKz0gSE9TVF9QS0dDT05GX1NUQVRJQwo+ID4+
ICAgRXJyLCBzbyB0aGlzIHdvdWxkIG1lYW4gdGhhdCB3ZSBhbG1vc3QgYWx3YXlzIGxpbmsgc3Rh
dGljYWxseSBpbiB0aGUKPiA+PlNIQVJFRF9TVEFUSUMgY2FzZT8gSSBkb24ndCB0aGluayB0aGF0
IHRoYXQncyB3aGF0IHdlIHdhbnQsIHJlYWxseS4uLgoKQWdyZWVkOiBpbiB0aGUgc2hhcmVkK3N0
YXRpYyBjYXNlLCB3ZSB3YW50IHRvIGxpbmsgZHluYW1pY2FsbHkgYnkKZGVmYXVsdC4KCj4gPj4g
ICBJZiBhIHBhY2thZ2Ugd2FudHMgdG8gbGluayBzdGF0aWNhbGx5IGFuZCBpcyB1c2luZyBwa2ct
Y29uZmlnLCB3aHkgaXMgbm90Cj4gPj5jYWxsaW5nIHBrZy1jb25maWcgd2l0aCAtLXN0YXRpYz8g
U29tZXRoaW5nIHNlZW1zIHRvIGJlIHJlYWxseSBvZmYgaGVyZS4uLgo+ID5UbyBteSBrbm93bGVk
Z2UgbW9zdCBwYWNrYWdlcyBhcmUgbm90IGFkZGluZyAtLXN0YXRpYyB3aGVuIGNhbGxpbmcgcGtn
LWNvbmZpZy4KPiA+LS1zdGF0aWMgaXMgYWRkZWQgYnkgYnVpbGRyb290IHRocm91Z2ggSE9TVF9Q
S0dDT05GX1BPU1RfSU5TVEFMTF9IT09LUy4KPiA+ZGFzaCBmYWlscyB0byBidWlsZCBiZWNhdXNl
IC1zdGF0aWMgaXMgcGFzc2VkIHRvIGdjYy4KPiA+LXN0YXRpYyBpcyBwYXNzZWQgdG8gZ2NjIGJl
Y2F1c2UgcGFja2FnZS9NYWtlZmlsZS5pbiBpcyBzZXR0aW5nCj4gPi0tZW5hYmxlLXN0YXRpYyAo
YW5kIC0tZW5hYmxlLXNoYXJlZCk6ClstLVNOSVAtLV0KPiA+ZGFzaCBkb2Vzbid0IG5vdCBoYW5k
bGUgLS1lbmFibGUtc2hhcmVkLgo+ID5JdCBhZGRzIC1zdGF0aWMgdG8gZ2NjIGNhbGwgZGVwZW5k
aW5nIG9uIC0te2VuLGRpc31hYmxlLXN0YXRpYy4KPiA+Cj4gPlNvLCB0aGUgJ29ubHl5JyBvdGhl
ciBvcHRpb24gd291bGQgYmUgdG8gYWRkCj4gPkRBU0hfQ09ORl9PUFRTICs9IC0tZGlzYWJsZS1z
dGF0aWMKPiA+dG8gb3ZlcnJpZGUgd2hhdCBpcyBzZXQgYnkgcGFja2FnZS9NYWtlZmlsZS5pbgo+
ICBUaGlzIGlzIHdoYXQgd2FzIGRvbmUgZm9yIGRyb3BiZWFyIDQgeWVhcnMgYWdvIGluIGNvbW1p
dCBjOTkyMmE0ZDJmYzc5ZS4KClRoYXQgd2FzIG5vdCBleGFjdGx5IHRoZSBzYW1lIHJlYXNvbi4g
ZHJvcGJlYXIgbWlzdXNlcyAtLWVuYWJsZS1zdGF0aWMuCgotLWVuYWJsZS17c3RhdGljLHNoYXJl
ZH0gaXMgbWVhbnQgZm9yIGJ1aWxkaW5nIGxpYnJhcmllcywgbm90IGZvcgpsaW5raW5nIGFuIGV4
ZWN1dGFibGUgc3RhdGljYWxseSBvciBub3QgWzBdLgoKWzBdIGh0dHBzOi8vd3d3LmdudS5vcmcv
c29mdHdhcmUvbGlidG9vbC9tYW51YWwvbGlidG9vbC5odG1sI0xUXzAwNWZJTklUCgpTdGlsbCwg
SSB0aGluayBpbiB0aGF0IGNhc2UsIGFuZCB1bmxlc3MgdGhlIHBhY2thZ2UgcmVhbGx5IG5lZWRz
IGEKc3RhdGljIGxpbmssIHdlIHNob3VsZCBmaXggaXQgd2l0aCBhZC1ob2Mgd2FydHMsIGxpa2Ug
dGhlIG9uZSBmb3IKZHJvcGJlYXIuIFNvLCB3ZSBzaG91bGQgd29yayBhcm91bmQgdGhlIGlzc3Vl
IGluIGRhc2ggYW5kIHphYmJpeCouCgpbKl0gbm93IHRoYXQgd2UgaGF2ZSBmaXhlZCB0aGUgYSBh
bmQgeiBwYWNrYWdlcywgd2hhdCBpcyB0aGVyZSBsZWZ0IHRvCmZpeD8gOy0pCgo+ID5JIGNhbiBz
ZW5kIGEgdjIgaWYgeW91IHRoaW5rIHRoYXQgdGhpcyBzb2x1dGlvbiBpcyBiZXR0ZXIuCj4gPkhv
d2V2ZXIsIGl0J2xsIGhhdmUgdG8gYmUgYXBwbGllZCB0byBkYXNoIGFuZCB6YWJiaXggYnV0IHBl
cmhhcHMgdG8gYQo+ID5sYXJnZSBudW1iZXIgb2YgImFwcGxpY2F0aW9uIiBwYWNrYWdlcyAuLi4K
PiAgVmVyeSBnb29kIHBvaW50LgoKSSBhbSBub3Qgc3VyZSB0aGVyZSB3b3VsZCBiZSBzbyBtYW55
IHBhY2thZ2VzIHRoYXQgbWlzYmVoYXZlIGluIHRoYXQKc2l0dWF0aW9uLCBpbiBmYWN0Li4uCgo+
ICBJIHRoaW5rIHBlcmhhcHMgd2Ugc2hvdWxkIHNpbXBseSByZW1vdmUgQlIyX1NIQVJFRF9TVEFU
SUMgY29tcGxldGVseS4gVGhlCj4gaWRlYSBpcyB0byBidWlsZCBib3RoIHN0YXRpYyBhbmQgc2hh
cmVkIGxpYnJhcmllcywgYnV0IGxpbmsgd2l0aCBzaGFyZWQKPiBsaWJyYXJpZXMgYnkgZGVmYXVs
dC4gSG93ZXZlciwgaXQgdHVybnMgb3V0IG5vdCB0byBiZSB3b3JraW5nOiBjbWFrZSBhbmQKPiBt
ZXNvbiBwYWNrYWdlcyBkb24ndCBzdXBwb3J0IGl0LCBmb3IgYWxsIHRoZSBub24tQyBsYW5ndWFn
ZXMgaXQncyBub3QKPiByZWxldmFudCwgYW5kIGV2ZW4gZm9yIGF1dG90b29scyBwYWNrYWdlcyBp
dCBkb2Vzbid0IHdvcmsgY29uc2lzdGVudGx5LCBhcwo+IHNob3duIGJ5IHRoZXNlIGlzc3Vlcy4g
U28gSSB0aGluayB0aGlzIG9wdGlvbiBpcyBqdXN0IGNyZWF0aW5nIHByb2JsZW1zIGZvcgo+IHVz
IHdpdGhvdXQgYWRkZWQgdmFsdWUuCj4gCj4gIEkndmUgcHV0IGEgYnVuY2ggb2Ygb3RoZXIgQnVp
bGRyb290IGNvbnRyaWJ1dG9ycyBpbiBDYyB0byB3ZWlnaCBpbiBpbiB0aGlzCj4gcXVlc3Rpb24u
IEJ1dCBmb3IgbWUsIGl0IGlzIGNyZWF0aW5nIHByb2JsZW1zIHdpdGhvdXQgYWRkaW5nIG11Y2gg
dmFsdWUuCgpJIGhhdmUgYWx3YXlzIGJlZW4gYSBiaXQgY29uZnVzZWQgb24gaG93IEJSMl9TSEFS
RURfU1RBVElDX0xJQlMgd2FzCnN1cHBvc2VkIHRvIHdvcmssIHRvIGJlIGhvbmVzdC4uLiBTdXJl
LCBpdCBtZWFudCB3ZSB3YW50ZWQgdG8gX2J1aWxkXwpib3RoIHRoZSBzdGF0aWMgYW5kIHNoYXJl
ZCBsaWJzLiBCdXQgaG93IHdlcmUgd2UgZ29pbmcgdG8gdGVsbCBwYWNrYWdlcwp3aGV0aGVyIHRo
ZXkgd2VyZSBzdXBwb3NlZCB0byBsaW5rIHN0YXRpY2lhbGx5IG9yIG5vdD8KClN1cmVseSB3ZSBk
byBub3Qgd2FudCBhIHBlci1wYWNrYWdlIG9wdGlvbi4uLiBUaGVuIHdlJ3JlIGxlZnQgd2l0aApk
ZWNpZGluZyBhdCB0aGUgcGFja2FnZSdzIC5tayBsZXZlbCwgYnkgaGFyZC1jb2Rpbmcgc29tZSBo
ZXVyaXN0aWMgdG8KZGVjaWRlLgoKSW4gdXBzdHJlYW0sIHdlIGhhdmUgbm8gc3VjaCBjYXNlIHdo
ZXJlIHdlJ2Qgd2FudCBhIHBhY2thZ2UgdG8gYmUKc3RhdGljYWxseSBsaW5rZWQgZXZlbiBpbiB0
aGUgcHJlc2VuY2Ugb2Ygc2hhcmVkIGxpYnJhcmllcyAobWF5YmUgdGhlCnRoZSBleGNlcHRpb24g
YmVpbmcgYnVzeWJveCwgZm9yIHRob3NlIHdobyB3YW50IHRvIGNoZWFwbHkgYnVpbGQgYW4KaW5p
dHJkIGJlZm9yZSBwaXZvdGluZyBpbiB0aGUgZmluYWwgcm9vdGZzLCBidXQgdGhhdCBjYW4gYmUg
ZG9uZSB3aXRoCmEgY29uZmlnIGZyYWdtZW50IG9yIGEgY3VzdG9tIGNvbmZpZyBmaWxlIGluIGFu
eSBjYXNlKS4KClRoaXMgbGVhdmVzIG91dC1vZi10cmVlIHBhY2thZ2VzLgoKSW4gdGhhdCBjYXNl
LCB0aGVyZSBjYW4gYmUgdG9ucyBvZiByZWFzb25zIHRvIHByZWZlciBhIHN0YXRpYyBsaW5rIGV2
ZW4KaW4gdGhlIHByZXNlbmNlIG9mIHNoYXJlZCBsaWJyYXJpZXMuCgpTbywgdGhlIHJlYWwgcXVl
c2l0b24gaXMgd2hldGhlciB3ZSB3YW50IHRvIHN1cHBvcnQgdGhhdCB1c2UtY2FzZSBvcgpub3Qu
CgpJZiB3ZSBkbywgdGhlbiB3ZSBuZWVkIHRvIGtlZXAgQlIyX1NIQVJFRF9TVEFUSUNfTElCUyBh
bmQgZml4IHRob3NlCnBhY2thZ2VzIHRoYXQgbWlzYmVoYXZlIGluIGl0cyBwcmVzZW5jZSwgbGlr
ZSBkb25lIGZvciBkcm9wYmVhci4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgoKLS0gCi4tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVk
IHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYg
MDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAg
ICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFH
QUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdl
ZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8
CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
