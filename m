Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193A6C52D1D
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 16:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B830380E27;
	Wed, 31 Jul 2024 16:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id siIrmC1JhuNu; Wed, 31 Jul 2024 16:37:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB39980E74
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB39980E74;
	Wed, 31 Jul 2024 16:37:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC8981BF3D8
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 16:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A705C60B0C
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 16:35:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0uUxzpcmpyMM for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 16:35:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6989F60AF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6989F60AF0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6989F60AF0
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 16:35:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2D9B240004;
 Wed, 31 Jul 2024 16:35:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sZCIK-005Ina-1C;
 Wed, 31 Jul 2024 18:35:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Alexis =?utf-8?Q?Lothor=C3=A9?= via buildroot <buildroot@buildroot.org>
References: <20240313224610.2743219-1-alexis.lothore@bootlin.com>
 <20240313224610.2743219-3-alexis.lothore@bootlin.com>
Date: Wed, 31 Jul 2024 18:35:20 +0200
In-Reply-To: <20240313224610.2743219-3-alexis.lothore@bootlin.com> ("Alexis
 =?utf-8?Q?Lothor=C3=A9?= via buildroot"'s message of "Wed, 13 Mar 2024
 23:46:10 +0100")
Message-ID: <878qxhtt87.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/qt5/qt5webkit: fix WebCore
 compatibility issue with updated libxml2
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkFsZXhpcyIgPT0gQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnPiB3cml0ZXM6CgogPiBGcm9tOiBBbGV4aXMgTG90aG9yw6kgPGFsZXhp
cy5sb3Rob3JlQGJvb3RsaW4uY29tPgogPiBxdDV3ZWJraXQgYnVpbGQgY3VycmVudGx5IGJyZWFr
cyBvbiB0aGUgZm9sbG93aW5nIGVycm9yOgoKID4gWFNMU3R5bGVTaGVldExpYnhzbHQuY3BwOjE0
ODoxMjk6IGVycm9yOiBpbnZhbGlkIGNvbnZlcnNpb24gZnJvbSDigJh2b2lkCiA+ICgqKSh2b2lk
KiwgeG1sRXJyb3IqKeKAmSB7YWthIOKAmHZvaWQgKCopKHZvaWQqLCBfeG1sRXJyb3IqKeKAmX0g
dG8KID4g4oCYeG1sU3RydWN0dXJlZEVycm9yRnVuY+KAmSB7YWthIOKAmHZvaWQgKCopKHZvaWQq
LCBjb25zdCBfeG1sRXJyb3IqKeKAmX0KID4gWy1mcGVybWlzc2l2ZV0KID4gICAxNDggfCBYTUxE
b2N1bWVudFBhcnNlclNjb3BlIHNjb3BlKGNhY2hlZFJlc291cmNlTG9hZGVyKCksCiA+IFhTTFRQ
cm9jZXNzb3I6OmdlbmVyaWNFcnJvckZ1bmMsIFhTTFRQcm9jZXNzb3I6OnBhcnNlRXJyb3JGdW5j
LAogPiBjb25zb2xlKTsKID4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KID4gICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwKID4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQKID4gICAgICAgfCAoKiko
dm9pZCosIHhtbEVycm9yKikge2FrYSB2b2lkICgqKSh2b2lkKiwgX3htbEVycm9yKil9CgogPiBU
aGlzIGVycm9yIGlzIGR1ZSB0byBhbiBBUEkgdXBkYXRlIGluIGxpYnhtbDIsIGVuZm9yY2luZyBj
b25zdCBvbiBtb3JlCiA+IHN0cnVjdCBpbiB2ZXJzaW9uIDIuMTIuMCAoc2VlIFsxXSkuIEJ1aWxk
cm9vdCBub3cgdHJhY2tzIHYyLjEyLjUuCiA+IFVwc3RyZWFtIFdlYmtpdCBwcm9qZWN0IGhhcyBh
bHJlYWR5IGlzc3VlZCB0aGUgY29ycmVzcG9uZGluZyBmaXggKFsyXSksCiA+IHdoaWNoIHVwZGF0
ZXMgY29ycmVzcG9uZGluZyBpbnRlcm5hbCBwcm90b3R5cGVzIGRlcGVuZGluZyBvbiBsaWJ4bWwy
CiA+IHZlcnNpb24sIGJ1dCB0aGUgcXQ1d2Via2l0IHZlcnNpb24gdHJhY2tlZCBpbiBidWlsZHJv
b3QgZG9lcyBub3QgaW50ZWdyYXRlCiA+IHRoZSBjb3JyZXNwb25kaW5nIFdlYmtpdCB2ZXJzaW9u
LgoKID4gRml4IHRoaXMgYnVpbGQgaXNzdWUgYnkgYnJpbmdpbmcgdGhlIHVwc3RyZWFtIHBhdGNo
ICJhcyBpcyIgZnJvbSBXZWJraXQKCiA+IFsxXSBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05P
TUUvbGlieG1sMi8tL3JlbGVhc2VzL3YyLjEyLjAKID4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9X
ZWJLaXQvV2ViS2l0L2NvbW1pdC8xYmFkMTc2YjI0OTY1NzlkNzYwODUyYzgwY2ZmM2FkOWZiN2Mz
YTRiCgogPiBTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJv
b3RsaW4uY29tPgoKQ29tbWl0dGVkIHRvIDIwMjQuMDIueCBhbmQgMjAyNC4wNS54LCB0aGFua3Mu
CgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
