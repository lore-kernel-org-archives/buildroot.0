Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978A0C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 16:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21DA640127;
	Sat,  8 Jan 2022 16:29:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CDnS0RVqt_k7; Sat,  8 Jan 2022 16:29:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BBC94011B;
	Sat,  8 Jan 2022 16:29:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB7A81BF599
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6CE04011B
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:29:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j7ZBEtxstu0E for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 16:29:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DC34400BA
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 16:29:51 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 6EbFnKFA5Zs8s6EbGnmZNW; Sat, 08 Jan 2022 17:29:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1641659390; bh=EwCaOZaLKsPMN0Wh4AQ5hcwX0sa71+QHUfzNSLIOc+A=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=lNkFRVgZ8Ta5n4eHtNhkoF9SoFByp1eYpXQbHZnLpUrAdnsxxyb/W84LbuElcjQl/
 2TW8Pp69TSbTESMvYuJZ3O4bhpHl9BSXsm2c6iKqQWnFa/1kaSuQ8cN2YrvjevymQS
 Kbnd6XXyshIxK43JKgc4KlNnXnrMvMxJKIe/ZJMBlxWn7l+fg5whSsE23GHzbXwkql
 aEGZO11ld/yIH7kgdsLkRppq4WU9STQjmBnd5pBHUA0/cvmMxowd/CQ/73MDjloM6/
 eNznTsLzo71h8pBXtvOLRmzgnH9kfZJHRkjmbCcE/lK/hY+Wd7D3imGtoy9mK/7dtI
 dqzLhoUcr7aIA==
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211018214535.5743fd67@windsurf>
 <41CC9CB4-4706-4071-B3A4-3268638ADFC8@benettiengineering.com>
 <20211018234037.3e1ec4cc@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <f7d56182-70ac-822a-dfeb-1eddfab146c7@benettiengineering.com>
Date: Sat, 8 Jan 2022 17:29:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211018234037.3e1ec4cc@windsurf>
Content-Language: en-US
X-CMAE-Envelope: MS4wfOH8PDKdpaY85DAlOZY8E/NHL/FNxGQTM768ogegxf6h5Y8G/27zC+yg4D/cpiZ/Q006vz9ZWyiXTVw+ehngDIKhcyLZGvXPRc+EncDxtAuzhtSCye6z
 C/sbdG1vEUGApeVSGiIBf9F0AcB8WtM7d5N+Uvkl1eRFeXBgEiaN8rpp7QJfDRuLrVfW09XIcrxCAnjq5hONOZGqciI5PV/65rgijWcrlku5z0iPdUC+3zUY
 52V2DytvTdcEVApse43RjemdP7GX1ItSrcqgROFVyKY=
Subject: Re: [Buildroot] [PATCH v2] configs/olimex_a20_olinuxino: fix mali
 not working because Linux version >= 4.20
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTgvMTAvMjEgMjM6NDAsIFRob21hcyBQZXRhenpvbmkgd3JvdGU6Cj4gT24gTW9uLCAxOCBP
Y3QgMjAyMSAyMTo1OTo0MSArMDIwMAo+IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBi
ZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPiAKPj4gVGhleSBpbnN0ZWFkIGVuYWJsZSBz
cGVjaWZpY2FsbHkgc3VueGktbWFsaS1tYWlubGluZSogaW4gbGltZSBhbmQKPj4gbGltZTIgZGVm
Y29uZmlncy4gU28gYXQgdGhlIG1vbWVudCBzdW54aS1tYWxpLW1haW5saW5lIGlzIGJ1aWx0IGJ1
dAo+PiBpdCBjYW7igJl0IHdvcmsgYW5kIGl0IGRvZXNu4oCZdCBtYWtlIHNlbnNlLiBBbHNvIHVw
IHRvIExpbnV4IDQuMjAgdGhpcwo+PiBuZWl0aGVyIHdvcmtlZCBiZWNhdXNlIG9mIGxhY2sgb2Yg
ZG91YmxlIGJ1ZmZlci4gU28gYmFzaWNhbGx5IGhlcmUKPj4gc3VueGktbWFsaS1tYWlubGluZSBJ
4oCZbSBwcmV0dHkgc3VyZSBuZXZlciB3b3JrZWQuCj4gCj4gQWFoLCBJIGhhZG4ndCByZWFsaXpl
ZC92ZXJpZmllZCB0aGF0IHRoZXkgZW5hYmxlZCBzdW54aS1tYWxpLW1haW5saW5lKi4KPiBJbiB0
aGlzIGNhc2UsIG9idmlvdXNseSB5b3VyIHBhdGNoIG1ha2VzIHNlbnNlLiBJJ3ZlIHN3aXRjaGVk
IGl0IGJhY2sKPiB0byAiTmV3IiBpbiBwYXRjaHdvcmsuCj4gCj4gVGhhbmtzIGZvciB0aGUgYWRk
aXRpb25hbCBleHBsYW5hdGlvbiEKPiAKPiBUaG9tYXMKPiAKClBpbmcuIFRoaXMgaXMgc3RpbGwg
bmVlZGVkIGZvciBoYXZpbmcgTWFsaSB3b3JraW5nIHdpdGggb3RoZXIgYXBwbGllZCAKcGF0Y2hl
czoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0Lz9z
ZXJpZXM9MjcwNjU2JnN0YXRlPSoKCi0tIApHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVy
aW5nIHNhcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
