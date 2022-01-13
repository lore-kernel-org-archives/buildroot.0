Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4894C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 12:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41DDD6FC30;
	Thu, 13 Jan 2022 12:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FTQJTr6C-Ivl; Thu, 13 Jan 2022 12:03:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 448116FBFE;
	Thu, 13 Jan 2022 12:03:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD8991BF350
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 12:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D851640158
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 12:03:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V6j-C725DGC9 for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 12:03:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF2E340124
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 12:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:To:
 From:Message-ID:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7bRbOMVzf7yPXsoL0DM4lAq1rg/tdtqD2S6XEhxdg14=; b=quLNaCBR0q/qL+/AiPGjqK2anx
 yPbfgskXixDfRGEt+JwGX3/U3k20XJUmbx0T+gjyRCTR18i2tCH/M1E+zU1TeBCWYs+6lNQ46Tx7u
 n8SaCdaHI39BGfkH4DI8VWrTh5QR1rPsU8BiO6+XZssUUkhrxrBkteRjezQ7qJ+WFphTUXN8qRD6F
 S0t7ZJygnTi4IHTWQ5xj3+/MmupiwnD5ke2LIvXrzs6nTRD+p/htTBHnl5O/RPqg1Fx6rt9mBBNZG
 DbIKSgU2UMBldvqfbdwh8T+SMW4iN6jkJnanQT8HOGivzSR7Zdu95qBJ0mUic0O/NLHKW6jiYlnjX
 iaCsbjYw==;
