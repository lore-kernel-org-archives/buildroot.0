Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D473AC49EA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 22:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A66D606AE;
	Tue,  6 Aug 2024 22:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gWUUB13wn1TU; Tue,  6 Aug 2024 22:27:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0199606C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0199606C2;
	Tue,  6 Aug 2024 22:27:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F3661BF302
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D0F580F3A
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qE1YZd4BxaP9 for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 22:27:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 788C080F2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 788C080F2A
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 788C080F2A
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 22:27:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8827A60002;
 Tue,  6 Aug 2024 22:27:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sbSeE-0006dA-32;
 Wed, 07 Aug 2024 00:27:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Sam Wang <pt.skyin@gmail.com>
References: <CAEu2X4E5UCYXo7D1tB6P=rTTOZywQ43Pm7dg1d0=xpn6TAtbJg@mail.gmail.com>
 <CAEu2X4H2cMERvvwd2dR-3v1VaM+WXgxVgpMVtuP4Zi1uhZ4iDw@mail.gmail.com>
Date: Wed, 07 Aug 2024 00:27:18 +0200
In-Reply-To: <CAEu2X4H2cMERvvwd2dR-3v1VaM+WXgxVgpMVtuP4Zi1uhZ4iDw@mail.gmail.com>
 (Sam Wang's message of "Sat, 18 May 2024 18:31:58 +0800")
Message-ID: <87zfppp9rt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] Fwd: BR2_MAKE makes "Rebuilding kernel with
 initramfs" use -j1
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlNhbSIgPT0gU2FtIFdhbmcgPHB0LnNreWluQGdtYWlsLmNvbT4gd3JpdGVzOgoKID4g
RGVhciBidWlsZHJvb3QgZGV2ZWxvcGVyLAogPiBJJ20gdXNpbmcgYnVpbGRyb290IDIwMjQuMDIu
MSB3aXRoIHRvcC1sZXZlbCBwYXJhbGxlbCBidWlsZCwgYW5kIGZvdW5kIGluCiA+IHRoZSBsYXN0
IHN0ZXAgb2YgbXkgYnVpbGQgLSAiUmVidWlsZGluZyBrZXJuZWwgd2l0aCBpbml0cmFtZnMiIC0g
aXQgdGhyb3dzCiA+IHRoZSBmb2xsb3dpbmcgd2FybmluZyBhbmQgbWFrZXMgdGhlIGtlcm5lbCBy
ZWJ1aWxkaW5nIHNpbmdsZSB0aHJlYWRlZC4KCiA+ICptYWtlWzFdOiB3YXJuaW5nOiBqb2JzZXJ2
ZXIgdW5hdmFpbGFibGU6IHVzaW5nIC1qMS4gIEFkZCAnKycgdG8gcGFyZW50CiA+IG1ha2UgcnVs
ZS4qCgogPiBUaGUgcHJldmlvdXMgdmVyc2lvbiAyMDIzLjAyLjQgZGlkbid0IGhhdmUgdGhpcyBp
c3N1ZS4gQW5kLCBJIGZvdW5kIHRoaXMKID4gY29tbWl0OiBsaW51eDogdXNlIEJSMl9NQUtFIMK3
IGJ1aWxkcm9vdC9idWlsZHJvb3RAMGI5ZWZjOSDCtyBHaXRIdWIKID4gPGh0dHBzOi8vZ2l0aHVi
LmNvbS9idWlsZHJvb3QvYnVpbGRyb290L2NvbW1pdC8wYjllZmM5OTFmOGEyYzFiNjM4OGU0ZTU3
NTY0MTIyODI2MmVhZGQxPiwKID4gd2hpY2ggY2hhbmdlcyAkKE1BS0UpIHRvICQoQlIyX01BS0Up
Ii4gSSByZXZlcnRlZCB0aGUgY2hhbmdlIGluIGxpbmUgNjQ1CiA+IGJhY2sgdG8gJChNQUtFKSBp
biBteSByZXBvLCBhbmQgdGhlIHdhcm5pbmcgd2FzIGdvbmUsIGFuZCB0aGUga2VybmVsCiA+IHJl
YnVpbGQgd2FzIGluIG11bHRpLXRocmVhZCBhZ2Fpbi4KCiA+IFdvbmRlcmluZyBpZiBJIG1pc3Nl
ZCBzb21ldGhpbmcgaW4gdGhlIGJ1aWxkcm9vdCBjb25maWd1cmF0aW9uIG9yIHRoaXMgcGFydAog
PiBvZiBCUjIgY29kZSBuZWVkcyBzb21lIHJldmlzaW9uPyBUaGFua3MgZm9yIHlvdXIgaGVscCEK
ClNvcnJ5IGZvciB0aGUgc2xvdyByZXNwb25zZSBhbmQgdGhhbmtzIGZvciB0aGUgcmVwb3J0LiBX
ZSBjYW5ub3QgcmVhbGx5CnJldmVydCBjb21taXQgMGI5ZWZjOTkxZjhhIGFzIGl0IGZpeGVzIGEg
cmVhbCBpc3N1ZSwgYnV0IGNvdWxkIHlvdQp2ZXJpZnkgaWYgaXQgd29ya3MgY29ycmVjdGx5IGlm
IHlvdSBwcmVmaXggdGhlIEJSMl9NQUtFIGludm9jYXRpb24gaW4KbGluZSA2NDggd2l0aCBhICs/
CgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
