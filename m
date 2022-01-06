Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BE7C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 15:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7333681335;
	Thu,  6 Jan 2022 15:37:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BcBpQrqEnB2V; Thu,  6 Jan 2022 15:37:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA7708131F;
	Thu,  6 Jan 2022 15:37:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23D2D1BF3F6
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E953812EB
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:37:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WtkOfnjyGv0v for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 15:37:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3255C812E0
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 15:37:54 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id C4B133203774;
 Thu,  6 Jan 2022 10:37:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 06 Jan 2022 10:37:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 message-id:subject:from:to:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 cEI/onHbgO7DYtcjr6ObcdHFbh3cWKNoRNnbE7SNu28=; b=e2fDMAL154TtD8pn
 7EKdGpQwFhcwC4G3nqmIqX+8zKZhIzjGrP2Z/fSy57b0hvLX+mThNZutJnvIybgh
 Ui/nST82T4iizWh0HgDF0SM7351tMErGQXwNXVwkdNzR0qHyV7W+s1hdW9CCCR3I
 xLYMY9Qk/Jpi1Fuv5HekaGuK3KLS9qXA2Cp7q2lJexgB0ci/tO5uyIJAlhtkcx5E
 6aiPp5ijCvxYwUEOnG1V5B7yH4CBVffdkFAzdNrvITtg06qMV44UCEWgCsAdDS34
 qKfxY9O1an4dOsvszyJjHy4HEXS9674+0y0fX5BGFKa57HRSv2/BsEywBF6mmA2f
 Kqd1hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=cEI/onHbgO7DYtcjr6ObcdHFbh3cWKNoRNnbE7SNu
 28=; b=YYu3ZqptCNeJDgXKHBotD3Z3hjD7QFjdTwpvBplCYIguqfBm8rFfEZWPD
 TJ6HI3fhELhBD7H4ZnmeiyBS3IIw9cA9vrENJ4XKtipYOybkYnN4TTIl4BBBF550
 8AaMFBFiit56oldVSS9+6u4bqimD4QJBZJH2Q1F+iU2eYDQ6NOOzxaOflk3utq8d
 /lZUN6JCFO+kE1oNREGDLFjtLEZvoaOw8EwPP0n+lYw1I7nHL9yRfpLFeHooQVW9
 fUAhrYhGmfgIXD0iT7ocs9P/+URtzL0ecZ+SvvcGhvhVKQFUhO58M54bULxBN+PH
 RgX4EgvUZ3f+3TXxG6t6bSqrXBOAQ==
X-ME-Sender: <xms:zwzXYT-sBI6yjc6pz9pN5s6Zy2pWcx8eEbcHvGjGlMX6NzYxPdSW2g>
 <xme:zwzXYfsMyF4X2EWDFmQzLAhZfMM5yH2QKTGWCdhKJWs9Pm-vvNPzMiE4s9A9T4zi5
 2rHv3i5mQc6oMk8n4I>
X-ME-Received: <xmr:zwzXYRBhm6_RkjF8Xc48IqV7tburxzT4w55IQlM2oRx8MlfaMx6iedDZy4p1Y6iUJbNgxq-BjyXP_VsZTDxcdnI8yTL8kA-JlgqPlfou8AVLEs2IN85Lb1tk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudefledgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthekredttderjeenucfhrhhomheplfgvshhs
 vgcuofhilhhlfihoohguuceojhgvshhsvggpuggvvhesfhgrshhtmhgrihhlrdgtohhmqe
 enucggtffrrghtthgvrhhnpeehjeeihfduuefhffdugeevhfekjedtteehkeelkeelleef
 fedvheeitdetvdeggeenucffohhmrghinhepsghuihhlughrohhothdrohhrghenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjvghsshgvpggu
 vghvsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:zwzXYfcfAP7WWwo9gIQqs2foyp9dLCExXR7x-wJ1pY9QauZYg0Wr3A>
 <xmx:zwzXYYNKvSjkcNyQ9UFYw5BTYGim__3yMe1_4ArWck2YDNYot2APBg>
 <xmx:zwzXYRkINTWSiXXK7GY08GiNWureypnx2zMvnDDz4AL--AsEdWAp1A>
 <xmx:zwzXYSWQ7UNm_BeU29kPPzKP9PAToaCTXGJkVvcQ1c4T-SzNGpwUZg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Jan 2022 10:37:50 -0500 (EST)
