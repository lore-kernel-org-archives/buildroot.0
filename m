Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE09C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 14:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38B4D60BCD;
	Thu, 10 Feb 2022 14:32:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l2VmKxfD2hCs; Thu, 10 Feb 2022 14:32:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7477160AF2;
	Thu, 10 Feb 2022 14:32:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E92D91BF2AA
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 14:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4BAB40997
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 14:32:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cwqzcpQStU8y for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 14:32:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FCE140990
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 14:32:29 +0000 (UTC)
Received: from smtpclient.apple ([151.18.8.18])
 by Aruba Outgoing Smtp  with ESMTPA
 id IAUknPizy4NL9IAUlnHnCM; Thu, 10 Feb 2022 15:32:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644503548; bh=O/EkUypbcnG3yxKaD7c2HkCUJC/ri3mYDNefX/fRyl0=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=dm29RfUR4z1GxAsEq0dVwKGvqb/tbVYvsi3BgtVhI1rPm6qOYtQ9W+Uco39OkH9/F
 AtXYBBu0HXihBFABhxb2OLQmWvXywA5acb9B15KGcZC7vL+3GiT9IjJ3A8rOEKpuNt
 Gby+zv+Eq1EJp2nbbFstemvjlSnP42dpbNETdH7IjW9HTLAhVQ2RgXkc80IR9zSvB+
 P5eL3bbPSXnVH1cqMWV01Ud0cLkeQ4w42GygsRvrN/PlHdVgVV4Hmxy1TktFCVImjq
 Pt+WGBiFXk+i+Yzhj53dUeLFTkfIM5MXgCG05rE6op7WfQLFPUrBLOjek/BLdhRBEv
 qImvDyJr9vvow==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 10 Feb 2022 15:32:25 +0100
Message-Id: <92FA06A8-01FB-46CC-A9B8-8883406C1D11@benettiengineering.com>
References: <SJ0PR02MB7758B9CB742E063B547278E3D72F9@SJ0PR02MB7758.namprd02.prod.outlook.com>
In-Reply-To: <SJ0PR02MB7758B9CB742E063B547278E3D72F9@SJ0PR02MB7758.namprd02.prod.outlook.com>
To: Neal Frager <nealf@xilinx.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfK/SQ8NGj6+GhnqH7iqyVro9yyeteL68Q2glln8Kya8x3MryhvKfpJlIxqyrWPEb/0+tegQ9D+S2b8J9nHBd1PPNt34XVySh9Huy9hvALz9kyO4KOJ3r
 SHlW3dCyZ5BYGragIN43NgoA+VZoimbsKaai+wskKOEYIW6IfYTTQY9Un/EVNj9J5aVwTuXm4kBSC/o6UEpgyefqQ5VgTUX0ijInksLrpcObp420B2k0HpBM
 2w5gVzg3fra7yiCh4AuxeKYF2od0XEXWxvYoAvqtR+Xcs4VoSmk8WArqqMFWe/t7
Subject: Re: [Buildroot] [PATCH v3 1/2] configs/zynqmp_zcu106: bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: luca@lucaceresoli.net, Michal Simek <michals@xilinx.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTmVhbCwKCj4gSWwgZ2lvcm5vIDEwIGZlYiAyMDIyLCBhbGxlIG9yZSAxNToyMSwgTmVhbCBG
cmFnZXIgPG5lYWxmQHhpbGlueC5jb20+IGhhIHNjcml0dG86Cj4gCj4g77u/SGkgR2l1bGlvLAo+
IAo+PiBJJ3ZlIHJlYnVpbHQgYm90aCBvZiB0aGVtIGFuZCBub3cgdGhleSBoYXZlIG15IHRhZ3Mg
c28gdGhleSBhcmUgcmVhZHkgdG8gYmUgY29tbWl0dGVkIQo+IAo+IEZhbnRhc3RpYyEgIFRoYW5r
IHlvdSBzbyBtdWNoIGZvciB5b3VyIHJlYWN0aXZpdHkgYW5kIHN1cHBvcnQuICBOb3cgdGhhdCB3
ZSBoYXZlIGRvbmUgdGhpcyBvbmNlLCBmdXR1cmUgdmVyc2lvbiBidW1wcyB3aWxsIGJlIG11Y2gg
ZWFzaWVyLgoKWWVzIDotKQoKPiAgUGxlYXNlIGxldCBtZSBrbm93IHdoZW4gdGhlIHBhdGNoZXMg
YXJlIGNvbW1pc3RlLCBzbyB0aGF0IEkgY2FuIGNsb25lIHRoZSBuZXcgdHJlZS4KCllvdSB3aWxs
IGJlIGluIENjIG9uY2UgY29tbWl0dGVkLgoKQmVzdCByZWdhcmRzCkdpdWxpbwoKPiAKPiBCZXN0
IHJlZ2FyZHMsCj4gTmVhbCBGcmFnZXIKPiBYaWxpbngKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
