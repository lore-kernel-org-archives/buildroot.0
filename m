Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D5BC433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 08:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB76B6FC22;
	Thu, 13 Jan 2022 08:53:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KMelljXySVqW; Thu, 13 Jan 2022 08:53:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1EEC6FC1B;
	Thu, 13 Jan 2022 08:53:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 213BC1BF9B9
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 08:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C8574000B
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 08:53:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id peNP6kmk21sE for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 08:53:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92280409CB
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 08:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:To:
 From:Message-ID:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kW/18DJTdsSUicFhfv9xXsw2I93CWM0VcXKdMtDnAOs=; b=sRgqE+KLJaWlR486EJ27oklD6W
 Q7057hiwGyJ4h4C0ERV27XiOcS4aRtJFQhejDPckShz/HR6rIRvfl9if0ZOTZkz2JvHvos/fzsUnX
 F2jRxdTGkxYBHOtnIsITolvMLJ69gkJViXOz+gr4IqG3xLvy3KNIKv3FDWiEbSSTH/BUhLfviamoT
 JTxisuuE/d4GO4Ktk2XgROm6ZSuCMBZP5+KXVZMc7cAjLNh5wldz7hi3XXNXD7+qyI4EPjc2QeeCw
 jfQLEPle42MwknNrl/LR1HNRmyywJ/1kjdLdRXDcHRNowaibBzoJMIppfFrFKD3Hyjld2rc4g22P0
 nwg+QQ0Q==;
Received: from 91-152-140-238.elisa-laajakaista.fi ([91.152.140.238]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1n7vrQ-000CAL-FC
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 09:53:32 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 476bb573
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 08:53:22 +0000 (UTC)
Date: Thu, 13 Jan 2022 10:53:18 +0200
Message-ID: <20220113105318.GC97860@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
In-Reply-To: <20220113071133.371F0415E6@smtp4.osuosl.org>
References: <20220113071133.371F0415E6@smtp4.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============4035511894260721422=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4035511894260721422==
Content-Type: multipart/signed; boundary="CccEN1QqWAXyrOMj"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--CccEN1QqWAXyrOMj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gVGh1LCAxMyBKYW4gMjAyMiAwNzowNjo0NCArMDAwMCBUaG9tYXMgUGV0YXp6b25pIDx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gRGV0YWlsIG9mIGZhaWx1cmVzIGZv
ciBtYXN0ZXIKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IAo+ICAgICBhcmNoICAg
ICB8ICAgICAgICAgICAgIHJlYXNvbiAgICAgICAgICAgICB8IE9LPyB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdXJsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCBvcnBoPwo+IC0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0rLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0KPgo+IFsuLi5d
Cj4KPiAgICAgYXJtICAgICAgfCAgICAgICAgICAgZ2NyLTMuNDAuMCAgICAgICAgICAgfCBOT0sg
fCBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9jZGQ1YzcyMTU0NGQ2ZjA3
YzUxYmU1MzZlNDE0ZmE0NzRmNGI5MDdiIHwgT1JQSAo+ICAgcmlzY3Y2NCAgICB8ICAgICAgICAg
ICBnY3ItMy40MC4wICAgICAgICAgICB8IE5PSyB8IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm5ldC9yZXN1bHRzLzhjZWNkMzNkNzc3MmIxOWQ2MGY3MGEwOTdkY2IxNjIzYmIzZWU3ZGUgfCBP
UlBICgpJIHJhbiBpbnRvIHRoZSBzYW1lIGlzc3VlIHdoaWxlIHRyeWluZyBvdXQgdGhlIHN3aXRj
aCB0byBOaW5qYSBmb3IgQ01ha2UKcGFja2FnZXMsIGJlY2F1c2UgdHJ5aW5nIHRvIGJ1aWxkICJt
aWRvcmkiIHB1bGxzIGluICJnY3IiIGFzIGEgZGVwZW5kZW5jeS4KClRoZXNlIGJ1aWxkIGZhaWx1
cmVzIGluICJnY3IiIGhhdmUgYmVlbiBjYXVzZWQgYnkgdGhlIHVwZGF0ZSB0byBNZXNvbiAwLjYx
Owp0aGVyZSBpcyBhbiB1cHN0cmVhbSBmaXggaGVyZToKCiAgaHR0cHM6Ly9naXRsYWIuZ25vbWUu
b3JnL0dOT01FL2djci8tL21lcmdlX3JlcXVlc3RzLzgxLnBhdGNoCgpBcHBseWluZyB0aGlzIHBh
dGNoIGxvY2FsbHkgbWFkZSB0aGUgY29uZmlndXJlIHN0ZXAgY29tcGxldGUsIGJ1dCB0aGVuIHRo
ZQpidWlsZCBzdGVwIHJhbiBpbnRvIHRoaXMgb3RoZXIgaXNzdWU6CgogIFsxLzExNF0gR2VuZXJh
dGluZyBnY2svZ2NrLTEudmFwaSB3aXRoIGEgY3VzdG9tIGNvbW1hbmQKICBGQUlMRUQ6IGdjay9n
Y2stMS52YXBpIAogIFsuLi5dCiAgVW5rbm93biBvcHRpb24gLS1tZXRhZGF0ZGlyPS9ob21lL2Fw
ZXJlei9idWlsZHJvb3Qvb3V0cHV0LWNtYWtlL2J1aWxkL2djci0zLjQwLjAvZ2NrCiAgUnVuICcv
aG9tZS9hcGVyZXovYnVpbGRyb290L291dHB1dC1jbWFrZS9wZXItcGFja2FnZS9nY3IvaG9zdC9i
aW4vdmFwaWdlbi0wLjUyIC0taGVscCcgdG8gc2VlIGEgZnVsbCBsaXN0IG9mIGF2YWlsYWJsZSBj
b21tYW5kIGxpbmUgb3B0aW9ucy4KICBuaW5qYTogYnVpbGQgc3RvcHBlZDogc3ViY29tbWFuZCBm
YWlsZWQuCgpJIGFtIHRyeWluZyB0byBmaXggdGhpcyBvdGhlciBpc3N1ZSBiZWZvcmUgc3VibWl0
dGluZyBhIHBhdGNoIGZvciB0aGUgImdjciIKcGFja2FnZS4gSWYgdGhpcyBzZWNvbmQgZmFpbHVy
ZSByaW5ncyBhIGJlbGwgdG8gYW55b25lLCBJIGFtIGFsbCBlYXJzXlcgZXllcy4KCgpDaGVlcnMs
CuKAlEFkcmnDoW4K

--CccEN1QqWAXyrOMj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYd/ofgAKCRCRxVnb5MkS
O8g2AJoDn4C0cI4fCJpdBUx3ZbD15nD44gCfc8ZYpoTWuCyD7DYBBVxKBzlhqzo=
=VHrr
-----END PGP SIGNATURE-----

--CccEN1QqWAXyrOMj--

--===============4035511894260721422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4035511894260721422==--
