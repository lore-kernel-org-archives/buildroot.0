Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439FAC433F5
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 11:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECD9E40AC2;
	Fri,  6 May 2022 11:32:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0AjX5I06bVgk; Fri,  6 May 2022 11:32:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 019B5404F8;
	Fri,  6 May 2022 11:32:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D8B01BF2BB
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 11:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 794D74158B
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 11:32:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smtpcorp.com header.b="xy4apqGE";
 dkim=pass (2048-bit key) header.d=sonifex.co.uk header.b="f/cadCkJ"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W3tYs280XtHk for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 11:32:34 +0000 (UTC)
X-Greylist: delayed 00:14:36 by SQLgrey-1.8.0
Received: from e2i465.smtp2go.com (e2i465.smtp2go.com [103.2.141.209])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A3CC4157F
 for <buildroot@buildroot.org>; Fri,  6 May 2022 11:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=smtpcorp.com; s=a1-4; h=List-Unsubscribe:Feedback-ID:From:To:Subject:Date:
 Message-ID:Reply-To:Sender:X-Smtpcorp-Track;
 bh=yYD/Q7U+ZEE13ZumBmLxIagj73DGFodMQD/Qgox9UeQ=; b=xy4apqGEv0mjvtH7HwVk45LWGo
 spOlL8VPeQ9s2GrgcjuLpad/oh6fu0BWq5mt1PRMH7Q7ChIyE9Yinkbhgyt9Xdbq2BC4TL75IzWcf
 GiXstoKVp+Get/rgfPOy2hABjT3latWdKDK4cUi5X7TkBA2oKAKu9io7SGUWyPQDU3yyOgTKomk30
 uUze77Th+H4QByJnZm/bMYshRJrYo+3wsbxI4AFWRL4gNaAim6at7ca3qIxqO961Iac+2g8gewfdB
 QJQAYGPNKOnJwx0ZooZCXuyqrLSEVrFzoohSZo8Z+jmEjC23tkrkAaVKxA2aa1MHX6GY94AZEDOUx
 CM4noNyw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sonifex.co.uk;
 i=@sonifex.co.uk; q=dns/txt; s=s592615; t=1651836754; h=from : subject
 : to : message-id : date;
 bh=yYD/Q7U+ZEE13ZumBmLxIagj73DGFodMQD/Qgox9UeQ=;
 b=f/cadCkJNli2C4KDml38H6PBrOC5j6dhkznIUj5B8Os1i4izRErgp4NqRkvzt/H8m3e/E
 hU4/pELPlCITlbUy8RTTt5L9QXWxLAZj2rDg5rRhj8C51ksgBiGee5/jXzxdf6bYBp63Upx
 seDSAx/hIPiA+lfI75NBY8exfpvOl6ZtJ14s9nvunhEPepvsiCWimqoYdaX6NNY6jbBik59
 upZSoz7eU0mnecfJ7Djlid9HmYEwGBz/j5b/uNPpO2Vt6loKD+1jgJgAbw5fpk15NAEKAqq
 sPBh6j5IXwFTiK+k93rs0sHGCehw/Yrnz2zFZmn9bDG13l/7KwrNrzI1UDog==
Received: from [10.45.79.170] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <wesley@sonifex.co.uk>)
 id 1nmvxy-TRjy5F-Cq; Fri, 06 May 2022 11:17:46 +0000
Received: from [10.87.224.66] (helo=NETHMAIL.sonifex.co.uk)
 by smtpcorp.com with esmtpsa
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <wesley@sonifex.co.uk>)
 id 1nmvxx-bMEp2Z-Aa; Fri, 06 May 2022 11:17:45 +0000
Received: from [192.168.0.19] (unknown [192.168.0.19])
 (Authenticated sender: wesley.revens@sonifex.co.uk)
 by NETHMAIL.sonifex.co.uk (Postfix) with ESMTPSA id 06C6D80C07BB;
 Fri,  6 May 2022 12:17:43 +0100 (BST)
Message-ID: <77b0f29f-7df7-36f4-9b49-5212fd46c5af@sonifex.co.uk>
Date: Fri, 6 May 2022 12:17:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20220505155424.3002847-1-neal.frager@amd.com>
From: Wesley Revens <wesley@sonifex.co.uk>
In-Reply-To: <20220505155424.3002847-1-neal.frager@amd.com>
Feedback-ID: 592615m:592615abMtQZZ:592615sHGBV5TFLK
X-Report-Abuse: Please forward a copy of this message, including all headers, 
 to <abuse-report@smtp2go.com>
