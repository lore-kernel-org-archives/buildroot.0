Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CF5CA0EE4
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 16:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 983F54070E;
	Fri, 15 Aug 2025 16:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sinDiS2ztK_b; Fri, 15 Aug 2025 16:41:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 891A1404CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 891A1404CA;
	Fri, 15 Aug 2025 16:41:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6867D196
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 16:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4679040467
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 16:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hrkFk76NiSZI for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 16:41:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.128;
 helo=smtpcmd03128.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84B6C40863
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84B6C40863
Received: from smtpcmd03128.aruba.it (smtpcmd03128.aruba.it [62.149.158.128])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84B6C40863
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 16:41:05 +0000 (UTC)
Received: from smtpclient.apple ([95.168.120.45]) by Aruba SMTP with ESMTPSA
 id mxUEuVtpRmHkSmxUFunBXz; Fri, 15 Aug 2025 18:41:03 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Fri, 15 Aug 2025 18:41:02 +0200
Message-Id: <154C2C5A-1097-4AD1-A36A-2921CF6264FA@benettiengineering.com>
References: <20250815171954.19b3ea36@windsurf>
Cc: buildroot@buildroot.org, Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20250815171954.19b3ea36@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (22G86)
X-CMAE-Envelope: MS4xfK3t7FuiVGdRRQaNK3OP2Qj3QrW/KtmaP3TRGJDDH/rh4GgkY3k3uZzcDdLFGDrwttRN+3L9Npxil7SOKTKx0MDOBloqpb8VhmuOWp/OtNd6bVe0ypdn
 p7gH/aDhBb8gG3LvJ5YXCOHSeAP5NG2v3GvR3g0mdyGklqUMFj4eZVZwvEw4TvO5CEWItyqwJ4Ve3kayvW2SrYS1yh1iW3O8jeBGa6Yq6dbLfNMfFfJyU0PJ
 BEen55+JHgRW6xmjkcO6KaJPAOIZmiUnTEAeCmvdpNVE0LbONkzcZIkmCMy9MbTGjBB1n0ut9i6CC7klmnnCXg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1755276063; bh=vSwdEdeFG4lD9aZZcCVtwdgWkP7ZcJ2ZXCc+Ud66VVI=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=Dfor2sEyehbZ4UwMOe2L8zUrNFs6miFXi9c8bFr6AWYmUZLke1kktCSNo9CSKslaA
 nOdYfNbbj/hAu0JDnjSlXCNfH8HwmHFR1C5hvv6uANYc7ZiHN7MuHMP72n2sP7y5Y+
 2qs6epcGXjFL62ftiVS+pC0m7bUh8if6soq2meSZwUpS3gEHJKsR7n/iRMbzsA9PUD
 ku9EJePj5o11MZoVRHNtEQfGadTfKdWglSXY5Cwi9ReqI+V6fc9vgUF9Ql1tsluw1+
 IY4DbQsWP+FYnI+uQ6yHwAlgZyG2AFjq2JXlNfZqQY7SrtZ+swESDxQxCsHKdp15cK
 cTO7+YEVr0P4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Dfor2sEy
Subject: Re: [Buildroot] [PATCH v2] package/libtracefs: fix build failure
 due to missing NPTL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLCBBbGwsCgo+IElsIGdpb3JubyAxNSBhZ28gMjAyNSwgYWxsZSBvcmUgMTc6MTks
IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IGhhIHNjcml0
dG86Cj4gCj4g77u/T24gRnJpLCAxNSBBdWcgMjAyNSAxMzowOTozNSArMDIwMAo+IEdpdWxpbyBC
ZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPiAK
Pj4gV2l0aCBjb21taXQ6Cj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saWJzL2xp
YnRyYWNlL2xpYnRyYWNlZnMuZ2l0L2NvbW1pdC8/aWQ9MzFhY2ZlMTc0N2IyNzNlMTQ3Zjg2NGI1
YTYyYTRlMzkxOTdjYTFhMgo+PiBwYWNrYWdlIGxpYnRyYWNlZnMgdXRlc3Qgc3RhcnRlZCB0byB1
c2UgcHRocmVhZF9iYXJyaWVyXygpIGZ1bmN0aW9ucyBhbmQKPj4gdGhpcyBsZWFkIHRvIGJ1aWxk
IGZhaWx1cmUgd2hlbiB3ZSBidWlsZCB3aXRob3V0IE5QVEwuIFNpbmNlIHV0ZXN0IGlzCj4+IG5v
dCBuZWVkZWQgb24gdGhlIHRhcmdldCB3ZSBjYW4gYXZvaWQgdG8gYnVpbGQgaXQsIHNvIGxldCdz
IGRpc2FibGUgaXQuCj4gCj4gVGhpcyBpcyBhbHJlYWR5IG11Y2ggYmV0dGVyICh0aGFua3MhKSwg
YnV0IHN0aWxsIGlzbid0IGVhc2lseSBkaXJlY3RseQo+IGFjdGlvbmFibGUgYnkgdGhlIExUUyBt
YWludGFpbmVyLiBZb3UgbmVlZCB0byBicmluZyB0aGlzIGJhY2sgdG8gdGhlCj4gQnVpbGRyb290
IGNvbW1pdCB0aGF0IGludHJvZHVjZWQgdGhlICJpc3N1ZSIsIHNvIHRoYXQgdGhlIExUUwo+IG1h
aW50YWluZXIgY2FuIHRyaXZpYWxseSBmaWd1cmUgb3V0IHdoZXRoZXIgdGhpcyBwYXRjaCBuZWVk
cyB0byBiZQo+IGJhY2twb3J0ZWQgdG8gdGhlIExUUyBicmFuY2ggb3Igbm90LgoKSSBzZWUuIFNv
IHdoYXQgYWJvdXQgdGhlIEZpeGVzOiB0YWcgcG9pbnRpbmcgdGhlIHRoZSBjb21taXQgdGhhdCBp
bnRyb2R1Y2VkIHRoZSBpc3N1ZSB0aGUgc2FtZSB3YXkgTGludXggZG9lcz8KVGhlIG9ubHkgcmVt
YWluaW5nIHByb2JsZW0gaXMgdGhlbiBob3cgZG8gSSBwb2ludCB0byBBdXRvYnVpbGRlciBmYWls
dXJlIFVSTD8KTWF5YmUgSSBjYW4gbGlzdCBpdCBhZnRlciB0aGUgY29tbWl0IGFib3ZlPwoKT3Ig
aXMgdGhlcmUgYWxyZWFkeSBhIHNvcnQgb2Ygc3RhbmRhcmQgZm9yIHRoaXM/Ck90aGVyd2lzZSB0
aGlzIGNvdWxkIGJlIGRlZmluZWQgYXMgdGhlIHN0YW5kYXJkIHdheSBpbiB0aGUgbWFudWFsLgoK
QmVzdCByZWdhcmRzCkdpdWxpbwoKPiAKPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmks
IGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
