Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC09C433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 21:06:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A913561264
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 21:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A913561264
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C25081B25;
	Thu, 11 Nov 2021 21:06:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GLzqsVVlSIJ5; Thu, 11 Nov 2021 21:06:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DEC381ADE;
	Thu, 11 Nov 2021 21:06:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B29A1BF388
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 21:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B6BD81ADE
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 21:06:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0mlgYGtIj3F5 for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 21:06:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62CB081AD1
 for <buildroot@busybox.net>; Thu, 11 Nov 2021 21:06:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:2dfd:466c:d080:8051])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id CBD7719F5A7;
 Thu, 11 Nov 2021 22:06:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636664771;
 bh=XvMvfeKuEzF+XS4Z/QOHc5eQEvvZh8B5xl4RU9Pmon8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aqi8S56MjSiWMF+fXFdd8uR8TGgIan3vCcz3cQNneOR8carDUOYHDpByrgEdJU3Np
 JcZLdr7KRt6bjQJD7EbjFUDd878ClZxyI/q9bKmaEbI5o9cuc1zBhh/LI+RPEfhNfr
 SgdA8FK+2ZVZSqdUy4LtI8+YOF3+OijGloVIf9pqKc+p6kNBS7Ux5brG7lCSvub1Xj
 nqIUSadOO7KA1rZer8lDpioikHpaankbN5m2njD9Gy+R6r6k6ixhmL9S0Eqfao6bF0
 o8xKDHiXSypsJJWZNj36v8LXEVc0Xrylhe4cZqSWfLvbxPkhVTWGomKrqY9awWnWME
 KIaADSsiH4wSQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Nov 2021 22:06:07 +0100
Date: Thu, 11 Nov 2021 22:06:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20211111210607.GD2609@scaer>
References: <20211110103107.421623-1-francois.perrad@gadz.org>
 <20211111205604.GC2609@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211111205604.GC2609@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2] package/luajit: fix luvi
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpJIGhpdCAic2VuZCIgdG9vIGZhc3Q7IGhlcmUncyB0aGUgcmVzdCBv
ZiBteSByZXZpZXc6CgpUaGUgdGl0bGUgY29kZSBzaG91bGQgbm90IHJlYWxseSBiZSBhYm91dCBs
dXZpLCBidXQgcmVhbGx5IGFib3V0IGxhdWppdC4KVGhpcyBwYXRjaCBpcyBub3QgZml4aW5nIGx1
dmk7IGl0IGlzIHJlYWxseSBmaXhpbmcgdGhlIGJ1aWxkIG9mIGx1YWppdC4KbHV2aSBqdXN0IGhh
cHBlbnMgdG8gYmUgdGhlIG9uZSBwYWNrYWdlIHRoYXQgZXhwb3NlZCB0aGUgaXNzdWUsIHNvIGl0
IGlzCm5vdCBmYWlyZSB0byBhc2NyaWJlIHRoZSBmYXVsdCB0byBpdC4KClByb2JhYmx5IHNvbWV0
aGluZyBsaWtlOgoKICAgIHBhY2thZ2UvbHVhaml0OiBlbnN1cmUgaG9zdCBhbmQgdGFyZ2V0IGFy
ZSBidWlsdCB3aXRoIHRoZSBzYW1lIGJ5dGVjb2RlIGZvcm1hdAoKT24gMjAyMS0xMS0xMSAyMTo1
NiArMDEwMCwgWWFubiBFLiBNT1JJTiBzcGFrZSB0aHVzbHk6Cj4gT24gMjAyMS0xMS0xMCAxMToz
MSArMDEwMCwgRnJhbmNvaXMgUGVycmFkIHNwYWtlIHRodXNseToKPiA+IGx1dmkgdXNlcyB0aGUg
Y3Jvc3MgYnl0ZWNvZGUgZ2VuZXJhdGlvbiBvZiBob3N0LWx1YWppdAo+ID4gdGhlIGJ5dGVjb2Rl
IGZvcm1hdCBoYXMgMiBmbGF2b3JzLCBkZXBlbmRpbmcgb2YgR0M2NCBvcHRpb24uCj4gPiAKPiA+
IHNpbmNlIHRoZSBjb21taXQgaHR0cHM6Ly9naXRodWIuY29tL0x1YUpJVC9MdWFKSVQvY29tbWl0
L2JkMDAwOTRjM2I1MGUxOTNmYjMyYWFkNzliN2VhOGVhNmI3OGVkMjUKPiA+IEdDNjQgbW9kZSBp
cyBlbmFibGUgYnkgZGVmYXVsdCBvbiBhbGwgNjRiaXRzIHBsYXRmb3JtLgo+ID4gCj4gPiB3aXRo
IHRoaXMgcGF0Y2gsIGx1YWppdCBhbmQgaG9zdC1sdWFqaXQgYXJlIGJ1aWx0IHdpdGggdGhlIHNh
bWUgb3B0aW9uLAo+ID4gc28gdGhlIGJ5dGVjb2RlIGdlbmVyYXRlZCBieSBob3N0LWx1YWppdCBp
cyB2YWxpZCBvbiBsdWFqaXQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJh
ZCA8ZnJhbmNvaXMucGVycmFkQGdhZHoub3JnPgo+ID4gLS0tCj4gPiAgcGFja2FnZS9sdWFqaXQv
bHVhaml0Lm1rIHwgMiArKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+
IAo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHVhaml0L2x1YWppdC5tayBiL3BhY2thZ2UvbHVh
aml0L2x1YWppdC5tawo+ID4gaW5kZXggZmJiZDhlYmM3Li5lOTMzNjFiYTMgMTAwNjQ0Cj4gPiAt
LS0gYS9wYWNrYWdlL2x1YWppdC9sdWFqaXQubWsKPiA+ICsrKyBiL3BhY2thZ2UvbHVhaml0L2x1
YWppdC5tawo+ID4gQEAgLTI2LDggKzI2LDEwIEBAIGVuZGlmCj4gPiAgIyBsaWJyYXJpZXMgYXJl
IGluc3RhbGxlZC4KPiA+ICBpZmVxICgkKEJSMl9BUkNIX0lTXzY0KSx5KQo+ID4gIExVQUpJVF9I
T1NUX0NDID0gJChIT1NUQ0MpCj4gPiArTFVBSklUX1hDRkxBR1MgKz0gLURMVUFKSVRfRU5BQkxF
X0dDNjQKClRoZXJlIGlzIG5vdCBzdWNoIG1hY3JvIGluIHRoZSBMdWFKaXQgY29kZS4KClJlZ2Fy
ZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBF
LiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3Mn
IGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBc
IC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0Mjcg
YC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMg
bm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBN
QUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
