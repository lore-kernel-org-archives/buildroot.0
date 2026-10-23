Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBE3606A331
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 09:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TpZq6TUY
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE69160669;
	Fri, 23 Oct 2026 09:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rU1cUzGLhYBn; Fri, 23 Oct 2026 09:18:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1C59F6065A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792747128;
	b=QKSLZxpMS0jSRl9NyUMLxnPQ4rDmVZy9eyDTnfJCsgiA8fNYSz3UoC53JnqVCsLu3pxO
	 XVEwUm5UD2j6kotmmzvknUMl9arIsAr1g95qPvpjmfqX2BLyZnp+T5I3ZKzYCd8dSOO8Y
	 bpXbXAKv8/MZb3I45ozndGYFXjmlBiuQsYmK7yCLwgW9C8VQ3mo4HrCom16dUUBnxnOa7
	 J1XtWOk903zfIq6Uilq2WNL8B7AX5D9km4ajhnfdBPyMSZtXdWwufpcS9eINO+y1tQYFC
	 blJ+cfBM7d6WJ0jsTJ59FWHWhCtaLDEzW9Q0vp6Sscyk/3G4KjHxtRrDapCYfqOzzyQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792747128;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:To:Cc:
	 References:Content-Language:In-Reply-To:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=mSMHqxlTNpUBbXVe/FcGyBRPfIGyZMXDGx4SZIq8dug=;
	b=VJKKmOYvtkX4EYsFJM6DcWGRY8rpsMFpBNX3c6h70svgLrePLv6gclbaYz50amqqB7IT
	 lC4BzF8DYXgggPJVM88RPjMvN59G3cgWa+j7hqCwlJpXH3QFK1x422+289HHVVjlhioSH
	 3NA3ctV5EHHmdjSoRH3SBmMCKPrQXP2xoyl+NO9gK9PYWxVsh/ie7x3Z/TxFUNekKocj2
	 gXcCG32OzD1HlcdykSJRwV3bbni2IlHPBsIjCmLjAhSw8fPb2TslkjVXWy9+5SGuWd48U
	 CtDCTsEnO+yiiFxZYiV2PjHWDBFXysJWMLb7beBjpqYN1ExO0H65j8uvHYScfdrIE4w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792747128;
	bh=mSMHqxlTNpUBbXVe/FcGyBRPfIGyZMXDGx4SZIq8dug=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TpZq6TUYx/PuMm97Tbtac6rQOk8F7gy1kJG3wT4uCPSVNJVwnfrE9GNCjl9bM/ijz
	 fvUNsADwgbGbnTJ+Ce2Y/0t7V35TFJj13A3PDuNYIH9PBI1U94YxwP0cLMV35lwbPo
	 cDpr+AcgmAUrCWlQw8JHLRNB7REnQkNlag+zxMUZCM5GZPEMmSvHBoxGY0DujrVOAF
	 JKhwz/oVG1CO4z/ibY52tm6+mN8u1bQ8z1qbo7JBTFXcVNR23DM7QK5w19GzKTonJV
	 m0S4KJgDXA5vqqVOUWI+kS6ohPxd412vvRfAhnHQK9/tTPwFjPhcnf61QbOsm2RpyL
	 hqJJAoxDTJU8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C59F6065A;
	Fri, 23 Oct 2026 09:18:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC92B371
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A288B6065A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id teHdPUIPaFVW for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 09:18:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3605F60606
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792747125;
 b=r3d7aHKpecAD6I5cdQA7zGjLrmoWHMarqAPZUCFZTMbqxa/r90SiLDgEJJyxuNHAojcq
 ZcWlvKy40+GAFkIx33n/5SH7odY59N0+ZW5HPcShv+uHXB2jYRh5tCacpLKOdkawQ0FOD
 3JwChczDz5mnPa0b58c9rwnFsWI+eGM3PLOoOEZ3Tj1UGnIqVBMFm085XX/LF5claXpDH
 WphJFse6tUvkxPhraOlMDtrFsIWljjx85ySTl1GVP3BJhnX7cHycpw/ChEzQg+x32++Tf
 4dcro/KBjEFSDKAtWRgvuedOtqDYTriiUkw+MOiyx7kkrpEsof35/cqQ9RqIzk6WatQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792747125;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Last-TLS-Session-Version;
 bh=SlwTGtUVjN7UFhXcJpaZJ4ven9CeCQ9LyXk8tU0QbCA=;
 b=T1Kzp5QxP3xD1NcN9oECKxLOvfTkyv1wU76vWbtMy7spqywMu9pjJGCNeyKFqZgXEaCj
 GeK8RlmspGZxWt2QWcZcj97Avz6e1EIovTNnZkweu6Kcq6z8RtzECKkoYt7hyIxocjkPB
 h4XAbbf3OFUl9Dy7pgrNxh7J+KSur/t+U/cSzl+dYbj0wXTkbZdW5KoPAzAJmUrmQOOvk
 qVCJjRtzGcvKGjd2shqDV3z5xRWBHaVpvJFJqkiQPUjrJHNMdxLiddBpTK7goa+QEeFQJ
 gMfcXbE19okaYi4jfZQbNiRAdTXd/9Xut7PdDL7G62OuGCBzA7Uic+DEtK5KlR/LXfA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=VGoS9x1f; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3605F60606
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:18:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 6BAC0C5145F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:19:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AE0E260398;
 Fri, 23 Oct 2026 09:18:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 818D210328501; 
 Fri, 23 Oct 2026 11:18:40 +0200 (CEST)
