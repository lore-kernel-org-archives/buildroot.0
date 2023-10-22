Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FBEC001DF
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 14:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 570356125C;
	Sun, 22 Oct 2023 14:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 570356125C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O8SgN2w_K7ja; Sun, 22 Oct 2023 14:08:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9227060E1B;
	Sun, 22 Oct 2023 14:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9227060E1B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DA631BF298
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 14:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76C6385439
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 14:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76C6385439
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tpq0EZhFfRxU for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 14:08:08 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4114F85433
 for <buildroot@busybox.net>; Sun, 22 Oct 2023 14:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4114F85433
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:fb1e:781c:6f9a:fbfd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id ADCEB60135;
 Sun, 22 Oct 2023 16:08:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Oct 2023 16:08:02 +0200
Date: Sun, 22 Oct 2023 16:08:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20231022140802.GJ2607@scaer>
References: <20231020161902.48876-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231020161902.48876-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1697983685;
 bh=PSd3gXWkCHZmfhqXRinZ/0jOj+qhKdoJmC7gepu/owo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KDFFZ0owRcaIi4+i2bo2r0hP1X1IQFqZ4XnB/qpBcyQsDQSK6Q2DnAeYPyGr5JFxl
 oW5auMY1YC2h2KUsGlIK50s/pLCcRgyglYDN12KG6sXloJAo+8MF96vw2spUpNfrCq
 Nt1CDq4XS/8FcQU8E++d7BUEsADrcensAtXBc2lYMNArNhgt6QWrcglOOYrwXIexPH
 XUouZ7FlynltEN3QY17cjK0OIq2rnC4Kf3EvA88o6Tb3zyzUaqrPQ/mAjucYpRq3tj
 G2VF59bMAGQdi6ys+EjjOruUdpf3Z73YjFGa/aknybg8sIWkZb+t0c6Tz/t65AM2Hu
 YVRX8VsRl6JSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KDFFZ0ow
