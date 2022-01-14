Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF984C433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 09:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EFB7410C6;
	Fri, 14 Jan 2022 09:27:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eDtDw6lh2tuX; Fri, 14 Jan 2022 09:27:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAD0F408DF;
	Fri, 14 Jan 2022 09:27:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1DE371BF3DF
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 09:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B72F40A8E
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 09:27:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VnJmVsNeLVSc for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 09:26:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED60840364
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 09:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A1dk4H3cjJYsQESHYop1oLxTDWwmCyzd9dR+ArwAB6g=; b=o5y+9fiJ+gHWnRpzKEEC2KvxCe
 4LyZuYqzEvjFoF3ZfO70XgMrJP0xVAYklLvVU1eRH+/02/nOr58/13yaDxNh5eNh/8Sg1iWLCmVt3
 ql6EK6aYvTlZGeT3yJD9KbDPcxEI93Je8LnGR2oflGbqsMjnopiPerwA4yOC2e1ot1hVMge7q/O9I
 BDFiRMMH/DHQZGtebmdCUBGhb8edo5hTj3RA/ukTBO1rhe2PGLZITx0V9YqZfJe+z/eMcqjAAnGY2
 329DV4Pa8BOsM5naYeTkbzl3eIMbWSFKJRccttQCWosk4R4KVVNDk+N08CM2HyVtr5ImV8tbBkZy2
 n64SZ5dg==;
