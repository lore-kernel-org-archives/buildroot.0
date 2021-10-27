Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC669C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 15:00:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1A2960EFF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 15:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1A2960EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55B474040C;
	Wed, 27 Oct 2021 15:00:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fgxmmGOW4stt; Wed, 27 Oct 2021 15:00:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45F5D40420;
	Wed, 27 Oct 2021 15:00:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C8451BF2F4
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 15:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C2758197D
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 15:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-6o3pnwFR-r for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 15:00:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C6C8818C4
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 15:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date;
 bh=pUjQVcBcHs5UizzMXwMGvdSqOm0sHWz7aJNmKn4oPJM=; 
 b=rpHuAj5YrG0Xn+OdhLzyZxjdieSQWjdOFPg89P5THtD61Vh8ie/gLJ9f4nfdh8lakC3uZvFeRA3+7HF/r6TidNj736WZ9waPOKifCG5Y+idCkoP6t4piloIXTlQK8/0fyTudpLmRq9NzeiRA2NmWKuuMbObXMUG9i+0pleCxwXacgC+5yHYkCaMclqtyNYPIs5VMg/ejmAO3Y7jDgGvY+yZZuagsFezVPB+IiBQOJQjGN1C/6/mtPPD4k8Vulm4ZyNHLhsFoDWkIniV5xy0XACDMK/wamiDJaI6vQgOPmDBdapkpAG/Ptjt0TMelqmeALBVZqV7OqjH6MI0shVkXRQ==;
Received: from 91-153-34-142.elisa-laajakaista.fi ([91.153.34.142] helo=momiji)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mfkPh-0007I9-34; Wed, 27 Oct 2021 17:00:25 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id f9f0e069;
 Wed, 27 Oct 2021 15:00:14 +0000 (UTC)
Date: Wed, 27 Oct 2021 18:00:08 +0300
Message-ID: <20211027180008.GB3460036@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20211025080446.3860462-1-james.hilliard1@gmail.com>
References: <20211025080446.3860462-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libpsl: remove docs config
 option
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============9212678222973492014=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============9212678222973492014==
Content-Type: multipart/signed; boundary="ffJBodNAfAmyzaou"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--ffJBodNAfAmyzaou
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gTW9uLCAyNSBPY3QgMjAyMSAwMjowNDo0NiAtMDYwMCBKYW1lcyBIaWxsaWFyZCA8amFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4gVGhpcyBvcHRpb24gaXMgb25seSBhdmFpbGFi
bGUgaW4gbWFzdGVyIGFuZCBub3QgYW55IHJlbGVhc2UuCj4gCj4gRml4ZXM6Cj4gb3V0cHV0L2J1
aWxkL2xpYnBzbC0wLjIxLjEvbWVzb24uYnVpbGQ6MTowOiBFUlJPUjogVW5rbm93biBvcHRpb25z
OiAiZG9jcyIKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlh
cmQxQGdtYWlsLmNvbT4KCkFja2VkLWJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpA
aWdhbGlhLmNvbT4KCj4gLS0tCj4gIHBhY2thZ2UvbGlicHNsL2xpYnBzbC5tayB8IDEgLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xp
YnBzbC9saWJwc2wubWsgYi9wYWNrYWdlL2xpYnBzbC9saWJwc2wubWsKPiBpbmRleCA2OWU1ZGE0
Y2E0Li41ZGMwM2E3YzI0IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGlicHNsL2xpYnBzbC5tawo+
ICsrKyBiL3BhY2thZ2UvbGlicHNsL2xpYnBzbC5tawo+IEBAIC0xMCw3ICsxMCw2IEBAIExJQlBT
TF9MSUNFTlNFID0gTUlULCBCU0QtMy1DbGF1c2UKPiAgTElCUFNMX0xJQ0VOU0VfRklMRVMgPSBD
T1BZSU5HIHNyYy9MSUNFTlNFLmNocm9taXVtCj4gIExJQlBTTF9ERVBFTkRFTkNJRVMgPSBob3N0
LXBrZ2NvbmYKPiAgTElCUFNMX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+IC1MSUJQU0xfQ09ORl9P
UFRTID0gLURkb2NzPWZhbHNlCj4gIAo+ICAjIFRoZSBvcmRlciBvZiBjaGVja3MgaXMgdGhlIHNh
bWUgYXMgZG9uZSBieSBsaWJwc2wgd2hlbiBjb25maWd1cmVkLgo+ICBpZmVxICgkKEJSMl9QQUNL
QUdFX0xJQklETjIpJChCUjJfUEFDS0FHRV9MSUJVTklTVFJJTkcpLHl5KQo+IC0tIAo+IDIuMjUu
MQoKQ2hlZXJzLArigJRBZHJpw6FuCg==

--ffJBodNAfAmyzaou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYXlpeAAKCRCRxVnb5MkS
O+MLAJ9Eh6ZjNTvTu1vW4lmBg3mSXl0QNACfduDlke/DIpUmUMXWEu18wZ8Vpsg=
=osMC
-----END PGP SIGNATURE-----

--ffJBodNAfAmyzaou--

--===============9212678222973492014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9212678222973492014==--
