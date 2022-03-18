Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25061C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 22:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1F1060D72;
	Fri, 18 Mar 2022 22:12:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nI3zCL001y3q; Fri, 18 Mar 2022 22:12:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF35A60C26;
	Fri, 18 Mar 2022 22:12:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 557BB1BF853
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44CBD41722
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:12:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7wYJa_Poysf3 for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 22:12:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F8454170A
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 22:12:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:20af:3c78:ddff:75e1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E641A13F846;
 Fri, 18 Mar 2022 23:12:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647641544;
 bh=1I4iez3amv5eMtu78jLXvQLSop5dj0/LhtJg/U6gu9Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kUDsiAGv4j5PG50YAG2kNGzaL+EGOd1M+0C0YQuup+ishbgTDNu+u+uQ76Zqw2uDl
 Emk2Oe8auScwzpf9k+fPztoI39dyVAmoWweOonJYFl5TNQWvj++bzI5C5oVai3cTlx
 s2klcPIdtQnWnrjQxhD3Mfwl/NfzxYfUshxTpchGMTHMqKADJ1HVG5xa2LfXmspvPu
 Qr7KQX9UNHAeKYpyCGZFDrZMrTqq07u4NKKhrCC19Rngwj6lBV0lR66OLYjX9cn+5G
 Cxr14Xsd1HFllXisRXHO91Lq4gsTLh4PM7SlaO/1+czpWsXRgxM5n5cMLAZG/9OTBV
 dwqy0gtZoxC0Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 18 Mar 2022 23:12:21 +0100
