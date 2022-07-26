Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFB4C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 06:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0027B83F86;
	Tue, 26 Jul 2022 06:11:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0027B83F86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03k0uRjotMWq; Tue, 26 Jul 2022 06:11:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6D7A83F5B;
	Tue, 26 Jul 2022 06:11:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6D7A83F5B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D947E1BF287
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 06:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C07DC60B02
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 06:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C07DC60B02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YUVukEApf1mC for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 06:11:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 449C860B0B
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 449C860B0B
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 06:11:48 +0000 (UTC)
Received: from [0.0.0.0] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MAP77-1oM2Xr2M7n-00BxPT; Tue, 26 Jul 2022 08:11:44 +0200
Message-ID: <41003a49-1037-71d0-cf78-45f3112a708b@green-communications.fr>
Date: Tue, 26 Jul 2022 08:11:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20220705081330.22435-1-nicolas.cavallari@green-communications.fr>
 <7e88bc80-3c9e-f7c5-684d-74fd146fdb3b@mind.be>
Content-Language: en-US
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <7e88bc80-3c9e-f7c5-684d-74fd146fdb3b@mind.be>
X-Provags-ID: V03:K1:P9lRiUSbfgwehEt4hHCeeeoM8aLg6bBZiDI3DmuV8szM2Ou7+n/
 3RdRdWDHZOneZ6yP2mdK0Vo3Ipu9ZrFiDA4myqj1lAAzNxHgSXoDLSsZHaAcdcZ4NTTCk2I
 6AhARYy9lfLCsLSZkmLXW1eR7NW38XVdoCSh8bpQcIa44VWTNyqF8IQjnqgaQ/S3wP8HR8t
 uSuhRK41s89Ek/umMukqw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hnCU05s9abI=:I7KpexUwg1Fs3mQGIwbUYm
 RlTvBzpc17yj0pPH55kbXCQh7zMzPbj7fc9A8upPQqnsMCOCBpCXlqqkFiPkoxPoK9K2uA1zo
 MxNNvhqVRycCQaH2n6c2M3bn7W6409zUK8/7/vbocD1KVLlt4hbVy6NffgJ7kIzhbO7l8FDVp
 3AmBwqpl4UcpIsl01S90Y9kEhN10fvQHf5M2uHD4bacCHc9RLsABjEDaFK3xGM0z1ILYN4/oW
 mkpUH5Kh/HkZVtwwtrS0jWSnfIWvOWeOPHBkQ6AEOvvyoCX+x7mwLVf8klE3i3+HqLR6iLCW1
 ErqBlIf3VA6O1qZZjiGt9wAwq79YWClVxKrdnXeUDIsWw6g0b1oEx1nEF4NDz6F8QKIP7YZrQ
 M8Nh3mYkjvzFau9S1nKcZlX8sYcb5quE/jA145h3JPc38WN6jp5sBkgA+mOKSPzVP4BTwmMgL
 onYwDWY33Rt5p5E6fK8bFiWm+M9Q022N+hWQdoxXQplPRo34asg6MvdUaCUs0SnAWFoAGlXsV
 ltk3mJWkQsddPSAe/Akw/ObX1R7zXihSha87zMsrf8qH/T+X5vyByVEpUHc3/WIfhAIlFkC7k
 +omxPqpc11fwhXIt/OZJ+3epDx8rH5ZoFp5FD+jUXBwW6I6KNjg6DpWzJnFv0ErxM0mwr9JTg
 hnaL3OGJP62WNaeZM2kX7G7Yr/Heo3pBOYFOzYVun8jJ9nwuXPitgsGjnExN5UTUgh+sN+6lo
 JRwGJFLv+bsta8D7Sv/ZHDzPbaXX4winNcpv27yST3Qrp539hKxfVoFsdNd/B5rVPrZHuOkhw
 X7UIW1I
