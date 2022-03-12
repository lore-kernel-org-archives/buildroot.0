Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9D4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 20:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 785BD8261C;
	Sat, 12 Mar 2022 20:36:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r1_E5gK8XqAG; Sat, 12 Mar 2022 20:36:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C107813ED;
	Sat, 12 Mar 2022 20:36:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59DB71BF3DD
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46AD140486
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lejfcOzuq9hs for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 20:36:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2379840183
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 20:36:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:91a3:d0c0:1a06:f60f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id AECEE7802D1;
 Sat, 12 Mar 2022 21:36:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647117392;
 bh=r44I7JL6Ua4t4KeALHsj2UtsauN5qX3vQq3pmgmNZDE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eWIHgi+Y4seef3pJp/XTiofMRZgwzfQFppzNU0GBchTz20udOEY/yE2TXEqNGDT1i
 3zT6afzccO7B8awIevOHR2V+t9ofTd2v6gMd16B+meiKRS/dCxd+4TChVDnA1Jq1FR
 8jjJg7S1SkRX/aEEZtwkPBow+Zwn3NVRxjKoQCpZxyI6oySnj/b8Ee2iBpYW+848ys
 8D5i2Pgi8d+l0E1MZh4A89TYrQvymwSNxQp1BuUSl4MSzX7l0sTcL8wT5JmmcEBWJA
 hvfwHDmM1LSDXfMZJDdT2m7hJkF94JV4I0O3Mm6uhi8y8sOR1/qksh8yVinHtdTG3L
 7fsCNKhTlSZBQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 12 Mar 2022 21:36:27 +0100
