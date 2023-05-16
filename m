Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5671C77B75
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 11:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46E6F41858;
	Tue, 16 May 2023 11:50:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46E6F41858
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cqw_ua8NKy96; Tue, 16 May 2023 11:50:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51D0A41828;
	Tue, 16 May 2023 11:50:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51D0A41828
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD5D51BF591
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 11:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93373402CE
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 11:50:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93373402CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YarvTO2rsN8y for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 11:50:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF67F40119
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF67F40119
 for <buildroot@buildroot.org>; Tue, 16 May 2023 11:50:46 +0000 (UTC)
Received: from 91-153-34-68.elisa-laajakaista.fi ([91.153.34.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pytCV-00AjPp-1e; Tue, 16 May 2023 13:50:43 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id af6a6141;
 Tue, 16 May 2023 11:50:41 +0000 (UTC)
Date: Tue, 16 May 2023 14:50:35 +0300
Message-ID: <20230516145035.GB2291336@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20230516080117.18721-1-thomas@devoogdt.com>
References: <20230516080117.18721-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wnb0QVzflGuXPtxEUtu/hzLCTiZJG3nzqPu4V4W6Oms=; b=C9ip6BYkDk4T1swj6EjZ60fbxk
 m+vQ4sY1h6CM89JJVkK5GOslleRnrE6E2mdwmqIopqXWDZczj3G4PlJIRvSu2XRMxmEWo8laCKx5p
 vZKoWwLexoSgATm5NtN1GvSpvehweroj0KfLBck3a/DRMWTY58JpmwQQW8X9fXtsMTQUlQtndTh9n
 xnY3aMpLOzEL0T7y4AMpqlVf7m2L0wQTj08r+zOh0wmXKlmZ9PUCFimJVumGAyUWB+CRZf4vyAjAL
 2c972Cq5qmb/z/cgwNT3SNMfYe2rvrrJdQBAztOEZrx1uOEyts3oKtcr73tLFVRCK1aLaE+Vft+xF
 z9n1o4DQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=C9ip6BYk
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: fix GCC version in
 comment
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
Content-Type: multipart/mixed; boundary="===============2166385312077136099=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2166385312077136099==
Content-Type: multipart/signed; boundary="4VH3Nx3NIY8aK9et"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--4VH3Nx3NIY8aK9et
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gVHVlLCAxNiBNYXkgMjAyMyAxMDowMToxNyArMDIwMCBUaG9tYXMgRGV2b29nZHQgPHRob21h
c0BkZXZvb2dkdC5jb20+IHdyb3RlOgo+IENvbW1pdCA0YzdmY2JiZTc1ZGU1YzUzNWU4ZDVkZDcx
ODI5MDBiNmQwOWUyYjAzIHNob3VsZCBoYXZlIHNldCBpdCB0byBHQ0MgOC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgRGV2b29nZHQgPHRob21hc0BkZXZvb2dkdC5jb20+CgpSZXZpZXdlZC1i
eTogQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+Cgo+IC0tLQo+ICBw
YWNrYWdlL3dlYmtpdGd0ay9Db25maWcuaW4gfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dlYmtp
dGd0ay9Db25maWcuaW4gYi9wYWNrYWdlL3dlYmtpdGd0ay9Db25maWcuaW4KPiBpbmRleCA5NzYz
NDEwOTNlLi4yM2MwYmY0MWRiIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvd2Via2l0Z3RrL0NvbmZp
Zy5pbgo+ICsrKyBiL3BhY2thZ2Uvd2Via2l0Z3RrL0NvbmZpZy5pbgo+IEBAIC0yMSw3ICsyMSw3
IEBAIGNvbW1lbnQgIndlYmtpdGd0ayBuZWVkcyBsaWJndGszIGFuZCBhIHRvb2xjaGFpbiB3LyBD
KyssIHdjaGFyLCB0aHJlYWRzLCBkeW5hbWljCj4gIAlkZXBlbmRzIG9uICFCUjJfQklORk1UX0ZM
QVQKPiAgCWRlcGVuZHMgb24gIUJSMl9QQUNLQUdFX0xJQkdUSzMgfHwgIUJSMl9JTlNUQUxMX0xJ
QlNURENQUCB8fCBcCj4gIAkJIUJSMl9VU0VfV0NIQVIgfHwgIUJSMl9UT09MQ0hBSU5fSEFTX1RI
UkVBRFMgfHwgQlIyX1NUQVRJQ19MSUJTIHx8IFwKPiAtCQkhQlIyX1RPT0xDSEFJTl9HQ0NfQVRf
TEVBU1RfNyB8fCBcCj4gKwkJIUJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzggfHwgXAo+ICAJ
CSFCUjJfSE9TVF9HQ0NfQVRfTEVBU1RfNF85Cj4gIAlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VCj4g
IAo+IC0tIAo+IDIuMzQuMQo+IAo+IAoKQ2hlZXJzLArigJRBZHJpw6FuCg==

--4VH3Nx3NIY8aK9et
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZGNuCwAKCRCRxVnb5MkS
O7PcAJ9dfWDVz6MDks0+A1thyKEuAm8oxQCfS6XYKl1b6oZ/BNm/ECHv2pM1IiA=
=nFsd
-----END PGP SIGNATURE-----

--4VH3Nx3NIY8aK9et--

--===============2166385312077136099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2166385312077136099==--
