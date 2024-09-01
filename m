Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A93EC54FC6
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 14:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06F216076B;
	Sun,  1 Sep 2024 14:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hzw66IHtYt8u; Sun,  1 Sep 2024 14:13:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E97926075A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E97926075A;
	Sun,  1 Sep 2024 14:13:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1F2E1BF2B6
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 14:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8A7940167
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 14:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GaqEQRdZhPSK for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 14:13:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D911F40015
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D911F40015
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D911F40015
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 14:13:51 +0000 (UTC)
Received: from 91-152-140-108.elisa-laajakaista.fi ([91.152.140.108]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sklKu-007zNG-1S; Sun, 01 Sep 2024 16:13:47 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 95f20c81;
 Sun, 1 Sep 2024 14:13:43 +0000 (UTC)
Date: Sun, 1 Sep 2024 17:13:38 +0300
Message-ID: <20240901171338.GB1275649@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20240831120707.471306-1-thomas@devoogdt.com>
References: <20240831120707.471306-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y6cYRdCF7PIfZ3lP5con98OgYJzapH/D71WTlH0LO9Y=; b=Hkq33xBmkOm+kByVHAd2Et8thl
 NRiY8mXhCqwDTUvUs6teT33qC4NyAzclgN2NRopiHpjDqLs/rbfkTKJ8LzkBkWDgUfMDOF61h7E9K
 wzY0layoPS9wRQvmdXBKiq5CrusTe/cmyNNF+IsVRHDBvs3G7s8OPOW7LXGb44N0lVTkYkpT13mac
 5TCx8LuLSrntgiX5F926CryECs1GEFiRnJsq/Bg6LDrIeUnZwwx1pZX7Qwnlc974kIiCNSWLr8se9
 kP+F8E5tqgYeIRJUuiFUIYxrwh2uD7XuyOSYQ1k+8TL9B7UVZpTiLIxJU+PEBZPDeip10ZaWgnStW
 Wupuzr1w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=Hkq33xBm
Subject: Re: [Buildroot] [PATCH v1] package/webkitgtk: bump to 2.44.3
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7575598720194820296=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7575598720194820296==
Content-Type: multipart/signed; boundary="s4LlKX5Kvt4MXsIw"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--s4LlKX5Kvt4MXsIw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgVGhvbWFzLAoKVGhhbmtzIGZvciB3b3JraW5nIG9uIHRoaXMgdXBkYXRlLiBUaGVyZSBpcyBv
bmUgaXNzdWUgdGhhdCBuZWVkcwphZGRyZXNzaW5nLCB0aG91Z2guLi4KCk9uIFNhdCwgMzEgQXVn
IDIwMjQgMTQ6MDc6MDcgKzAyMDAgVGhvbWFzIERldm9vZ2R0IDx0aG9tYXNAZGV2b29nZHQuY29t
PiB3cm90ZToKCj4gQnVnZml4IHJlbGVhc2Ugd2l0aCBtYW55IHNlY3VyaXR5IGZpeGVzLCBpbmNs
dWRpbmcgKGJ1dCBub3QgbGltaXRlZCB0bykKPiBwYXRjaGVzIGZvciBDVkUtMjAyNC00MDc3Niwg
Q1ZFLTIwMjQtNDA3NzksIENWRS0yMDI0LTQwNzgwLCBDVkUtMjAyNC00MDc4MiwKPiBDVkUtMjAy
NC00MDc4OSwgYW5kIENWRS0yMDI0LTQ1NTguCj4gCj4gUmVsZWFzZSBub3RlczoKPiAKPiAgIGh0
dHBzOi8vd2Via2l0Z3RrLm9yZy8yMDI0LzA4LzEzL3dlYmtpdGd0azIuNDQuMy1yZWxlYXNlZC5o
dG1sLgoKQWxvbmdzaWRlIHdpdGggdGhlIGFubm91bmNlbWVudCwgd2UgZm91bmQgYSBjb3VwbGUg
b2YgaXNzdWVzIHRoYXQgbmVlZAppbXBvcnRpbmcgYSBjb3VwbGUgb2YgcGF0Y2hlcywgYm90aCBv
ZiB3aGljaCBhcmUgYWxyZWFkeSBwcmVzZW50IGluIHRoZQp3ZWJraXRnbGliLzIuNDQgcmVsZWFz
ZSBicmFuY2guIEkgc2VudCBhbiBlLW1haWwgdG8gbGV0IHBhY2thZ2VycyBrbm93IGEKY291cGxl
IG9mIHdlZWtzIGFnbzoKCiAgaHR0cHM6Ly9saXN0cy53ZWJraXQub3JnL3BpcGVybWFpbC93ZWJr
aXQtZ3RrLzIwMjQtQXVndXN0LzAwNDAwMi5odG1sCgpUaGUgdHdvIHBhdGNoZXMgeW91IHdvdWxk
IG5lZWQgdG8gYWRkIGFyZSB0aGVzZToKCiAgaHR0cHM6Ly9naXRodWIuY29tL1dlYktpdC9XZWJL
aXQvY29tbWl0LzkxNDBjZTcxMmFhODcwOTE2MTM4NzRkODAyNzg3YWI0NzZiZTBlMzkKICBodHRw
czovL2dpdGh1Yi5jb20vV2ViS2l0L1dlYktpdC9jb21taXQvNDg1NGI5NDRiMzQ1OTkwZTQxMDAz
MTk2NjI3Nzc4NTZmZThlYTRhYQoKT3RoZXJ3aXNlLCBjaGFuZ2VzIExHVE0uCgpBbHNvLCBhbm90
aGVyIHRpZGJpdDogSSBhbSBwbGFubmluZyB0byByZWxlYXNlIDIuNDQuNCBuZXh0IHdlZWssIHdo
aWNoCndpbGwgYmUgdGhlIGxhc3QgdmVyc2lvbiBmcm9tIHRoZSBzZXJpZXMsIGFuZCBpbiBhIGZl
dyB3ZWVrcyBtb3JlIHdlCmFyZSBwbGFubmluZyB0byByZWxlYXNlIDIuNDYuMCBhcyB3ZWxsIC0t
IGp1c3QgYSBoZWFkcyB1cCBpbiBjYXNlIGl0IG1heQpiZSBwcmVmZXJhYmxlIHRvIHdhaXQgdW50
aWwgZWl0aGVyIHZlcnNpb24uCgpDaGVlcnMsCuKAlEFkcmnDoW4K

--s4LlKX5Kvt4MXsIw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZtR2kgAKCRCRxVnb5MkS
O2nEAJ0aeOCMOigf6mJCa6ks3ikjcNg/7QCfdAuC162A6u0ChIYI7AJsFWQ+Aqs=
=7+Lj
-----END PGP SIGNATURE-----

--s4LlKX5Kvt4MXsIw--

--===============7575598720194820296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7575598720194820296==--
