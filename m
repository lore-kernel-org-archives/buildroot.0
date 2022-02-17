Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C56C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 15:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E98B361B82;
	Thu, 17 Feb 2022 15:10:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0-JvV8huaczb; Thu, 17 Feb 2022 15:10:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BAC761B80;
	Thu, 17 Feb 2022 15:09:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25F071BF2B9
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 220948308A
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BI6QRHNufnDO for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 15:09:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D56888316A
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 15:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LPOP3cNfr/bwGymkehuMXwxKNEkKaGfIN7hHpDImSso=; b=OWS57vmbT4DlQiCfx3k9Dsqpk8
 GP3iMYooOz+nFDj+CxyThIBCkXapxsSSRUnQK5qoRNgXyjzl9SA19ZE0zLSfaCn1oIg1w/yroX/IZ
 dUkRraNjUi9kJqP8jHsRepCHGVj1rlKdp5S5TbPpzbe0eWenZBmJDDlYhgX3xmWBk7GWWcq126hZt
 if6lqSBTpCuQCtPTq8SDhb5r3aiOSjGHXwKp8W7cFcGwOMinwSQBoG4zLF+lPOUB6ybY6SD9D1AcV
 gamvPzTFVR8l2WFkyfbRNwcSvxztPYd/e1oWyt3AyXIuW6KvZP9gbwfhhybhdqirGdyBzDe0WPehy
 IM5Fm2Zg==;
