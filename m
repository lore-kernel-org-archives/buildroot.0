Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEF2C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 22:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FC3B8486A;
	Fri, 18 Mar 2022 22:33:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FJDSDIP3vrOJ; Fri, 18 Mar 2022 22:33:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0FD3847B9;
	Fri, 18 Mar 2022 22:33:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4EC3B1BF853
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E339408FB
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:33:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fi1LdxAu2fT8 for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 22:33:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B2D1408D1
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 22:33:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:20af:3c78:ddff:75e1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CA3E113F80A;
 Fri, 18 Mar 2022 23:33:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647642800;
 bh=Ji2YIyzl/YwStYtPK5l5gBojUg2EOqNY207MxP08jqQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G36MQ7Qwf1/H/ZQ07p3ur2DRaqRBez8AYu1MEu2tfz0MUyDYIs7O5uTl8nLUkUYxT
 dQcxedlU0clleQ56el+4v2e3gEoCoIwS2oTN4BZvxhW0kQSGs7oy4vRAS/2mxVJZB6
 92x/FwxJA+CVzjpZ0Wyxpg7FcCaORnOCIXNT1JmCIZohaynqTjFsbgL5tqqoMwOSQ5
 MRrpo5ZyCCApJa7Jydmlty8loSOj4ZuDWmVY6lbNZuy0Rkh3TnNU9inWF8Rf1JtUsZ
 Hke5+xB3YPrNzYIFbWKwnLqLBiL8gHLu7ygwotfE17oyo7YV9esURGVwJ1YvQ32raI
 w2JWyDu9jk7iw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 18 Mar 2022 23:33:15 +0100
Date: Fri, 18 Mar 2022 23:33:15 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Message-ID: <20220318223315.GU283544@scaer>
References: <20220318132427.48737-1-clement.leger@bootlin.com>
 <20220318132427.48737-2-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318132427.48737-2-clement.leger@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v5 1/8] package/pkg-generic: host variant
 inherits target download settings
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2zDqW1lbnQsIEFsbCwKCk9uIDIwMjItMDMtMTggMTQ6MjQgKzAxMDAsIENsw6ltZW50IEzDqWdl
ciBzcGFrZSB0aHVzbHk6Cj4gRnJvbTogIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluLjE5OThA
ZnJlZS5mcj4KPiAKPiBJdCBzZWVtcyByZWFzb25hYmxlIHRvIGV4cGVjdCB0aGF0IHRoZSBkb3du
bG9hZCBvZiB0aGUgaG9zdCBhbmQgdGFyZ2V0Cj4gdmFyaWFudHMgc2hvdWxkIHVzdWFsbHkgYmUg
ZXhhY3RseSB0aGUgc2FtZSBhbmQgdGh1cyByZXVzZSB0aGUgdGFyZ2V0Cj4gcGFja2FnZSB2YWx1
ZXMgZm9yIHRoZSBob3N0IHBhY2thZ2UuIFRoaXMgY29tbWl0cyBhZGQgc3VwcG9ydCB0bwo+IGlu
aGVyaXQgaG9zdCBfRExfU1VCRElSLCBfRE9XTkxPQURfREVQRU5ERU5DSUVTLCBfRExfRU5WIGFu
ZAo+IF9ET3dOTE9BRF9QT1NUX1BST0NFU1MgdmFyaWFibGVzIGZyb20gdGFyZ2V0IG9uZXMuIFRo
ZXNlIHZhcmlhYmxlcyBjYW4KPiBzdGlsbCBiZSBvdmVycmlkZW4gaWYgbmVjZXNzYXJ5IGZvciB0
aGUgaG9zdCBwYWNrYWdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4u
bW9yaW4uMTk5OEBmcmVlLmZyPgo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xl
bWVudC5sZWdlckBib290bGluLmNvbT4KCkFzIFRob21hcyBhbHNvIGhpbnRlZCBoZSBhZ3JlZWQg
b24gdGhlIHByaW5jaXBsZTogYXBwbGllZCB0byBtYXN0ZXIsCnRoYW5rcy4KClJlZ2FyZHMsCllh
bm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL3BrZy1nZW5lcmljLm1rIHwgMjQgKysrKysr
KysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGtnLWdlbmVyaWMubWsgYi9wYWNrYWdlL3BrZy1nZW5l
cmljLm1rCj4gaW5kZXggYjNhN2UxZDYwZS4uNzlmY2Y2MDNkMyAxMDA2NDQKPiAtLS0gYS9wYWNr
YWdlL3BrZy1nZW5lcmljLm1rCj4gKysrIGIvcGFja2FnZS9wa2ctZ2VuZXJpYy5tawo+IEBAIC01
NDAsNiArNTQwLDMwIEBAIGlmbmRlZiAkKDIpX1NVQkRJUgo+ICAgZW5kaWYKPiAgZW5kaWYKPiAg
Cj4gK2lmbmRlZiAkKDIpX0RMX1NVQkRJUgo+ICsgaWZkZWYgJCgzKV9ETF9TVUJESVIKPiArICAk
KDIpX0RMX1NVQkRJUiA9ICQkKCQoMylfRExfU1VCRElSKQo+ICsgZW5kaWYKPiArZW5kaWYKPiAr
Cj4gK2lmbmRlZiAkKDIpX0RPV05MT0FEX0RFUEVOREVOQ0lFUwo+ICsgaWZkZWYgJCgzKV9ET1dO
TE9BRF9ERVBFTkRFTkNJRVMKPiArICAkKDIpX0RPV05MT0FEX0RFUEVOREVOQ0lFUyA9ICQkKGZp
bHRlci1vdXQgJCgxKSwkJCgkKDMpX0RPV05MT0FEX0RFUEVOREVOQ0lFUykpCj4gKyBlbmRpZgo+
ICtlbmRpZgo+ICsKPiAraWZuZGVmICQoMilfRExfRU5WCj4gKyBpZmRlZiAkKDMpX0RMX0VOVgo+
ICsgICQoMilfRExfRU5WID0gJCQoJCgzKV9ETF9FTlYpCj4gKyBlbmRpZgo+ICtlbmRpZgo+ICsK
PiAraWZuZGVmICQoMilfRE9XTkxPQURfUE9TVF9QUk9DRVNTCj4gKyBpZmRlZiAkKDMpX0RPV05M
T0FEX1BPU1RfUFJPQ0VTUwo+ICsgICQoMilfRE9XTkxPQURfUE9TVF9QUk9DRVNTID0gJCQoJCgz
KV9ET1dOTE9BRF9QT1NUX1BST0NFU1MpCj4gKyBlbmRpZgo+ICtlbmRpZgo+ICsKPiAgaWZuZGVm
ICQoMilfU1RSSVBfQ09NUE9ORU5UUwo+ICAgaWZkZWYgJCgzKV9TVFJJUF9DT01QT05FTlRTCj4g
ICAgJCgyKV9TVFJJUF9DT01QT05FTlRTID0gJCQoJCgzKV9TVFJJUF9DT01QT05FTlRTKQo+IC0t
IAo+IDIuMzQuMQo+IAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9S
SU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25z
cGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENB
TVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0t
LS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8
CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAg
ICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1e
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
