Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E51C47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 08:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FCA041D6E;
	Wed, 31 Jan 2024 08:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FCA041D6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4XF6mmK2v6ax; Wed, 31 Jan 2024 08:26:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E5AB41D70;
	Wed, 31 Jan 2024 08:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E5AB41D70
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A9491BF846
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 08:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11FC540A4B
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 08:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11FC540A4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xwgbd5x7J0-9 for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 08:26:17 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76A6A40204
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 08:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76A6A40204
Received: from 91-152-140-108.elisa-laajakaista.fi ([91.152.140.108]
 helo=momiji.home) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rV5vB-00Bzqw-HY; Wed, 31 Jan 2024 09:26:13 +0100
Received: from localhost (momiji.home [local])
 by momiji.home (OpenSMTPD) with ESMTPA id 8645f681;
 Wed, 31 Jan 2024 08:26:12 +0000 (UTC)
Date: Wed, 31 Jan 2024 10:26:12 +0200
Message-ID: <20240131102612.GD4009850@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <43b543a2-6782-42f2-ac09-1c72d9c49d59@korsgaard.com>
References: <20240125144121.1534299-1-aperez@igalia.com>
 <8734ul6ruc.fsf@48ers.dk> <20240126003346.GB2901019@igalia.com>
 <43b543a2-6782-42f2-ac09-1c72d9c49d59@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yP4GxUPoWOc54LEc4IV6tdc7ateTH82DNL8dNgCOEZo=; b=XxPNHNFjv8M9HOpRO3bVIM8cIO
 t05M2kF5jpJvohpjdbCEOTl139kalcMFORm/Vc5EH4FWSp4Kayv43dXM217FKz0wMuFgBpLMLM934
 MZXl9vBcOi271ajL+bNy91HIGJuWCATu23Q+NmSTuQ6IzHyMEJdzFi0DYx4lDC8OWYtc35LCsVyUz
 YEJQhYaCnlwGWfU9Jd2KcEItuin7tgIOiZCOUema39XTJgQ7mB2xO0dLEHACDsGsGPXy29Z97Qnji
 vOdmpU1/D4eauhU6ZfNo0uXLmc+MlVpG0zeVkvsg5lSS5Tjba/h8sX5Q1SjHI6jn48S4ySJah3yWV
 EFVIWlYw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=XxPNHNFj
