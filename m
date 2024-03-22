Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20CEC54E71
	for <buildroot@archiver.kernel.org>; Fri, 22 Mar 2024 16:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4196160614;
	Fri, 22 Mar 2024 16:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EbxWzO24KI7s; Fri, 22 Mar 2024 16:43:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D57560FE8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D57560FE8;
	Fri, 22 Mar 2024 16:43:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 733B61BF287
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 16:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BE4641850
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 16:43:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dbfYPa_JotGw for <buildroot@lists.busybox.net>;
 Fri, 22 Mar 2024 16:43:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 207674176D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 207674176D
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 207674176D
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 16:43:10 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id F107FCB47F
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 16:40:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8D6A1C000C;
 Fri, 22 Mar 2024 16:40:34 +0000 (UTC)
Message-ID: <32da443e-5ce6-46d3-ad22-b5e3ea8f3eba@bootlin.com>
Date: Fri, 22 Mar 2024 17:40:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240212013511.1146354-1-james.hilliard1@gmail.com>
In-Reply-To: <20240212013511.1146354-1-james.hilliard1@gmail.com>
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1711125635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vMl8ytkqgBc5q/pfcizS+4XUTWvnhx8oRPkMrbITLR8=;
 b=JHdepHXohD8ChD9J+s0ralENamm9CIzEXdLAUZM9tN7DnSpIwN5D8YHpLvD4ehpagDCXuc
 UvSbdg4vP/tYWZRc5YnxDby+OOGCs5+ZHa78WaEDpMsHvnIhkQUd919RuMBqOG0vSPmv7F
 lgJLrZ3vxsqKWoFMHB7Cpi3qtUXN1PZW3z4OLRLHx154c/5lu9ai8p9YDwLMwRtNmmM5O0
 +pO/wO+xH6NDxHlQ9zNX/LwwHzE28aZxx3iGp5lvo3tDtyRH0tYeUYjUmZ2s1m3P+V8cqu
 zM/Ar7oWh8Nhw7nLVzsXYtqqxVU7DD++XRiCY5oegEFOaOytvibfV3DaWDcLMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JHdepHXo
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 42.0.2
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiAyLzEyLzI0IDAyOjM1LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiBMaWNlbnNl
IGhhc2ggY2hhbmdlZCBkdWUgdG8gZHJvcHBpbmcgUFNGIGxpY2Vuc2U6Cj4gaHR0cHM6Ly9naXRo
dWIuY29tL3B5Y2EvY3J5cHRvZ3JhcGh5L2NvbW1pdC81ZTY0NzZhNGM2ZTA5NDkyNmE5ODNkY2Y1
Y2JlOTQ4OGMzMGFlYjUzCj4gCj4gV2Ugbm93IG5lZWQgdG8gZW5hYmxlIGNoYWNoYSBzdXBwb3J0
IHdoZW4gYnVpbGRpbmcgd2l0aCBsaWJvcGVuc3NsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbWVz
IEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoKSSBhbSBub3Qgc3VyZSB3aGV0
aGVyIHRoaXMgcGF0Y2ggaXMgdGhlIHJlc3VsdCBvZiBnZW5lcmFsIGJ1aWxkcm9vdCBtYWludGVu
YW5jZQpvciBpZiBpdCBhaW1zIHRvIHNvbHZlIGEgc3BlY2lmaWMgaXNzdWUsIGJ1dCBJIGZvdW5k
IGl0IHdoaWxlIHNlYXJjaGluZyB0byBzb2x2ZQpzb21lIHJ1bnRpbWUgZmFpbHVyZSB3aXRoIGFu
IGltYWdlIGJhc2VkIG9uIGJyYW5jaCAyMDI0LjAyLnguIEkgaGF2ZSBhIGN1c3RvbQpzY3JpcHQg
ZXhlY3V0aW5nIHRoZSBmb2xsb3dpbmcgY2FsbDoKCiBjZXJ0ID0gT3BlblNTTC5jcnlwdG8ubG9h
ZF9jZXJ0aWZpY2F0ZShPcGVuU1NMLmNyeXB0by5GSUxFVFlQRV9QRU0sCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2VydF9ieXRlcykKd2hpY2ggZmFpbHMg
d2l0aCB0aGUgZm9sbG93aW5nIGV4Y2VwdGlvbjoKCiBGaWxlICIvdXNyL2xpYi9weXRob24zLjEx
L3NpdGUtcGFja2FnZXMvT3BlblNTTC9jcnlwdG8ucHkiLCBsaW5lIDEzMjcsIGluCmdldF9zaWdu
YXR1cmVfYWxnb3JpdGhtCiBBdHRyaWJ1dGVFcnJvcjogbW9kdWxlICdsaWInIGhhcyBubyBhdHRy
aWJ1dGUgJ1g1MDlfQUxHT1JfZ2V0MCcKClRoaXMgZXJyb3IgaXMgZHVlIHRvIHBhY2thZ2UgcHl0
aG9uLXB5b3BlbnNzbCBleHBlY3RpbmcgcGFja2FnZQpweXRob24tY3J5cHRvZ3JhcGh5IHdpdGgg
dmVyc2lvbiBhdCBsZWFzdCA0MS4wLjUKKGh0dHBzOi8vZ2l0aHViLmNvbS9weWNhL2NyeXB0b2dy
YXBoeS9wdWxsLzk3NDAvZmlsZXMpLgoKU28gSSBjb25maXJtIHRoYXQgcHVsbGluZyB0aGlzIHBh
dGNoIG9uIHRvcCBvZiAyMDI0LjAyLnggZml4ZWQgbXkgaXNzdWUgOikKCi0tIApBbGV4aXMgTG90
aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRw
czovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
