Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9937C433EF
	for <buildroot@archiver.kernel.org>; Sat, 19 Mar 2022 09:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B9DF400A6;
	Sat, 19 Mar 2022 09:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UYqQJLWvOwz5; Sat, 19 Mar 2022 09:47:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E665400D6;
	Sat, 19 Mar 2022 09:47:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 293F01BF842
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 09:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16025400D6
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 09:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l80gT520dGQx for <buildroot@lists.busybox.net>;
 Sat, 19 Mar 2022 09:46:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A38D6400A6
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 09:46:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:20af:3c78:ddff:75e1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 68CF413F8AA;
 Sat, 19 Mar 2022 10:46:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647683215;
 bh=5wV4BDmtujVthwqSjnTqqmFShg8kHkaRYHB7aRVq8tI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aRNO5wGF4M8bsIQRvpbZqyPuHBc6aLSdRm7XbV11ACTYRENv3Fm107uddgDcccZrZ
 76WYmL04P9yGAL/WuOvzykfGw4bG4RYU8gQP6QNA6okJlTn7B+GVgZyEZaK5ZchbmH
 uXl7C8SAX8Maaak8CRq+xFgIhQ4Ay7+D4yf2C211X4/rfug4VyBUkIfSXq7E6zn3WZ
 az/QxdTrqR05xjAGZ79HznHTIvUudVv+NwZLucsCPwpNID6Fmm1xc93TvfFSe3sq9e
 2uJmpzgyP4Hbz83Z4+CF87s2xz7VukjVvypcs6KlIrtU/WbJFkoKAFSyzUn8J77AYJ
 1YJRj8ncKpehg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 19 Mar 2022 10:46:51 +0100
