Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9637C433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 11:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B3C040148;
	Wed,  2 Feb 2022 11:32:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vdh3XBVTn3Kl; Wed,  2 Feb 2022 11:32:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDAFE40329;
	Wed,  2 Feb 2022 11:32:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED4791BF27C
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 11:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6F1D82EA1
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 11:32:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dv6BwBESwe09 for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 11:32:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3FB3818C4
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 11:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t+boNXZTDV5/G9a4tDigFHQ5R9rO+wpSuGBrSR7/ZYk=; b=pu+KGylafL9+L9PEImM114Q19n
 mdSwlVnV1FGY4dJJTppJBwuhaKSN6ct5uBjpGJzQDgA6OHO66FP+LeYi6Vj/qoYveU+dwFqaf1qwY
 Rh9KY9mDoR0+IcZA5IlPngVv1+Bofb9Lht0I8TcqMGnqj5tuQMgs2ZqD0dBi1CzXCCubYQ8ZyPe+C
 rrsr6FiVJjwhwzXtynYgHpWy1MQC8y3Lcrd7ZkLq3kX1s8cvFI4hWge6vkhF9n4S9ZKiw+7Awa8dO
 1128PL7xec9+vyCUmnGK/eFUEgEgblnRjtL0vh9GiJ3yMkT8a2h1rsVfGSDVX0vDHzduIU8R53Lyw
 8/VS+5UA==;
