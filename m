Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8EDC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 21:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40EDE83F82;
	Wed, 20 Jul 2022 21:02:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40EDE83F82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9qJoD0jUgQXH; Wed, 20 Jul 2022 21:02:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5225983F5D;
	Wed, 20 Jul 2022 21:02:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5225983F5D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96E841BF473
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70CEE83F5D
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:02:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70CEE83F5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QAYY_LGRwWtv for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 21:02:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 364C383F55
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 364C383F55
 for <buildroot@busybox.net>; Wed, 20 Jul 2022 21:02:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 04F7760002;
 Wed, 20 Jul 2022 21:02:39 +0000 (UTC)
Date: Wed, 20 Jul 2022 23:02:39 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220720230239.41f80c32@windsurf>
In-Reply-To: <20220615161753.2580142-5-francois.perrad@gadz.org>
References: <20220615161753.2580142-1-francois.perrad@gadz.org>
 <20220615161753.2580142-5-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658350960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p5GXJts/lbnQBEsM1u4UM/nOoDI20S5Q0tdgsXJcEBo=;
 b=BmF5WXTI0o/FAqf9k7pWUXMk1VNndTRfh7qqarCSS60//iWQxnZ7/8lXjtpoKgNvbevY/i
 hCMIgT56PuKTn76ZWnIZpxj50HiA9PAisvwTmautOZi7DjZ45lgDwKh79rAwWGZQu+1saf
 /moFaTkgsKPWhSz3gSwC+EWpieP45+WbkfeQdhuagSokzfw5CV5nHtgU4SZvfM02Ey2noa
 uB84iD5MLHh4RCd2370+4mRHuXHANgJB07aGQeXh8tktZcChThACKMgVtrkOJBn15QS25H
 0t/KS0yYK0zJGjwiJHx5oDFM+Jq5pneB49h/baDhAA6fGsiZNVv0AuvNO/uERA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BmF5WXTI
Subject: Re: [Buildroot] [PATCH 5/5] package/open62541: refactor choice
 UA_NAMESPACE with a proper default
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRnJhbsOnb2lzLAoKT24gV2VkLCAxNSBKdW4gMjAyMiAxODoxNzo1MyArMDIwMApGcmFu
Y29pcyBQZXJyYWQgPGZwZXJyYWRAZ21haWwuY29tPiB3cm90ZToKCj4gU2lnbmVkLW9mZi1ieTog
RnJhbmNvaXMgUGVycmFkIDxmcmFuY29pcy5wZXJyYWRAZ2Fkei5vcmc+CgpTb3JyeSwgYnV0IHRo
aXMgb25lIGRlc2VydmVzIGEgbm9uLWVtcHR5IGNvbW1pdCBsb2cuIFdoeSBhcmUgeW91IGRvaW5n
CnRoaXM/IFdoeSBpcyBCUjJfUEFDS0FHRV9PUEVONjI1NDFfVUFfTkFNRVNQQUNFX1pFUk9fREVG
QVVMVCBnb2luZwphd2F5PyBJcyBpdCBPSyB0byBub3QgaGF2ZSBhbnkgQ29uZmlnLmluLmxlZ2Fj
eSBoYW5kbGluZz8KCkNvdWxkIHlvdSByZXdvcmsgdGhpcyBwYXRjaCBieSBleHBhbmRpbmcgdGhl
IGp1c3RpZmljYXRpb24/CgpUaGFua3MgYSBsb3QhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpv
bmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBl
bmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
