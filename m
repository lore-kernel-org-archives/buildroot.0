Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EAEECAAD5
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 13:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFD1082F11;
	Mon, 29 Aug 2022 13:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFD1082F11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gNRmsPIjX1xa; Mon, 29 Aug 2022 13:47:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E3CA826AA;
	Mon, 29 Aug 2022 13:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E3CA826AA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 01A041BF309
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 13:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEF59408D4
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 13:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEF59408D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8krB_3IaFDat for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 13:47:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69B90408CE
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69B90408CE
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 13:47:37 +0000 (UTC)
Received: from 91-153-34-150.elisa-laajakaista.fi ([91.153.34.150] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1oSf70-0048RS-B7; Mon, 29 Aug 2022 15:47:34 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id cc0bb82d;
 Mon, 29 Aug 2022 13:47:23 +0000 (UTC)
Date: Mon, 29 Aug 2022 16:47:19 +0300
Message-ID: <20220829164719.GB4045490@kodama>
From: Adrian Perez de Castro <aperez@igalia.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <20220827134525.GA37358@scaer>
References: <20220824122601.266641-1-aperez@igalia.com>
 <20220827134203.GY37358@scaer> <20220827134525.GA37358@scaer>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fRVlo9Y9CXEFx4t3w81qrdaymewhPJZCy62u5zm+CiI=; b=eD/HYdO3wO5SjMDZBbukJNyG+F
 wB/F3+JHQsPXDyX9TPJFHV7ZBHs2EqV1YP5ThgJIZuuzSPnyh9CgczfKElXZMbhUf0IfgQswnopxc
 koMYQ8zr7l8QOY8gBaUzyLI1fNsTXgaP6mAZxX6c47rqK9unnbzWUzlzaCuEVanXzvlBysXq/IXlt
 Iyg+oWNnQRPFHMbfREhHPV+rfVBuk3x0MxKwATv5uH86qg8ixltUAlDIxSI+ZwIW1/y9dhfJclNj/
 yG7cf2UdPBZ1au/iJGJIqgAE1Go6qYKAuYJyuReGkR5uNx1ERVQJ2UENLGjST05aOimISeikdbUYB
 N/UTQcfQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=eD/HYdO3
Subject: Re: [Buildroot] [PATCH 1/1] package/wpebackend-fdo: bump to version
 1.12.1
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4901051119819507614=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4901051119819507614==
Content-Type: multipart/signed; boundary="upss3BtVB8G4ERQ7"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--upss3BtVB8G4ERQ7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgWWFubiwKCk9uIFNhdCwgMjcgQXVnIDIwMjIgMTU6NDU6MjUgKzAyMDAgIllhbm4gRS4gTU9S
SU4iIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6CiAKPiBPbiAyMDIyLTA4LTI3IDE1
OjQyICswMjAwLCBZYW5uIEUuIE1PUklOIHNwYWtlIHRodXNseToKPiA+IE9uIDIwMjItMDgtMjQg
MTU6MjYgKzAzMDAsIEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gc3Bha2UgdGh1c2x5Ogo+ID4gPiBU
aGlzIG1pbm9yIHJlbGVhc2UgZml4ZXMgYSBjcmFzaC4gUmVsZWFzZSBub3RlczoKPiA+ID4gCj4g
PiA+ICAgaHR0cHM6Ly93cGV3ZWJraXQub3JnL3JlbGVhc2Uvd3BlYmFja2VuZC1mZG8tMS4xMi4x
Lmh0bWwKPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8g
PGFwZXJlekBpZ2FsaWEuY29tPgo+ID4gQXBwbGllZCB0byBuZXh0LCB0aGFua3MuCj4gCj4gRGFt
biwgc2VudCB0b28gZmFzdC4uCj4gCj4gSSBtZWFudCB0byBhc2s6ICB0aGUgcmVsZWFzZSBub3Rl
cyBzdGF0ZSAiaW4gY2VydGFpbiBzaXR1YXRpb25zIi4gSXMKPiB0aGF0IG9jY3VyaW5nIG9mdGVu
IGVub3VnaCB0byB3YXJyYW50IGJlaW5nIGFwcGxpZWQgb24gbWFzdGVyPwoKV2hpbGUgdGhlIGNy
YXNoZXMgYXJlIG5vdCB2ZXJ5IGNvbW1vbiwgaXQgd291bGQgYmUgbmljZSB0byBpbmNsdWRlIHRo
ZQp2ZXJzaW9uIGJ1bXAgaW4gdGhlICJtYXN0ZXIiIGJyYW5jaC4gSSByZWNrb24gdGhlIGNoYW5n
ZXMgYXJlIHJhdGhlciBzbWFsbAphbmQgdGhleSBzaG91bGRuJ3QgaW50cm9kdWNlIGFueSByZWdy
ZXNzaW9uLgoKQ2hlZXJzLArigJRBZHJpw6FuCg==

--upss3BtVB8G4ERQ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYwzDZwAKCRCRxVnb5MkS
OxWRAJ9tw8uMiaRC6uiHm0cUO6VxljAM/gCcCCf9ptNoAkIZkUmCa0V7BasguMM=
=jeq6
-----END PGP SIGNATURE-----

--upss3BtVB8G4ERQ7--

--===============4901051119819507614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4901051119819507614==--
