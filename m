Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7700C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 11:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47B33825E8;
	Sun, 24 Apr 2022 11:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jRkSFn2CgY2K; Sun, 24 Apr 2022 11:35:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AAA0824CE;
	Sun, 24 Apr 2022 11:35:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 508CE1BF580
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 11:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C0B360BD1
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 11:35:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HihaQTTitAM9 for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 11:35:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B149160BD0
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 11:35:40 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 178AA440535;
 Sun, 24 Apr 2022 14:34:53 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1650800093;
 bh=wTwgJSL7adzyRscbNZJfGmI5N3Yr/BrOCjXKsm+7TY0=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=Gt57cZwAMppfSeMhVLq1dLpzJk/r0tz1FyQv87gy4TvYKZ5VOGsrX6hKHZvjJmx3F
 ldc3R/N1Q5SOadeKlcmw47VGjlCk3R+WTu0wwXgsea9q7xelHMcQKNRJDNaSvtVNUW
 Ofilo57EgUukBCHnh1lRKjkfkWbJ0mrWgQfP7YLaFwDOfdD7DFNhb8o4bVks0X+OG9
 YTni6BHHNQsXYjB+HLQAIB3WXsFWACWiXwb1fCAfioRmtH9R6GNN75x7lCX3YM0hcF
 6mLhsUy23UPTKkuHlbg31biKY/ezcGvzPIi90h+PeMxqkHfbVtMc9TxvXlQr2IJzMs
 Cm3pnv/5KVqLg==
References: <20220420083923.3875405-1-thomas.perrot@bootlin.com>
 <20220420083923.3875405-2-thomas.perrot@bootlin.com>
 <87pmlbr70w.fsf@tarshish>
 <13e22a566019cfbb7f9a6de52a485dad687e1217.camel@bootlin.com>
 <20220422121639.5118cd38@windsurf>