Received: from 91-152-140-238.elisa-laajakaista.fi ([91.152.140.238]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1n7yoq-0005fX-Mc
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 13:03:04 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 738fee0d
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 12:02:48 +0000 (UTC)
Date: Thu, 13 Jan 2022 14:02:48 +0200
Message-ID: <20220113140248.GB219766@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
In-Reply-To: <20220113111230.GB172867@momiji>
References: <20220113071133.371F0415E6@smtp4.osuosl.org>
 <20220113105318.GC97860@momiji> <20220113111230.GB172867@momiji>
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2022-01-12
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
Content-Type: multipart/mixed; boundary="===============6896497459948551139=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6896497459948551139==
Content-Type: multipart/signed; boundary="c7TrYsCbT/vQLpBt"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--c7TrYsCbT/vQLpBt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgYWdhaW4sCgpPbiBUaHUsIDEzIEphbiAyMDIyIDExOjEyOjMwICswMjAwIEFkcmlhbiBQZXJl
eiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPiB3cm90ZToKPiBPbiBUaHUsIDEzIEphbiAy
MDIyIDEwOjUzOjE4ICswMjAwIEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEu
Y29tPiB3cm90ZToKPiA+IE9uIFRodSwgMTMgSmFuIDIwMjIgMDc6MDY6NDQgKzAwMDAgVGhvbWFz
IFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4gPiAKPiA+
ID4gRGV0YWlsIG9mIGZhaWx1cmVzIGZvciBtYXN0ZXIKPiA+ID4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPiA+ID4gCj4gPiA+ICAgICBhcmNoICAgICB8ICAgICAgICAgICAgIHJlYXNv
biAgICAgICAgICAgICB8IE9LPyB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdXJsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBvcnBoPwo+ID4g
PiAtLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tCj4gPiA+Cj4gPiA+IFsuLi5dCj4gPiA+Cj4g
PiA+ICAgICBhcm0gICAgICB8ICAgICAgICAgICBnY3ItMy40MC4wICAgICAgICAgICB8IE5PSyB8
IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2NkZDVjNzIxNTQ0ZDZmMDdj
NTFiZTUzNmU0MTRmYTQ3NGY0YjkwN2IgfCBPUlBICj4gPiA+ICAgcmlzY3Y2NCAgICB8ICAgICAg
ICAgICBnY3ItMy40MC4wICAgICAgICAgICB8IE5PSyB8IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRy
b290Lm5ldC9yZXN1bHRzLzhjZWNkMzNkNzc3MmIxOWQ2MGY3MGEwOTdkY2IxNjIzYmIzZWU3ZGUg
fCBPUlBICj4gPiAKPiA+IEkgcmFuIGludG8gdGhlIHNhbWUgaXNzdWUgd2hpbGUgdHJ5aW5nIG91
dCB0aGUgc3dpdGNoIHRvIE5pbmphIGZvciBDTWFrZQo+ID4gcGFja2FnZXMsIGJlY2F1c2UgdHJ5
aW5nIHRvIGJ1aWxkICJtaWRvcmkiIHB1bGxzIGluICJnY3IiIGFzIGEgZGVwZW5kZW5jeS4KPiA+
IAo+ID4gVGhlc2UgYnVpbGQgZmFpbHVyZXMgaW4gImdjciIgaGF2ZSBiZWVuIGNhdXNlZCBieSB0
aGUgdXBkYXRlIHRvIE1lc29uIDAuNjE7Cj4gPiB0aGVyZSBpcyBhbiB1cHN0cmVhbSBmaXggaGVy
ZToKPiA+IAo+ID4gICBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvZ2NyLy0vbWVyZ2Vf
cmVxdWVzdHMvODEucGF0Y2gKPiA+IEFwcGx5aW5nIHRoaXMgcGF0Y2ggbG9jYWxseSBtYWRlIHRo
ZSBjb25maWd1cmUgc3RlcCBjb21wbGV0ZSwgYnV0IHRoZW4gdGhlCj4gPiBidWlsZCBzdGVwIHJh
biBpbnRvIHRoaXMgb3RoZXIgaXNzdWU6Cj4gPiAKPiA+ICAgWzEvMTE0XSBHZW5lcmF0aW5nIGdj
ay9nY2stMS52YXBpIHdpdGggYSBjdXN0b20gY29tbWFuZAo+ID4gICBGQUlMRUQ6IGdjay9nY2st
MS52YXBpIAo+ID4gICBbLi4uXQo+ID4gICBVbmtub3duIG9wdGlvbiAtLW1ldGFkYXRkaXI9L2hv
bWUvYXBlcmV6L2J1aWxkcm9vdC9vdXRwdXQtY21ha2UvYnVpbGQvZ2NyLTMuNDAuMC9nY2sKPiA+
ICAgUnVuICcvaG9tZS9hcGVyZXovYnVpbGRyb290L291dHB1dC1jbWFrZS9wZXItcGFja2FnZS9n
Y3IvaG9zdC9iaW4vdmFwaWdlbi0wLjUyIC0taGVscCcgdG8gc2VlIGEgZnVsbCBsaXN0IG9mIGF2
YWlsYWJsZSBjb21tYW5kIGxpbmUgb3B0aW9ucy4KPiA+ICAgbmluamE6IGJ1aWxkIHN0b3BwZWQ6
IHN1YmNvbW1hbmQgZmFpbGVkLgo+ID4gCj4gPiBJIGFtIHRyeWluZyB0byBmaXggdGhpcyBvdGhl
ciBpc3N1ZSBiZWZvcmUgc3VibWl0dGluZyBhIHBhdGNoIGZvciB0aGUgImdjciIKPiA+IHBhY2th
Z2UuIElmIHRoaXMgc2Vjb25kIGZhaWx1cmUgcmluZ3MgYSBiZWxsIHRvIGFueW9uZSwgSSBhbSBh
bGwgZWFyc15XIGV5ZXMuCj4gCj4gRm91bmQgaXQsIHRoaXMgc2Vjb25kIG9uZSBpcyBhIHR5cG8g
aW4gdGhlIE1lc29uIHNvdXJjZSBjb2RlLCB0aGUgZm9sbG93aW5nCj4gdXBzdHJlYW0gcGF0Y2gg
Zml4ZXMgdGhlIGlzc3VlIGFscmlnaHQ6Cj4gCj4gICBodHRwczovL2dpdGh1Yi5jb20vbWVzb25i
dWlsZC9tZXNvbi9wdWxsLzk4MDYKPiAKPiBJJ2xsIHN1Ym1pdCBwYXRjaGVzIGZvciBib3RoIGlz
c3VlcyBtb21lbnRhcmlseS4KCkZpeGVzIHNlbnQ6CgogLSBnY3I6IGh0dHBzOi8vcGF0Y2h3b3Jr
Lm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMjAxMTMwOTQ2MzAuMjMyMjA5
MC0xLWFwZXJlekBpZ2FsaWEuY29tLwogLSBtZXNvbjogaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMDExMzExNTcwNC4yMzU0MTUwLTEtYXBl
cmV6QGlnYWxpYS5jb20vCgpDaGVlcnMsCuKAlEFkcmnDoW4K

--c7TrYsCbT/vQLpBt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYeAU6AAKCRCRxVnb5MkS
OylpAJ4pFERC6kISbcBNY9c2ywzSPCqpyACeLd6jN6mmYlEpXS58mw35qTCT7IQ=
=b68h
-----END PGP SIGNATURE-----

--c7TrYsCbT/vQLpBt--

--===============6896497459948551139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6896497459948551139==--
