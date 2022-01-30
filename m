Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32C5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 20:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6182040469;
	Sun, 30 Jan 2022 20:44:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VKGa-N5-eKT1; Sun, 30 Jan 2022 20:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94BCF403CC;
	Sun, 30 Jan 2022 20:44:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A5971BF3FD
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 20:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AAD4833B7
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 20:44:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j51GOEKF1xuy for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 20:44:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE53C833A8
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 20:44:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CC4811C0002;
 Sun, 30 Jan 2022 20:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643575485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xfuGWOZajXaSCnjxWTAz9XKxGvisiK6s5maa4zUPW1c=;
 b=EL1A/amp6nkCxOtnBBGRc8MqE6/jt7VTNyylUCK2/vzm7J6HVBpgZnVldXNHAsKfwtI2SD
 5hPhA/x6PRd72uy3+W0fF9tpJAfJ2cYzfWdxlvpTNyWlI6LiyTMGYx0nqzdqafqBU3EzkT
 zF+92DEY++2856Z/IQ4DmTwkJDenk4OfdBjHLIf2u/D1JRLPtrF3DTwkAqf5R1rKF+zmSe
 /ochJMzCNh5EzbYkHEUrcfhzl5+J+QMOTIZCJ7e609tCjpQUhMQZUEyUFSQdrpPOYP2SN6
 b6843mK/d7HwuSW8bdwmvF/azu95zaVuPjr8+TFKTG/ImAeuQ0wPCP783l++XQ==
Date: Sun, 30 Jan 2022 21:44:43 +0100
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220130214443.0106ce53@windsurf>
In-Reply-To: <400c4077-1e25-a5fd-592e-cbf149d7a626@gmail.com>
References: <20220129224651.1282263-1-romain.naour@gmail.com>
 <20220129224651.1282263-3-romain.naour@gmail.com>
 <20220130150243.5795f1fa@windsurf>
 <400c4077-1e25-a5fd-592e-cbf149d7a626@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/5] package/efl: rework eeze handling in
 Kconfig
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBTdW4sIDMwIEphbiAyMDIyIDE4OjQwOjM5ICswMTAwClJvbWFpbiBOYW91ciA8
cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IExlIDMwLzAxLzIwMjIgw6AgMTU6MDIs
IFRob21hcyBQZXRhenpvbmkgYSDDqWNyaXTCoDoKPiA+IE9uIFNhdCwgMjkgSmFuIDIwMjIgMjM6
NDY6NDkgKzAxMDAKPiA+IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gPiAgIAo+ID4+IENvbW1pdCBbMV0gYWRkZWQgZWV6ZSBkZXBlbmRlbmN5IHVzaW5nICJk
ZXBlbmRzIG9uIiB0byBzZXZlcmFsIGVmbAo+ID4+IG9wdGlvbnMgKGRybSwgbGlibW91bnQpIGlu
c3RlYWQgb2Ygc2VsZWN0aW5nIGVlemUgYW5kIHByb3BhZ2F0ZSB0aGUKPiA+PiB1ZGV2IHJldmVy
c2UgZGVwZW5kZW5jeS4gIAo+ID4gCj4gPiBJIGRvIGFncmVlIHdpdGggY2hhbmdpbmcgZnJvbSBh
ICJkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0VGTF9FRVpFIiB0byBhCj4gPiAiZGVwZW5kcyBCUjJf
UEFDS0FHRV9IQVNfVURFViIgKyAic2VsZWN0IEJSMl9QQUNLQUdFX0VGTF9FRVpFIi4KPiA+IEhv
d2V2ZXIuLi4KPiA+ICAgCj4gPj4gVGhlIGRlcGVuZGVuY3kgYmV0d2VlbiBlZXplLCBsaWJpbnB1
dCwgZWZsIGRybSByZXF1aXJlcyB0byBhZGQgYSBuZXcKPiA+PiBsaWJpbnB1dCBvcHRpb24uICAK
PiA+IAo+ID4gLi4uIEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGlzIGp1c3RpZmljYXRpb24uIENvdWxk
IHlvdSBjbGFyaWZ5LiBFdmVuCj4gPiBhZnRlciByZWFkaW5nIFBBVENIIDQvNSwgSSBkb24ndCBn
ZXQgdGhlIHJlbGF0aW9uc2hpcC4gUEFUQ0ggNC81IGNvdWxkCj4gPiBoYXZlIGJlZW4gZG9uZSAo
SSBndWVzcyB1c2luZyB0aGUgc2FtZSBwcmluY2lwbGUgb2YgImRlcGVuZHMgb24KPiA+IEJSMl9Q
QUNLQUdFX0VGTF9FRVpFIi4gIAo+IAo+IEFGQUlLLCBlZmwgZHJtIG5lZWRzIGxpYmlucHV0IChl
bHB1dCkgdGhhdCByZXF1aXJlcyB1ZGV2IChlZXplKS4KPiBVbnRpbCBub3cgd2UgZG9uJ3QgaGF2
ZSBhIGxpYmlucHV0IG9wdGlvbiB0byBkaXNhYmxlIGl0IHdoZW4gZWV6ZSBpcyBhbHNvIGRpc2Fi
bGVkLgoKUmlnaHQsIGFuZD8gSG93IGlzIHRoYXQgcmVsYXRlZCB0byBjaGFuZ2luZyAiZGVwZW5k
cyBvbgpCUjJfUEFDS0FHRV9FRkxfRUVaRSIgdG8gInNlbGVjdCBCUjJfUEFDS0FHRV9FRkxfRUVa
RSIgPwoKPiA+PiBSZXdvcmsgZWV6ZSBoYW5kbGluZyB0byB1c2Ugc2VsZWN0IEJSMl9QQUNLQUdF
X0VGTF9FRVpFIHNpbmNlIHRoZQo+ID4+IHVzZXIgaXMgYWxyZWFkeSBhd2FyZSBvZiB0aGUgdWRl
diBkZXBlbmRlbmN5IChCUjJfUEFDS0FHRV9IQVNfVURFVikuICAKPiA+IAo+ID4gSSBkb24ndCB1
bmRlcnN0YW5kIHdoeSB5b3Ugc2F5IHRoZSB1c2VyIGlzIGFscmVhZHkgYXdhcmUgb2YgdGhlIHVk
ZXYKPiA+IGRlcGVuZGVuY3k/IFRoYW5rcyB0byB0aGUgY29tbWVudHM/ICAKPiAKPiBJIG1lYW4g
aWYgZWV6ZSBjYW4gYmUgc2VsZWN0ZWQsIGl0IG1lYW5zIHRoYXQgdGhlIHVzZWQgZWl0aGVyIHNl
bGVjdGVkIHN5c3RlbWQKPiBvciBldWRldi4KCkJ1dCB0aGF0J3MganVzdCBub3JtYWwgdGhpbmcg
aW4gQnVpbGRyb290LCBubz8gSSBmYWlsIHRvIHVuZGVyc3RhbmQgdGhpcwpwYXJ0IG9mIHlvdXIg
Y29tbWl0IGxvZy4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENF
TywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFp
bmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