Received: from 163.179.165.83.dynamic.reverse-mundo-r.com ([83.165.179.163]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nKiPl-00051k-1A; Thu, 17 Feb 2022 16:09:49 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id a2ea18e3;
 Thu, 17 Feb 2022 15:09:39 +0000 (UTC)
Date: Thu, 17 Feb 2022 16:09:35 +0100
Message-ID: <20220217160935.GB804216@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <87a6epfxi3.fsf@dell.be.48ers.dk>
References: <20211124205607.3021277-1-aperez@igalia.com>
 <87mtjlwlvo.fsf@dell.be.48ers.dk> <20220124161611.GB162969@momiji>
 <20220217133620.GB757559@momiji> <87a6epfxi3.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: bump version to
 2.34.2
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
Content-Type: multipart/mixed; boundary="===============2997586013142801155=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2997586013142801155==
Content-Type: multipart/signed; boundary="qpEqoHH4IGI2E7C/"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--qpEqoHH4IGI2E7C/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gVGh1LCAxNyBGZWIgMjAyMiAxNDoxMjowNCArMDEwMCBQZXRlciBLb3JzZ2FhcmQgPHBldGVy
QGtvcnNnYWFyZC5jb20+IHdyb3RlOgo+ID4+Pj4+ICJBZHJpYW4iID09IEFkcmlhbiBQZXJleiBk
ZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPiB3cml0ZXM6Cj4gCj4gSGksCj4gCj4gID4+ID4g
V2hhdCBhYm91dCB3ZWJraXRndGs/IEl0IHdvdWxkIGFsc28gYmUgZ29vZCB0byBtb3ZlIHRoYXQg
dG8gdGhlIDIuMzQueAo+ICA+PiA+IHNlcmllcyBiZWZvcmUgd2UgcmVsZWFzZSAyMDIyLjAyLgo+
ICA+PiAKPiAgPj4gSSBoYXZlIGFsbCB0aGUgaW50ZW50aW9uIHRvIHVwZGF0ZSBXZWJLaXRHVEsg
YXMgc29vbiBhcyBJIGhhdmUgc29tZSBzcGFyZQo+ICA+PiBjeWNsZXMgdG8gZmlndXJlIG91dCBh
IGJ1aWxkIGlzc3VlIHdoZW4gWDExIGhlYWRlcnMgYXJlIG5vdCBwcmVzZW50IChlLmcuCj4gID4+
IGluIFdheWxhbmQtb25seSBjb25maWd1cmF0aW9ucyk7IGN1cnJlbnRseSBJIGFscmVhZHkgaGF2
ZSBhIFdJUCBwYXRjaCBzZXQKPiAgPj4gaGVyZToKPiAgPj4gCj4gID4+IGh0dHBzOi8vZ2l0LnNy
Lmh0L35hcGVyZXpkYy9idWlsZHJvb3QvbG9nL3dpcC93ZWJraXRndGsKPiAKPiAgPiBIZXJlIHdl
IGdvOiBodHRwczovL2J1Z3Mud2Via2l0Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjM2NzcwIOKAlCB0
dXJucyBvdXQgdGhlCj4gID4gYnVpbGQgd2FzIGJyb2tlbiBpbiB0aGUgZGV2ZWxvcG1lbnQgYnJh
bmNoIGFzIHdlbGwsIGFuZCBJIHBsYW4gdG8gYmFja3BvcnQKPiAgPiB0aGUgcGF0Y2ggdG8gMi4z
NC54Lgo+IAo+ICA+PiBBbHNvIEkganVzdCBzdWJtaXR0ZWQgc29tZSBtb21lbnRzIGFnbyBhIHNt
YWxsIHBhdGNoIHRvIHVwZGF0ZSB0aGUgV1BFIFdlYktpdAo+ICA+PiBwYWNrYWdlIHRvIDIuMzQu
NCBhcyB3ZWxsLgo+IAo+ICA+IEkgYW0gcmVsZWFzaW5nIDIuMzQuNiB0aGlzIHdlZWssIHdoaWNo
IHdpbGwgaW5jbHVkZSB0aGUgcGF0Y2ggbWVudGlvbmVkCj4gID4gYWJvdmUsIHNvIEkgd2lsbCBz
dWJtaXQgZGlyZWN0bHkgYW4gdXBkYXRlIHRvIDIuMzQuNiBvbmNlIGl0IGhhcyBiZWVuCj4gID4g
cHVibGlzaGVkLgo+IAo+IE9rLiBFdmVuIHRob3VnaCB3ZSBhcmUgcG9zdC1yYzEsIEkgdGhpbmsg
aXQgc3RpbGwgbWFrZXMgc2Vuc2UgdG8gaW5jbHVkZQo+IHRoaXMgb24gbWFzdGVyIGZvciAyMDIy
LjAyLgoKWWF5LCBnb29kIHRvIGtub3cgd2UgY2FuIGxvb2sgaW50byBoYXZpbmcgdGhlIGxhdGVz
dCBzdGFibGUgdGhlcmUuIFRoZQpyZWxlYXNlcyBhcmUgbm93IGRvbmU6CgogIGh0dHBzOi8vd3Bl
d2Via2l0Lm9yZy9yZWxlYXNlL3dwZXdlYmtpdC0yLjM0LjYuaHRtbAogIGh0dHBzOi8vd2Via2l0
Z3RrLm9yZy8yMDIyLzAyLzE3L3dlYmtpdGd0azIuMzQuNi1yZWxlYXNlZC5odG1sCgpXZSBzdGls
bCBkb24ndCBoYXZlIHRoZSBjb3JyZXNwb25kaW5nIGFkdmlzb3J5IHB1Ymxpc2hlZCAodGhlcmUg
aXMgYSBzZWN1cml0eQpmaXggaW5jbHVkZWQgd2hpY2ggaGFzIGEgQ1ZFIG51bWJlciksIGJ1dCBJ
IGFtIHN0YXJ0aW5nIHJpZ2h0IG5vdyB0byBwcmVwYXJlCnRoZSBwYXRjaGVzIHRvIHVwZGF0ZSB0
aGUgQnVpbGRyb290IHBhY2thZ2VzID0pCgpDaGVlcnMsCuKAlEFkcmnDoW4K

--qpEqoHH4IGI2E7C/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYg5lLwAKCRCRxVnb5MkS
Oz/IAJ9mNdyVrJZxX3gdaHFxkHm4Ypv8MwCfeDUmvws2Nqs+FFSNrSfhfWWSMhA=
=4dE9
-----END PGP SIGNATURE-----

--qpEqoHH4IGI2E7C/--

--===============2997586013142801155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2997586013142801155==--
