Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B6CC19F2B
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 21:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D005403FF;
	Wed,  3 Aug 2022 21:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D005403FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l1xJ_ByaS1M5; Wed,  3 Aug 2022 21:07:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9ECB40332;
	Wed,  3 Aug 2022 21:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9ECB40332
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16D661BF9B9
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 21:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5E8D817C3
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 21:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5E8D817C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tqUz5Q9bxTu2 for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 21:07:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F12018174F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F12018174F
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 21:07:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c944:63a3:5f2a:bb6f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 546D978051D;
 Wed,  3 Aug 2022 23:07:36 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 03 Aug 2022 23:07:35 +0200
Date: Wed, 3 Aug 2022 23:07:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20220803210735.GB3321867@scaer>
References: <20220729000904.1295295-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220729000904.1295295-1-joel@jms.id.au>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659560864;
 bh=9PlhVkxvlo0xu0cNhdaxpW0Y6rye8jiaoLAzIAYNK9A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oBFpc3I0ib0swg/05f2Tqe5MacK21k/LbdwwYeyhrCI9b1xw+xGP5EIAJYQ+bXqQ9
 MTXI0IevV6TMU9eOkDVPyV1crqblLj6mA9RC5dd3Qiu1BVoHP1Ual+LlP6K/BTNQjJ
 WMqUcgCPirQESbLOP2JKQX35euIFPU5w1isrTgrg2iCnM3rfAwVxIQ+vO9b8/wAcMr
 X+km9LGG8ydcs4JWImLQY1mFdjk1PRAill69SJgKAZ/bzE4qGdiB6qc2GNiT1dFW9R
 sv7M+91eg+fjisuIzKnObPLJQq34p+H9a8/909XdexLg07YWzAu/vIpQYGXqUigNmT
 QY0vizX5lkc2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oBFpc3I0
