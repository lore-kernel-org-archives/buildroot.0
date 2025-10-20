Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D2ACCD193
	for <buildroot@archiver.kernel.org>; Mon, 20 Oct 2025 07:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 400E961348;
	Mon, 20 Oct 2025 07:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1tFx86LMixD; Mon, 20 Oct 2025 07:18:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C415B6131D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C415B6131D;
	Mon, 20 Oct 2025 07:18:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60FEC177
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 07:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49ECE4082A
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 07:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aaWvvawtfSjT for <buildroot@buildroot.org>;
 Mon, 20 Oct 2025 07:18:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=romain.gantois@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 504E1402F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 504E1402F2
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 504E1402F2
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 07:17:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 06E621A152B
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 07:17:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D28A2606D5
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 07:17:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 341FF102F238E; 
 Mon, 20 Oct 2025 09:17:49 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Oct 2025 09:17:49 +0200
Message-ID: <22876007.EfDdHjke4D@fw-rgant>
In-Reply-To: <20251018194314.114284-12-thomas.petazzoni@bootlin.com>
References: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
 <20251018194314.114284-12-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760944672; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=Im30jemSVkwItOvCnvf8qPqbHmZ2HAgjoQ8mnsP8oQ4=;
 b=jPR5gB5PJYeE1FWn7bWS4RXx8eqlXbK27JuWbcwyM8Tqci9x6vO0N8jUZUTq4J3NU25aQb
 GIjUetRoh51Xg8FBfzKiW42xEE1fKpQyxmPtxbZIMVqu4O4s+2eqoIAlcuoFvJTotjVuEd
 kq5v12FNlSe5hkrNpf5rqDOPzHlsZgpaMKm4BIfDlAl2dUbdSUEeyjWH5NCqSmbEQLMA21
 u1OXILsvM+y6OYWjFtLIeGXtz3zAE32ByNmtjYt7vMFc3m0ALtztfkc9alXYbqJL4nqY25
 VCexrHUGvSgULpTqurwXSuubGdBuRdQnNroW+QYS24UHp3MFmyQWPZUThoTVfA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jPR5gB5P
Subject: Re: [Buildroot] [PATCH 11/11] package/snagboot: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Gantois via buildroot <buildroot@buildroot.org>
Reply-To: Romain Gantois <romain.gantois@bootlin.com>
Content-Type: multipart/mixed; boundary="===============8313074465456792305=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8313074465456792305==
Content-Type: multipart/signed; boundary="nextPart7867956.EvYhyI6sBW";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart7867956.EvYhyI6sBW
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 11/11] package/snagboot: new package
Date: Mon, 20 Oct 2025 09:17:49 +0200
Message-ID: <22876007.EfDdHjke4D@fw-rgant>
In-Reply-To: <20251018194314.114284-12-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0

Hi Thomas,

On Saturday, 18 October 2025 21:43:09 CEST Thomas Petazzoni wrote:
> This commit adds a package for Snagboot, the open-source
...

> +
> +# We do not install the dependencies for the snagfactory GUI
> +define SNAGBOOT_REMOVE_SNAGFACTORY
> +	$(RM) $(HOST_DIR)/bin/snagfactory
> +endef

Only the "gui" variant of the Snagboot package provides Snagfactory, the base 
version doesn't, so is this removal really necessary?

Thanks!

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart7867956.EvYhyI6sBW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEIcCsAScRrtr7W0x0KCYAIARzeA4FAmj14h0ACgkQKCYAIARz
eA6DrA//Wvg/Z8YQsnKhBW5xXGesBQqmZFP7up4NA2N74pql7GsFDGqKgSLwyUA4
hbhJfTN8G/sPwBoe3U0OnBScLdCT24vQkqgjjXbKa1fZBfwyHOmmypWOWdEx83/G
/g1oFG+5Qd1PfDwORSaaYnwDhnJEDrc9yRn4smt1zybPEPgPWnSg/A4nd7pHHUc9
g6S82+eoR30F5XhjP4Xkj086YnxmZnlcN2x7cLfokvV06rmt+tdHmdReL31t1Npa
2bQ3tQGIB/lA8d9Z7DplNYisssuyHCsaGVa8AAi4gwiwbE9l7vhUTGWOWu3TAhgx
k9zH/6GMARF3T5zUViOaNdd/C3tvklYKAlgXBJkKR1SdquzLwA3r3Kn9B2+f8IpR
eSnrkHS9cOmyR2yd1g7BX8oVwL16OggqYbrfqr5xpam80wFdPjbbBJYQj2kJPPSs
rpUz3Voslg0WUVQ6sJjwALhkdF65XWn6HLqw0j7T+PnKqLNrBG/YtODreOA3x+el
WfotnD0vJxCIMvLlvSOw65oFmshdMFFfVJzFUaMUzBqsQ9I+LOtTKsQ0+EDyh6OZ
N36xcb9ZYgZqL+YMX1rgRXToaLKMbpLJb1f057o2D6xFhi3WaX57oDommg/mNStW
R+T50o4nc028VgfXpFSrPyHPGtnWzvhpIN6QGqBg6jGJ/vPnUsk=
=6rQz
-----END PGP SIGNATURE-----

--nextPart7867956.EvYhyI6sBW--




--===============8313074465456792305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8313074465456792305==--



