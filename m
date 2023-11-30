Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E79C07CA9
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 08:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49B546F4A8;
	Thu, 30 Nov 2023 08:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49B546F4A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0IrPDAwsajLS; Thu, 30 Nov 2023 08:17:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9485C61B3A;
	Thu, 30 Nov 2023 08:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9485C61B3A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CD571BF3BC
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12EE1822EC
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12EE1822EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id duLIL_oZ87oS for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 08:17:40 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7D8A822C6
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 08:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7D8A822C6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BD3140007;
 Thu, 30 Nov 2023 08:17:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r8cEp-002JnK-1j;
 Thu, 30 Nov 2023 09:17:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Jos=C3=A9?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
References: <20230726233012.50b0ac6c@windsurf>
 <20231112221115.2289525-3-salvador.joseluis@gmail.com>
Date: Thu, 30 Nov 2023 09:17:35 +0100
In-Reply-To: <20231112221115.2289525-3-salvador.joseluis@gmail.com>
 (=?utf-8?Q?=22Jos=C3=A9?=
 Luis Salvador Rufo"'s message of "Sun, 12 Nov 2023 23:11:17 +0100")
Message-ID: <87ttp38xk0.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/zfs: fix zfs autotools
 cross-compilation
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
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>,
 Michael Zimmermann <sigmaepsilon92@gmail.com>, Philippe.Serbruyns@ugent.be,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkpvc8OpIiA9PSBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpvc2Vs
dWlzQGdtYWlsLmNvbT4gd3JpdGVzOgoKID4gVGhpcyBjb21taXQgYWRkcmVzc2VzIGEgbG9uZy1z
dGFuZGluZyBidWcgZW5jb3VudGVyZWQgZHVyaW5nIFpGUwogPiBjb21waWxhdGlvbiBpbiBjcm9z
cy1wbGF0Zm9ybSBlbnZpcm9ubWVudHMuIFRoZSBpc3N1ZSBhcmlzZXMgYmVjYXVzZSBaRlMKID4g
YXV0b2NvbmYgdHJpZ2dlcnMgYSBgbWFrZSBtb2R1bGVzYCB0byBkZXRlY3QgaWYgdGhlIGtlcm5l
bCBjYW4gY29tcGlsZQogPiBtb2R1bGVzIFsxXS4gVGhlIHByb2JsZW0gb2NjdXJzIHdoZW4gYXV0
b2NvbmYgdXNlcyB0aGUgaG9zdCBlbnZpcm9ubWVudAogPiBpbnN0ZWFkIG9mIHRoZSBjcm9zcy1w
bGF0Zm9ybSBlbnZpcm9ubWVudC4KCiA+IFRvIGZpeCB0aGlzLCB3ZSBleHBvcnQgbmVjZXNzYXJ5
IGVudmlyb25tZW50IHZhcmlhYmxlcyB0byBlbnN1cmUgdGhhdCBaRlMKID4gYXV0b2NvbmYgdXRp
bGl6ZXMgdGhlIGNyb3NzLXBsYXRmb3JtIGVudmlyb25tZW50IGNvcnJlY3RseS4KCiA+IFRoaXMg
cGF0Y2ggcmVzb2x2ZXMgWkZTIGNyb3NzLXBsYXRmb3JtIGNvbXBpbGF0aW9uczoKID4gLSBodHRw
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9lYmVhYjI1NjEwMWJjYmEzOGMzNWZk
NTUwNzVjNDE0ZTYyZjkyY2FhLwogPiAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9y
ZXN1bHRzLzAzYjlmMTJhMTA2YmYxMDBlZWM2OTVhOTJiODNiZjA5YjIyYzY4YjAvCiA+IC0gaHR0
cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvYzJkYTkwMzM3NDYzNjA3YzJmYWRm
ZWFjN2FkNzJlNWMzODk5YTYxZi8KID4gLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQv
cmVzdWx0cy80NjVhMjQ5ZjkyZDJmNWRiN2FjNGI2MWI0MTExZTZjYmFhYTE1Njg4LwogPiAtIGh0
dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzdlMmQzMjc3ZTI2ZmE1YjBjODA3
M2EwZThiOWU4MmY0N2FkZTk2OTcvCiA+IC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0
L3Jlc3VsdHMvYThmYjg3MzM2YjA5ZmVmODc4N2E3ODg5ZGZjY2NmMTRmZTEyMTViOS8KID4gLSBo
dHRwczovL2dpdGxhYi5jb20va3VidTkzL2J1aWxkcm9vdC8tL2pvYnMvMTUyMjg0ODQ4MwoKID4g
QW5kIGZpeCBhIGZldyBlbWFpbHM6CiA+IC0gYWxwaW5lLkRFQi4yLjIyLjM5NC4yMTA4MTgxNjMw
MjgwLjIwMjgyNjJAcmlkem8gW2J1aWxkIHpmcyBpbnRvIGJ1aWxkcm9vdCBmb3IgcmFzcGJlcnJ5
IHBpIDRdCiA+IC0gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL3BpcGVybWFpbC9idWlsZHJv
b3QvMjAyMS1BdWd1c3QvNjIxNjk2Lmh0bWwKID4gLSBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDIxLUF1Z3VzdC82MjEzNDUuaHRtbAogPiAtIGh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjItSnVseS82NDYz
NzkuaHRtbAogPiAtIGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRy
b290LzIwMjMtSnVuZS82Njg0NjcuaHRtbAoKID4gWzFdIFRoaXMgaXMgdGhlIGZ1bGwgY2FsbGJh
Y2ssIHlvdSBjYW4ganVzdCBjaGVjayB0aGUgbGFzdCBsaW5rOgogPiAtIGh0dHBzOi8vZ2l0aHVi
LmNvbS9vcGVuemZzL3pmcy9ibG9iL3pmcy0yLjEuMTIvY29uZmlnL2tlcm5lbC1kZWNsYXJlLWV2
ZW50LWNsYXNzLm00I0w3QzExLUw3QzExCiA+IC0gaHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMv
emZzL2Jsb2IvemZzLTIuMS4xMi9jb25maWcva2VybmVsLm00I0w4ODMKID4gLSBodHRwczovL2dp
dGh1Yi5jb20vb3Blbnpmcy96ZnMvYmxvYi96ZnMtMi4xLjEyL2NvbmZpZy9rZXJuZWwubTQjTDg2
OAogPiAtIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9ibG9iL3pmcy0yLjEuMTIvY29u
ZmlnL2tlcm5lbC5tNCNMNjY4CgogPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBMdWlzIFNhbHZhZG9y
IFJ1Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4KCkNvbW1pdHRlZCB0byAyMDIzLjAy
LnggYW5kIDIwMjMuMDgueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