Date: Fri, 18 Mar 2022 23:12:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220318221221.GP283544@scaer>
References: <20220318193310.752282-1-fontaine.fabrice@gmail.com>
 <20220318215025.GN283544@scaer>
 <CAPi7W81HfkqmaLq4ZB7zqfq4p0Gcp411f1AkTeC42FcFVxEkZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W81HfkqmaLq4ZB7zqfq4p0Gcp411f1AkTeC42FcFVxEkZQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/wireplumber: fix introspection
 build
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmFicmljZSwgQWxsLAoKT24gMjAyMi0wMy0xOCAyMjo1OCArMDEwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gTGUgdmVuLiAxOCBtYXJzIDIwMjIgw6AgMjI6NTAsIFlhbm4gRS4g
TU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiBhIMOpY3JpdCA6Cj4gPiBPbiAyMDIyLTAz
LTE4IDIwOjMzICswMTAwLCBGYWJyaWNlIEZvbnRhaW5lIHNwYWtlIHRodXNseToKPiA+ID4gaW50
cm9zcGVjdGlvbiBuZWVkcyBob3N0LWRveHlnZW4gYW5kIGhvc3QtcHl0aG9uLWx4bWwgc2luY2Ug
dGhlIGFkZGl0aW9uCj4gPiA+IG9mIHRoZSBwYWNrYWdlIGluIGNvbW1pdCBjOWEzYzEwNDE3YWFk
Y2U5ZWU0OTIyZTMwMjM1Nzc2NDA5Y2U4ZWIzIGFuZAo+ID4gPiBodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvcGlwZXdpcmUvd2lyZXBsdW1iZXIvLS9jb21taXQvMmU1YjEzZjk3MGZlM2Rk
MjhhNGNlNzU4NjhkNDY0MDMwMzRjNjgyMgo+ID4KPiA+IEFzIHBlciB0aGF0IGRpZmYsIGl0IHNl
ZW1zIGRveHlnZW4gaXMgb25seSBuZWVkZWQgd2hlbiBhY3R1YWxseSBidWlsZGluZwo+ID4gdGhl
IGRvY3VtZW50YXRpb246Cj4gPgo+ID4gICAgIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9waXBld2lyZS93aXJlcGx1bWJlci8tL2NvbW1pdC8yZTViMTNmOTcwZmUzZGQyOGE0Y2U3NTg2
OGQ0NjQwMzAzNGM2ODIyIzBjYzExMzllMzM0N2Y1NzNhZTFmZWVlNWI3M2RiYzhhOGEyMWZjZmEK
PiBBcyB3cml0dGVuIGluIHRoZSBjb21taXQgdGl0bGUsIHdpcmVwbHVtYmVyICJidWlsZCBnb2Jq
ZWN0Cj4gaW50cm9zcGVjdGlvbiBmcm9tIHhtbCBmaWxlcyBnZW5lcmF0ZWQgYnkgRG94eWdlbiIK
ClllcywgYnV0IHN0aWxsLCBieSBpdHNlbGYsIGl0IGRvZXMgbm90IG1ha2Ugc2Vuc2UgdG8gZG8g
dGhhdCBpZgpkb2N1bWVudGF0aW9uIGlzIG5vdCBidWlsdC4KCkkuZS46IG5vIGRvYyA9PiBubyBm
aWxlcyBnZW5lcmF0ZWQgYnkgZG94eWdlbiA9PiBubyBpbnRyb3NwZWN0aW9uIG9uCnRob3NlIGZp
bGVzLgoKKGJ1dCBzZWUgYmVsb3cpLgoKPiA+ICAgICBkb3h5Z2VuX3AgPSBmaW5kX3Byb2dyYW0o
J2RveHlnZW4nLCByZXF1aXJlZDogZ2V0X29wdGlvbignZG9jJykpCj4gCj4gSW5kZWVkLCB0aGlz
IGlzIHdoYXQgaXMgZG9uZSBpbiB0aGlzIGNvbW1pdC4KPiBCdXQgdGhlIG5leHQgb25lIChpLmUu
Cj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3BpcGV3aXJlL3dpcmVwbHVtYmVyLy0v
Y29tbWl0LzkzYzJlN2Q2ODZiYTY3ODk5MTE4NWU3MTE1MzNjZTI5ODI2YjUzNzQpCj4gYWRkcyB0
aGUgZm9sbG93aW5nOgo+IAo+IGlmIGdldF9vcHRpb24oJ2RvYycpLmVuYWJsZWQoKSBvciBnZXRf
b3B0aW9uKCdpbnRyb3NwZWN0aW9uJykuZW5hYmxlZCgpCj4gICBkb3h5Z2VuX3AgPSBmaW5kX3By
b2dyYW0oJ2RveHlnZW4nLCB2ZXJzaW9uOiAnPj0gMS45LjAnLCByZXF1aXJlZDogdHJ1ZSkKPiBl
bGlmIGdldF9vcHRpb24oJ2RvYycpLmF1dG8oKSBvciBnZXRfb3B0aW9uKCdpbnRyb3NwZWN0aW9u
JykuYXV0bygpCj4gICBkb3h5Z2VuX3AgPSBmaW5kX3Byb2dyYW0oJ2RveHlnZW4nLCB2ZXJzaW9u
OiAnPj0gMS45LjAnLCByZXF1aXJlZDogZmFsc2UpCj4gZWxzZQo+ICAgZG94eWdlbl9wID0gZGlz
YWJsZXIoKQoKVGhhdCBjb21taXl0IHNob3VsZCBoYXZlIGFsc28gYmVlbiBtZW50aW9uZWQsIG9y
IGF0IGxlYXN0IHRoZQpmb2xsb3dpbmcuLi4KCj4gPiBCdXQgd2UgYXJlIGFscmVkeSBwYXNzaW5n
IC1EZG9jPWRpc2FibGVkLCBzbyB3aHkgaXMgaXQgc3RpbGwgdHJ5aW5nIHRvCj4gPiBidWlsZCB0
aGUgZG9jdW1lbnRhdGlvbj8KPiBJdCdzIG5vdCBidWlsZGluZyB0aGUgImZ1bGwiIGRvY3VtZW50
YXRpb24gKHdoaWNoIGRlcGVuZHMgb24gc3BoaW54LAo+IGV0Yy4pLCBvbmx5IHRoZSBmaWxlIHRo
YXQgaXMgbmVlZGVkIGZvciBnb2JqZWN0LWludHJvc3BlY3Rpb24uCgouLi4gaGVyZSBzaGpvdWxk
IGhhdmUgYmVlbiBtZW50aW9uZWQuCgpBcHBsaWVkIHRvIG1hc3RlciB3aXRoIHRob3NlIGV4cGxh
bmF0aW9ucyBhZGRlZCwgdGhhbmtzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRl
ZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2
IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAg
ICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBB
R0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1n
ZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAg
fAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