Subject: Re: [Buildroot] [PATCH 1/1] package/pulseaudio: bump to version 16.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiAyNC8wNy8yMDIyIDExOjEwLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToK
Pgo+Cj4gT24gMDUvMDcvMjAyMiAxMDoxMywgTmljb2xhcyBDYXZhbGxhcmkgd3JvdGU6Cj4+IFRo
ZSBhdXRvdG9vbHMgYnVpbGQgc3lzdGVtIHdhcyBmaW5hbGx5IHJlbW92ZWQgaW4gZmF2b3Igb2Yg
bWVzb24sCj4+IHNvIG1pZ3JhdGUgdGhlIHBhY2thZ2UgdG8gdGhlIG1lc29uIGluZnJhLgo+Pgo+
PiBOb3RhYmxlIGNoYW5nZXM6Cj4+IC0gYzExIGlzIHJlcXVpcmVkLgo+Cj4gwqBUaGlzIGFjdHVh
bGx5IG1lYW5zIHRoYXQgdGhlIG1pbmltYWwgR0NDIHZlcnNpb24gaXMgNC44IG9yIDQuOSAKPiAo
ZGVwZW5kaW5nIG9uIHdoaWNoIGZlYXR1cmVzIGFyZSB1c2VkIGV4YWN0bHkgLSBJIGRpZCBhIHRl
c3Qgd2l0aCB0aGUgCj4gb2xkIFNvdXJjZXJ5IEFSTSB0b29sY2hhaW4gd2hpY2ggaXMgNC44LCBh
bmQgdGhhdCBvbmUgd29ya3MsIHNvIGl0IAo+IHNlZW1zIHRvIGJlIGVub3VnaCkuIFNvIHRoZXJl
IHNob3VsZCBiZSBhIGRlcGVuZGVuY3kgdGhhdCBleHByZXNzZXMgdGhhdC4KCkkgdGhpbmsgdGhh
dCBzdGF0aWNfYXNzZXJ0IGlzIHRoZSBvbmx5IGMxMSBmZWF0dXJlIHVzZWQgaW4gcHVsc2VhdWRp
by4KCj4KPiDCoFRoYXQgd291bGQgbWVhbiBwcm9wYWdhdGluZyB0byBwdWxzZWF1ZGlvJ3MgNiBy
ZXZlcnNlIGRlcGVuZGVuY2llcywgCj4gYW5kIHByb2JhYmx5IGZ1cnRoZXIgdG8gcmVjdXJzaXZl
IGRlcGVuZGVuY2llcywgd2hpY2ggaXMgdGlyZXNvbWUuLi4KPgo+IMKgU2luY2UgbW9yZSBhbmQg
bW9yZSBwYWNrYWdlcyBhcmUgZGVwZW5kaW5nIG9uIEMxMSAoaW5jbHVkaW5nIHJlY2VudCAKPiBr
ZXJuZWxzKSwgSSBkaXNjdXNzZWQgdGhpcyB3aXRoIG90aGVyIG1haW50YWluZXJzIGFuZCB3ZSBk
ZWNpZGVkIHRvIAo+IGp1c3QgbWFrZSA0LjkgdGhlIG1pbmltdW0uIFRoaXMgaXMgYWN0dWFsbHkg
YWxyZWFkeSB0aGUgbWluaW11bSBmb3IgCj4gdGhlIGhvc3QgY29tcGlsZXIsIHdlJ2xsIG1ha2Ug
aXQgdGhlIG1pbmltdW0gZm9yIHRoZSB0YXJnZXQgYXMgd2VsbC4gCj4gV2UgY2FuJ3Qgc3RheSBp
biB0aGUgcGFzdCBmb3JldmVyLgo+Cj4+IC0gZ2xpYiBpcyBubyBsb25nZXIgb3B0aW9uYWwuCj4+
IC0gdGhlcmUgaXMgbm8gb3B0aW9uIHRvIGNob29zZSBpZiBsaWJjYXAgb3IgbmVvbiBtdXN0IGJl
IHVzZWQgb3Igbm90Lgo+PiAtIHN1cHBvcnQgZm9yIGxpYmF0b21pY19vcHMgaXMgYnJva2VuIGFu
ZCBtdXN0IGJlIGV4dGVuc2l2ZWx5IHBhdGNoZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE5pY29s
YXMgQ2F2YWxsYXJpIAo+PiA8bmljb2xhcy5jYXZhbGxhcmlAZ3JlZW4tY29tbXVuaWNhdGlvbnMu
ZnI+Cj4+IC0tIAo+PiBUZXN0ZWQgd2l0aCB0ZXN0LXBrZyAtYSBmb3IgcHVsc2VhdWRpbyBvbmx5
IGFuZCBmb3IgcHVsc2VhdWRpbythdmFoaSsKPj4gZGJ1cytuY3Vyc2VzK2xpYm9wZW5zc2wrZmZ0
dytzYW1wbGVyYXRlK2dkYm0rb3JjK2xpYmNhcCtsaWJzb3hyK2Fsc2EKPj4gb24gdG9wIG9mIGVm
ZDIxNWM3OQo+PiAtLS0KPj4gwqAgLi4uY19hc3NlcnQtaW5zdGVhZC1vZi1zdGF0aWNfYXNzZXJ0
LWZvLnBhdGNoIHzCoCAzMiArKysrKwo+PiDCoCAuLi5pbGQtc3lzLUZpeC1hdG9taWMtc3VwcG9y
dC1kZXRlY3Rpb24ucGF0Y2ggfMKgIDU5ICsrKysrKysrCj4+IMKgIC4uLmQtbWlzc2luZy1saWJh
dG9taWNfb3BzLWRlcGVuZGVuY2llcy5wYXRjaCB8IDEyOSArKysrKysrKysrKysrKysrKysKPj4g
wqAgcGFja2FnZS9wdWxzZWF1ZGlvL0NvbmZpZy5pbsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgwqAgMSArCj4+IMKgIHBhY2thZ2UvcHVsc2VhdWRpby9wdWxzZWF1ZGlvLmhh
c2jCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDQgKy0KPj4gwqAgcGFja2FnZS9wdWxzZWF1
ZGlvL3B1bHNlYXVkaW8ubWvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNzMgKysrKy0t
LS0tLQo+PiDCoCA2IGZpbGVzIGNoYW5nZWQsIDI1MCBpbnNlcnRpb25zKCspLCA0OCBkZWxldGlv
bnMoLSkKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IAo+PiBwYWNrYWdlL3B1bHNlYXVkaW8vMDAw
MS1zaG0uYy11c2UtX1N0YXRpY19hc3NlcnQtaW5zdGVhZC1vZi1zdGF0aWNfYXNzZXJ0LWZvLnBh
dGNoCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCAKPj4gcGFja2FnZS9wdWxzZWF1ZGlvLzAwMDIt
YnVpbGQtc3lzLUZpeC1hdG9taWMtc3VwcG9ydC1kZXRlY3Rpb24ucGF0Y2gKPj4gwqAgY3JlYXRl
IG1vZGUgMTAwNjQ0IAo+PiBwYWNrYWdlL3B1bHNlYXVkaW8vMDAwMy1idWlsZC1zeXMtQWRkLW1p
c3NpbmctbGliYXRvbWljX29wcy1kZXBlbmRlbmNpZXMucGF0Y2gKPj4KPj4gZGlmZiAtLWdpdCAK
Pj4gYS9wYWNrYWdlL3B1bHNlYXVkaW8vMDAwMS1zaG0uYy11c2UtX1N0YXRpY19hc3NlcnQtaW5z
dGVhZC1vZi1zdGF0aWNfYXNzZXJ0LWZvLnBhdGNoIAo+PiBiL3BhY2thZ2UvcHVsc2VhdWRpby8w
MDAxLXNobS5jLXVzZS1fU3RhdGljX2Fzc2VydC1pbnN0ZWFkLW9mLXN0YXRpY19hc3NlcnQtZm8u
cGF0Y2ggCj4+Cj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAuLjhj
ZGMyM2UxZTAKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgCj4+IGIvcGFja2FnZS9wdWxzZWF1ZGlv
LzAwMDEtc2htLmMtdXNlLV9TdGF0aWNfYXNzZXJ0LWluc3RlYWQtb2Ytc3RhdGljX2Fzc2VydC1m
by5wYXRjaAo+PiBAQCAtMCwwICsxLDMyIEBACj4+ICtGcm9tIGZiMzlmOTYwMGQ0NjRjZTc2MTkx
N2MwZTc4N2I5NDAwOTdmNjAyNGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4+ICtGcm9tOiBO
aWNvbGFzIENhdmFsbGFyaSA8bmljb2xhcy5jYXZhbGxhcmlAZ3JlZW4tY29tbXVuaWNhdGlvbnMu
ZnI+Cj4+ICtEYXRlOiBUaHUsIDIzIEp1biAyMDIyIDE2OjUyOjQ5ICswMjAwCj4+ICtTdWJqZWN0
OiBbUEFUQ0hdIHNobS5jOiB1c2UgX1N0YXRpY19hc3NlcnQgaW5zdGVhZCBvZiBzdGF0aWNfYXNz
ZXJ0IAo+PiBmb3IgdWNsaWJjCj4+ICsKPj4gK0JvdGggYXJlIEMxMSBjb25zdHJ1Y3RzLsKgIFRo
ZSBmaXJzdCBvbmUgaXMgZGVmaW5lZCBieSB0aGUgY29tcGlsZXIgaW4KPj4gK2dudTExIG1vZGUs
IGJ1dCB0aGUgc2Vjb25kIG9uZSBzaG91bGQgYmUgYSBtYWNybyBkZWZpbmVkIGluIGFzc2VydC5o
Cj4+ICsKPj4gK1RoZSBtYWNybyBleGlzdHMgaW4gZ2xpYmMgPj0gMi4xNiBhbmQgbXVzbCA+PSAx
LjEuMTAgYnV0IG5vdCBpbgo+PiArdWNsaWJjIDEuMC40MS7CoCBJdCBpcyBleHBlY3RlZCB0byBi
ZSBwcmVzZW50IGluIHVjbGliYyAxLjAuNDIuCj4+ICsKPj4gK1NpZ25lZC1vZmYtYnk6IE5pY29s
YXMgQ2F2YWxsYXJpIAo+PiA8bmljb2xhcy5jYXZhbGxhcmlAZ3JlZW4tY29tbXVuaWNhdGlvbnMu
ZnI+Cj4KPiDCoERpZG4ndCB5b3Ugc2VudCB0aGlzIHBhdGNoIHVwc3RyZWFtPwoKVGhpcyBpcyBt
b3JlIGEgd29ya2Fyb3VuZCB0aGFuIGEgZml4LCB0aGUgcmVhbCBidWcgaXMgdWNsaWJjIG5vdCBi
ZWluZyAKYzExIGNvbXBsaWFudCwgYW5kIEkgYWxyZWFkeSBzZW50IGEgcGF0Y2ggdG8gZml4IHVj
bGliYy4KSSBkb24ndCB0aGluayBwdWxzZWF1ZGlvIGlzIGludGVyZXN0ZWQgaW4gdWNsaWJjIHN1
cHBvcnQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
