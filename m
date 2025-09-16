Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA79CAC59B
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26E10411A1;
	Tue, 16 Sep 2025 20:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0mfoA_bFM8n0; Tue, 16 Sep 2025 20:03:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72DD7411A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72DD7411A8;
	Tue, 16 Sep 2025 20:03:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A6DA512D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98F59610FE
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zl2kgogao4Aw for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:03:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 868D260B97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 868D260B97
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 868D260B97
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:03:12 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2099452936; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 16 Sep 2025 20:03:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uybtM-0035Aj-2x;
 Tue, 16 Sep 2025 22:03:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Vincent =?utf-8?Q?Stehl=C3=A9?=
 <vincent.stehle@laposte.net>
References: <20250915185448.11118-1-ju.o@free.fr>
 <20250915185448.11118-3-ju.o@free.fr>
Date: Tue, 16 Sep 2025 22:03:08 +0200
In-Reply-To: <20250915185448.11118-3-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Mon, 15 Sep 2025 20:54:48 +0200")
Message-ID: <87ikhi9ncz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=N9j9hGLq+ILkp1NmMbAqHwJzUshWCx1JXbbwiKBC6BvlqgtxoF8SbfFL7Ldwwxo3FRzQ2TT9V4jq5gsxTwlrwjtifdRmazjHlfBMVHmfUKCDzS8wq61FsgZpUgyHwRwOLPBWvs4EZ8xq7Cvvws0ngFtmIj76jvAKUVqp1L09cnvXegqTAGMr7g02hiO+yN3q5+IErDiO2P3lw1fRwwbhc2cgIAtByXIxlxm5V0to7wAyLTV+/SM6mvpqK5UiUCd6j73BVOx93zzbSgx6lt/f/8RvumPJfDtJZL4PGmj9Iu+RIlfNZNMx4o+jbmoWshU6QBWXYZNuiSuO44xvhwAegQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=i0JY4IoXNbMdu1wjS8Jtuojoo2ZX+EAHOsaHEBceIh4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=N9j9hGLq
Subject: Re: [Buildroot] [PATCH 3/3] boot/boot-wrapper-aarch64: bump to git
 commit b621b157b4 (2025-06-10)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkp1bGllbiIgPT0gSnVsaWVuIE9saXZhaW4gdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290
QGJ1aWxkcm9vdC5vcmc+IHdyaXRlczoKCiA+IENoYW5nZWxvZzoKID4gZ2l0IGxvZyAtLW9uZWxp
bmUgYWM2NzQyNTIwZC4uYjYyMWIxNTdiNAoKID4gYjYyMWIxNSBhYXJjaDY0OiBFbmFibGUgYWNj
ZXNzIGludG8gRkVBVF9TUEVfRkRTIHJlZ2lzdGVyIGZyb20gRUwyIGFuZCBiZWxvdwogPiA3ODUz
MDJjIGFhcmNoNjQ6IEVuYWJsZSB1c2Ugb2YgWlQwCiA+IDdmNWE1NDUgYWFyY2g2NDogRW5hYmxl
IHVzZSBvZiBGUE1SCiA+IDBmM2ExNTMgYWFyY2g2NDogc2h1ZmZsZSBJRF9BQTY0UEZSezAsMX1f
RUwxIGRlZmluaXRpb25zCiA+IDBlNzg0OTIgTWFrZWZpbGU6IEVuc3VyZSBpbml0cmQgcGFyYW1l
dGVycyBpbiAvY2hvc2VuIGFyZSB1cC10by1kYXRlCiA+IDE1NzEzNDUgYWFyY2g2NDogRW5hYmxl
IGFjY2VzcyBpbnRvIEZFQVRfUE1VdjNwOSByZWdpc3RlcnMgZnJvbSBFTDIgYW5kIGJlbG93CiA+
IGUxYjkxMzcgYWFyY2g2NDogRW5hYmxlIGFjY2VzcyBpbnRvIEZFQVRfRkdUMiByZWdpc3RlcnMg
ZnJvbSBFTDIgYW5kIGJlbG93CgogPiBDYzogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhs
ZUBsYXBvc3RlLm5ldD4KID4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJl
ZS5mcj4KCkNvbW1pdHRlZCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
