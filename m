Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B22DC4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 08:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E04D96F504;
	Thu, 30 Nov 2023 08:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E04D96F504
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KKV440ji433i; Thu, 30 Nov 2023 08:31:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52B8D6F4F8;
	Thu, 30 Nov 2023 08:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52B8D6F4F8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 089DF1BF23B
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D18F741715
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:31:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D18F741715
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nTZwued0hjlK for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 08:31:02 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 573A0400D6
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 08:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 573A0400D6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B75B1BF20C;
 Thu, 30 Nov 2023 08:31:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r8cRn-002Kli-1x;
 Thu, 30 Nov 2023 09:30:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20231120214150.671145-1-gael.portay@rtone.fr>
 <20231127184040.GB3177259@scaer>
Date: Thu, 30 Nov 2023 09:30:59 +0100
In-Reply-To: <20231127184040.GB3177259@scaer> (Yann E. MORIN's message of
 "Mon, 27 Nov 2023 19:40:40 +0100")
Message-ID: <87leaf8wxo.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] board/raspberrypi: fix autoprobing of
 bluetooth driver
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
Cc: =?utf-8?Q?Ga=C3=ABl?= PORTAY <gael.portay@rtone.fr>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIllhbm4iID09IFlhbm4gRSBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdy
aXRlczoKCiA+IEdhw6tsLCBBbGwsCiA+IE9uIDIwMjMtMTEtMjAgMjI6NDEgKzAxMDAsIEdhw6ts
IFBPUlRBWSBzcGFrZSB0aHVzbHk6CiA+PiBUaGUgY29tbWl0IDY4OWI5YWM0MzkgKHBhY2thZ2Uv
cnBpLWZpcm13YXJlOiByZXdvcmsgYm9vdC9jb25maWcgZmlsZQogPj4gaGFuZGxpbmcpIGhhcyBz
cGxpdCBpbiB0d28gdGhlIHByb3BlcnR5OgogPj4gCiA+PiBkdG92ZXJsYXk9bWluaXVhcnQtYnQs
a3JuYnQ9b24KID4+IAogPj4gSW50bzoKID4+IAogPj4gZHRvdmVybGF5PW1pbml1YXJ0LWJ0CiA+
PiBkdG92ZXJsYXk9a3JuYnQ9b24KID4+IAogPj4gVGhlIGluaXRpYWwgcHJvcGVydHkgY29udGFp
bmVkIHRoZSBkdGJvIGZpbGUgbWluaXVhcnQtYnRbMV0gYW5kIGl0cwogPj4gcGFyYW1ldGVyIGty
bmJ0PW9uWzJdWzNdLgogPj4gCiA+PiBUaGUgZmlyc3Qgc3ludGF4IGlzIGNvcnJlY3Qgd2hpbGUg
dGhlIHNlY29uZCBpcyBub3QuIFRoZSBrcm5idD1vbiBpcyBub3QKID4+IGEgZHRvdmVybGF5WzRd
IGJ1dCBhIGR0cGFyYW1bNV0uIFRoZXJlZm9yZSB0aGUgcHJvcGVydHkgZHRwYXJhbSBtdXN0IGJl
CiA+PiB1c2VkIGluc3RlYWQuCiA+PiAKID4+IFRoaXMgZml4ZXM6CiA+PiAKID4+ICMgY2F0IC9z
eXMvZmlybXdhcmUvZGV2aWNldHJlZS9iYXNlL2Nob3Nlbi91c2VyLXdhcm5pbmdzCiA+PiBGYWls
ZWQgdG8gbG9hZCBvdmVybGF5ICdrcm5idD1vbicKID4+IAogPj4gWzFdOiBodHRwczovL2dpdGh1
Yi5jb20vcmFzcGJlcnJ5cGkvbGludXgvYmxvYi9ycGktNS4xMC55L2FyY2gvYXJtL2Jvb3QvZHRz
L292ZXJsYXlzL21pbml1YXJ0LWJ0LW92ZXJsYXkuZHRzCiA+PiBbMl06IGh0dHBzOi8vZ2l0aHVi
LmNvbS9yYXNwYmVycnlwaS9saW51eC9ibG9iL3JwaS01LjEwLnkvYXJjaC9hcm0vYm9vdC9kdHMv
b3ZlcmxheXMvbWluaXVhcnQtYnQtb3ZlcmxheS5kdHMjTDkxCiA+PiBbM106IGh0dHBzOi8vZ2l0
aHViLmNvbS9yYXNwYmVycnlwaS9saW51eC9ibG9iL3JwaS01LjEwLnkvYXJjaC9hcm0vYm9vdC9k
dHMvb3ZlcmxheXMvUkVBRE1FI0wyMTMtTDIxNQogPj4gWzRdOiBodHRwczovL3d3dy5yYXNwYmVy
cnlwaS5jb20vZG9jdW1lbnRhdGlvbi9jb21wdXRlcnMvY29uZmlnX3R4dC5odG1sI2R0b3Zlcmxh
eQogPj4gWzVdOiBodHRwczovL3d3dy5yYXNwYmVycnlwaS5jb20vZG9jdW1lbnRhdGlvbi9jb21w
dXRlcnMvY29uZmlnX3R4dC5odG1sI2R0cGFyYW0KID4+IAogPj4gU2lnbmVkLW9mZi1ieTogR2HD
q2wgUE9SVEFZIDxnYWVsLnBvcnRheUBydG9uZS5mcj4KCiA+IEFwcGxpZWQgdG8gbWFzdGVyLCB0
aGFua3MuCgpDb21taXR0ZWQgdG8gMjAyMy4wMi54IGFuZCAyMDIzLjA4LngsIHRoYW5rcy4KCi0t
IApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
