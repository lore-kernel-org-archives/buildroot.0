Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675A0C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 16:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 232DB40931;
	Mon, 10 Jan 2022 16:37:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dj8GH65K0typ; Mon, 10 Jan 2022 16:37:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A2954092E;
	Mon, 10 Jan 2022 16:37:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E6521BF369
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 16:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A2B660D5F
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 16:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sRtr8FI6mVkN for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 16:36:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D20F560C34
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 16:36:57 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 76935440870;
 Mon, 10 Jan 2022 18:36:53 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1641832613;
 bh=xxV4WJDm5zWbRUR6b/CB6ApKri6QMZT2vUd78s+g5PE=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=F0iyjQfgQJlhnyF1rTlyPb+jHaroNVPP/lj/OHmi0HvPgC3Uv/jmfdKfs1n9li1jd
 hxvtud9p3pRYlRsNv70oXdCWPYxkCYlQ4M5iDMZPsfAflTxThvfAQJPuMziRaeheNP
 tnwB9sX3oZRgA8TRiNWIRFWCT3hTld3V5BAlPgECMlH+nJ3jByhC+LbO6iuMMk+43I
 rGf7agjrbqNb1wILX9ZNG9XKvFFlqn+DyxZzgcmS1aBBFJ/siBL9jtPDtxl5Z8ONeA
 LVNaKkemEG7HS0Ok4fk8Wydoii10vwx4BIiraescA+avg0Rs5+7oUkq1jY1wF+qHc8
 JFYZ6oNHk6EUA==
References: <20220110131624.3639727-1-arnout@mind.be>
User-agent: mu4e 1.6.10; emacs 27.1
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Date: Mon, 10 Jan 2022 18:35:55 +0200
In-reply-to: <20220110131624.3639727-1-arnout@mind.be>
Message-ID: <871r1fy2ca.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/systemd: add checklist of upgrade
 caveats
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Norbert Lange <nolange79@gmail.com>,
 =?utf-8?B?SsOpcsOpbXk=?= ROSEN <jeremy.rosen@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Adam Duskett <aduskett@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gTW9uLCBKYW4gMTAgMjAyMiwgQXJub3V0IFZhbmRlY2FwcGVsbGUgKEVz
