Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C2EC02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 15:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5FED42C3B;
	Fri,  7 Feb 2025 15:03:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e70MkrTNYyAI; Fri,  7 Feb 2025 15:03:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D78542B98
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D78542B98;
	Fri,  7 Feb 2025 15:03:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A7964CF
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 15:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C17B60BA8
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 15:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u35aZ2rD7-dR for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 15:03:41 +0000 (UTC)
X-Greylist: delayed 314 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 07 Feb 2025 15:03:40 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 64E1F704A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64E1F704A3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:748:100:40::2:5;
 helo=mout3.freenet.de; envelope-from=prvs=013339b121=earthquake.de@freenet.de;
 receiver=<UNKNOWN> 
Received: from mout3.freenet.de (mout3.freenet.de [IPv6:2001:748:100:40::2:5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64E1F704A3
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 15:03:40 +0000 (UTC)
Received: from [194.97.210.51] (helo=sub3.mail.fnrz.de)
 by mout3.freenet.de with esmtpa (ID earthquake.de@freenet.de) (port 25) (Exim
 4.94.2 #2) id 1tgPoE-007kwZ-98; Fri, 07 Feb 2025 15:58:22 +0100
Received: from p5df03b90.dip0.t-ipconnect.de ([93.240.59.144]:64524
 helo=[10.32.8.78])
 by sub3.mail.fnrz.de with esmtpsa (ID earthquake.de@freenet.de)
 (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_128_GCM:128) (port 465)
 (Exim 4.96 #2) id 1tgPoD-009PDS-2Y; Fri, 07 Feb 2025 15:58:22 +0100
Message-ID: <32bc46d1-58e9-48af-af2c-1bfbc406d4c9@freenet.de>
Date: Fri, 7 Feb 2025 15:58:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org, busybox@busybox.net
Content-Language: de-DE
From: Earthquake <earthquake.de@freenet.de>
X-FN-MUUID: 1738940301122757EE1B8BO
X-Originated-At: 93.240.59.144!64524
X-Scan-TS: Fri, 07 Feb 2025 15:58:21 +0100
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=freenet.de; 
 s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
 MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aku1ZMy4cxeIWwKd2zqM415ZV6ImEBlIO4SnJTUtORU=; b=bd0BYMUOW6dUAohaQqXy5TliM7
 yfrEPV+IO2UceY46dnsqRXORMhwOVs+MbOa62TwdBhm9pKhi5EjsKZL9D45ihGBPDD59Vlmk2/FT/
 Gc9NrcINjOGBR9m6lryF2f1eIYNhZufelrAx9ydyA4vOJIPHiu6xY3cWm+GhnHJd/sgubNEQzGNH4
 HPBTqgdNuf3WTmS50mRb7314OnKjbM7/mhBeO7tuNW60WS3iagmPR7SB4A/KsbacIUkbn+//tV4qo
 OGY9+RHQG5JUArwqnrbLuJqay8jHl6tqUynzIJFab+Eu4Ij5UfUyM/d/I4KHhDhayhJgCMhorayPh
 eQQfa00A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=freenet.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=freenet.de header.i=@freenet.de header.a=rsa-sha256
 header.s=mjaymdexmjqk header.b=bd0BYMUO
Subject: [Buildroot] generic-package compiler flags
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpJIGFkZGVkIGFub3RoZXIgcGFja2FnZSB0byBteSBidWlsZHJvb3QgdmlhIGJ1aWxkcm9v
dCBleHRlcm5hbHMuCkl0cyBhIGdlbmVyaWstcGFja2FnZSBpbiB0aGUgbWsgZmlsZSBhbmQgdGhl
IEJVSUxEX0NNRFMgaXMKCiQoTUFLRSkgJChUQVJHRVRfQ09ORklHVVJFX09QVFMpIC1DICQoQEQp
CgpXaXRoaW4gdGhlIHBhY2thZ2Ugc291cmNlLU1ha2VmaWxlIHRoZSAtZlBJQyBpcyBhZGRlZCB0
byBDRkxBR1MKQ0ZMQUdTICs9IC1mUElDCgpPdXRzaWRlIG9mIGJ1aWxkcm9vdCB0aGUgcGFja2Fn
ZSBidWlsZHMgdGhlIGxpYiBhcyAuc28gKC1zaGFyZWQgaXMgYWxzbyAKZGVmaW5lZCksIGJ1dCB3
aXRoaW4gYnVpbGRyb290IHRoZSAtZlBJQyBvcHRpb24gaW4gQ0ZMQUdTIGlzIG1pc3NpbmcuCgpD
RkxBR1Mgd2l0aGluIHRoZSBidWlsZHJvb3QgZW52IGlzOiAtRF9MQVJHRUZJTEVfU09VUkNFIAot
RF9MQVJHRUZJTEU2NF9TT1VSQ0UgLURfRklMRV9PRkZTRVRfQklUUz02NMKgIC1PMiAtZzAgLURf
Rk9SVElGWV9TT1VSQ0U9MQoKSG93IGNhbiBJIHNvbHZlIHRoaXMgYW5kIGFsc28gY2hhbmdlIHRo
ZSAtZzAgYW5kIC1PPwoKCgpUaGFua3MgZm9yIGFuIGFuc3dlcmUuCgpCZXN0IHJlZ2FyZHMsCgpB
bGV4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
