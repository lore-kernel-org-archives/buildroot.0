Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A4AC001DE
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 16:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66BF6405DB;
	Tue, 25 Jul 2023 16:38:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66BF6405DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 37KCNgrwK957; Tue, 25 Jul 2023 16:38:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB97841573;
	Tue, 25 Jul 2023 16:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB97841573
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13CA61BF83B
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 16:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3E326109B
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 16:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3E326109B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QtnUC6AWis6Q for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 16:38:51 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61E5960A79
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 16:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61E5960A79
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4328224000C;
 Tue, 25 Jul 2023 16:38:48 +0000 (UTC)
Date: Tue, 25 Jul 2023 18:38:47 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230725183847.16dcc769@windsurf>
In-Reply-To: <20230724120442.191703-1-thomas@devoogdt.com>
References: <20230723092314.129079-4-thomas@devoogdt.com>
 <20230724120442.191703-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690303128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PbDgEZxV2HvJKRQhYJixWvdwXf0MuONKvIzblhCpgyY=;
 b=Or41WkctGLUsJgq3KeWBKQ3vnSj3K60fG2mo8vG7HiY5OaqnUMs7LIAXAA0XFFkCfRd/J6
 gH9j2ZGtb202vBr/ZZtFAAeMJkdLnfxAJuunkw50dCoujAOYqysNeYavdMutML5bsU9TjJ
 RRwNk99IYUy64S300vMTqUDNHDf09KdSFqt/EcUj1W4OL/NLD3gb7AeTWE6Vkee/BKn6D+
 IEmuV2zpio55S4rZDAwCSLVVliYFCWaOI2QX/Chaj1mFLIkC0Dwa9FLlbKaBycbfYEIMgl
 jq8oUaPL0uK7JPzum5TvQB0YE7JeLVk2vz47tgTVTX17wJW4G3QuDQwZxWNqaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Or41Wkct
Subject: Re: [Buildroot] [PATCH v4] package/fluent-bit: rework wasm handling
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

