Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73017EB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BFC761426;
	Fri, 14 Jul 2023 10:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BFC761426
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gQcO1kd2qCV3; Fri, 14 Jul 2023 10:18:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5291D6141E;
	Fri, 14 Jul 2023 10:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5291D6141E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E5F21BF313
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DCF2818C9
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DCF2818C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JumJQ9q_dcWL for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:18:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C424D8146C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C424D8146C
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:18:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B15F61C000C;
 Fri, 14 Jul 2023 10:18:35 +0000 (UTC)
Date: Fri, 14 Jul 2023 12:18:34 +0200
To: Ignacy =?UTF-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
Message-ID: <20230714121834.22742681@windsurf>
In-Reply-To: <20230714090804.kaid6vdlxiubf632@zenon.in.qult.net>
References: <20230714090804.kaid6vdlxiubf632@zenon.in.qult.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689329916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IjJpRSHUSn7grJfLuGs6I5Effakme0tt1ILIdrXF6tY=;
 b=M2O4dlrkqj4TUz2UkwoQuXsXUhuEzsT2AoCFjXchPJ9PeouY88SQihCKqySAtEt7v/4RlC
 OnskJ6lMSWW5Ih9EcVifYgf9mqW/qteZ162zGzzchcC/672mNc4si4Dz6u804rIDoH60AM
 cAgbfuoT9i8IFThtQd6CtmdcVkELAaV2L1brJEIw05DN2yKVT/NNCpkI1d2hnRiYO5rl92
 HCXBQQ78Pg9GGnJfxzwihsvD/3IpNdBrH3a6jCj7J8GzSCx1S4AwdRyISYl1w/UFZKSecf
 A67LbrpznzPOAgEVLbau23ItRGqy46sQa2tfC3om5MhrJgVtaRAbytc5RNHr4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M2O4dlrk