User-agent: mu4e 1.6.10; emacs 27.1
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Apr 2022 14:19:48 +0300
In-reply-to: <20220422121639.5118cd38@windsurf>
Message-ID: <875ymy3e9k.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/imx-cst: new package
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas Perrot <thomas.perrot@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gRnJpLCBBcHIgMjIgMjAyMiwgVGhvbWFzIFBldGF6em9uaSB3cm90ZToK
PiBPbiBGcmksIDIyIEFwciAyMDIyIDEyOjA5OjAwICswMjAwCj4gVGhvbWFzIFBlcnJvdCA8dGhv
bWFzLnBlcnJvdEBib290bGluLmNvbT4gd3JvdGU6Cj4KPj4gPiBJdCBsb29rcyBsaWtlIHRoZSBv
bmx5IGRpZmZlcmVuY2UgYmV0d2VlbiA2NCBhbmQgMzIgaXMgaW4gb3BlbnNzbAo+PiA+IGJ1aWxk
Cj4+ID4gcnVsZSwgYW5kIGZvciB4ODYgKGhvc3QpIHRhcmdldHMgb25seS4gV2UgZG9uJ3QgdXNl
IHRoaXMgb3BlbnNzbCBydWxlCj4+ID4gc2luY2Ugd2UgYnVpbGQgaG9zdC1vcGVuc3NsIHdpdGgg
b3VyIG93biBydWxlcy4gU28gbWF5YmUgd2UgY2FuIGp1c3QKPj4gPiBhcmJpdHJhcmlseSBjaG9v
c2UgaGFyZCBjb2RlZCAnbGludXg2NCcuIEl0IHNlZW1zIHRoYXQKPj4gPiBkZWJpYW4vTWFrZWZp
bGUKPj4gPiBkb2VzIHRoYXQuICAKPj4gCj4+IFRoYW5rcyBmb3IgeW91ciByZXZpZXcsIEnigJlt
IHN1Ym1pdHRpbmcgYSB2MyB3aXRoIHRoZSBPU1RZUEUgdmFyaWFibGUKPj4gaGFyZGNvZGVkIHRv
IGxpbnV4NjQuCj4KPiBObywgcGxlYXNlIGRvbid0LiBXZSdyZSBkb2luZyB0aGUgYnVpbGQgbGlr
ZSB0aGlzOgo+Cj4gYnVpbGQ6Cj4gICAgICAgICAkKE1BS0UpIC1DICQoQ1NUX0NPREVfUEFUSCkv
b2JqLiQoT1NUWVBFKSBidWlsZAo+Cj4gQW5kIGNvZGUvY3N0L2NvZGUvb2JqLmxpbnV4MzIvTWFr
ZWZpbGUgY29udGFpbnM6Cj4KPiBDT1BUSU9OUyArPSAtbTMyCj4gTERPUFRJT05TICs9IC1tMzIK
Pgo+IHdoaWxlIGNvZGUvY3N0L2NvZGUvb2JqLmxpbnV4NjQvTWFrZWZpbGUgY29udGFpbnMKPgo+
IENPUFRJT05TICs9IC1tNjQKPiBMRE9QVElPTlMgKz0gLW02NAo+Cj4gQW5kIEkgY2FuIGRlZmlu
aXRlbHkgc2VlIHRoZSAtbTY0IGJlaW5nIGFkZGVkIGluIHRoZSBjb21waWxlciBmbGFncwo+IHdo
ZW4gZG9pbmcgYSBidWlsZCBvbiBhIHg4Ni02NCBob3N0IChydW4gdGhlIGJ1aWxkIHdpdGggVkVS
Qk9TRT0xLCB5b3UKPiB3aWxsIHNlZSkuCj4KPiBTbyBpZiB5b3UgdXNlIGxpbnV4NjQgdW5jb25k
aXRpb25hbGx5LCB0aGUgQ1NUIGJpbmFyaWVzIHdpbGwgYmUgYnVpbHQKPiB3aXRoIC1tNjQsIGV2
ZW4gb24gMzItYml0IGhvc3QgbWFjaGluZXMgPT4gYmFkLgoKWW91IGFyZSByaWdodC4gSSBkaWRu
J3Qgbm90aWNlIHRoZXNlIC1tMzIvLW02NCBwYXJhbWV0ZXJzLgoKQnV0IHRoYXQgcmFpc2VzIGFu
b3RoZXIgcHJvYmxlbS4gLW0zMi8tbTY0IGFyZSBwbGF0Zm9ybSBzcGVjaWZpYwpvcHRpb25zLiBB
IHF1aWNrIGxvb2sgYXQgdGhlIEdDQyBtYW51YWwgaW5kaWNhdGVzIHRoYXQgeDg2LCBTcGFyYywg
YW5kClBvd2VyUEMgdGFyZ2V0cyBzdXBwb3J0IHRoZXNlIG9wdGlvbnMuIFMzOTAgc3VwcG9ydHMg
LW02NCwgYnV0IG5vdAotbTMyLiBBUk0vQVJNNjQgc3VwcG9ydCBub25lLiBTbyB0aGlzIHBhY2th
Z2Ugc2hvdWxkIGRlcGVuZCBvbiBob3N0CmFyY2hpdGVjdHVyZXMgdGhhdCBzdXBwb3J0IC1tMzIv
LW02NC4KCkFsdGVybmF0aXZlbHkgd2UgY2FuIGp1c3QgcGF0Y2ggb3V0IHRoZSB3aG9sZSAzMi82
NCB0aGluZy4gVGhpcyBpcyBtb3N0Cmxpa2VseSBhIHJlbW5hbnQgb2YgcHJldmlvdXMgdmVyc2lv
bnMgdGhhdCBzaGlwcGVkIGJpbmFyeSAuYSBmaWxlcy4KCmJhcnVjaAoKLS0gCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfi4gLn4gICBUayBPcGVu
IFN5c3RlbXMKPX0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS1vb08tLVUtLU9vby0tLS0tLS0tLS0tLXs9CiAgIC0gYmFydWNoQHRrb3MuY28uaWwgLSB0ZWw6
ICs5NzIuNTIuMzY4LjQ2NTYsIGh0dHA6Ly93d3cudGtvcy5jby5pbCAtCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