Received: from 91-152-140-238.elisa-laajakaista.fi ([91.152.140.238]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nFDsP-0006WY-8A; Wed, 02 Feb 2022 12:32:41 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id f201b9eb;
 Wed, 2 Feb 2022 11:32:26 +0000 (UTC)
Date: Wed, 2 Feb 2022 13:32:22 +0200
Message-ID: <20220202133222.GB1296849@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas.devoogdt@gmail.com>
In-Reply-To: <20220202112528.7778-1-thomas.devoogdt@barco.com>
References: <20220202112528.7778-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] pacakge/glib-networking: bump to version
 2.70.0
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
Cc: Thomas Devoogdt <thomas.devoogdt@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6260930838857986573=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6260930838857986573==
Content-Type: multipart/signed; boundary="5BZm0/j3HSJ/Lnr7"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--5BZm0/j3HSJ/Lnr7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gV2VkLCAwMiBGZWIgMjAyMiAxMjoyNToyOCArMDEwMCBUaG9tYXMgRGV2b29nZHQgPHRob21h
cy5kZXZvb2dkdEBnbWFpbC5jb20+IHdyb3RlOgo+IEZyb206IFRob21hcyBEZXZvb2dkdCA8dGhv
bWFzLmRldm9vZ2R0QGdtYWlsLmNvbT4KPiAKPiBQS0NTIzExIGlzIHJlcXVpcmVkIGlmIGdudXRs
cyBpcyB1c2VkOgo+IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9nbGliLW5ldHdvcmtp
bmcvLS9jb21taXQvOWIzZDMwZTQwZjMwNmYwZTM2ZTJhMzk2ZDNiNmRmMWVkZWVhOWYyMQo+IAo+
IE9sZGVyIGNvbXBpbGVycyByZXF1aXJlIGNfc3RkPWdudTk5Ogo+IGh0dHBzOi8vZ2l0bGFiLmdu
b21lLm9yZy9HTk9NRS9nbGliLW5ldHdvcmtpbmcvLS9jb21taXQvYjE5MjA4NmI5OTM2NjAyYTQw
YTE0ZDAwYTY4ODNiMzM5YjlkNzk1NQo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBEZXZvb2dk
dCA8dGhvbWFzLmRldm9vZ2R0QGdtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBBZHJpYW4gUGVyZXog
ZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4KCj4gLS0tCj4gIC4uLi8wMDAxLW1lc29uLWNo
YW5nZS1zdGQtdG8tZ251OTkucGF0Y2ggICAgICB8IDMwICsrKysrKysrKysrKysrKysrKysKPiAg
cGFja2FnZS9nbGliLW5ldHdvcmtpbmcvQ29uZmlnLmluICAgICAgICAgICAgIHwgIDEgKwo+ICBw
YWNrYWdlL2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmcuaGFzaCAgfCAgNCArLS0KPiAg
cGFja2FnZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nLm1rICAgIHwgIDIgKy0KPiAg
NCBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9nbGliLW5ldHdvcmtpbmcvMDAwMS1tZXNvbi1jaGFuZ2Ut
c3RkLXRvLWdudTk5LnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ2xpYi1uZXR3b3Jr
aW5nLzAwMDEtbWVzb24tY2hhbmdlLXN0ZC10by1nbnU5OS5wYXRjaCBiL3BhY2thZ2UvZ2xpYi1u
ZXR3b3JraW5nLzAwMDEtbWVzb24tY2hhbmdlLXN0ZC10by1nbnU5OS5wYXRjaAo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uOWYyNjZiYzJjOAo+IC0tLSAvZGV2L251
bGwKPiArKysgYi9wYWNrYWdlL2dsaWItbmV0d29ya2luZy8wMDAxLW1lc29uLWNoYW5nZS1zdGQt
dG8tZ251OTkucGF0Y2gKPiBAQCAtMCwwICsxLDMwIEBACj4gK0Zyb20gY2RmYTcyNmJhZTFkODJi
N2JkMzczNTQ3NWZjMmIyYzZhMzFjMWQyZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJv
bTogSWduYWNpbyBDYXNhbCBRdWludGVpcm8gPHFpZ25hY2lvQGFtYXpvbi5jb20+Cj4gK0RhdGU6
IEZyaSwgMTIgTm92IDIwMjEgMTE6NTE6MzMgKzAxMDAKPiArU3ViamVjdDogW1BBVENIXSBtZXNv
bjogY2hhbmdlIHN0ZCB0byBnbnU5OQo+ICsKPiArVGhpcyBpcyB0aGUgc2FtZSBhcyBnbGliIGFu
ZCBzaG91bGQgZml4IGlzc3VlcyB3aXRoIG9sZAo+ICtjb21waWxlcnMKPiArCj4gKyhjaGVycnkg
cGlja2VkIGZyb20gY29tbWl0IGIxOTIwODZiOTkzNjYwMmE0MGExNGQwMGE2ODgzYjMzOWI5ZDc5
NTUpCj4gK1NpZ25lZC1vZmYtYnk6IFRob21hcyBEZXZvb2dkdCA8dGhvbWFzLmRldm9vZ2R0QGJh
cmNvLmNvbT4KPiArLS0tCj4gKyBtZXNvbi5idWlsZCB8IDIgKy0KPiArIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ICsKPiArZGlmZiAtLWdpdCBhL21lc29u
LmJ1aWxkIGIvbWVzb24uYnVpbGQKPiAraW5kZXggYjAxOGNhN2IuLjEzMGEyYmYwIDEwMDY0NAo+
ICstLS0gYS9tZXNvbi5idWlsZAo+ICsrKysgYi9tZXNvbi5idWlsZAo+ICtAQCAtMyw3ICszLDcg
QEAgcHJvamVjdCgKPiArICAgdmVyc2lvbjogJzIuNzAuMCcsCj4gKyAgIGxpY2Vuc2U6ICdMR1BM
Mi4xKycsCj4gKyAgIG1lc29uX3ZlcnNpb246ICc+PSAwLjUwLjAnLAo+ICstICBkZWZhdWx0X29w
dGlvbnM6IFsnY19zdGQ9Yzk5J10KPiArKyAgZGVmYXVsdF9vcHRpb25zOiBbJ2Nfc3RkPWdudTk5
J10KPiArICkKPiArIAo+ICsgcHJlZml4ID0gZ2V0X29wdGlvbigncHJlZml4JykKPiArLS0gCj4g
KzIuMTcuMQo+ICsKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nbGliLW5ldHdvcmtpbmcvQ29uZmln
LmluIGIvcGFja2FnZS9nbGliLW5ldHdvcmtpbmcvQ29uZmlnLmluCj4gaW5kZXggMjIzMzEyNTVm
Ny4uMzhjZGVkNWU2YiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2dsaWItbmV0d29ya2luZy9Db25m
aWcuaW4KPiArKysgYi9wYWNrYWdlL2dsaWItbmV0d29ya2luZy9Db25maWcuaW4KPiBAQCAtNiw2
ICs2LDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0dMSUJfTkVUV09SS0lORwo+ICAJZGVwZW5kcyBv
biAhQlIyX1NUQVRJQ19MSUJTCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCR0xJQjIKPiAgCXNl
bGVjdCBCUjJfUEFDS0FHRV9PUEVOU1NMIGlmICFCUjJfUEFDS0FHRV9HTlVUTFMKPiArCXNlbGVj
dCBCUjJfUEFDS0FHRV9QMTFfS0lUIGlmIEJSMl9QQUNLQUdFX0dOVVRMUwo+ICAJaGVscAo+ICAJ
ICBOZXR3b3JrLXJlbGF0ZWQgR0lPIG1vZHVsZXMgZm9yIGdsaWIuCj4gIAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmcuaGFzaCBiL3BhY2thZ2Uv
Z2xpYi1uZXR3b3JraW5nL2dsaWItbmV0d29ya2luZy5oYXNoCj4gaW5kZXggOTc2YTE5ZjI1ZS4u
NmE1M2I0MzZiMCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2dsaWItbmV0d29ya2luZy9nbGliLW5l
dHdvcmtpbmcuaGFzaAo+ICsrKyBiL3BhY2thZ2UvZ2xpYi1uZXR3b3JraW5nL2dsaWItbmV0d29y
a2luZy5oYXNoCj4gQEAgLTEsMyArMSwzIEBACj4gLSMgRnJvbSBodHRwOi8vZnRwLmdub21lLm9y
Zy9wdWIvZ25vbWUvc291cmNlcy9nbGliLW5ldHdvcmtpbmcvMi42Ni9nbGliLW5ldHdvcmtpbmct
Mi42Ni4wLnNoYTI1NnN1bQo+IC1zaGEyNTYgIGM1ZDdiZTI0MzdmZGQxOTZlZWJmYjcwYzQ1MTdi
OTZkM2JhN2VjMTNiZDQ5NjMxOGI4ZjAyZGVhMzgzZTAwOTkgIGdsaWItbmV0d29ya2luZy0yLjY2
LjAudGFyLnh6Cj4gKyMgRnJvbSBodHRwOi8vZnRwLmdub21lLm9yZy9wdWIvZ25vbWUvc291cmNl
cy9nbGliLW5ldHdvcmtpbmcvMi43MC9nbGliLW5ldHdvcmtpbmctMi43MC4wLnNoYTI1NnN1bQo+
ICtzaGEyNTYgIDY2YjQwOGU3YWZhODZjNTgyZmUzODk2M2RiNTYxMzM4NjlhYjRiNTdkMzRlNDhl
YzU2YWJhNjIxOTQwZDZmMzUgIGdsaWItbmV0d29ya2luZy0yLjcwLjAudGFyLnh6Cj4gIHNoYTI1
NiAgZGM2MjY1MjBkY2Q1M2EyMmY3MjdhZjNlZTQyYzc3MGU1NmM5N2E2NGZlM2FkYjA2Mzc5OWQ4
YWIwMzJmZTU1MSAgQ09QWUlORwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dsaWItbmV0d29ya2lu
Zy9nbGliLW5ldHdvcmtpbmcubWsgYi9wYWNrYWdlL2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdv
cmtpbmcubWsKPiBpbmRleCA2NTYzMGM3ZmVkLi41MzI4MDcwMGJjIDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvZ2xpYi1uZXR3b3JraW5nL2dsaWItbmV0d29ya2luZy5tawo+ICsrKyBiL3BhY2thZ2Uv
Z2xpYi1uZXR3b3JraW5nL2dsaWItbmV0d29ya2luZy5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAj
Cj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1HTElCX05FVFdPUktJTkdfVkVSU0lP
Tl9NQUpPUiA9IDIuNjYKPiArR0xJQl9ORVRXT1JLSU5HX1ZFUlNJT05fTUFKT1IgPSAyLjcwCj4g
IEdMSUJfTkVUV09SS0lOR19WRVJTSU9OID0gJChHTElCX05FVFdPUktJTkdfVkVSU0lPTl9NQUpP
UikuMAo+ICBHTElCX05FVFdPUktJTkdfU0lURSA9IGh0dHA6Ly9mdHAuZ25vbWUub3JnL3B1Yi9n
bm9tZS9zb3VyY2VzL2dsaWItbmV0d29ya2luZy8kKEdMSUJfTkVUV09SS0lOR19WRVJTSU9OX01B
Sk9SKQo+ICBHTElCX05FVFdPUktJTkdfU09VUkNFID0gZ2xpYi1uZXR3b3JraW5nLSQoR0xJQl9O
RVRXT1JLSU5HX1ZFUlNJT04pLnRhci54ego+IC0tIAo+IDIuMTcuMQo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpDaGVlcnMsCuKAlEFkcmnDoW4K

--5BZm0/j3HSJ/Lnr7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYfprxgAKCRCRxVnb5MkS
O23eAJsGiGbEXe7K9s9GVIoOlUZ9m4FuZwCdGCIoatVYb72LTKWd1Ylh7PcSZQY=
=f2Oh
-----END PGP SIGNATURE-----

--5BZm0/j3HSJ/Lnr7--

--===============6260930838857986573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6260930838857986573==--
