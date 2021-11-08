Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F07C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 10:19:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 355F86103A
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 10:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 355F86103A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0517680D58;
	Mon,  8 Nov 2021 10:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OWRLy64lUR_V; Mon,  8 Nov 2021 10:19:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EB0080D40;
	Mon,  8 Nov 2021 10:19:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46DE91BF36C
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 10:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42FC340182
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 10:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P5v5T3l4mpEu for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 10:19:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25EB440163
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 10:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:To:From:Message-ID:Date;
 bh=z5NpPE2GNzhUcjghzazn+no8TlnrdQBEBTZgGDCdxSo=; 
 b=CqisLhHyPVZuRX79H41clkDleBuXaXxek2uW3A4dzgysdDy+vMT6nVIYR55HcS5vKx52UslBl04KKETV+oIolsGpmsm7BRRwny7/QA2FV8Xcx5IKDPaUmteDEHZrot/PlmLwmVnICaLev5ujEaTAU9dujfZgccsTPtfHTi8SXTx0MGCMc6aklNRiilPU+5eAnTHnGCdmT34J/VfJaDwmphnmjMVAoPyQBUR2vQ6kWycDxCuHFiPfFVc2afXYK0W6fcu6ZJtGH7HE2Fh3gHeZ/9SyshEQCFsPcEm54GbBltJHQ1a+/Sm4rRUm1PnJmZHPeqbPim0jNXghc+eJQo1aKA==;
Received: from 91-153-34-221.elisa-laajakaista.fi ([91.153.34.221] helo=momiji)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mk1ku-0007Hk-51
 for <buildroot@buildroot.org>; Mon, 08 Nov 2021 11:20:00 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id a3c34488
 for <buildroot@buildroot.org>; Mon, 8 Nov 2021 10:19:23 +0000 (UTC)
Date: Mon, 8 Nov 2021 12:19:23 +0200
Message-ID: <20211108121923.GB462971@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
In-Reply-To: <20211107065455.CED66402C5@smtp4.osuosl.org>
References: <20211107065455.CED66402C5@smtp4.osuosl.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-11-06
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
Content-Type: multipart/mixed; boundary="===============4645197515873045436=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4645197515873045436==
Content-Type: multipart/signed; boundary="XPsCR0jrZfJkaIGl"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--XPsCR0jrZfJkaIGl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gU3VuLCAwNyBOb3YgMjAyMSAwNjo1NDo1MSArMDAwMCBUaG9tYXMgUGV0YXp6b25pIDx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gICBhYXJjaDY0ICAgIHwgICAgICAg
IHdlYmtpdGd0ay0yLjMyLjQgICAgICAgIHwgTk9LIHwgaHR0cDovL2F1dG9idWlsZC5idWlsZHJv
b3QubmV0L3Jlc3VsdHMvMmZiYmY2NWEzZGQ4YjY5MTZmYWRiNDU5YWYxYjMwOGY4OGI1ODU1NCB8
ICAgICAKClRoaXMgaXMgYSBidWlsZCBmYWlsdXJlIHdoaWNoIGhhZCBiZWVuIHJlcG9ydGVkIGlu
IHRoZSBwYXN0IGluIFdlYktpdCdzCkJ1Z3ppbGxhLCBidXQgd2Ugd2VyZSBub3QgYWJsZSB0byBm
aW5kIGEgd2F5IHRvIHJlbGlhYmx5IHJlcHJvZHVjZToKCiAgaHR0cHM6Ly9idWdzLndlYmtpdC5v
cmcvc2hvd19idWcuY2dpP2lkPTIwODkwNyNjMTEKCkknbGwgdHJ5IHRvIGNvbWUgdXAgd2l0aCBh
IGZpeCB0aGlzIHdlZWsgbm93IHRoYXQgd2UgaGF2ZSB0aGlzIGF1dG9idWlsZGVyCmNvbmZpZ3Vy
YXRpb24gdG8gcmVwcm9kdWNlIGl0IHJlbGlhYmx5IDopCgoKQ2hlZXJzLArigJRBZHJpw6FuCg==

--XPsCR0jrZfJkaIGl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYYj5qwAKCRCRxVnb5MkS
OwQTAJ0QBnTH8vMHKpn+LGIxH3hMLpDWTQCfawW4KSxCLYQX6PmTDEz5a0a3byY=
=uXr/
-----END PGP SIGNATURE-----

--XPsCR0jrZfJkaIGl--

--===============4645197515873045436==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4645197515873045436==--
