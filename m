Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5802C4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 22:05:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 480B860F5E
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 22:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 480B860F5E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B13281B14;
	Wed, 28 Jul 2021 22:05:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t4AyTYN7YTC2; Wed, 28 Jul 2021 22:05:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B7A981A58;
	Wed, 28 Jul 2021 22:05:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 098A01BF37C
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 22:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBA794026B
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 22:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RzSuRyH8vHKU for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 22:05:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92815400EB
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 22:05:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6504420003;
 Wed, 28 Jul 2021 22:05:20 +0000 (UTC)
Date: Thu, 29 Jul 2021 00:05:18 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Matt Weber <matthew.weber@rockwellcollins.com>
Message-ID: <20210729000518.64432265@windsurf>
In-Reply-To: <20210412162347.15021-1-matthew.weber@rockwellcollins.com>
References: <20210412162347.15021-1-matthew.weber@rockwellcollins.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3] package/xml-security-c: new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Chris Simons <chris.simons@rockwellcollins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8sCgpPbiBNb24sIDEyIEFwciAyMDIxIDExOjIzOjQ3IC0wNTAwCk1hdHQgV2ViZXIgPG1h
dHRoZXcud2ViZXJAcm9ja3dlbGxjb2xsaW5zLmNvbT4gd3JvdGU6Cgo+ICAtIFdvcmtlZCBhcm91
bmQgWGVyY2VzX2F1dG9jb25mX2NvbmZpZy5ocHA6IGVycm9yOiDigJhjaGFyMTZfdOKAmSBkb2Vz
IG5vdCBuYW1lIGEgdHlwZQo+ICAgIGJ5IGRpc2FibGluZyBjb2RlIHNvdXJjZXJ5IHRvb2xjaGFp
bnMKPiAgICAoSVNPIEMrKyBmb3JiaWRzIGRlY2xhcmF0aW9uIC0gcmVxdWlyZXMgSVNPIEMrKyAy
MDExIChjb2RlIHNvdXJjZXJ5IGlzIEdDQyA0LjgpCgpNZWgsIGhvdyBjb21lIGV4Y2x1ZGluZyBh
IENvZGUgU291cmNlcnkgdG9vbGNoYWluIGlzIGEgc29sdXRpb24gdG8KdGhpcz8gTXkgYnVnIHJl
cG9ydCBvbiB0aGUgdjIgd2FzIG5vdCBldmVuIHJlbGF0ZWQgdG8gYSBDb2RlIFNvdXJjZXJ5CnRv
b2xjaGFpbiwgc28gdGhlIHdvcmsgYXJvdW5kIHByb3Bvc2VkIGluIHRoaXMgdjMgZG9lc24ndCBl
dmVuIGZpeCB0aGUKaXNzdWUgcG9pbnRlZCBvdXQgaW4gdjIuCgpBbnl3YXksIHRoZSBwcm9ibGVt
IGlzIHRoYXQgdGhpcyBwYWNrYWdlIHdhcyBub3QgcGFzc2luZyAtc3RkPWMrKzExCndoZW4gYnVp
bGRpbmcgY29kZSwgc28gdGhlIGJ1aWxkIGZhaWxzIG9uIG9sZGVyIGNvbXBpbGVycyB0aGF0IGRp
ZCBub3QKdXNlIEMrKzExIGFzIHRoZWlyIGRlZmF1bHQgc3RhbmRhcmQuIFNvIEkgaGF2ZSBtb2Rp
ZmllZCB0aGUgcGFja2FnZSB0bwpyZXF1aXJlIGdjYyA+PSA0LjcgYW5kIHBhc3MgLXN0ZD1jKysx
MSBpbiBDWFhGTEFHUywgYW5kIGFwcGxpZWQuCgpUaGFua3MhCgpUaG9tYXMKLS0gClRob21hcyBQ
ZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtl
cm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