Received: from 91-152-140-238.elisa-laajakaista.fi ([91.152.140.238]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1n8IrI-0009EX-0u; Fri, 14 Jan 2022 10:26:56 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id fdc0ed45;
 Fri, 14 Jan 2022 09:26:39 +0000 (UTC)
Date: Fri, 14 Jan 2022 11:26:35 +0200
Message-ID: <20220114112635.GB546958@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <20220113174130.GI1477939@scaer>
References: <20220113115704.2354150-1-aperez@igalia.com>
 <20220113174130.GI1477939@scaer>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: add upstream patch to
 fix vapigen support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6463812834636819476=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6463812834636819476==
Content-Type: multipart/signed; boundary="0wlqju6I1xpF1iN0"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--0wlqju6I1xpF1iN0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gWWFubiwKCk9uIFRodSwgMTMgSmFuIDIwMjIgMTg6NDE6MzAgKzAxMDAgIllhbm4gRS4g
TU9SSU4iIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cgo+IE9uIDIwMjItMDEtMTMg
MTM6NTcgKzAyMDAsIEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gc3Bha2UgdGh1c2x5Ogo+ID4gSW1w
b3J0IGFuIHVwc3RyZWFtIHBhdGNoIHdoaWNoIGZpeGVzIGEgdHlwbyBpbiB0aGUgTWVzb24gc291
cmNlIGNvZGUKPiA+IHdoaWNoIGNhdXNlZCBhIHdyb25nIGNvbW1hbmQgbGluZSBvcHRpb24gdG8g
YmUgcGFzc2VkIHRvIHRoZSB2YXBpZ2VuCj4gPiBwcm9ncmFtLiBUaGlzIGZpeGVzIHRoZSBidWls
ZCBmb3IgYWxsIHBhY2thZ2VzIHdoaWNoIHVzZSBNZXNvbiBhbmQKPiA+IHByb3ZpZGUgQVBJIGJp
bmRpbmdzIGdlbmVyYXRlZCB1c2luZyBzYWlkIHRvb2wuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6
IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPgo+ID4gLS0tCj4gPiAg
Li4ueC10eXBvLWluLXZhcGlnZW4tb3B0aW9uLW1ldGFkYXRhZGlyLnBhdGNoIHwgMzEgKysrKysr
KysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCj4gPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbWVzb24vMDAwMy1nbm9tZS1maXgtdHlwby1pbi12
YXBpZ2VuLW9wdGlvbi1tZXRhZGF0YWRpci5wYXRjaAo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9tZXNvbi8wMDAzLWdub21lLWZpeC10eXBvLWluLXZhcGlnZW4tb3B0aW9uLW1ldGFkYXRh
ZGlyLnBhdGNoIGIvcGFja2FnZS9tZXNvbi8wMDAzLWdub21lLWZpeC10eXBvLWluLXZhcGlnZW4t
b3B0aW9uLW1ldGFkYXRhZGlyLnBhdGNoCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5k
ZXggMDAwMDAwMDAwMC4uZjhjYzMwZWMyOQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvcGFj
a2FnZS9tZXNvbi8wMDAzLWdub21lLWZpeC10eXBvLWluLXZhcGlnZW4tb3B0aW9uLW1ldGFkYXRh
ZGlyLnBhdGNoCj4gPiBAQCAtMCwwICsxLDMxIEBACj4gPiArRnJvbSA1Mzg1ZTRjMGE0ZGQ0Zjlj
ZjFlMTVjOWMzMjFiMjJkMTljYzAwMTFhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ID4gK0Zy
b206IE1pY2hhbCBWYXNpbGVrIDxtaWNoYWwudmFzaWxla0BuaWMuY3o+Cj4gPiArRGF0ZTogTW9u
LCAxMCBKYW4gMjAyMiAyMToyNzozMCArMDEwMAo+ID4gK1N1YmplY3Q6IFtQQVRDSF0gZ25vbWU6
IGZpeCB0eXBvIGluIHZhcGlnZW4gb3B0aW9uIG1ldGFkYXRhZGlyCj4gPiArCj4gPiArVGhpcyB0
eXBvIHdhcyBpbnRyb2R1Y2VkIGluIDllZjM2ZmE4MGJmNDQ4M2JjZDgzN2VhMzk4NWE1MWFiNTMz
Yzc5NzIgYW5kCj4gPiArY2FuIGNhdXNlIGEgYnVpbGQgZmFpbHVyZSwgYmVjYXVzZSAtLW1ldGFk
YXRkaXIgaXMgbm90IGEgdmFsaWQgdmFwaWdlbgo+ID4gK29wdGlvbi4KPiA+ICsKPiA+ICtTaWdu
ZWQtb2ZmLWJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4KPiA+
ICtVcHN0cmVhbS1TdGF0dXM6IGh0dHBzOi8vZ2l0aHViLmNvbS9tZXNvbmJ1aWxkL21lc29uL3B1
bGwvOTgwNgo+IAo+IFdoZW4gYW4gdXBzdHJlYW0gUFIvTVIgaGFzIGJlZW4gbWVyZ2VkLCB3ZSBw
cmVmZXIgdGhhdCBhbiBhY3R1YWwKPiBiYWNrcG9ydCBpcyBtYWRlLCBzbyB0aGF0IHRoZSBwYXRj
aCBoYXMgdGhlIHByb3BlciB1cHN0cmVhbSBoYXNoLAo+IHdoaWNoIGhlbHBzIGluIHRoZSBmdXR1
cmUgYXNlcyBpZiBhIHZlcnNpb24gYnVtcCBpbmNsdWRlcyB0aGF0Cj4gY29tbWl0Lgo+IAo+IFNv
IEkndmUgbWFkZSB0aGF0IGEgcHJvcGVyIGJhY2twb3J0Ogo+IAo+ICAgICAkIGdpdCBmb3JtYXQt
cGF0Y2ggLW4xIC0tc3RhcnQtbnVtYmVyPTMgLS1uby1udW1iZXJlZCA5OTUyNDQ2YTIKCk5lYXQg
R2l0IGNvbW1hbmQsIHRvZGF5IEkgaGF2ZSBsZWFybnQgYWJvdXQgYSBmZXcgdGhpbmdzIHRoYXQg
Zm9ybWF0LXBhdGNoCmNhbiBkbyEKClRoYW5rcyBmb3IgbWVyZ2luZyBib3RoIHRoaXMgYW5kIHRo
ZSBnY3IgcGF0Y2ggOikKCkNoZWVycywK4oCUQWRyacOhbgo=

--0wlqju6I1xpF1iN0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYeFBywAKCRCRxVnb5MkS
O4MJAJ4kjmDQEGpY0Uv9BJ4Eic/q4sGb1gCfVI01Ooza0EMKczikHqemQLkUQoc=
=socc
-----END PGP SIGNATURE-----

--0wlqju6I1xpF1iN0--

--===============6463812834636819476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6463812834636819476==--
