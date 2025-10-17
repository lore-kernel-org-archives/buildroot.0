Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40A2CCD195
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 12:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9925A4035A;
	Fri, 17 Oct 2025 12:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CXSJ48Yo192W; Fri, 17 Oct 2025 12:47:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB98340388
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB98340388;
	Fri, 17 Oct 2025 12:47:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EA90975
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 12:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 543B040388
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 12:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ghQrknMhgzI5 for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 12:47:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 607F84035A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 607F84035A
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 607F84035A
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 12:47:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E30BCC041ED;
 Fri, 17 Oct 2025 12:47:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3860E606DB;
 Fri, 17 Oct 2025 12:47:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BB6B6102F2354; 
 Fri, 17 Oct 2025 14:47:31 +0200 (CEST)
Mime-Version: 1.0
Date: Fri, 17 Oct 2025 14:47:30 +0200
Message-Id: <DDKLX5UMW2QX.K1QKLCJF2UC4@bootlin.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 <buildroot@buildroot.org>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Bernd Kuhls"
 <bernd@kuhls.net>, <nicolas.carrier@nav-timing.safrangroup.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251017-libldns_drill-v2-0-f5479778848f@bootlin.com>
 <20251017-libldns_drill-v2-2-f5479778848f@bootlin.com>
In-Reply-To: <20251017-libldns_drill-v2-2-f5479778848f@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760705258; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=q8Qo7Q5RjR/CHgpZVNunGK03HyUIHDJHb3RXNYMDGNg=;
 b=NNgp4Ow6UT7oQm4Kn9OXh5S6dccUArfGyqyL0erUk5A09R+gYTgoowzvurWKQ6vnqMNb3m
 FvmohjSDWAEFpBCruDSlfWArzZLDXczI1HyDkLf97zdxkBX8ljJRZCjwLbLirtFumlW7XV
 DTVA5rsKvOLQn1V7TN4eBMHlJA+b05BGT7Lx4X5ARuhWVgCNxamCAFVLyh1l0r0nlMe7IR
 XT8KRDlfjrtKUuqiHbPTIGYtS0E/l8iNkQuaEhVntMPbHuGkULwWNnOHfi+alr31WyrkNd
 G3LMpFUNDp5wiszyyhU/LtMDHHZ9h5tm2eW4Mc1aTcIYtu9LwcfaGY4XuYG74A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=NNgp4Ow6
Subject: Re: [Buildroot] [PATCH v2 2/2] support/testing: add basic runtime
 test for libldns/drill
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpIE9jdCAxNywgMjAyNSBhdCA5OjM2IEFNIENFU1QsIEFsZXhpcyBMb3Rob3LDqSB3cm90
ZToKPiBBZGQgYSBzaW1wbGUgdGVzdCBlbnN1cmluZyB0aGF0Cj4gLSBsaWJsZG5zIGlzIGNvcnJl
Y3RseSBidWlsdCBhbmQgaW5zdGFsbGVkCj4gLSBkcmlsbCBpcyBjb3JyZWN0bHkgYnVpbHQgYW5k
IGluc3RhbGxlZAo+IC0gZHJpbGwgaXMgYWJsZSB0byBleGVjdXRlIG9uIHRoZSB0YXJnZXQKPgo+
IFNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5j
b20+CgpJIHVuZm9ydHVuYXRlbHkgZm9yZ290IHRvIGNvbGxlY3QgVGhvbWFzJ3MgUkIgb24gdGhp
cyBwYXRjaCBiZWZvcmUgc2VuZGluZwp0aGUgdjIuIEknbGwgcmVtZW1iZXIgdG8gYWRkIGl0IGlm
IHRoZSBzZXJpZXMgbmVlZHMgYSB2My4KCkFsZXhpcwoKLS0gCkFsZXhpcyBMb3Rob3LDqSwgQm9v
dGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxp
bi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
