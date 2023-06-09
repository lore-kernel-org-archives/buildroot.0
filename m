Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3439BC7EE25
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 09:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3EA483C61;
	Fri,  9 Jun 2023 09:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3EA483C61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rQlqKxWtqDY8; Fri,  9 Jun 2023 09:10:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD6DE83C6E;
	Fri,  9 Jun 2023 09:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD6DE83C6E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8ED0B1BF334
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 09:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74DB740222
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 09:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74DB740222
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HXbG8my_JFNU for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 09:10:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A5554016F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A5554016F
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 09:10:14 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC228FF809;
 Fri,  9 Jun 2023 09:10:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q7Y8I-000wPu-Qs; Fri, 09 Jun 2023 11:10:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= via buildroot
 <buildroot@buildroot.org>
References: <20230425070923.1294644-1-raphael.melotte@mind.be>
 <20230509115831.634176-1-raphael.melotte@mind.be>
Date: Fri, 09 Jun 2023 11:10:10 +0200
In-Reply-To: <20230509115831.634176-1-raphael.melotte@mind.be>
 (=?utf-8?Q?=22Rapha=C3=ABl=09M=C3=A9lotte?= via buildroot"'s message of
 "Tue, 9 May 2023 13:58:29 +0200")
Message-ID: <877csd0znx.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package: busybox: backport fix for
 missing getrandom()
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
Cc: =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlJhcGhhw6tsIiA9PSBSYXBoYcOrbCBNw6lsb3R0ZSB2aWEgYnVpbGRyb290IDxidWls
ZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gVGhlIGN1cnJlbnQgQnVzeWJveCB2ZXJz
aW9uICgxLjM2LjApIGZhaWxzIHRvIGJ1aWxkIHdpdGggc29tZQogPiBsaWJjL2xpbnV4IGNvbWJp
bmF0aW9ucyB3aGVyZSBnZXRyYW5kb20oKSBpcyBub3QgYXZhaWxhYmxlLiBUd28gZml4ZXMKID4g
Zm9yIGdsaWJjIGFscmVhZHkgZXhpc3RzIHVwc3RyZWFtLCBzbyBiYWNrcG9ydCB0aGVtIGhlcmUu
IEEgdGhpcmQKID4gb25lIChzdWJtaXR0ZWQgdXBzdHJlYW0sIG5vdCBwYXJ0IG9mIHRoZSBtYWlu
IGJyYW5jaCB5ZXQpIHdhcyBuZWVkZWQKID4gdG8gYmUgYWJsZSB0byBjb21waWxlIHdpdGggb2xk
ZXIgbXVzbCBhbmQgdUNsaWJjIHZlcnNpb25zIChvciBvbGRlcgogPiBrZXJuZWxzKS4KCiA+IFRo
aXMgZml4ZXMgdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHJhaXNlZCBzaW5jZSBjb21taXQK
ID4gZDY4YjYxNzk5M2JkMmY1YzgyYTQ5MzZlZDFlMjRlNGZlYzZiOTRhMjoKCiA+IG1pc2N1dGls
cy9zZWVkcm5nLmM6NDU6MjQ6IGZhdGFsIGVycm9yOiBzeXMvcmFuZG9tLmg6IE5vIHN1Y2ggZmls
ZSBvciBkaXJlY3RvcnkKID4gICNpbmNsdWRlIDxzeXMvcmFuZG9tLmg+CgogPiBGaXhlczoKID4g
LSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy80NGEwNDc2Yjg2YzU3OWU2
YWE2NThmMTU2ZjAyOTI5NThkNDA1MTNjCiA+IC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qu
bmV0L3Jlc3VsdHMvZWQwMjgxNjBkYjM5NzU4MTU1OGZkOGM5Njc1NTYyMWRkODI5OGJiMQogPiAt
IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNDEyMjYy
NDAwOAogPiAtIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pv
YnMvNDEyMjYyNDAzNAogPiAtIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxk
cm9vdC8tL2pvYnMvNDEyMjYyNDA0NAogPiAtIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC8tL2pvYnMvNDEyMjYyNDA0OAogPiAtIGh0dHBzOi8vZ2l0bGFiLmNvbS9i
dWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNDEyMjYyNDA1MQoKID4gSXQgYWxzbyBmaXhl
cyB0aGUgZm9sbG93aW5nIChzaW1pbGFyKSBidWlsZCBmYWlsdXJlLCByYWlzZWQgc2luY2UgdGhl
CiA+IHNhbWUgY29tbWl0OgoKID4gbWlzY3V0aWxzL2xpYi5hKHNlZWRybmcubyk6IEluIGZ1bmN0
aW9uIGBzZWVkcm5nX21haW4nOgogPiBzZWVkcm5nLmM6KC50ZXh0LnNlZWRybmdfbWFpbisweDI2
Yyk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGdldHJhbmRvbScKID4gc2VlZHJuZy5jOigudGV4
dC5zZWVkcm5nX21haW4rMHgyZTgpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBnZXRyYW5kb20n
CiA+IGNvbGxlY3QyOiBlcnJvcjogbGQgcmV0dXJuZWQgMSBleGl0IHN0YXR1cwoKID4gRml4ZXM6
CiA+IC0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy80
MTIyNjI0MDI4CiA+IC0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
Ly0vam9icy80MTIyNjI0MDMxCgogPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8
cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+CiA+IC0tLQogPiBDaGFuZ2VzIHYxIC0+IHYyOgogPiAt
IGZpeCBidWlsZGluZyB3aXRoIG1ha2UgNC4yLjEgYW5kIGVhcmxpZXIuCiA+IC0gdXNlIHRoZSBj
dXJyZW50IGxhdGVzdCBwYXRjaCBzZW50IHVwc3RyZWFtICh2NCkuCgpDb21taXR0ZWQgdG8gMjAy
My4wMi54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
