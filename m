Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C46C0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 10:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 172B4408BF;
	Sat, 12 Aug 2023 10:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 172B4408BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10t7F8IIvyqO; Sat, 12 Aug 2023 10:20:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28FCB4089F;
	Sat, 12 Aug 2023 10:19:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28FCB4089F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 794B51BF2C7
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 10:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 533EE81E69
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 10:19:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 533EE81E69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4e-77Saa0iN0 for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 10:19:56 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1EC948179D
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 10:19:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EC948179D
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE8F440002;
 Sat, 12 Aug 2023 10:19:52 +0000 (UTC)
Date: Sat, 12 Aug 2023 12:19:51 +0200
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Message-ID: <20230812121951.582dd68f@windsurf>
In-Reply-To: <21974407.EfDdHjke4D@kilian-aisec>
References: <2691942.mvXUDI8C0e@kilian-aisec> <2160318.Mh6RI2rZIc@kilian-aisec>
 <20230811164858.36987e01@windsurf>
 <21974407.EfDdHjke4D@kilian-aisec>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691835593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JAsYepVAPVsa0s/J9YgwaJmn15e/bXQRmR7HWOV3v1E=;
 b=Pzf7xYdhG9gi4LoFqrk7FsA6ccxqmi+s8Yl+Ad+g7u7nGoSl0EVmhTvN4pRSuN6754X+8/
 0bX0TO3OLMmMntPgv5zh2ga/5OOcKdFT5kwHvlBVkbW7G5ikGhuLGADENdneum8Fyx55BR
 b3iEbBadGNYRIGIcAdIwPmONB5oDgR0z/KsS69qz9alkdX8L6G4FNp1FiIjPYxojfkLAFc
 unhGdOMGc0dVJbfSrl4S/g4SlVZrlXyqREv+eV8q1YX72v5KkaeeCgqadT6/WeBLtdqwE6
 oQT5TDet/FkJ3oPlk2CAXdnOjxsyiDcm653td/9kEDJNyS+Gab09e6Xc4LL7wA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Pzf7xYdh
Subject: Re: [Buildroot] Interested in board support for BeagleV-Ahead
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCAxMiBBdWcgMjAyMyAxMTo1Njo0NSArMDIwMApLaWxpYW4gWmlubmVja2VyIDxraWxp
YW4uemlubmVja2VyQG1haWwuZGU+IHdyb3RlOgoKPiBZZXMsIEkgcmVhbGx5IGFwcHJlY2lhdGUg
YWxsIGluZm9ybWF0aW9uIHRoYXQgbWF5IGhlbHAhIEkgYW0gbm90IHZlcnkgCj4gZXhwZXJpZW5j
ZWQsIGVzcGVjaWFsbHkgd2hlbiBpdCBjb21lcyB0byBhc3NlbWJsaW5nIGEgYm9vdCBpbWFnZSBm
cm9tIHRoZSAKPiBhcnRpZmFjdHMsIHNvIGl0IHdvdWxkIGJlIGEgZ3JlYXQgaGVscC4KCldhbnRl
ZCB0byBleHBlcmltZW50IGEgYml0LiBUdXJucyBvdXQgdGhhdCB0aGUgVVNCIFRUTCBjYWJsZSBJ
IGhhcHBlbgp0byBoYXZlIHdpdGggbWUgZmFsbHMgaW50byB0aGUgIkl0IGhhcyBiZWVuIG5vdGlj
ZWQgdGhhdCA2cGluIEZUREkKY2FibGVzIGxpa2UgdGhpcyBkb2VzbuKAmXQgc2VlbSB3b3JrIHdp
dGggQmVhZ2xlViBBaGVhZCBkZWJ1ZyBwb3J0IGFuZAp0aGVyZSBtaWdodCBiZSBvdGhlciBjYWJs
ZXMvbW9kdWxlcyB0aGF0IHdpbGwgc2hvdyBnYXJiYWdlIHdoZW4KY29ubmVjdGVkIHRvIHRoZSBi
b2FyZCIgYXQKaHR0cHM6Ly9kb2NzLmJlYWdsZWJvYXJkLm9yZy9sYXRlc3QvYm9hcmRzL2JlYWds
ZXYvYWhlYWQvMDItcXVpY2stc3RhcnQuaHRtbCwKc28gSSBkb24ndCBoYXZlIGFjY2VzcyB0byB0
aGUgYm9hcmQgVUFSVCB0byBleHBsb3JlIHRoaW5ncywgc2FkbHkuCgpUaG9tYXMKLS0gClRob21h
cyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