T24gTW9uLCAyNCBKdWwgMjAyMyAxNDowNDo0MiArMDIwMApUaG9tYXMgRGV2b29nZHQgPHRob21h
c0BkZXZvb2dkdC5jb20+IHdyb3RlOgoKPiBGbHVlbnQtYml0IGlzbid0IHZlcnkgZ3JlYXQgYXQg
c3VwcG9ydGluZyB0aGUgdmFyaW91cyBhcmNoaXRlY3R1cmVzLAo+IHNvIGhlbHAgYSBsaXR0bGUg
Yml0IGJ5IGRlZmluaW5nIHRoZSBXQU1SX0JVSUxEX1RBUkdFVCBvdXJzZWx2ZXMuCj4gCj4gVHdv
IGZhaWx1cmVzIGZvciBNSVBTIHdoaWxlIGV4ZWN1dGluZyAuL3V0aWxzL3Rlc3QtcGtnOgo+IAo+
IC0gc291cmNlcnktbWlwczY0Ogo+IGNvcmUvaXdhc20vY29tbW9uL2FyY2gvaW52b2tlTmF0aXZl
X21pcHMuczogQXNzZW1ibGVyIG1lc3NhZ2VzOgo+IGNvcmUvaXdhc20vY29tbW9uL2FyY2gvaW52
b2tlTmF0aXZlX21pcHMuczo1ODogRXJyb3I6IG9wY29kZSBub3Qgc3VwcG9ydGVkIG9uIHRoaXMg
cHJvY2Vzc29yOiBtaXBzNjRyMiAobWlwczY0cjIpIGBsZGMxICRmMTIsMCgkc3ApJwo+IGNvcmUv
aXdhc20vY29tbW9uL2FyY2gvaW52b2tlTmF0aXZlX21pcHMuczo1OTogRXJyb3I6IG9wY29kZSBu
b3Qgc3VwcG9ydGVkIG9uIHRoaXMgcHJvY2Vzc29yOiBtaXBzNjRyMiAobWlwczY0cjIpIGBsZGMx
ICRmMTQsOCgkc3ApJwo+IG1ha2VbNF06ICoqKiBbc3JjL3dhc20vQ01ha2VGaWxlcy92bWxpYi1z
dGF0aWMuZGlyL2J1aWxkLm1ha2U6NDk1OiBzcmMvd2FzbS9DTWFrZUZpbGVzL3ZtbGliLXN0YXRp
Yy5kaXIvX18vX18vbGliL3dhc20tbWljcm8tcnVudGltZS1XQU1SLTEuMS4xL2NvcmUvaXdhc20v
Y29tbW9uL2FyY2gvaW52b2tlTmF0aXZlX21pcHMucy5vXSBFcnJvciAxCj4gbWFrZVs0XTogKioq
IFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KPiAKPiAtIHNvdXJjZXJ5LW1pcHM6Cj4g
Y29yZS9pd2FzbS9jb21tb24vYXJjaC9pbnZva2VOYXRpdmVfbWlwcy5zOiBBc3NlbWJsZXIgbWVz
c2FnZXM6Cj4gY29yZS9pd2FzbS9jb21tb24vYXJjaC9pbnZva2VOYXRpdmVfbWlwcy5zOjU4OiBF
cnJvcjogb3Bjb2RlIG5vdCBzdXBwb3J0ZWQgb24gdGhpcyBwcm9jZXNzb3I6IG1pcHMzMnIyICht
aXBzMzJyMikgYGxkYzEgJGYxMiwwKCRzcCknCj4gY29yZS9pd2FzbS9jb21tb24vYXJjaC9pbnZv
a2VOYXRpdmVfbWlwcy5zOjU5OiBFcnJvcjogb3Bjb2RlIG5vdCBzdXBwb3J0ZWQgb24gdGhpcyBw
cm9jZXNzb3I6IG1pcHMzMnIyIChtaXBzMzJyMikgYGxkYzEgJGYxNCw4KCRzcCknCj4gbWFrZVs0
XTogKioqIFtzcmMvd2FzbS9DTWFrZUZpbGVzL3ZtbGliLXN0YXRpYy5kaXIvYnVpbGQubWFrZTo0
OTU6IHNyYy93YXNtL0NNYWtlRmlsZXMvdm1saWItc3RhdGljLmRpci9fXy9fXy9saWIvd2FzbS1t
aWNyby1ydW50aW1lLVdBTVItMS4xLjEvY29yZS9pd2FzbS9jb21tb24vYXJjaC9pbnZva2VOYXRp
dmVfbWlwcy5zLm9dIEVycm9yIDEKPiBtYWtlWzRdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hl
ZCBqb2JzLi4uLgo+IAo+IFdoaWNoIGFyZSBmaXhlZCBieSBzZXR0aW5nIHRoZSBvYnNjdXJlIGZs
YWcgIldBTVJfQlVJTERfSU5WT0tFX05BVElWRV9HRU5FUkFMIi4KPiAKPiBTZWUgaHR0cHM6Ly9n
aXRodWIuY29tL2J5dGVjb2RlYWxsaWFuY2Uvd2FzbS1taWNyby1ydW50aW1lL2lzc3Vlcy82MjUg
Zm9yIG1vcmUgaW5mbzoKPiDigJxIaSwgYnVpbGRpbmcgdGhlIGludm9rZU5hdGl2ZV9nZW5lcmFs
LmMgZXhwbGljaXRseSBpcyBzdXBwb3J0ZWQgbm93LCBwbGVhc2UgcHVsbCB0aGUgbGF0ZXN0IGNv
ZGUgYW5kIHVzZQo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBEZXZvb2dkdCA8dGhvbWFzQGRl
dm9vZ2R0LmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21h
cyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