Message-ID: <fadb9968-cb15-45e2-91ab-aa8dcc2e5deb@bootlin.com>
Date: Fri, 23 Oct 2026 11:18:39 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com
References: <20261022151358.2260712-1-dario.binacchi@amarulasolutions.com>
 <20261022151358.2260712-3-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
In-Reply-To: <20261022151358.2260712-3-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/6] package/uboot-tools: add fwumdata
 target tool
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgpPbiAxMC8yMi8yNiAxNzoxMywgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gQWRkIGFuIG9wdGlv
biB0byBidWlsZCBhbmQgaW5zdGFsbCB0aGUgZnd1bWRhdGEgdG9vbCBvbiB0aGUgdGFyZ2V0Lgo+
IAo+IGZ3dW1kYXRhIGFsbG93cyB0byByZWFkLCBkaXNwbGF5IGFuZCBtb2RpZnkgdGhlIEZXVSAo
RmlybXdhcmUgVXBkYXRlKQo+IG1ldGFkYXRhIGZyb20gTGludXggdXNlcnNwYWNlLCBzaW1pbGFy
bHkgdG8gd2hhdCBmd19wcmludGVudi9md19zZXRlbnYKPiBkbyBmb3IgdGhlIFUtQm9vdCBlbnZp
cm9ubWVudC4gSXQgY2FuIGJlIHVzZWQgdG8gY2hhbmdlIHRoZQo+IGFjdGl2ZS9wcmV2aW91cyBi
YW5rIGluZGljZXMsIHRoZSBiYW5rIHN0YXRlcyBvciB0aGUgaW1hZ2UgYWNjZXB0YW5jZQo+IGZs
YWdzLCBlLmcuIGJ5IGFuIHVwZGF0ZSBhZ2VudCBhZnRlciB3cml0aW5nIGEgbmV3IGZpcm13YXJl
IGJhbmsuCj4gCj4gVGhlIGxvY2F0aW9uIG9mIHRoZSBtZXRhZGF0YSBpcyByZWFkIGZyb20gL2V0
Yy9md3VtZGF0YS5jb25maWcsIHdoaWNoCj4gaXMgcGxhdGZvcm0gc3BlY2lmaWMgYW5kIGlzIHRo
ZXJlZm9yZSBub3QgaW5zdGFsbGVkIGJ5IHRoZSBwYWNrYWdlOiBpdAo+IGhhcyB0byBiZSBwcm92
aWRlZCwgZm9yIGV4YW1wbGUsIGJ5IGEgcm9vdGZzIG92ZXJsYXkuCgpSZXZpZXdlZC1ieTogS29y
eSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290bGluLmNvbT4KClRoYW5rIHlvdSEKLS0gCkvD
tnJ5IE1haW5jZW50LCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBrZXJuZWwgZW5naW5lZXJp
bmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
