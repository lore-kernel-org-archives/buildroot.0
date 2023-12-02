Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9268C4167B
	for <buildroot@archiver.kernel.org>; Sat,  2 Dec 2023 08:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BF3640169;
	Sat,  2 Dec 2023 08:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BF3640169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ohhyZEqpQxkJ; Sat,  2 Dec 2023 08:39:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95CA24048A;
	Sat,  2 Dec 2023 08:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95CA24048A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BE0B1BF3BF
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 08:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E892F84917
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 08:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E892F84917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iOcErDjor9S8 for <buildroot@lists.busybox.net>;
 Sat,  2 Dec 2023 08:39:30 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B5C284915
 for <buildroot@buildroot.org>; Sat,  2 Dec 2023 08:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B5C284915
Received: by mail.gandi.net (Postfix) with ESMTPSA id ACA5DFF806;
 Sat,  2 Dec 2023 08:39:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r9LX5-0053aC-1w;
 Sat, 02 Dec 2023 09:39:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
References: <20231129110258.3708-1-flavio.tapajos@newtesc.com.br>
 <20231129110258.3708-2-flavio.tapajos@newtesc.com.br>
Date: Sat, 02 Dec 2023 09:39:27 +0100
In-Reply-To: <20231129110258.3708-2-flavio.tapajos@newtesc.com.br>
 (=?utf-8?Q?=22Fl=C3=A1vio=09Tapaj=C3=B3s=22's?= message of "Wed, 29 Nov
 2023 08:02:58 -0300")
Message-ID: <87y1ed2e2o.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/rsyslog: add libdbi-drivers
 optional dependency
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZsw6F2aW8iID09IEZsw6F2aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rl
c2MuY29tLmJyPiB3cml0ZXM6CgogPiBOZWVkZWQgaW4gb3JkZXIgdG8gdXNlIG9tbGliZGJpIG1v
ZHVsZQogPiBTaWduZWQtb2ZmLWJ5OiBGbMOhdmlvIFRhcGFqw7NzIDxmbGF2aW8udGFwYWpvc0Bu
ZXd0ZXNjLmNvbS5icj4KID4gLS0tCiA+ICBERVZFTE9QRVJTICAgICAgICAgICAgICAgICB8IDEg
KwogPiAgcGFja2FnZS9yc3lzbG9nL3JzeXNsb2cubWsgfCA3ICsrKysrKysKID4gIDIgZmlsZXMg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgogPiBkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RF
VkVMT1BFUlMKID4gaW5kZXggMWYyNmU5YmM4MS4uMmYzZWVkZjhhMCAxMDA2NDQKID4gLS0tIGEv
REVWRUxPUEVSUwogPiArKysgYi9ERVZFTE9QRVJTCiA+IEBAIC0xMDc4LDYgKzEwNzgsNyBAQCBG
OglwYWNrYWdlL3B5dGhvbi1weW1vZGJ1cy8KID4gIE46CUZsw6F2aW8gVGFwYWrDs3MgPGZsYXZp
by50YXBham9zQG5ld3Rlc2MuY29tLmJyPgogPiAgRjoJY29uZmlncy9hc3VzX3Rpbmtlci1zX3Jr
MzI4OF9kZWZjb25maWcKID4gIEY6CWJvYXJkL2FzdXMvdGlua2VyLXMvCiA+ICtGOglwYWNrYWdl
L3JzeXNsb2cvCgpJJ3ZlIHNwbGl0IHRoZSBERVZFTE9QRVJTIGFkZGl0aW9uIGluIGEgc2VwYXJh
dGUgY29tbWl0IGFuZCBhcHBsaWVkIHRvCm5leHQsIHRoYW5rcy4KCgogPiAgTjoJRmxvcmlhbiBG
YWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+CiA+ICBGOglwYWNrYWdlL2NwdWxpbWl0Lwog
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9yc3lzbG9nL3JzeXNsb2cubWsgYi9wYWNrYWdlL3JzeXNs
b2cvcnN5c2xvZy5tawogPiBpbmRleCBjZjlmMmMwZTc5Li44ZWE5MmVhNzg1IDEwMDY0NAogPiAt
LS0gYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5tawogPiArKysgYi9wYWNrYWdlL3JzeXNsb2cv
cnN5c2xvZy5tawogPiBAQCAtMTUxLDYgKzE1MSwxMyBAQCBSU1lTTE9HX0NPTkZfT1BUUyArPSBc
CiA+ICAJLS1kaXNhYmxlLW9tam91cm5hbAogPiAgZW5kaWYKIAogPiAraWZlcSAoJChCUjJfUEFD
S0FHRV9MSUJEQklfRFJJVkVSUykseSkKID4gK1JTWVNMT0dfQ09ORl9PUFRTICs9IC0tZW5hYmxl
LWxpYmRiaQogPiArUlNZU0xPR19ERVBFTkRFTkNJRVMgKz0gbGliZGJpLWRyaXZlcnMKID4gK2Vs
c2UKID4gK1JTWVNMT0dfQ09ORl9PUFRTICs9IC0tZGlzYWJsZS1saWJkYmkKID4gK2VuZGlmCiA+
ICsKID4gIGRlZmluZSBSU1lTTE9HX0lOU1RBTExfSU5JVF9TWVNURU1ECiA+ICAJJChJTlNUQUxM
KSAtbSAwNjQ0IC1EIHBhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLnNlcnZpY2UgXAogPiAgCQkkKFRB
UkdFVF9ESVIpL3Vzci9saWIvc3lzdGVtZC9zeXN0ZW0vcnN5c2xvZy5zZXJ2aWNlCiA+IC0tIAoK
ID4gMi40My4wCgogPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwogPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0CiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
CiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAoKCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