Date: Sat, 12 Mar 2022 21:36:27 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Message-ID: <20220312203627.GM283544@scaer>
References: <20220311123636.13415-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220311123636.13415-1-clement.leger@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 0/7] boot/optee-os: support new optee-os
 3.16.0 build dependencies
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2zDqW1lbnQsIEFsbCwKCk9uIDIwMjItMDMtMTEgMTM6MzYgKzAxMDAsIENsw6ltZW50IEzDqWdl
ciB2aWEgYnVpbGRyb290IHNwYWtlIHRodXNseToKPiBOZXdlciB2ZXJzaW9ucyBvZiBvcHRlZS1v
cyAoPj0gMy4xNi4wKSB1c2VzIHB5dGhvbi1jcnlwdG9ncmFwaHkgaW5zdGVhZAo+IG9mIHB5dGhv
bi1weWNyeXB0b2RvbWV4IHRvIGJ1aWxkLiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgdG8gYnVp
bGQKPiBob3N0LXB5dGhvbi1jcnlwdG9ncmFwaHkgYW5kIHVzZXMgaXQgaW4gb3B0ZWUtb3MgcGFj
a2FnZSB0byBidWlsZCB0aGUKPiAzLjE2LjAgdmVyc2lvbi4gQWxzbyBidW1wIG9wdGVlLWNsaWVu
dCwgb3B0ZWUtYmVuY2htYXJrLCBvcHRlZS1leGFtcGxlcwo+IGFuZCBvcHRlZS10ZXN0IHdoaWNo
IG5lZWRzIHRvIGJlIGFsaWduZWQgd2l0aCBvcHRlZS1vcyB2ZXJzaW9uLgoKRm9sbG93aW5nIHRo
ZSBpbXBvcnRhbnQgcmV2aWV3IGZyb20gVGhvbWFzIG9uIHBhdGNoIDEsIEkndmUgbWFya2VkIHRo
aXMKc2VyaWVzIGFzIGNoYW5nZXMgcmVxdWVzdGVkIGluIFBhdGNod29yay4KClBsZWFzZSwgY2Fu
IHlvdSBhZGQgbWUgaW4gQ2Mgb2YgcGF0Y2ggMSBpbiBhIGZ1dHVyZSByZXNwaW4gKEkgdG9vIG1h
eQpoYXZlIHRvIGRlYWwgd2l0aCBweXRob24tY3J5cHRvZ3JhcGh5IG9uIHRoZSBob3N0IGluIHNo
b3J0IG9yZGVyKS4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLS0KPiBDaGFuZ2VzIGlu
IHYzOgo+IC0gRml4IGF1dGhvcnNoaXAgZm9yIGNvbW1pdHMgdGhhdCB3ZXJlIGNvcGllZCBmcm9t
IEV0aWVubmUgb25lcy4KPiAtIEZpeCBwYWNrYWdlIFVSTCBmb3Igb3B0ZWUtb3MKPiAtIEFkZGVk
IEFja2VkLWJ5IEV0aWVubmUgQ2FycmllcmUKPiAKPiBDaGFuZ2VzIGluIHYyOgo+IC0gQnVtcCBv
cHRlZS1jbGllbnQsIG9wdGVlLWJlbmNobWFyaywgb3B0ZWUtZXhhbXBsZXMgYW5kIG9wdGVlLXRl
c3QKPiAKPiBDbMOpbWVudCBMw6lnZXIgKDcpOgo+ICAgcGFja2FnZS9weXRob24tY3J5cHRvZ3Jh
cGh5OiBlbmFibGUgaG9zdCBwYWNrYWdlCj4gICBib290L29wdGVlLW9zOiBhZGQgc3VwcG9ydCB0
byBidWlsZCB3aXRoIHB5dGhvbi1jcnlwdG9ncmFwaHkKPiAgIGJvb3Qvb3B0ZWUtb3M6IGJ1bXAg
dG8gdmVyc2lvbiAzLjE2LjAKPiAgIHBhY2thZ2Uvb3B0ZWUtdGVzdDogYnVtcCB0byB2ZXJzaW9u
IDMuMTYuMAo+ICAgcGFja2FnZS9vcHRlZS1leGFtcGxlczogYnVtcCB0byB2ZXJzaW9uIDMuMTYu
MAo+ICAgcGFja2FnZS9vcHRlZS1jbGllbnQ6IGJ1bXAgdG8gdmVyc2lvbiAzLjE2LjAKPiAgIHBh
Y2thZ2Uvb3B0ZWUtYmVuY2htYXJrOiBidW1wIHRvIHZlcnNpb24gMy4xNi4wCj4gCj4gIGJvb3Qv
b3B0ZWUtb3MvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTMgKysrKysr
KysrKystLQo+ICBib290L29wdGVlLW9zL29wdGVlLW9zLmhhc2ggICAgICAgICAgICAgICAgICAg
ICAgICB8ICA0ICsrLS0KPiAgYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5tayAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgNyArKysrKystCj4gIHBhY2thZ2Uvb3B0ZWUtYmVuY2htYXJrL29wdGVl
LWJlbmNobWFyay5oYXNoICAgICAgIHwgIDQgKystLQo+ICBwYWNrYWdlL29wdGVlLWJlbmNobWFy
ay9vcHRlZS1iZW5jaG1hcmsubWsgICAgICAgICB8ICAyICstCj4gIHBhY2thZ2Uvb3B0ZWUtY2xp
ZW50L29wdGVlLWNsaWVudC5oYXNoICAgICAgICAgICAgIHwgIDQgKystLQo+ICBwYWNrYWdlL29w
dGVlLWNsaWVudC9vcHRlZS1jbGllbnQubWsgICAgICAgICAgICAgICB8ICAyICstCj4gIHBhY2th
Z2Uvb3B0ZWUtZXhhbXBsZXMvb3B0ZWUtZXhhbXBsZXMuaGFzaCAgICAgICAgIHwgIDQgKystLQo+
ICBwYWNrYWdlL29wdGVlLWV4YW1wbGVzL29wdGVlLWV4YW1wbGVzLm1rICAgICAgICAgICB8ICAy
ICstCj4gIHBhY2thZ2Uvb3B0ZWUtdGVzdC9vcHRlZS10ZXN0Lmhhc2ggICAgICAgICAgICAgICAg
IHwgIDQgKystLQo+ICBwYWNrYWdlL29wdGVlLXRlc3Qvb3B0ZWUtdGVzdC5tayAgICAgICAgICAg
ICAgICAgICB8ICAyICstCj4gIHBhY2thZ2UvcHl0aG9uLWNyeXB0b2dyYXBoeS9weXRob24tY3J5
cHRvZ3JhcGh5Lm1rIHwgIDcgKysrKysrKwo+ICAxMiBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRp
b25zKCspLCAxNyBkZWxldGlvbnMoLSkKPiAKPiAtLSAKPiAyLjM0LjEKPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
LS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJ
QkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUg
IERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMz
IDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBc
ZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxf
IHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0t
LS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
