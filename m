Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA460C79FA1
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 08:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74AC4407C2;
	Fri, 11 Sep 2026 08:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zuPpuyVJamYr; Fri, 11 Sep 2026 08:15:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9E4D940AD7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789114518;
	b=ccIPhlcZGZdRddZh9c/Po6IaAvUdkaPIp/SiqbLtn2cKDaxCvWsRVAYlHembbnQ28aHg
	 xTivL+8KzxD/E+7PBUPLI7BJgwt46mF3JNMQwO4ZbIKr15zezCJ0YTPAtd8rl0ZbOZW0S
	 OTSe2CFu57Gq94fC6gbIQAHtBdNBWSfwHLOY2QVW8uJd+Edx+/WO9gqr7p+66tAq1buNH
	 4LGX85POMhfAqvMbg8GdN3gevzsqjh6UtnxXVlZV609AoIDgh6ADOURbwilikAS7u9Ulg
	 4rrSeaNrIStnEaCOjX3a6EC67jZhXZfrfjxfPxfSuggc0swJKrmrKFPi2EZFSnlYkOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789114518;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Mime-Version:Date:Message-Id:Cc:To:X-Mailer:
	 References:In-Reply-To:X-Last-TLS-Session-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=l8e0HXPEEho6UZu7rDZMh1mDcbMxJN6BU7wdT6YGY+E=;
	b=Jjl1YE8tlW4T9VNjXsQ0Q6iyOgGLOKdmjVuOLkf64mLxqNMppGlypydxTCCm3smVx01r
	 QMy32C2Vgx9KnnfuKvAlTLx2K4YCeALri3c+awehKNzt9vXf2kOtPVJAUOwtIiuKzWJ9C
	 sedTNzgZ+ZHq5VaTtqpIo9ji6lVi0lgfJQnrBKq+/UFddzLJrTagG6ZpXWWYu00AcFoMz
	 zKjXYAeRApDJjZqV6RfXrKl3RqDp2nWS1a4zsA0nemsWb+YSngpf748pwP5lxoE81A6TW
	 2inMAK9lYbdDIlyNVjmbxPfzi80Hcq1EkqnzOO+7QqEhNvzA17jNpbAuSSk6oCBzrig==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789114518;
	bh=l8e0HXPEEho6UZu7rDZMh1mDcbMxJN6BU7wdT6YGY+E=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IK6KwosrE8xp3loSxLZrA18XHVgrsvO5I3hpExymRlJAfJaSovSzW6+8BLye67jmR
	 GWDZWUDrMfHqHrFBTkEk1jWLBMuQi2aA6Gf3mHzk1TRbAZh9vGp4fxbW+ImC19uVzp
	 DyBOENTtbZ+YNx2yTLlIYYb4D0eWDCPdWq69Ljn8iaizeM5bBSSQSDHwUO8y5vKdpJ
	 XjEOu3nO2/JNAbdzV5tbfoSu1v81XKMkZI1mFu8FMwFIBrsBdkC1AgbetYKGQcJ7t8
	 Cp3iSy2C/OjeWrU07vWA59Tyz3wJhzpTOZxRhRM7BznCd/kiNAjZKS2tr6N79Sz+VK
	 OYxhbAKz65EZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E4D940AD7;
	Fri, 11 Sep 2026 08:15:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A4ABB493
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 08:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 961E640AF6
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 08:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pG9dApuig_21 for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 08:15:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 12DDD40AD7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789114516;
 b=Kyj3F0tDMdLv1kkJ8RpyM0MaCE+SRGnWyWA2ZeFCT+UTu5nyXBRuakz4dNaJ/Rv9xk9Z
 SSWU4Z/28k/3pKx/+K8c3xCl0Nzul7kwqA1WInDEPPR210yDNnm6h6MuIWMW6CRzjNIDW
 8olQFehyZVd9saQHHjBRg19lK9H8nL0ax6DhCfbeu3EZ2Tw7SVAsdElcpI2ddDD5CBFWr
 iINDGHlNz1IAE1S61837Sre9Fwy5+hFLr3PGy7bZcYjaIbPiU7pzg5x6tcvGjqCnJ6o2+
 EeZm+gSqpMlAxXQ49q+mWNdNSPRXV+KMZT5IziOssCkFs7kz+Z4t3lD0UMhnt3xmdXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789114516;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Mime-Version:
 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:
 From:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
 bh=OQg96haVOUXNxDRVgaaNzZ5UpwED1Yqgo7NvxYKU0sk=;
 b=Gu+l5ggGwq+4NxejNTtM1mH9//sROf1zICNxxOhKx32d4xusKLZqlxCb7HO8tdn5TQJy
 Yd1EzDywKrq/8f2asaDPovlV4ZhHGBrptzMdPc+UbMXjqR+Nj+xpKHeJyhEYLpc264VW0
 PqmLRwtn7Q6z5dT4koUsDnJ81q5xEaKWwTHqU8W5hTSyQJ/xm3Kjw5deoXEko90AygLWc
 rM9aEAtqGU7bBOhPO7l01F6XY9zwXxDVAXHOFeRZm7W00jVfXrBhGwgy6SuE2o9V9TFh9
 uwhYyDle+c79W7JshlAdyaPfbhv7CcgMjkfBqUFSb4HMSS3SqKq71YoLRlW8M7hF3Pg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="a2sQBE/D"; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12DDD40AD7
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 08:15:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 87C941A0185;
 Fri, 11 Sep 2026 08:15:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 55821601DE;
 Fri, 11 Sep 2026 08:15:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 440BD11C7A35F; 
 Fri, 11 Sep 2026 10:15:11 +0200 (CEST)
