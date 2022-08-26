Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370B2ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8520F4192E;
	Fri, 26 Aug 2022 12:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8520F4192E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oxJtMFIb8nOX; Fri, 26 Aug 2022 12:23:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6661541944;
	Fri, 26 Aug 2022 12:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6661541944
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 332871BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C16441929
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C16441929
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yBckyBGzVy8g for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:23:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AB8A40929
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9AB8A40929
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:23:36 +0000 (UTC)
Received: from 91-153-34-64.elisa-laajakaista.fi ([91.153.34.64] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1oRYN3-001156-4n; Fri, 26 Aug 2022 14:23:33 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id f0e0a214;
 Fri, 26 Aug 2022 12:23:22 +0000 (UTC)
Date: Fri, 26 Aug 2022 15:23:18 +0300
Message-ID: <20220826152318.GB547877@kodama>
From: Adrian Perez de Castro <aperez@igalia.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <20220826114900.GA2569@scaer>
References: <20220826105323.495057-1-aperez@igalia.com>
 <20220826114900.GA2569@scaer>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G7Vr9nBbSKJip57ilWdJ4BzkRCyP5/eVZAJs1AF0Gvs=; b=rPHA9cB2OGah6hVntTNdrE8Amv
 WzGJT6DgJPRyddQ2AaQmmGptwgJjMbUX8K7O4VmX6qOWwJDw7pIMakE8BTF5ShGvjmXBUfebPDLdx
 1VGRaX/9OczWaQFPSPVp1vNXV9VFwn06vDbdXXQTRPvhiXVw89pE7ChzdwDHTyd1MRBIChoLmk2nG
 8+7GIlp9n7rD6ow6ULG1LAMxJpToIguZk/alq+o1dONL+oKHYEqYCOXRwPqJYQgEtGXpbDdXFXEGR
 /9fbfj1NDVgl7Sk67HJEL2zJfjIRJb23IcpuNrZ/UiUIchm/OZhma+81sw8HXdv3sap0JYf8Q3/Oz
 2PchzKiA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=rPHA9cB2
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to
 version 2.36.7
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
Content-Type: multipart/mixed; boundary="===============6430187719431266690=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6430187719431266690==
Content-Type: multipart/signed; boundary="mZmzCD4nMRO64PBg"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--mZmzCD4nMRO64PBg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gRnJpLCAyNiBBdWcgMjAyMiAxMzo0OTowMCArMDIwMCAiWWFubiBFLiBNT1JJTiIgPHlhbm4u
bW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiBBZHJpYW4sIEFsbCwKPiAKPiBPbiAyMDIyLTA4
LTI2IDEzOjUzICswMzAwLCBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIHNwYWtlIHRodXNseToKPiA+
IEJ1Z2ZpeCByZWxlYXNlLCB3aXRoIGEgc2VjdXJpdHkgcGF0Y2ggZm9yIENWRS0yMDIyLTMyODkz
Lgo+ID4gUmVsZWFzZSBub3RlczoKPiA+IAo+ID4gICBodHRwczovL3dwZXdlYmtpdC5vcmcvcmVs
ZWFzZS93cGV3ZWJraXQtMi4zNi42Lmh0bWwKPiA+ICAgaHR0cHM6Ly93cGV3ZWJraXQub3JnL3Jl
bGVhc2Uvd3Bld2Via2l0LTIuMzYuNy5odG1sCj4gPiAKPiA+IEFjY29tcGFueWluZyBzZWN1cml0
eSBhZHZpc29yeToKPiA+IAo+ID4gICBodHRwczovL3dwZXdlYmtpdC5vcmcvc2VjdXJpdHkvV1NB
LTIwMjItMDAwOC5odG1sCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBQZXJleiBkZSBD
YXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPgo+IAo+IFlvdSBzZWVtZWQgdmVyeSBpbnNpc3RhbnQg
dGhhdCBpdCBzaG91bGQgYmUgYXBwbGllZCBxdWlja2x5LCBzbyBJIGRpZC4KPiA7LV0KClRoYXQg
d2FzICJnaXQgc2VuZC1lbWFpbCIgYmVpbmcgZnVubnkgYW5kIG5vdCBlbmRpbmcgd2l0aCBhIHN1
Y2Nlc3MgZXhpdCBjb2RlLApJIHRob3VnaHQgaXQgaGFkbid0IHF1ZXVlZCB0aGUgZW1haWwgYnV0
IEkgZGlkbid0IGNhcmUgdG8gY2hlY2sgdGhlIE1UQSBxdWV1ZQpzbyBJIHJldHJpZWQgYSBmZXcg
dGltZXMgTzotKQoKPiBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKVGhhbmtzIQoK4oCUQWRy
acOhbgo=

--mZmzCD4nMRO64PBg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYwi7NgAKCRCRxVnb5MkS
O6H2AJ9/jaPESX+MvBbOB7RVOh/uREfS5ACeMCIoZDvDnmLETgcdClPA+eshfpM=
=U07v
-----END PGP SIGNATURE-----

--mZmzCD4nMRO64PBg--

--===============6430187719431266690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6430187719431266690==--