Date: Sat, 19 Mar 2022 10:46:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220319094651.GA1566358@scaer>
References: <20220318132427.48737-1-clement.leger@bootlin.com>
 <20220318132427.48737-4-clement.leger@bootlin.com>
 <20220318223221.GS283544@scaer> <20220319101749.265ebceb@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220319101749.265ebceb@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v5 3/8] boot/optee-os: add support to build
 with python-cryptography
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
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLCBBbGwsCgpPbiAyMDIyLTAzLTE5IDEwOjE3ICswMTAwLCBUaG9tYXMgUGV0YXp6b25p
IHNwYWtlIHRodXNseToKPiBPbiBGcmksIDE4IE1hciAyMDIyIDIzOjMyOjIxICswMTAwCj4gIllh
bm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4gCj4gPiA+IGRp
ZmYgLS1naXQgYS9ib290L29wdGVlLW9zL0NvbmZpZy5pbiBiL2Jvb3Qvb3B0ZWUtb3MvQ29uZmln
LmluCj4gPiA+IGluZGV4IGVhMTY1NTBiNzIuLjAyYjVkN2M4NmYgMTAwNjQ0Cj4gPiA+IC0tLSBh
L2Jvb3Qvb3B0ZWUtb3MvQ29uZmlnLmluCj4gPiA+ICsrKyBiL2Jvb3Qvb3B0ZWUtb3MvQ29uZmln
LmluCj4gPiA+IEBAIC0xLDYgKzEsNyBAQAo+ID4gPiAgY29uZmlnIEJSMl9UQVJHRVRfT1BURUVf
T1MKPiA+ID4gIAlib29sICJvcHRlZV9vcyIKPiA+ID4gIAlkZXBlbmRzIG9uIEJSMl9BUk1fQ1BV
X0FSTVY4QSB8fCBCUjJfQVJNX0NQVV9BUk1WN0EKPiA+ID4gKwlkZXBlbmRzIG9uIEJSMl9QQUNL
QUdFX0hPU1RfUlVTVENfQVJDSF9TVVBQT1JUUyAgCj4gPiAKPiA+IFRoYXQncyB3cm9uZzogMy4x
NS4wIHN0aWxsIGRvZXMgbm90IG5lZWQgaG9zdC1weXRob24tY3J5cHRvZ3JhcGh5Lgo+ID4gCj4g
PiBGdXJ0aGVybW9yZSwgZXZlbiBhZnRlciB3ZSBidW1wIHRvIDMuMTYuMCwgc2luY2Ugd2UgY2Fu
IGNob29zZSBhbgo+ID4gYXJiaXRyYXJ5IGdpdCB0cmVlIGF0IGFuIGFyYml0cmFyeSBjb21taXQs
IGl0IGlzIHN0aWxsIHBvc3NpYmxlIHRvCj4gPiBwb2ludCB0byBhIHZlcnNpb24gb2Ygb3B0ZWUt
b3MgdGhhdCBkb2VzIG5vdCByZXF1aXJlIGl0IGVpdGhlci4KPiA+IAo+ID4gU28sIHRoYXQgZGVw
ZW5kZW5jeSBvbmx5IHJlYWxseSBiZWxvbmdzLi4uCj4gPiAKPiA+ID4gIAloZWxwCj4gPiA+ICAJ
ICBPUC1URUUgT1MgcHJvdmlkZXMgdGhlIHNlY3VyZSB3b3JsZCBib290IGltYWdlIGFuZCB0aGUg
dHJ1c3QKPiA+ID4gIAkgIGFwcGxpY2F0aW9uIGRldmVsb3BtZW50IGtpdCBvZiB0aGUgT1AtVEVF
IHByb2plY3QuIE9QLVRFRSBPUwo+ID4gPiBAQCAtNjEsNiArNjIsMTQgQEAgY29uZmlnIEJSMl9U
QVJHRVRfT1BURUVfT1NfTkVFRFNfRFRDCj4gPiA+ICAJICBTZWxlY3QgdGhpcyBvcHRpb24gaWYg
eW91ciBPUC1URUUgT1MgcGxhdGZvcm0gY29uZmlndXJhdGlvbgo+ID4gPiAgCSAgcmVxdWlyZXMg
dGhlIERldmljZSBUcmVlIGNvbXBpbGVyIHRvIGJlIGF2YWlsYWJsZS4KPiA+ID4gIAo+ID4gPiAr
Y29uZmlnIEJSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNfUFlUSE9OX0NSWVBUT0dSQVBIWQo+ID4g
PiArCWJvb2wgIk9QLVRFRSBPUyBuZWVkcyBob3N0LXB5dGhvbi1jcnlwdG9ncmFwaHkiICAKPiA+
IAo+ID4gLi4uIGhlcmUuCj4gCj4gWWVzIGFuZCBuby4gQmVjYXVzZSBhcyBzb29uIGFzIHRoZSBC
UjJfVEFSR0VUX09QVEVFX09TX0xBVEVTVCBnZXRzCj4gYnVtcGVkIHRvIDMuMTYuMCwgdGhlbiBv
dXIgZGVmYXVsdCBzZWxlY3Rpb24gZm9yIE9QLVRFRSAodW5sZXNzIHlvdQo+IGNob3NlIGEgY3Vz
dG9tIEdpdCB2ZXJzaW9uKSB3aWxsIHJlcXVpcmUgcHl0aG9uLWNyeXB0b2dyYXBoeS4gU28gdG8K
PiBrZWVwIHRoaW5ncyBzaW1wbGUsIEkgYXNrZWQgQ2zDqW1lbnQgdG8gYWRkIHRoaXMgZGVwZW5k
ZW5jeSB0byB0aGUKPiB3aG9sZSBwYWNrYWdlLgoKQnV0IHRoYXQncyB0aGUgcG9pbnQ6IHlvdSBj
YW4gc3RpbGwgY2hvb3NlIGEgY3VzdG9tIGdpdCB0cmVlIHRoYXQgcG9pbnRzCnRvIGFuIGVhcmxp
ZXIsIHByZS0zLjE2LjAgdHJlZSwgd2hpY2ggd2lsbCBzdGlsbCBiZSBidWlsZGFibGUgd2l0aG91
dApweXRoby1jcnlwdG9ncmFwaHkuCgpCdXQgeWVzLCB5b3UgZ290IGEgcG9pbnQ6IEkgZm9yZ290
IHRvIGd1YXJkIHRoZSBkZWZhdWx0IGNsYXVzZSBpbiB0aGUKY2hvaWNlLCB3aXRoIHRoZSBzYW1l
IGRlcGVuZGVuY3kuIEknbGwgc3VibWl0IGEgcGF0Y2guCgpSZWdhcmRzLApZYW5uIEUuIE1PUklO
LgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1U
aW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cnwg
KzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8
ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0t
LS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3lt
b3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNv
bnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0t
LS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