Subject: Re: [Buildroot] [PATCH] package/elfutils: enable building with
 musl-based toolchains
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSWduYWN5LAoKT24gRnJpLCAxNCBKdWwgMjAyMyAxMTowODowNCArMDIwMApJZ25hY3kg
R2F3xJlkemtpIDxpZ25hY3kuZ2F3ZWR6a2lAZ3JlZW4tY29tbXVuaWNhdGlvbnMuZnI+IHdyb3Rl
OgoKPiBTZWxlY3QgQlIyX1BBQ0tBR0VfQVJHUF9TVEFOREFMT05FIGFzIHNvb24gYXMgdGhlIHRv
b2xjaGFpbiBpcyBub3QKPiBnbGliYy1iYXNlZCBhbmQgYWRkIGFyZ3Atc3RhbmRhbG9uZSB0byBi
dWlsZCBkZXBlbmRlbmNpZXMgaW4gdGhhdAo+IGNhc2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogSWdu
YWN5IEdhd8SZZHpraSA8aWduYWN5Lmdhd2VkemtpQGdyZWVuLWNvbW11bmljYXRpb25zLmZyPgo+
IC0tLQo+ICBwYWNrYWdlL2VsZnV0aWxzL0NvbmZpZy5pbiAgIHwgOSArKystLS0tLS0KPiAgcGFj
a2FnZS9lbGZ1dGlscy9lbGZ1dGlscy5tayB8IDUgKysrKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpUaGlzIGxvb2tzIHZlcnkgZ29vZCwgYW5k
IHdhcyB0ZXN0ZWQgc3VjY2Vzc2Z1bGx5IGhlcmUsIGJ1dCB5b3UgbmVlZCB0bwpnbyB0aHJvdWdo
IGFsbCB0aGUgcmV2ZXJzZSBkZXBlbmRlbmNpZXMgb2YgZWxmdXRpbHMsIGFuZCBjaGVjayBpZiB0
aGV5CmNhbiBub3cgYnVpbGQgd2l0aCBtdXNsLiBUbyBkbyB0aGF0OgoKJCBnaXQgZ3JlcCAic2Vs
ZWN0IEJSMl9QQUNLQUdFX0VMRlVUSUxTIgpwYWNrYWdlL2F2cmR1ZGUvQ29uZmlnLmluOiAgICAg
IHNlbGVjdCBCUjJfUEFDS0FHRV9FTEZVVElMUwpwYWNrYWdlL2JwZnRvb2wvQ29uZmlnLmluOiAg
ICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9FTEZVVElMUwpwYWNrYWdlL2ZhbGNvc2VjdXJpdHktbGli
cy9Db25maWcuaW46ICAgc2VsZWN0IEJSMl9QQUNLQUdFX0VMRlVUSUxTCnBhY2thZ2Uva2V4ZWMt
bGl0ZS9Db25maWcuaW46ICAgc2VsZWN0IEJSMl9QQUNLQUdFX0VMRlVUSUxTCnBhY2thZ2UvbGli
YnBmL0NvbmZpZy5pbjogICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0VMRlVUSUxTCnBhY2thZ2Uv
bHRyYWNlL0NvbmZpZy5pbjogICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0VMRlVUSUxTCnBhY2th
Z2UvbWFrZWR1bXBmaWxlL0NvbmZpZy5pbjogc2VsZWN0IEJSMl9QQUNLQUdFX0VMRlVUSUxTCnBh
Y2thZ2UvbWVzYTNkL0NvbmZpZy5pbjogICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0VMRlVUSUxT
IGlmIEJSMl9QQUNLQUdFX01FU0EzRF9MTFZNCnBhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbjogICAg
ICAgc2VsZWN0IEJSMl9QQUNLQUdFX0VMRlVUSUxTCnBhY2thZ2UvcGV0aXRib290L0NvbmZpZy5p
bjogICAgc2VsZWN0IEJSMl9QQUNLQUdFX0VMRlVUSUxTCnBhY2thZ2UvcmFjZWhvdW5kL0NvbmZp
Zy5pbjogICAgc2VsZWN0IEJSMl9QQUNLQUdFX0VMRlVUSUxTCgpGb3IgZXhhbXBsZSwgYXZyZHVk
ZSBoYXM6CgogICAgICAgIGRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9VU0VTX1VDTElCQyB8fCBC
UjJfVE9PTENIQUlOX1VTRVNfR0xJQkMgIyBlbGZ1dGlscwoKd2hpY2ggaXMgbm8gbG9uZ2VyIGNv
cnJlY3QsIGFzIGVsZnV0aWxzIG5vIGxvbmdlciBoYXMgdGhpcyBkZXBlbmRlbmN5LgpTbyB5b3Ug
bmVlZCB0byBldmFsdWF0ZSBpZiBlYWNoIG9mIHRob3NlIHJldmVyc2UgZGVwZW5kZW5jaWVzIG5v
dwpidWlsZHMgZmluZSB3aXRoIG11c2wsIGluIHdoaWNoIGNhc2UgdGhlIHVjbGliYyB8fCBnbGli
YyBkZXBlbmRlbmN5IGNhbgpiZSBkcm9wcGVkLCBvciBpZiB0aGUgcGFja2FnZSBzdGlsbCBkb2Vz
bid0IGJ1aWxkIHdpdGggbXVzbCwgaW4gd2hpY2gKY2FzZSBpdCdzIG5vIGxvbmdlciBlbGZ1dGls
cyBmYXVsdCwgYnV0IHNvbWUgb3RoZXIgcmVhc29uIChhbmQgdGhlCmNvbW1lbnQgb24gdGhlIHVj
bGliYyB8fCBnbGliYyBuZWVkcyB0byBiZSB1cGRhdGVkKS4gQXMgYW4gZXhhbXBsZSwKYXZyZHVk
ZSBub3cgYnVpbGRzIGZpbmUgd2l0aCBtdXNsLgoKQW5kIHRoZSBmdW4gZ2FtZSBpcyB0aGF0IHRo
aXMgd29yayBuZWVkcyB0byBiZSBkb25lIHJlY3Vyc2l2ZWx5OiBvbmNlCnlvdSBoYXZlIGNoZWNr
ZWQgaWYgZm9yIGV4YW1wbGUgbGliYnBmIGNhbiBub3cgYnVpbGQgd2l0aCBtdXNsLCB5b3UKbmVl
ZCB0byBsb29rIGF0IHRoZSByZXZlcnNlIGRlcGVuZGVuY2llcyBvZiBsaWJicGYgKGluIHRoaXMg
Y2FzZSwgb25seQpwYWNrYWdlL2ttZW1kKS4KCkNvdWxkIHlvdSBoYXZlIGEgbG9vayBhdCBkb2lu
ZyB0aGlzPwoKVGhhbmtzIGEgbG90IQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8s
IEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jv
b3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