Mime-Version: 1.0
Date: Fri, 11 Sep 2026 10:15:10 +0200
Message-Id: <DLCC5VLMUJQ6.3DWP9KWESE5N1@bootlin.com>
Cc: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, "Julien
 Olivain" <ju.o@free.fr>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <buildroot@buildroot.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260911063053.795160-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20260911063053.795160-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/openscap: propagate dependencies of
 libxmlsec1 after bump
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

SGkgVGhvbWFzLAp0aGFua3MgZm9yIHRoZSBmaXguCgpPbiBGcmkgU2VwIDExLCAyMDI2IGF0IDg6
MzAgQU0gQ0VTVCwgVGhvbWFzIFBldGF6em9uaSB3cm90ZToKPiBJbiBjb21taXQKPiBmZWY5Y2Fk
MWZlODRiNDM2NmU3MDVhZGIwMzQ3MGUxMjE5OWZmZDI1ICgicGFja2FnZS9saWJ4bWxzZWMxOiBi
dW1wCj4gdmVyc2lvbiB0byAxLjMuMTIiKSwgbGlieG1sc2VjMSB3YXMgYnVtcGVkLCBhbmQgYWxv
bmdzaWRlIHNvbWUKPiBhZGRpdGlvbmFsICJkZXBlbmRzIG9uIiB3ZXJlIGFkZGVkLgo+Cj4gSG93
ZXZlciwgdGhlc2UgbmV3ICJkZXBlbmRzIG9uIiB3ZXJlIG5vdCBwcm9wYWdhdGUgdG8gcmV2ZXJz
ZQoKcy9wcm9wYWdhdGUvcHJvcGFnYXRlZAoKPiBkZXBlbmRlbmNpZXMgb2YgbGlieG1sc2VjMSwg
aS5lLiBvcGVuc2NhcCwgY2F1c2luZyBLY29uZmlnIHdhcm5pbmdzOgo+Cj4gV0FSTklORzogdW5t
ZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3IgQlIyX1BBQ0tBR0VfTElCWE1MU0VD
MQo+ICAgRGVwZW5kcyBvbiBbbl06IEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzcgWz1uXSAm
JiBCUjJfVE9PTENIQUlOX0hBU19BVE9NSUMgWz1uXQo+ICAgU2VsZWN0ZWQgYnkgW3ldOgo+ICAg
LSBCUjJfUEFDS0FHRV9PUEVOU0NBUCBbPXldICYmIEJSMl9QQUNLQUdFX0xJQkdQR19FUlJPUl9B
UkNIX1NVUFBPUlRTIFs9eV0gJiYgIUJSMl9TVEFUSUNfTElCUyBbPW5dICYmIEJSMl9UT09MQ0hB
SU5fSEFTX1RIUkVBRFNfTlBUTCBbPXldCj4KPiBhbmQgcG90ZW50aWFsbHkgc29tZSBidWlsZCBp
c3N1ZXMsIGV2ZW4gdGhvdWdoIHdlIGRpZG4ndCBjaGVjayBpbiB0aGUKPiBhdXRvYnVpbGRlcnMg
Zm9yIHBvdGVudGlhbCBmYWlsdXJlcy4KPgo+IFRoaXMgY29tbWl0IGZpeGVzIHRoYXQgYnkgcHJv
cGVybHkgcHJvcGFnYXRpbmcgdGhlIG5ldyBkZXBlbmRlbmNpZXMuCj4KPiBDYzogQWxleGlzIExv
dGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KPiBDYzogSnVsaWVuIE9saXZhaW4g
PGp1Lm9AZnJlZS5mcj4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPgoKQWNrZWQtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlz
LmxvdGhvcmVAYm9vdGxpbi5jb20+CgpUaGFua3MsCgpBbGV4aXMKLS0gCkFsZXhpcyBMb3Rob3LD
qSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8v
Ym9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
