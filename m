Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9F5C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 12:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A1068116D;
	Sat, 13 Jul 2024 12:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5g4Kwm1Jde8Y; Sat, 13 Jul 2024 12:23:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 794B981F9B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 794B981F9B;
	Sat, 13 Jul 2024 12:23:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 74E9D1BF5AE
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6092581F9B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9aZmfeKbQiX for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 12:23:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=hw234@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 38F1A8116D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38F1A8116D
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38F1A8116D
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 12:23:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.3.5] ([85.235.69.207]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnJhO-1s3Ptz2RYC-00agRf; Sat, 13
 Jul 2024 14:23:27 +0200
Message-ID: <32cf5126-ae76-41a5-abae-88870afddcac@gmx.de>
Date: Sat, 13 Jul 2024 14:23:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, Harvey <hw234@gmx.de>,
 Buildroot Mailing List <buildroot@buildroot.org>
References: <21792856-4631-4b18-9dbc-9f161dd9c4a1@gmx.de>
 <1f2b0154-8fd6-4f28-8d22-54382681e7bc@mind.be>
Content-Language: de-DE
In-Reply-To: <1f2b0154-8fd6-4f28-8d22-54382681e7bc@mind.be>
X-Provags-ID: V03:K1:fqRH8nqjwqtTiP3IPPzJancelpQEns3HNgajVtOnZpfu4cHQuO4
 WLmYPLtgCvTOejByX/CiR7Ndx6qQqHeNNZAdEPeqqtzPML4+ifZR6pDqsbilr5iWHM219YJ
 iy8D0/gHMYGuhS2Wkfge2Z6ZnBTGXT4gMX2bFAZ/MozOyaaRhp9oeMmEeePj3iKyyETFqiB
 OfypwQwMr8kM2oOHa/dnQ==
UI-OutboundReport: notjunk:1;M01:P0:wvEP24fdXo4=;ZMcTovcxMVDRyfjfHBCPSEfJ+X5
 kFlzpIooIZY6MnsDqBeap1KL4CUPQkSvnGkd6JS5Bh8Y6ltgDZb3Fig6PyLEYVQNgFfQ3yDwf
 pJ4K5TiT508d3HlxTfy4m3Fs8VCb7B1Q+HQubQqPr250uk2mm6mgn+Dy0ad/B5y2aHGwJQCrY
 Q83aj24DtY7N6JFi3fIk19PbThBpZ7MsHhv7DhiK4ZotxhrzQunr/0EPfX0EOx6gm3eWKAO/w
 XqJHF23psHFyNHQByVrmLFeCV93/gAF5JPQ2ELpp4ZIEcsXcoXXBnMv2kn+c7J1rzdmIAAQRr
 irUawsOvoh/F+MiJOZgqxcgNoZErYV1Wy9fwylWpSgpWWYSN4xWYhSGEZDy1i2kAN1WT8WKWg
 hZGxT1AQZcNF31mkGt4Ldi58yD3afCHtrtsdUWfNdYmDcysRF7jRUjjPpng/ftMk2vxDaxZbf
 TVVkPxIW50RwXabHj3CAiz7hp8D4c+aPdY78osc6l9Fen5MTh+QFFoskjde9NPnGtztSXTZVZ
 3Rdz4p8Tt3lLzzAXpIJM3YFLf9yD6baDXIPQ17esauHkvQgcRJTgbJZicOJpdwfub6CoPa+1Y
 kVc9DlyxjJFHzETU454LE9hLDQIzWBHNHJbVMJaf4uhdM4ERDUN6QBOEf7urJcshzF9aHgJtG
 0SeUh5MtXntoQzP3FaNKXvoQ1ezmWy+4N/TxNxbPe2fz+AG8d/3pMpCFUkujM6RT3X1cVa6WZ
 JJmiQsky9oPrMDvIphF4wpOzingzcjBC+gAXFLcxPnXRx45Ab3PB8S9loLqL1dPc+oGyyZdUb
 oQht8rYr7+9PQ8T9pcN+POUQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720873407; x=1721478207; i=hw234@gmx.de;
 bh=r6LYwhih7zkI+PE1rQIMozQUr59oJWW4lloFWCQfwUk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
 References:In-Reply-To:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=JHtPZvX1/vtnzNZXpuqJ2JrrKdEgDKqpQKcThw5caifSWzWWVqoGtIRPtaq4KeO4
 2qCFJgbB9Hcnrc0ac+hNFzFDvy2axs/hOU/Di0cdjOFtNttY+Udes2BJKrM6LB3BG
 xxq1V/aF00mcCRbrXuClschzXwO6pmtaJgJgDYxZUA1VFPgLjfgd0NBzCbgpaUzZ+
 e0p+NfIUmt9BhY0qBTAmGVXHdrSraUlj266I/ZMfwTrIq6AwxTL7XTnG6XUtho5i2
 8doOUBNJdsU6bIWnfjuVYbzdBzbZ8Oatu6udoYJ5B6HJGWZ8WKbRka+qpRAWxWP4P
 BRRnZGGhfWGD7eEQqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=hw234@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=JHtPZvX1
Subject: Re: [Buildroot] Dropbear trying to write to /var/log/wtmp
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
From: Harvey via buildroot <buildroot@buildroot.org>
Reply-To: Harvey <hw234@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXJub3V0LAoKPiAgwqBJdCdzIGEgYnVnIGluIEJ1aWxkcm9vdC4gRHJvcGJlYXIgaGFzIGEgc2Vw
YXJhdGUgb3B0aW9uIGZvciB3dG1wIGFuZAo+IHd0bXB4LCBidXQgQnVpbGRyb290IG9ubHkgcGFz
c2VzIC0tZGlzYWJsZS13dG1wLCBub3QgLS1kaXNhYmxlLXd0bXB4Lgo+Cj4gIMKgUGxlYXNlIHdy
aXRlIGEgcGF0Y2ggdGhhdCBhZGRzIC0tZGlzYWJsZS13dG1weCwgdGVzdCBpdCwgYW5kIHNlbmQg
aXQKPiB0byB0aGUgbWFpbGluZyBsaXN0ISBbMV0KCkkgbmV2ZXIgZGlkIHRoaXMgYmVmb3JlLCBi
dXQgd2l0aCB0aGUgaGVscCBvZiBhIGZyaWVuZCwgSSBkaWQgdGhlIHRoaW5nCmJlbG93LiBJIGhv
cGUgaXQgaXMgc3VmZmljaWVudC4KCiMgQWRkIC0tZGlzYWJsZS13dG1weCB0byBkcm9wYmVhci5t
ayB0byBhdm9pZCB1bm5lZWRlZCBlbnRyaWVzIGluIHN5c2xvZ2ZpbGUKCmRpZmYgLS1naXQgYS9w
YWNrYWdlL2Ryb3BiZWFyL2Ryb3BiZWFyLm1rIGIvcGFja2FnZS9kcm9wYmVhci9kcm9wYmVhci5t
awppbmRleCBkOTUwNGM1NTI1Li40Mjc0MGVjMzBhIDEwMDY0NAotLS0gYS9wYWNrYWdlL2Ryb3Bi
ZWFyL2Ryb3BiZWFyLm1rCisrKyBiL3BhY2thZ2UvZHJvcGJlYXIvZHJvcGJlYXIubWsKQEAgLTEx
Niw3ICsxMTYsOCBAQCBEUk9QQkVBUl9QT1NUX0VYVFJBQ1RfSE9PS1MgKz0KRFJPUEJFQVJfRElT
QUJMRV9TVEFOREFMT05FCiAgZW5kaWYKCiAgaWZuZXEgKCQoQlIyX1BBQ0tBR0VfRFJPUEJFQVJf
V1RNUCkseSkKLURST1BCRUFSX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtd3RtcAorRFJPUEJFQVJf
Q09ORl9PUFRTICs9IC0tZGlzYWJsZS13dG1wIFwKKyAgICAgICAgICAgICAgICAgICAgICAtLWRp
c2FibGUtd3RtcHgKICBlbmRpZgoKICBpZm5lcSAoJChCUjJfUEFDS0FHRV9EUk9QQkVBUl9MQVNU
TE9HKSx5KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