Subject: Re: [Buildroot] [PATCH] package/libwpe: switch back to version
 1.14.2
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
Content-Type: multipart/mixed; boundary="===============2004906748730000012=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2004906748730000012==
Content-Type: multipart/signed; boundary="5iLCmRuhWh63RjWU"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--5iLCmRuhWh63RjWU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gRnJpLCAyNiBKYW4gMjAyNCAwOTo0MzoyMyArMDEwMCBQZXRlciBLb3JzZ2FhcmQgPHBldGVy
QGtvcnNnYWFyZC5jb20+IHdyb3RlOgo+IE9uIDI1LzAxLzIwMjQgMjMuMzMsIEFkcmlhbiBQZXJl
eiBkZSBDYXN0cm8gd3JvdGU6Cj4gPj4gSG1tLCB0aGlzIHdhcyBidW1wZWQgYmFjayBpbiBKdWx5
IGJlZm9yZSAyMDIzLjA4LXJjMS4gSXMgdGhlcmUgbm8gMS4xNi54Cj4gPj4gdmVyc2lvbiBjb21p
bmc/Cj4gPiAKPiA+IE5vdCBhbnl0aW1lIHNvb24uIFJlbGVhc2UgMS4xNC4yIHdoaWNoIEkganVz
dCBtYWRlIHllc3RlcmRheSBpbmNsdWRlcyBhbGwgdGhlCj4gPiBmaXhlcyB0aGF0IGFyZSBhbHNv
IGluIDEuMTUuMiAtLSB1c3VhbGx5IHdlIG9ubHkgZG8gYSBuZXcgc3RhYmxlIGJyYW5jaCBpZgo+
ID4gdGhlcmUgYXJlIG5ldyBmZWF0dXJlcywgYW5kIHdlIGhhdmVuJ3QgYWRkZWQgYW55dGhpbmcg
dG8gbGlid3BlIGZvciBhIHF1aXRlCj4gPiBsb25nIHRpbWUuCj4gPiAKPiA+IEFsc28sIFlhbm4g
YXNrZWQgb24gSVJDIHdoZXRoZXIgdGhlIHBhY2thZ2VzIHRoYXQgZGVwZW5kIG9uIGxpYndwZQo+
ID4gKHdwZWJhY2tlbmQtZmRvLCB3cGV3ZWJraXQsIGdzdDEtcGx1Z2lucy1iYWQpIGNhbiB1c2Ug
MS4xNC54Li4uIFllcywKPiA+IHRoZXkgY2FuLiBGb3IgV1BFIFdlYktpdCB3ZSBldmVuIGhhdmUg
YSBjb21wYXRpYmlsaXR5IHRhYmxlIGhlcmU6Cj4gPiAKPiA+ICAgIGh0dHBzOi8vd3Bld2Via2l0
Lm9yZy9yZWxlYXNlL3NjaGVkdWxlLwo+ID4gCj4gPiA9KQo+IAo+IE9LLCBnb29kIC0gQXBwbGll
ZCwgdGhhbmtzLgoKU3VwZXIgOikKCj4gPiBNYXliZSB3ZSBzaG91bGQgcmVjb25zaWRlciB0aGUg
dmVyc2lvbmluZyBzY2hlbWUsIHVzaW5nIHN1ZmZpeGVzIGZvcgo+ID4gZGV2ZWxvcG1lbnQgcmVs
ZWFzZXMgYW5kIHJlbGVhc2UgY2FuZGlkYXRlcyAoIlguWS1kZXZOIiwgIlgtWS1yY04iKQo+ID4g
aW5zdGVhZCBvZiBldmVuL29kZCBudW1iZXJpbmcuIEl0IHNlZW1zIHRvIGNhdXNlIGVub3VnaCBj
b25mdXNpb24gdG8KPiA+IGF0IGxlYXN0IGNvbnNpZGVyIHRoZSBjaGFuZ2UuCj4gCj4gSSBkb24n
dCByZWFsbHkgZmVlbCBzdHJvbmdseSBhYm91dCBpdC4gSXQgaXMgYSBiaXQgIm9kZCIsIGJ1dCBj
b25zaXN0ZW50IAo+IHdpdGggdGhlIGd0ay9nbm9tZSBzdHVmZi4KCkdOT01FIGhhcyBiZWVuIHNs
b3dseSB0cnlpbmcgdG8gcGhhc2Ugb3V0IHRoZSBldmVuL29kZCBudW1iZXJpbmcgc2NoZW1lLCBi
dXQKaXQgaXMgdHJ1ZSB0aGF0IG1vc3QgbGlicmFyaWVzIGFyZSBzdGlsbCB1c2luZyBpdCwgYW5k
IHNvIGZhciBpdCBoYXMgYmVlbgptb3N0bHkgdXNlci1mYWNpbmcgYXBwbGljYXRpb25zIHRoZSBv
bmVzIHRoYXQgaGF2ZSBhZG9wdGVkIHRoZSBuZXcgdmVyc2lvbmluZwpzY2hlbWUgWzFdLgoKR2l2
ZW4gaXQncyBub3QgcmVhbGx5IGEgInByb2JsZW0iLCB3ZSBhY3R1YWxseSBwcmVmZXIgdG8gYXZv
aWQgY2hhbmdpbmcgaXQKaW4gdGhlIFdlYktpdCBjb21wb25lbnRzIHRvIGF2b2lkIGNodXJuLiBX
aGF0IEknbGwgZG8gaXMgYWRkIGEgY29tbWVudCBuZXh0CnRvIHRoZSB2ZXJzaW9uIHN0cmluZyBp
biB0aGUgLm1rIGZpbGVzLCBsaWtlIEkgZGlkIGluIHRoaXMgcGF0Y2gsIG5leHQgdGltZQpJIHVw
ZGF0ZSB0aGUgb3RoZXIgcGFja2FnZXMuCgpDaGVlcnMsCuKAlEFkcmnDoW4KCi0tLQpbMV0gaHR0
cHM6Ly9kaXNjb3Vyc2UuZ25vbWUub3JnL3QvbmV3LWdub21lLXZlcnNpb25pbmctc2NoZW1lLzQy
MzUK

--5iLCmRuhWh63RjWU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZboEJAAKCRCRxVnb5MkS
O2Y+AJwLjy0rp4WhMENjq51hIh+DqW0fggCaAh6gL8yMql5MUAAuTu1PriZ++VM=
=3MLW
-----END PGP SIGNATURE-----

--5iLCmRuhWh63RjWU--

--===============2004906748730000012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2004906748730000012==--
