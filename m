Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C8BC433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 13:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C05960F30;
	Tue,  4 Oct 2022 13:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C05960F30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YrFeNo9hchHh; Tue,  4 Oct 2022 13:35:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3435B60B94;
	Tue,  4 Oct 2022 13:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3435B60B94
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 052021BF841
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 13:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D415940BCE
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 13:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D415940BCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bRp4VWeDYVY1 for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 13:35:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF97040BAD
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF97040BAD
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 13:35:49 +0000 (UTC)
Received: from 91-153-34-120.elisa-laajakaista.fi ([91.153.34.120] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1ofi5M-007mjD-0z; Tue, 04 Oct 2022 15:35:47 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id a9448bfd;
 Tue, 4 Oct 2022 13:35:37 +0000 (UTC)
Date: Tue, 4 Oct 2022 16:35:33 +0300
Message-ID: <20221004163533.GB1955969@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220921201854.5b4913b2@windsurf>
References: <20220920230029.1680134-1-aperez@igalia.com>
 <20220920230029.1680134-4-aperez@igalia.com>
 <20220921201854.5b4913b2@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yXhsj/IhRD8YQ8Aw+GyP731P9DNebAYfv35PiT3rhg0=; b=LbHWZ7cvNJhyI7ffcDX7LwoAC5
 7IAA9ugmjRyvfI6E6lj5a7I58WArwMhVKmCtIEdP5PvZu73byoYQ9YmR34sCF1wmWD/o+4U3mM3YY
 gxSK1qefXygkk3p8CPA1Qo0wYCX6so438c5kS3yAL48Ht5NxCU5O85RpEGLNPNk5PiOlyslaEKFIU
 FHjS2CD40s38Cp+ETKBLOITonxGKklg8FKWk6Vnrp3aPwCwnAt+2tNpBG688cV9wf3jen16hk6VLg
 UCEtWU62r3+WYdQHDR37GGh+EyeWO+0SVFi745Z/3+gz/R1vVb0S2cfTbG56Z7GWDDJvVgGwPtvmv
 sCQHVNEg==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=LbHWZ7cv
Subject: Re: [Buildroot] [PATCH 3/3] package/wpewebkit: bump to version
 2.38.0
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
Content-Type: multipart/mixed; boundary="===============6852792219467358219=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6852792219467358219==
Content-Type: multipart/signed; boundary="UNIdSdHjn22o46+8"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--UNIdSdHjn22o46+8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgYWxsLCBUaG9tYXMsCgpPbiBXZWQsIDIxIFNlcCAyMDIyIDIwOjE4OjU0ICswMjAwIFRob21h
cyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBPbiBX
ZWQsIDIxIFNlcCAyMDIyIDAyOjAwOjI5ICswMzAwCj4gQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8
YXBlcmV6QGlnYWxpYS5jb20+IHdyb3RlOgo+IAo+ID4gVXBkYXRlIHRvIGEgbmV3IG1ham9yIHJl
bGVhc2Ugd2hpY2ggYnJpbmdzIGluIGltcHJvdmVtZW50cyBhbmQgYSBmZXcKPiA+IG5ldyBmZWF0
dXJlcy4gUmVsZWFzZSBub3RlczoKPiA+IAo+ID4gICBodHRwczovL3dwZXdlYmtpdC5vcmcvcmVs
ZWFzZS93cGV3ZWJraXQtMi4zOC4wLmh0bWwKPiA+IAo+ID4gVGhpcyByZWxlYXNlIGFsc28gaW5j
bHVkZXMgc2VjdXJpdHkgZml4ZXMgZm9yIENWRS0yMDIyLTMyODg2LAo+ID4gQ1ZFLTIwMjItMzI4
OTEsIGFuZCBDVkUtMjAyMi0zMjkxMi4gQWNjb21wYW55aW5nIHNlY3VyaXR5IGFkdmlzb3J5Ogo+
ID4gCj4gPiAgIGh0dHBzOi8vd3Bld2Via2l0Lm9yZy9zZWN1cml0eS9XU0EtMjAyMi0wMDA5Lmh0
bWwKPiAKPiBBY2NvcmRpbmcgdG8gdGhpcyBwYWdlLCBDVkUtMjAyMi0zMjg5MSBvbmx5IGFmZmVj
dHMgdmVyc2lvbnMgdXAgMi4zNi41LAo+IGFuZCB3ZSdyZSB1c2luZyAyLjM2LjcgaW4gQnVpbGRy
b290Lgo+IAo+IEFsc28gYWNjb3JkaW5nIHRvIHRoaXMgcGFnZSwgdGhlIHR3byBvdGhlciBDVkVz
IGhhdmUgYmVlbiBmaXhlZCBpbgo+IDIuMzYuOC4KPiAKPiBTbywgY291bGQgeW91IHJld29yayB0
aGlzIHBhdGNoIHNlcmllcyB0bzoKPiAKPiAgLSBIYXZlIGEgZmlyc3QgcGF0Y2ggInBhY2thZ2Uv
d3Bld2Via2l0OiBzZWN1cml0eSBidW1wIHRvIHZlcnNpb24KPiAgICAyLjM2LjgiLCB3aGljaCBk
b2VzIGJ1bXAgdG8gMi4zNi44Cj4gCj4gIC0gSGFzIHRoZSBwYXRjaGVzIHVwZGF0aW5nIGxpYndw
ZSwgd3BlYmFja2VuZC1mZG8uCj4gCj4gIC0gSGFzIHRoZSBwYXRjaCB1cGRhdGluZyB3cGV3ZWJr
aXQgdG8gMi4zOC4wCj4gCj4gSW5kZWVkLCB3ZSB3aWxsIHdhbnQgdG8gYmFja3BvcnQgdGhlIDIu
MzYuOCBidW1wIHRvIG91ciBzdGFibGUgYnJhbmNoLAo+IGFzIGl0IGNvbnRhaW5zIHNlY3VyaXR5
IGZpeGVzLgoKUGF0Y2ggc2VyaWVzIHVwZGF0ZWQsIGl0IHRvb2sgbWUgYSBiaXQgdG8gZ2V0IGhh
cmR3YXJlIG91dCBvZiB0aGUgY2xvc2V0CnRvIHRlc3QgYSAzMi1iaXQgTkVPTiBidWlsZCB3aXRo
IHRoZSBwYXRjaCB0aGF0IEkgYW0gbm93IGluY2x1ZGluZyBpbgp0aGUgMi4zNi44IHVwZGF0ZSAo
YXMgcmVxdWVzdGVkIGJ5IE1pY2hhZWwpIDotfQoKSGVyZSBpdCBpczoKCiAgaHR0cHM6Ly9wYXRj
aHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0Lz9zZXJpZXM9MzIxMzI3CgpD
aGVlcnMsCuKAlEFkcmnDoW4K

--UNIdSdHjn22o46+8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYzw2pQAKCRCRxVnb5MkS
O5KGAJ0cGwreM4ZClVC2v0AL3SwfUaGCxgCeMLF2OBnI0+3SNSqeYzEK/63TWac=
=JFdD
-----END PGP SIGNATURE-----

--UNIdSdHjn22o46+8--

--===============6852792219467358219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6852792219467358219==--