Subject: Re: [Buildroot] [PATCH 1/2] package/perl-net-ssh2: bump to version
 0.73
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIzLTEwLTIwIDE4OjE5ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IGRpZmYgUkVBRE1FLnBvZDoKPiBzZWUgaHR0cHM6Ly9tZXRhY3Bh
bi5vcmcvcmVsZWFzZS9SS0lUT1ZFUi9OZXQtU1NIMi0wLjczL2RpZmYvU0FMVkEvTmV0LVNTSDIt
MC43MiNSRUFETUUucG9kCgpXZSB3YW50IHRvIGhhdmUgYSBzdW1tYXJ5IG9mIHRoZSBjaGFuZ2Vz
IGRpcmVjdGx5IGluIG91ciBjb21taXQgbG9nLApiZWNhdXNlIG91ciBjb21taXQgbG9nIGlzIGFs
bCB0aGF0IGlzIGd1YXJhbnRlZGQgdG8gYmUgYXZhaWxhYmxlIGluCm91ciByZXBvc2l0b3J5LiBB
bnkgcmVmZXJlbmNlIHRvIGEgdGhvcmQtcGFydHkgbG9jYXRpb24gd2lsbCBub3QgaGF2ZQp0aGUg
c2FtZSBndWFyYW50ZWUgKGUuZy4gZXZlbiBpZiBDUEFOIGhhcyBleGlzdGVkIGZvciBhZ2VzLCB0
aGV5IG1heQpyZXdyaXRlIHRoZSBVUkxzIGluIHRoZSBmdXR1cmUpLgoKSW5jaWRlbnRhbGx5LCB0
aGUgJ2RpZmYnIGFib3ZlIGNvbmZ1c2VzIFBhdGNod29yazoKICAgIGh0dHBzOi8vcGF0Y2h3b3Jr
Lm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMzEwMjAxNjE5MDIuNDg4NzYt
MS1mcmFuY29pcy5wZXJyYWRAZ2Fkei5vcmcvCgpBbHNvLCBpdCBzb3VsZCBiZSBuaWNlIHRvIGV4
cGxhaW4gd2h5IHdlIGhhdmUgdG8gY2hhbmdlIHRvIGFub3RoZXIKImF1dGhvciIgYXMgdGhlIG9y
aWdpbi4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lz
IFBlcnJhZCA8ZnJhbmNvaXMucGVycmFkQGdhZHoub3JnPgo+IC0tLQo+ICBwYWNrYWdlL3Blcmwt
bmV0LXNzaDIvcGVybC1uZXQtc3NoMi5oYXNoIHwgOCArKysrLS0tLQo+ICBwYWNrYWdlL3Blcmwt
bmV0LXNzaDIvcGVybC1uZXQtc3NoMi5tayAgIHwgNCArKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3BlcmwtbmV0LXNzaDIvcGVybC1uZXQtc3NoMi5oYXNoIGIvcGFja2FnZS9wZXJsLW5ldC1zc2gy
L3BlcmwtbmV0LXNzaDIuaGFzaAo+IGluZGV4IGIyZThiMmQ0OC4uOTFiYmRjMmU4IDEwMDY0NAo+
IC0tLSBhL3BhY2thZ2UvcGVybC1uZXQtc3NoMi9wZXJsLW5ldC1zc2gyLmhhc2gKPiArKysgYi9w
YWNrYWdlL3BlcmwtbmV0LXNzaDIvcGVybC1uZXQtc3NoMi5oYXNoCj4gQEAgLTEsNiArMSw2IEBA
Cj4gLSMgcmV0cmlldmVkIGJ5IHNjYW5jcGFuIGZyb20gaHR0cDovL2NwYW4ubWV0YWNwYW4ub3Jn
Lwo+IC1tZDUgIDU3YWEwZjZlMmJlNDAyMGY3NTg4OGE3MTk1YWQ1Y2JhICBOZXQtU1NIMi0wLjcy
LnRhci5nego+IC1zaGEyNTYgIDg2N2Q4MzA3MGZhYzY0MzZiOWYwOTcxOTE4MjQzMDAyMDcyZmJm
OGQyNzI0YTg3YzI1NGIzNDI1MGRjZTAyMjIgIE5ldC1TU0gyLTAuNzIudGFyLmd6Cj4gKyMgcmV0
cmlldmVkIGJ5IHNjYW5jcGFuIGZyb20gaHR0cHM6Ly9jcGFuLm1ldGFjcGFuLm9yZy8KPiArbWQ1
ICAyMjI2MjVjOTFhZmZjY2ViNDNlODYxMDYzZDUyOTQzZiAgTmV0LVNTSDItMC43My50YXIuZ3oK
PiArc2hhMjU2ICBhNTFlNGMzMTY4ZmMzZDhhYjg5YTZiNjczYzgzNjMyMzMwM2U5NWIxOGRlMTk4
MTNlYzQ1Mjg4MTBlYzIzNzg1ICBOZXQtU1NIMi0wLjczLnRhci5nego+ICAKPiAgIyBjb21wdXRl
ZCBieSBzY2FuY3Bhbgo+IC1zaGEyNTYgIDI2OGFmYWVlN2FhODhhNDE5NTljOTNjZDkxODUzZTgx
MjRiZGJlNjRhNzQ0ODBkMzZmZjExMzBlMDFhMWMwY2EgIFJFQURNRS5wb2QKPiArc2hhMjU2ICBl
NTE3ZThkMzY5MGJiZWJmOTdmNzhjNWNlZDRmMGVjYjI2MTA2ZWVmMzgxNjg3ZGQ2ZmIzODc5YWE1
YTNmMDMxICBSRUFETUUucG9kCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGVybC1uZXQtc3NoMi9w
ZXJsLW5ldC1zc2gyLm1rIGIvcGFja2FnZS9wZXJsLW5ldC1zc2gyL3BlcmwtbmV0LXNzaDIubWsK
PiBpbmRleCAyMGU0NWI2MjguLjkxYzA4NDU4ZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3Blcmwt
bmV0LXNzaDIvcGVybC1uZXQtc3NoMi5tawo+ICsrKyBiL3BhY2thZ2UvcGVybC1uZXQtc3NoMi9w
ZXJsLW5ldC1zc2gyLm1rCj4gQEAgLTQsOSArNCw5IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKPiAgCj4gLVBFUkxfTkVUX1NTSDJfVkVSU0lPTiA9IDAuNzIKPiArUEVSTF9ORVRf
U1NIMl9WRVJTSU9OID0gMC43Mwo+ICBQRVJMX05FVF9TU0gyX1NPVVJDRSA9IE5ldC1TU0gyLSQo
UEVSTF9ORVRfU1NIMl9WRVJTSU9OKS50YXIuZ3oKPiAtUEVSTF9ORVRfU1NIMl9TSVRFID0gJChC
UjJfQ1BBTl9NSVJST1IpL2F1dGhvcnMvaWQvUy9TQS9TQUxWQQo+ICtQRVJMX05FVF9TU0gyX1NJ
VEUgPSAkKEJSMl9DUEFOX01JUlJPUikvYXV0aG9ycy9pZC9SL1JLL1JLSVRPVkVSCj4gIFBFUkxf
TkVUX1NTSDJfTElDRU5TRSA9IEFydGlzdGljIG9yIEdQTC0xLjArCj4gIFBFUkxfTkVUX1NTSDJf
TElDRU5TRV9GSUxFUyA9IFJFQURNRS5wb2QKPiAgUEVSTF9ORVRfU1NIMl9ERVBFTkRFTkNJRVMg
PSBsaWJzc2gyIHpsaWIKPiAtLSAKPiAyLjM5LjIKPiAKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4g
RS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNz
JyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwg
XCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3
IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlz
IG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwg
TUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