c2Vuc2l1bS9NaW5kKSB3cm90ZToKPiBCdW1waW5nIHRoZSB2ZXJzaW9uIG9mIHN5c3RlbWQgaXMg
YSBsaXR0bGUgbW9yZSBjb21wbGljYXRlZCB0aGFuIHRoZQo+IHVzdWFsIHBhY2thZ2UsIGFuZCBp
dCdzIGVhc3kgdG8gZm9yZ2V0IHNvbWUgb2YgdGhlIHRoaW5ncyB0aGF0IG5lZWQgdG8KPiBiZSBk
b25lIC0gYW5kIHRoaXMgaGFzIGhhcHBlbmVkIHNldmVyYWwgdGltZXMgaW4gdGhlIHBhc3QuCj4K
PiBBZGQgYSBjaGVja2xpc3Qgb2YgdGhpbmdzIHRvIHdvcnJ5IGFib3V0IHdoZW4gdXBkYXRpbmcg
c3lzdGVtZC4KPgo+IE5vdGUgdGhhdCB0aGVyZSBhcmUgbWFueSBvdGhlciBjb21wbGljYXRlZCBw
YWNrYWdlcyB0aGF0IGFsc28gbmVlZCBhIGxvdAo+IG9mIGF0dGVudGlvbiB3aGVuIHVwZ3JhZGlu
Zy4gSG93ZXZlciwgc3lzdGVtZCBpcyBhIHJlYWxseSBjcml0aWNhbAo+IHBhY2thZ2Ugc28gaXQn
cyBtb3JlIGltcG9ydGFudCB0aGF0IHdlIGdldCB0aGF0IG9uZSByaWdodCB0aGFuLCBzYXksCj4g
dmFsZ3JpbmQuCj4KPiBDYzogTm9yYmVydCBMYW5nZSA8bm9sYW5nZTc5QGdtYWlsLmNvbT4KPiBD
YzogSsOpcsOpbXkgUk9TRU4gPGplcmVteS5yb3NlbkBzbWlsZS5mcj4KPiBDYzogQWRhbSBEdXNr
ZXR0IDxhZHVza2V0dEBnbWFpbC5jb20+Cj4gQ2M6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFybm91dCBWYW5kZWNhcHBlbGxlIChF
c3NlbnNpdW0vTWluZCkgPGFybm91dEBtaW5kLmJlPgo+IC0tLQo+ICBwYWNrYWdlL3N5c3RlbWQv
c3lzdGVtZC5tayB8IDEyICsrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rIGIvcGFj
a2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsKPiBpbmRleCAzODExZGJhZTQyLi40ZDgyZDJhYjgxIDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rCj4gKysrIGIvcGFja2FnZS9z
eXN0ZW1kL3N5c3RlbWQubWsKPiBAQCAtNCw2ICs0LDE4IEBACj4gICMKPiAgIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKPiAgCj4gKyMgV2hlbiB1cGRhdGluZyBzeXN0ZW1kLCB0YWtlIGNhcmUgb2Yg
dGhlIGZvbGxvd2luZzoKPiArIyAtIENoZWNrIGlmIHRoZSByZXF1aXJlbWVudHMgaGF2ZSBjaGFu
Z2VkIChzZWUgUkVBRE1FKSwgaW4gcGFydGljdWxhcgo+ICsjICAgYXJjaCBhbmQgaGVhZGVycwo+
ICsjIC0gSWYgeWVzLCBwcm9wYWdhdGUgdGhlIGRlcGVuZGVuY2llcyB0byBCUjJfSU5JVF9TWVNU
RU1ECj4gKyMgLSBJZiB0aGUgcmVxdWlyZWQga2VybmVsIG9wdGlvbnMgaGF2ZSBjaGFuZ2VkLCB1
cGRhdGUgdGhlIENvbmZpZy5pbgo+ICsjICAgaGVscCB0ZXh0IGFuZCB0aGUgbGlzdCBvZiBLQ09O
RklHX0VOQUJMRV9PUFQuCj4gKyMgLSBDaGVjayBpZiB0aGVyZSBhcmUgbmV3IG1lc29uX29wdGlv
bnMuIE1ha2Ugc3VyZSBhbGwgb3B0aW9ucyBhcmUgc2V0Cj4gKyMgICBleHBsaWNpdGx5ICh1c3Vh
bGx5IHRvIGRlZmF1bHQgdmFsdWUpLgo+ICsjIC0gSWYgdGhlcmUgYXJlIG5ldyBzZXJ2aWNlczoK
PiArIyAgIC0gY3JlYXRlIG5ldyBvcHRpb25zIGZvciB0aGVtIChpZiB0aGV5IHJlYWxseSBhcmUg
b3B0aW9uYWwpOwo+ICsjICAgLSBjcmVhdGUgYSBuZXcgX1VTRVIgaWYgbmVjZXNzYXJ5Owo+ICsj
ICAgLSBjcmVhdGUgbmV3IGRpcmVjdGlvbnJ5ICh3aXRoIF9QRVJNSVNTSU9OUykgaWYgbmVjZXNz
YXJ5LgoKcy9kaXJlY3Rpb25yeS9kaXJlY3RvcnkvCgpiYXJ1Y2gKCj4gIFNZU1RFTURfVkVSU0lP
TiA9IDI1MC4xCj4gIFNZU1RFTURfU0lURSA9ICQoY2FsbCBnaXRodWIsc3lzdGVtZCxzeXN0ZW1k
LXN0YWJsZSx2JChTWVNURU1EX1ZFUlNJT04pKQo+ICBTWVNURU1EX0xJQ0VOU0UgPSBcCgoKLS0g
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfi4g
Ln4gICBUayBPcGVuIFN5c3RlbXMKPX0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS1vb08tLVUtLU9vby0tLS0tLS0tLS0tLXs9CiAgIC0gYmFydWNoQHRrb3Mu
Y28uaWwgLSB0ZWw6ICs5NzIuNTIuMzY4LjQ2NTYsIGh0dHA6Ly93d3cudGtvcy5jby5pbCAtCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
