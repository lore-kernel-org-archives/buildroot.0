Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380C2C4167D
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 18:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6C6784CB0;
	Wed,  1 Nov 2023 18:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6C6784CB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YYPnkWAhsKc2; Wed,  1 Nov 2023 18:07:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31C0784CDB;
	Wed,  1 Nov 2023 18:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31C0784CDB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E4551BF59F
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62E92431CD
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:07:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62E92431CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u5-66CLY96-H for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 18:07:33 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62DE5431C8
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 18:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62DE5431C8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7A1C61BF207;
 Wed,  1 Nov 2023 18:07:31 +0000 (UTC)
Date: Wed, 1 Nov 2023 19:07:28 +0100
To: "=?UTF-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LI=?= (Leonid Yuriev)"
 <leo@yuriev.ru>
Message-ID: <20231101190728.6dfd28ca@windsurf>
In-Reply-To: <20231017172108.142456-1-leo@yuriev.ru>
References: <20231017172108.142456-1-leo@yuriev.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698862051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/pF9wxsreNjEsWl1ZXUryRMgXFTAVa1v/9b+Q+KEa2A=;
 b=DKsrvCfL+YwJV9oJoAf3TScGvVkNc69Oh1nckLfnOosvDZSGXbKHvuwwQKswmdagiSZ+4G
 jeSPf1le3lcI6n0c/Ctth/yB1/yLfQNzMDrEZaTGa1P6bM74UIXVEbF3lzkZUthMnGX+Rh
 LUm1PxFeERTdxoAwzVhkifNkUIxedavYbvOcoVA5G5zYWG4FzZoBpEmUkdpdBUVY2pNy93
 CugLTHg1IxQtZzvGxo/ShbDDavovi5xc7MMXgAtwVy3cBaix2brv+dccH0b0aLt0991yvL
 6m4Cx2wSk/I4UZTwKCXfmvLDb146SagGe40nRILfN2aVe5b3c9gpa+MVkrtwSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DKsrvCfL
Subject: Re: [Buildroot] [PATCH] package/libmdbx: bump version to 0.12.8
 "Vladimir Utkin"
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

T24gVHVlLCAxNyBPY3QgMjAyMyAyMDoyMTowNyArMDMwMArQm9C10L7QvdC40LQg0K7RgNGM0LXQ
siAoTGVvbmlkIFl1cmlldikgPGxlb0B5dXJpZXYucnU+IHdyb3RlOgoKPiBUaGlzIGlzIGJ1Z2Zp
eCByZWxlYXNlIG9mIHN0YWJsZSBsaWJtZGJ4IGJyYW5jaCwgb24gdGhlIGRheSBvZiB0aGUgMTAw
dGgKPiBhbm5pdmVyc2FyeSBvZiB0aGUgYmlydGggb2YgdGhlIG91dHN0YW5kaW5nIFNvdmlldCBh
bmQgUnVzc2lhbiBzY2llbnRpc3QKPiBhbmQgZW5naW5lZXIgVmxhZGltaXIgRmVkb3JvdmljaCBV
dGtpbi4KPiAKPiBJdCBpcyByZWFzb25hYmxlIHRvIGJhY2twb3J0IHRoaXMgcGF0Y2ggdG8gYWxs
IGFwcGxpY2FibGUgcmVsZWFzZXMvYnJhbmNoZXMgb2YgQnVpbGRyb290Lgo+IAo+IFRoZSBtb3N0
IHNpZ25pZmljYW50IGZpeGVzIG9mIHYwLjEyLjg6Cj4gIC0gRml4ZWQgcmVncmVzc2lvbiBvZiBt
ZGJ4X3B1dChNREJYX01VTFRJUExFKSBkdXJpbmcgYmF0Y2gvYnVsawo+ICAgIGluc2VydGlvbiBv
ZiBtdWx0aS12YWx1ZXMgKGFrYSAiZHVwc29ydCIpLgo+ICAtIEltcGxlbWVudGVkIG92ZXJ3cml0
aW5nIGluIG1kYnhfcHV0KE1EQlhfQ1VSUkVOVCkgb2YgYWxsIGN1cnJlbnQKPiAgICBtdWx0aS1r
ZXkgdmFsdWVzIGluIHRoZSBhYnNlbmNlIG9mIHRoZSBmbGFnIE1EQlhfTk9PVkVSV1JJVEUuCj4g
IC0gQWRkZWQgdGhlIGFiaWxpdHkgdG8gdXNlIG1kYnhfY3Vyc29yX2dldChNREJYX0dFVF9NVUxU
SVBMRSkgd2l0aG91dAo+ICAgIGZpcnN0IHNldHRpbmcgdGhlIGN1cnNvciwgY29tYmluaW5nIHRo
ZSBiYXRjaCBkYXRhIGdldHRpbmcgb3BlcmF0aW9uCj4gICAgd2l0aCBwb3NpdGlvbmluZyB0aGUg
Y3Vyc29yLgo+ICAtIE1pY3JvLW9wdGltaXphdGlvbiBhbmQgcmVmYWN0b3JpbmcgY3Vyc29yX3B1
dF9ub2NoZWNrbGVuKCkuCj4gIC0gQ2xhcmlmeWluZyB0aGUgd29yZGluZyBpbiB0aGUgQVBJIGRl
c2NyaXB0aW9uLCBpbmNsdWRpbmcgZXhwbGFuYXRpb24KPiAgICBhYm91dCBTSUdTRUdWIGFuZCBu
b3QgYWxsb3dpbmcgZGlyZWN0IGRhdGEgY2hhbmdlcy4KPiAKPiBUaGUgY29tcGxldGUgQ2hhbmdl
TG9nOiBodHRwczovL2dpdGZsaWMucnUvcHJvamVjdC9lcnRoaW5rL2xpYm1kYngvYmxvYj9maWxl
PUNoYW5nZUxvZy5tZAo+IAo+IFNpZ25lZC1vZmYtYnk6INCb0LXQvtC90LjQtCDQrtGA0YzQtdCy
IChMZW9uaWQgWXVyaWV2KSA8bGVvQHl1cmlldi5ydT4KPiAtLS0KPiAgcGFja2FnZS9saWJtZGJ4
L2xpYm1kYnguaGFzaCB8IDIgKy0KPiAgcGFja2FnZS9saWJtZGJ4L2xpYm1kYngubWsgICB8IDIg
Ky0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpB
cHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBD
VE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczov
L2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
