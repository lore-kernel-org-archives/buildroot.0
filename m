Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33C6C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 10:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FDD160FAC;
	Thu,  3 Nov 2022 10:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FDD160FAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K2aP7drEP0xZ; Thu,  3 Nov 2022 10:25:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B0A66079D;
	Thu,  3 Nov 2022 10:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B0A66079D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F8851BF3D1
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 10:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79FDE40871
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 10:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79FDE40871
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tpZFNasQRn2W for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 10:25:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F7B740761
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F7B740761
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 10:25:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (21)
Received: from zm (pub-52.182.29.194.multiplay.pl [194.29.182.52])
 by server220076.nazwa.pl (Postfix) with ESMTP id CA6D71BCB4F;
 Thu,  3 Nov 2022 11:25:09 +0100 (CET)
References: <20221103014156.791695-1-m.niestroj@grinn-global.com>
 <CADvTj4pKWU2GDvmtrLqEX9MESebPS0Arpa+n3WbXD7d30wDP6w@mail.gmail.com>
User-agent: mu4e 1.8.11; emacs 28.2
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 03 Nov 2022 11:23:36 +0100
In-reply-to: <CADvTj4pKWU2GDvmtrLqEX9MESebPS0Arpa+n3WbXD7d30wDP6w@mail.gmail.com>
Message-ID: <87wn8cmj22.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/python-dbus-fast: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CkphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cml0ZXM6Cgo+IE9u
IFdlZCwgTm92IDIsIDIwMjIgYXQgOTo0OCBQTSBNYXJjaW4gTmllc3Ryb2oKPiA8bS5uaWVzdHJv
akBncmlubi1nbG9iYWwuY29tPiB3cm90ZToKPj4KPj4gU2lnbmVkLW9mZi1ieTogTWFyY2luIE5p
ZXN0cm9qIDxtLm5pZXN0cm9qQGdyaW5uLWdsb2JhbC5jb20+Cj4+IC0tLQo+PiAgREVWRUxPUEVS
UyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKwo+PiAgcGFja2FnZS9D
b25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+PiAgcGFja2FnZS9w
eXRob24tZGJ1cy1mYXN0L0NvbmZpZy5pbiAgICAgICAgICAgIHwgIDkgKysrKwo+PiAgLi4uL3B5
dGhvbi1kYnVzLWZhc3QvcHl0aG9uLWRidXMtZmFzdC5oYXNoICAgIHwgIDUgKysrCj4+ICBwYWNr
YWdlL3B5dGhvbi1kYnVzLWZhc3QvcHl0aG9uLWRidXMtZmFzdC5tayAgfCAxNCArKysrKysKPj4g
IC4uLi90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fZGJ1c19mYXN0LnB5ICB8IDQ0ICsrKysr
KysrKysrKysrKysrKysKPj4gIC4uLi90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2RidXNfZmFz
dC5weSAgICB8IDQwICsrKysrKysrKysrKysrKysrCj4+ICA3IGZpbGVzIGNoYW5nZWQsIDExNSBp
bnNlcnRpb25zKCspCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tZGJ1cy1m
YXN0L0NvbmZpZy5pbgo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLWRidXMt
ZmFzdC9weXRob24tZGJ1cy1mYXN0Lmhhc2gKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L3B5dGhvbi1kYnVzLWZhc3QvcHl0aG9uLWRidXMtZmFzdC5tawo+PiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fZGJ1c19mYXN0
LnB5Cj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
dGVzdF9weXRob25fZGJ1c19mYXN0LnB5CgpbLi4uc25pcC4uLl0KCj4+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL3B5dGhvbi1kYnVzLWZhc3QvcHl0aG9uLWRidXMtZmFzdC5tayBiL3BhY2thZ2UvcHl0
aG9uLWRidXMtZmFzdC9weXRob24tZGJ1cy1mYXN0Lm1rCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4+IGluZGV4IDAwMDAwMDAwMDAuLjc0YTAyZWI1YjkKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysg
Yi9wYWNrYWdlL3B5dGhvbi1kYnVzLWZhc3QvcHl0aG9uLWRidXMtZmFzdC5tawo+PiBAQCAtMCww
ICsxLDE0IEBACj4+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+PiArIwo+PiArIyBweXRob24t
ZGJ1cy1mYXN0Cj4+ICsjCj4+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+PiArCj4+ICtQWVRI
T05fREJVU19GQVNUX1ZFUlNJT04gPSAxLjYxLjEKPj4gK1BZVEhPTl9EQlVTX0ZBU1RfU09VUkNF
ID0gZGJ1c19mYXN0LSQoUFlUSE9OX0RCVVNfRkFTVF9WRVJTSU9OKS50YXIuZ3oKPj4gK1BZVEhP
Tl9EQlVTX0ZBU1RfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdl
cy9kZC9mNC9hMjgwZDQ2YjExOWQ1OWY2YTNkODRhYmY0NzQ0NTJhZTc2NjUxNTU4YjA5NjNhYjhj
NDhhZTEzYjVhNDQKPj4gK1BZVEhPTl9EQlVTX0ZBU1RfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMK
Pj4gK1BZVEhPTl9EQlVTX0ZBU1RfTElDRU5TRSA9IE1JVAo+PiArUFlUSE9OX0RCVVNfRkFTVF9M
SUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+Cj4gTWF5YmUganVzdCBhZGQgdGhpcyh0byBlbnN1cmUg
d2UgYnVpbGQgd2l0aCBvcHRpbWl6YXRpb25zKSBhbmQgc3BpbiBhCj4gdjIgdG8gcmVwbGFjZSBt
aW5lPzoKPiBQWVRIT05fREJVU19GQVNUX0VOViA9IFJFUVVJUkVfQ1lUSE9OPTEKPiBQWVRIT05f
REJVU19GQVNUX0RFUEVOREVOQ0lFUyA9IGhvc3QtcHl0aG9uLWN5dGhvbgo+CgpKdXN0IHNlbnQg
djIsIHRoYW5rcyEKCi0tCk1hcmNpbiBOaWVzdHLDs2oKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