Subject: Re: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
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
Cc: luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 michal.simek@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTmVhbCwKCkkgaGF2ZSBiZWVuIHdvcmtpbmcgb24gYSBCdWlsZHJvb3QgaW1hZ2UgZm9yIHRo
ZSBLcmlhIHJlY2VudGx5IHNvIG15IApjb21wYW55IGNhbiBldmFsdWF0ZSB0aGUgSzI2IFNPTS4K
SSByZWFjaGVkIGEgc2ltaWxhciBwb3NpdGlvbiB0byB3aGF0IGhhcyBiZWVuIGluY2x1ZGVkIGlu
IHlvdXIgcGF0Y2ggCmhvd2V2ZXIgSSBoYXZlIG5vdCBiZWVuIGFibGUgdG8KZ2V0IHRoZSBLcmlh
IHRvIGJvb3QgdXNpbmcgdGhlIFUtQm9vdCBTUEwuCgpJIGhhdmUgdHJpZWQgb3V0IHlvdXIgcGF0
Y2ggYW5kIGZvdW5kIHRoYXQgdGhlIExpbnV4IGtlcm5lbCBpcyBib290aW5nIApmaW5lIGZyb20g
dGhlIFNEIGNhcmQgdXNpbmcKdGhlIHByZS1wcm9ncmFtbWVkIGJvb3QuYmluIHRoYXQgaXMgYWxy
ZWFkeSBwcmVzZW50IG9uIHRoZSBLcmlhLiAKSG93ZXZlciwgYWZ0ZXIgYnVpbGRpbmcgdXNpbmcg
eW91ciBwYXRjaCwKSSB0cmllZCB1cGxvYWRpbmcgdGhlIGJvb3QuYmluIHRoYXQgYXBwZWFycyBp
biBidWlsZHJvb3Qvb3V0cHV0L2ltYWdlcyAKdG8gbXkgS3JpYSB1c2luZyB0aGUKIkJvb3QgSW1h
Z2UgUmVjb3ZlcnkgVG9vbCIgd2ViIFVJIHRoYXQgcnVucyBvbiB0aGUgS3JpYSBpZiB5b3UgaG9s
ZCBkb3duIAp0aGUgRldVRU4gYnV0dG9uCmR1cmluZyByZXNldCBvZiB0aGUgYm9hcmQuIE9uIGJv
b3QsIEkgdGhlbiBnZXQgdGhlIGZvbGxvd2luZyBvdXRwdXQgZnJvbSAKVS1Cb290IFNQTDoKClUt
Qm9vdCBTUEwgMjAyMi4wMSAoTWF5IDA2IDIwMjIgLSAxMToyMTo1NSArMDEwMCkKUE1VRlc6wqAg
djEuMQpMb2FkaW5nIG5ldyBQTVVGVyBjZmcgb2JqICgyMDE2IGJ5dGVzKQpTaWxpY29uIHZlcnNp
b246wqDCoMKgwqDCoMKgwqAgMwpFTCBMZXZlbDrCoMKgwqDCoMKgwqAgRUwzCkNoaXAgSUQ6wqDC
oMKgwqDCoMKgwqAgeGNrMjYKTXVsdGlib290OsKgwqDCoMKgwqAgNjQKVHJ5aW5nIHRvIGJvb3Qg
ZnJvbSBTUEkKClRoZW4gbm90aGluZyBlbHNlIGhhcHBlbnMuCgpUaGVyZSBpcyBhIGJpZyBkaWZm
ZXJlbmNlIGluIHRoZSBmaWxlIHNpemVzIGZvciB0aGUgYm9vdC5iaW4gZnJvbSAKYnVpbGRyb290
L291dHB1dC9pbWFnZXMgYW5kIHRoZSBCT09ULkJJTgpJIGRvd25sb2FkZWQgZnJvbSAKaHR0cHM6
Ly94aWxpbngtd2lraS5hdGxhc3NpYW4ubmV0L3dpa2kvc3BhY2VzL0EvcGFnZXMvMTY0MTE1MjUx
My9LcmlhK0syNitTT00jQm9vdC1GaXJtd2FyZS1VcGRhdGVzCnNvIEkgYW0gb2J2aW91c2x5IG1p
c3Npbmcgc29tZXRoaW5nIHNvbWV3aGVyZS4gSSB0aGluayBhbGwgdGhlIApjb21wb25lbnRzIGFy
ZSBiZWluZyBidWlsdCBidXQgSSdtIG5vdCBzdXJlCnRoZXkgYXJlIGJlaW5nIHBhY2thZ2VkIGlu
IGEgc2ltaWxhciB3YXkgdG8gaG93IHRoZSBwcmUtbG9hZGVkIGJvb3QuYmluIAppcyBsYWlkIG91
dCAob3IgSSBhbSB1c2luZyB0aGUgd3Jvbmcgb3V0cHV0IGZpbGUhKQoKSW4gbXkgb3duIHRlc3Rp
bmcgSSB3YXMgYWJsZSB0byB0ZXN0IHRoZSB1LWJvb3QuaW1nIHByb2R1Y2VkIGJ5IG15IApCdWls
ZHJvb3QgYnVpbGQgYnV0IEkgaGFkIHRvIHVzZSB0aGUKWGlsaW54IGJvb3RnZW4gdG9vbHMgYW5k
IHVzZSB0aGUgWGlsaW54IGZzYmwgcmF0aGVyIHRoYW4gdGhlIFUtQm9vdCBTUEwuCgpJbiBmdXR1
cmUsIHdlIHdvdWxkIGxpa2UgdG8gYmUgYWJsZSB0byBieXBhc3MgdGhpcyBzdGVwIGFuZCBqdXN0
IHVzZSAKd2hhdGV2ZXIgQnVpbGRyb290IHByb2R1Y2VzLgpJIHdhcyB3b25kZXJpbmcgaWYgeW91
IGNvdWxkIHBvaW50IG1lIGluIHRoZSByaWdodCBkaXJlY3Rpb24uCgpSZWdhcmRzLAoKV2VzbGV5
CgoKT24gMDUvMDUvMjAyMiAxNjo1NCwgTmVhbCBGcmFnZXIgdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3IgWGlsaW54IEtyaWEgS1YyNjAgc3RhcnRlciBr
aXQuCj4KPiBLVjI2MCBmZWF0dXJlcyBjYW4gYmUgZm91bmQgaGVyZToKPiBodHRwczovL3d3dy54
aWxpbnguY29tL3Byb2R1Y3RzL2JvYXJkcy1hbmQta2l0cy9rdjI2MC5odG1sCj4KPiBXaGlsZSB0
aGUgS3JpYSBTT00gaXMgYmFzZWQgb24gYSBaeW5xTVAgU29DLCB0aGVyZSBhcmUgc29tZSBrZXkK
PiBib290IGNvbmZpZyBkaWZmZXJlbmNlcyBmcm9tIHRoZSBvdGhlciBaeW5xTVAgZXZhbHVhdGlv
biBib2FyZHMuCj4KPiAxLiBUaGVyZSBhcmUgbm8gYm9vdCBzd2l0Y2hlcyBvbiBLcmlhIFNPTXMu
IFRoZSBib290IG1vZGUgaXMgdGh1cwo+IGhhcmQgY29uZmlndXJlZCBmb3IgUVNQSSBmbGFzaC4g
QSBwcmUtcHJvZ3JhbW1lZCBib290LmJpbiBjb21lcwo+IHdpdGggZXZlcnkgU3RhcnRlciBLaXQu
IFUtQm9vdCBjYW4gdGhlbiBmaW5kIHRoZSBMaW51eCBrZXJuZWwgYW5kCj4gZmlsZSBzeXN0ZW0g
b24gdGhlIFNEIGNhcmQuCj4KPiBPcHRpb25hbCBpbnN0cnVjdGlvbnMgZm9yIHVwZGF0aW5nIHRo
ZSBib290LmJpbiBpbiB0aGUgUVNQSSBmbGFzaAo+IGNhbiBiZSBmb3VuZCBpbiB0aGUgcmVhZG1l
LnR4dCBmaWxlIGFuZCB0aGUgbGluayBiZWxvdy4KPgo+IGh0dHBzOi8veGlsaW54LXdpa2kuYXRs
YXNzaWFuLm5ldC93aWtpL3NwYWNlcy9BL3BhZ2VzLzE2NDExNTI1MTMvS3JpYStLMjYrU09NCj4K
PiAyLiBLcmlhIFNPTXMgdXNlIFVBUlQxIGZvciB0aGUgY29uc29sZSBpbnN0ZWFkIG9mIFVBUlQw
LiBGb3IgdGhpcwo+IHJlYXNvbiwgS3JpYSBTdGFydGVyIEtpdHMgd2lsbCB1c2UgYSBzZXBhcmF0
ZSBleHRsaW51eC5jb25mIGZpbGUKPiBmcm9tIG90aGVyIFp5bnFNUCBldmFsdWF0aW9uIGJvYXJk
cy4KPHNuaXA+ClRvIHVuc3Vic2NyaWJlIGNsaWNrOiBodHRwOi8vbGluay5zb25pZmV4LmNvLnVr
L3VzLz9lPTFuWHZ4eFB1RXAyWmphLmRkZWRmamtBS082b2wKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