Subject: Re: [Buildroot] [PATCH 0/9] powerpc: Fix ppc64le configurations
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sm9lbCwgQWxsLAoKT24gMjAyMi0wNy0yOSAwOTozOCArMDkzMCwgSm9lbCBTdGFubGV5IHNwYWtl
IHRodXNseToKPiBUaGUgYXV0b2J1aWxkZXIgaGFzIGRldGVjdGVkIGEgYnVuY2ggb2YgcG93ZXJw
YyBidWlsZCBmYWlsdXJlcyBpbiByZWNlbnQKPiBtb250aHMsIGxlYWRpbmcgdG8gd29ya2Fyb3Vu
ZHMgYXBwbGllZCB0byB2YXJpb3VzIHBhY2thZ2VzLiBNYW55IG9mIHRoZXNlCj4gZmFpbHVyZXMg
d2VyZSBjYXVzZWQgYnkgaW52YWxpZCBHQ0MgY29uZmlndXJhdGlvbnM6IGJ1aWxkaW5nIEdDQyBp
bgo+IGxpdHRsZSBlbmRpYW4gb3IgNjQtYml0IG1vZGUgZm9yIENQVXMgdGhhdCBkb24ndCBzdXBw
b3J0IHRoYXQKPiBjb25maWd1cmF0aW9uLgoKVGhhbmtzIGZvciB0YWNrbGluZyB0aGUgaXNzdWUh
IPCfkY0KClRoZXJlIGhhcyBiZWVuIHNvbWUgZmVlZGJhY2sgb24gc29tZSBwYXRjaGVzIGluIHRo
ZSBzZXJpZXMsIHdoaWNoIHdpbGwKcmVxdWlyZSBlaXRoZXIgc29tZSBvZiB0aGUgcGF0Y2hlcyB0
byBiZSByZXdvcmtlZCwgYW5kL29yIHRoZSBjb21taXQKbG9ncyB0byBiZSBleHBhbmRlZCB3aXRo
IHNvbWUgbW9yZSBkZXRhaWxlZCBleHBsYW5hdGlvbnMuCgpTbyBJJ3ZlIG1hcmtlZCB0aGlzIHNl
cmllcyBhcyBDaGFuZ2VzLXJlcXVlc3RlZCBpbiBwYXRjaHdvcmsuCgpMb29raW5nIGZvcndhcmQg
dG8gc2VlaW5nIGhlIG5leHQgaXRlcmF0aW9uIHRvIGV2ZW50dWFsbHkgZml4IHRoZQppc3N1ZXMh
CgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiBUaGUgZmlyc3QgZmV3IHBhdGNoZXMgY2xhcmlm
eSB0aGUgbWVudWNvbmZpZyBvcHRpb25zIGZvciBwb3dlcnBjLgo+IAo+IFRoZSB0aGlyZCBwYXRj
aCAiYXJjaC9wb3dlcnBjOiBFbmFibGUgcG93ZXJwYzY0bGUgb25seSBvbiBDUFVzIHRoYXQKPiBz
dXBwb3J0IGl0IiBzaG91bGQgc3RvcCBhIHVzZXIgZnJvbSBzZWxlY3RpbmcgYSBwcGM2NGxlIGNv
bmZpZyBmb3IgYSBDUFUKPiB0aGF0IGRvZXNuJ3Qgc3VwcG9ydCBpdC4gVGhlIGxpc3Qgb2Ygc3Vw
cG9ydGVkIGNvbmZpZ3VyYXRpb25zIGNhbiBiZQo+IGNyb3NzIHJlZmVyZW5jZWQgZnJvbSB0aGUg
a2VybmVsIEtjb25maWc6Cj4gCj4gIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1
LjE4L3NvdXJjZS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL0tjb25maWcuY3B1dHlwZSNMMTU3Cj4g
Cj4gUGF0Y2hlcyA0LTUgYWRkIG5ldyBQb3dlciBzZXJ2ZXIgQ1BVcyBmcm9tIElCTS4KPiAKPiBU
aGUgZmluYWwgdGhyZWUgcGF0Y2hlcyByZW1vdmUgd29ya2Fyb3VuZHMgYXBwbGllZCBmb3IgcG93
ZXI4LCB3aGljaAo+IGFyZSB1bm5lY2Vzc2FyeSBub3cuIFRoaXMgc2hvdWxkIGVuYWJsZSBwYWNr
YWdlcyB0byBiZSBidWlsdCB3aXRoCj4gb3B0aW1pc2F0aW9ucyBmb3IgcDkvcDEwIHdoZXJlIGFw
cGxpY2FibGUuCj4gCj4gSSd2ZSBib290IHRlc3RlZCBhbGwgb2YgdGhlIGluLXRyZWUgY29uZmln
cywgYW5kIHRlc3RlZCB0aGUgcDkgYW5kIHAxMAo+IGNwdSB0eXBlcy4KPiAKPiBKb2VsIFN0YW5s
ZXkgKDkpOgo+ICAgYXJjaC9wb3dlcnBjOiBIaWRlIFNQRSBBQkkgYmVoaW5kIENQVSB0eXBlCj4g
ICBhcmNoL3Bvd2VycGM6IENsYXJpZnkgZ2VuZXJpYyBDUFVzCj4gICBhcmNoL3Bvd2VycGM6IEVu
YWJsZSBwb3dlcnBjNjRsZSBvbmx5IG9uIENQVXMgdGhhdCBzdXBwb3J0IGl0Cj4gICBwYWNrYWdl
L2dsaWJjOiBVc2UgcG93ZXJwYzY0bGUgaW5zdGVhZCBvZiBwb3dlcjgKPiAgIGFyY2gvcG93ZXJw
YzogQWRkIFBvd2VyOSBDUFUgdHlwZQo+ICAgYXJjaC9wb3dlcnBjOiBBZGQgUG93ZXIxMCBDUFUg
dHlwZQo+ICAgcGFja2FnZS9tZXNhM2Q6IFJlbW92ZSBmb3JjZSBkaXNhYmxlIG9mIHBvd2VyOAo+
ICAgcGFja2FnZS96bGliLW5nOiBSZXZlcnQgUG93ZXI4IHNwZWNpYWwgY2FzaW5nCj4gICBwYWNr
YWdlL29wZW5ibGFzOiBBZGQgUG93ZXI5IGFuZCBQb3dlcjEwIHRhcmdldHMKPiAKPiAgYXJjaC9D
b25maWcuaW4ucG93ZXJwYyAgICAgfCA0MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLQo+ICBwYWNrYWdlL2dsaWJjL0NvbmZpZy5pbiAgICB8ICAyICstCj4gIHBhY2thZ2Uv
bWVzYTNkL21lc2EzZC5tayAgIHwgIDMgKy0tCj4gIHBhY2thZ2Uvb3BlbmJsYXMvQ29uZmlnLmlu
IHwgIDIgKysKPiAgcGFja2FnZS96bGliLW5nL3psaWItbmcubWsgfCAgNiAtLS0tLS0KPiAgNSBm
aWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiAKPiAtLSAK
PiAyLjM1LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+
IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoK
LS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1l
IEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMz
IDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBf
X18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0t
LTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jp
bi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNw
aXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0t
LS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