Message-ID: <fff7dc06ab8c676e28709d3782e57e90ae121095.camel@fastmail.com>
From: Jesse Millwood <jesse_dev@fastmail.com>
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
Date: Thu, 06 Jan 2022 10:37:49 -0500
In-Reply-To: <09340549-99c9-b79c-17db-3967b1ab6335@mind.be>
References: <37282adb-8559-4124-874d-c1729bd3ce01@www.fastmail.com>
 <09340549-99c9-b79c-17db-3967b1ab6335@mind.be>
User-Agent: Evolution 3.42.2 (flatpak git) 
MIME-Version: 1.0
Subject: Re: [Buildroot] Overriding Kconfig Values from external br2
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAyMDIyLTAxLTA2IGF0IDEwOjQ1ICswMTAwLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3
cm90ZToKPiAKPiAKPiBPbiAwNS8wMS8yMDIyIDIwOjAzLCBKZXNzZSBNaWxsd29vZCB3cm90ZToK
PiA+IEhlbGxvLAo+ID4gCj4gPiBJIGhhdmUgYW4gZXh0ZXJuYWwgQy9DKysgdG9vbGNoYWluIHRo
YXQgSSd2ZSBwdXQgdG9nZXRoZXIgdGhhdCB1c2VzCj4gPiBNVVNMLiBJJ3ZlIAo+ID4gYWxzbyBi
dWlsdCBhbiBleHRlcm5hbCBSdXN0IHRvb2xjaGFpbiB0aGF0IHVzZXMgbXkgTVVTTCB0b29sY2hh
aW4uCj4gPiAKPiA+IE15IGlzc3VlIGlzIHRoYXQgdGhlcmUgaXMgYSBSdXN0IEtjb25maWcgdmFy
aWFibGUgdGhhdCBzcGVjaWZpZXMgaWYKPiA+IGEgc3BlY2lmaWMgCj4gPiBhcmNoaXRlY3R1cmUg
c3VwcG9ydHMgUnVzdC4KPiA+IAo+ID4gVGhlIEtjb25maWcgdmFyaWFibGUgaW4gcXVlc3Rpb24g
aXMKPiA+IEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX0FSQ0hfU1VQUE9SVFMgCj4gPiBp
biBwYWNrYWdlL3J1c3RjL0NvbmZpZy5pbi5ob3N0Lgo+IAo+IFtzbmlwXQo+IAo+ID4gWW91IG1h
eSBub3RpY2UgdGhhdCBJIGNoYW5nZWQgdGhlIGxpYmMgZGVwZW5kcyBsaW5lIHRvIGJlIG9yJ2Qg
d2l0aAo+ID4gQlIyX1RPT0xDSEFJTl9VU0VTX01VU0wuIEl0IHNlZW1zIHRoYXQgdGhpcyBkb2Vz
IG5vdCBnZXQgY29uc2lkZXJlZAo+ID4gd2hlbiBJIAo+ID4gY2hvb3NlIG15IGV4dGVybmFsIG11
c2wgdG9vbGNoYWluIG9wdGlvbi4gSW4gdGhlIG1lbnVjb25maWcgd2hlbiBJCj4gPiBzZWFyY2gg
Zm9yIAo+ID4gdGhlIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX0FSQ0hfU1VQUE9SVFMg
dmFyaWFibGUgd2l0aCB0aGUKPiA+ICIvIiBrZXkgaXQgCj4gPiBsb29rcyBsaWtlIGl0IGlzIG9u
bHkgZ2V0dGluZyBpdCBmcm9tIHRoZSBvcmlnaW5hbCBmaWxlLiBEb2VzCj4gPiBidWlsZHJvb3Qg
aGF2ZSBhIAo+ID4gbWVjaGFuaXNtIGZvciBvdmVyd3JpdGluZyB0aGlzIGtpbmQgb2Ygc2V0dGlu
ZyBhbmQgaWYgbm90LCBkb2VzCj4gPiBhbnlvbmUgaGF2ZSBhbiAKPiA+IGlkZWEgb2YgaG93IEkg
d291bGQgYWNjb21wbGlzaCB3aGF0IEkgYW0gdHJ5aW5nIHRvIGRvIChtYWtlCj4gPiBidWlsZHJv
b3QgaG9ub3IgbXkgCj4gPiBleHRlcm5hbCBydXN0IHRvb2xjaGFpbik/Cj4gCj4gwqAgTm8sIHRo
ZXJlJ3Mgbm8gd2F5IHRvIG92ZXJyaWRlIHRoZSBkZXBlbmRlbmNpZXMgb2YgYW4gZXhpc3RpbmcK
PiBDb25maWcuaW4gCj4gc3ltYm9sIGluIGFuIGV4dGVybmFsLgo+IAo+IMKgIEhvd2V2ZXIsIHRo
aXMgd2FzIGNvcnJlY3RlZCBpbiB1cHN0cmVhbSBCdWlsZHJvb3QgaW4gY29tbWl0IAo+IGQ2OWQ0
MGMwMjlkYzdkODE5OWI3NDVlYWVlNzU5ZDkyYjY2YzVkMTcuIFNvIHlvdSBjYW4gdHJ5IHRvIGJh
Y2twb3J0Cj4gdGhhdCBjb21taXQgCj4gaW5zdGVhZCwgb3IganVzdCB1cGRhdGUgQnVpbGRyb290
IHRvIHNvbWV0aGluZyBtb3JlIHJlY2VudC4KCkFybm91dCwgdGhhbmtzIGZvciB0aGUgcG9pbnRl
ciB0byB0aGUgY29tbWl0LiBUaGF0IGlzIGEgbG9naWNhbCB3YXkgdG8Kc3VwcG9ydCBvdGhlciBw
bGF0Zm9ybXMuIEhvd2V2ZXIsIEkgaGF2ZSBhIHBvd2VycGMgbXVzbCBydXN0IHRvb2xjaGFpbgp0
aGF0IEkndmUgYnVpbHQgZXh0ZXJuYWxseS4gCgpXaXRoIHRoZSBjaGFuZ2VzIGluIHRoYXQgY29t
bWl0IGNhbiBJIHNldApCUjJfUEFDS0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRT
IHRvICJ5IiBpbiBteSBleHRlcm5hbCBub3cKdGhhdCB0aGVyZSBpcyBubyBkZXBlbmRzIGV4cHJl
c3Npb25zIGFuZCBpdCBpcyBhbGwgZGVmYXVsdCBsb2dpYz8gT3IKd291bGQgSSBoYXZlIHRvIHN0
aWxsIGFkZCBhbm90aGVyIGV4cHJlc3Npb24gdGhhdCBtYXliZSBkZWZhdWx0cyB0byAieSIKaWYg
YSBuZXcgdmFyaWFibGUgaXMgdHJ1ZSBsaWtlCiJCUjJfRVhURVJOQUxfUlVTVENfVEFSR0VUX0FS
Q0hfU1VQUE9SVFMiIHRoYXQgaXMgZGVmaW5lZCBpbiBteQpleHRlcm5hbD8gCgpUaGFua3MsIApK
ZXNzZQoKPiAKPiDCoCBSZWdhcmRzLAo+IMKgIEFybm91dAo+IAo+IAo+ID4gCj4gPiBUaGFua3Ms
Cj4gPiBKZXNzZQo+ID4gCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo+ID4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
