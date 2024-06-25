Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E8AC2BBCA
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 10:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AE8A61025;
	Tue, 25 Jun 2024 10:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HMVbj6V3VMUH; Tue, 25 Jun 2024 10:28:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92A1E6083F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92A1E6083F;
	Tue, 25 Jun 2024 10:28:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 440F91BF271
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 10:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 315CF6083F
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 10:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NilURogGiFN for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 10:28:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC749605C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC749605C3
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC749605C3
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 10:28:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 1C17F1814B9; Tue, 25 Jun 2024 12:27:57 +0200 (CEST)
In-Reply-To: <20240624230402.GB192149@igalia.com>
References: <1582f-6672b400-7-af99240@116839531>
 <20240619140513.GB831334@igalia.com> <877cegowt1.fsf@dell.be.48ers.dk>
 <20240624230402.GB192149@igalia.com>
Date: Tue, 25 Jun 2024 12:27:57 +0200
To: "Adrian Perez de Castro" <aperez@igalia.com>
MIME-Version: 1.0
Message-ID: <4d-667a9b80-1-52de4600@143954543>
User-Agent: SOGoMail 5.10.0
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1719311278; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=8dL3kya3XMUcuEN38MlbOPjLbaUnwbY29XnkW7XHNaU=;
 b=mW34Luow4ioZ1gieNIhVVIadegOhfvwdJnUsNEk9ENjuDd9LA77cz+2N97oza7nrssXKUF
 PYs+pksciH20g2xsk7+TmZIlEoOwwsUd2fqQ7i4nh5EI61fEd02yEesg7YpfegnsN1zp/L
 RmFKf0T1GcfDwKzj/0ni36/6ZOq2gvU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=mW34Luow
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_2/4=5D_package/wpewebkit=3A_secur?=
 =?utf-8?q?ity_bump_to_version_2=2E44=2E2?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWRyaWFuLCBhbGwsCgpPbiBNb25kYXksIEp1bmUgMjQsIDIwMjQgMjI6MDQgQ0VTVCwgQWRy
aWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+IHdyb3RlOgoKPiBIaSBQZXRl
ciwgYWxsLAo+IAo+IE9uIFN1biwgMjMgSnVuIDIwMjQgMTE6MDM6MzggKzAyMDAgUGV0ZXIgS29y
c2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiB3cm90ZToKPiA+ID4+Pj4+ICJBZHJpYW4iID09
IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPiB3cml0ZXM6Cj4gPiAK
PiA+IFRoYW5rcy4gV2hhdCBoYXBwZW5lZCB0byB0aGF0IHBhdGNoPwo+IAo+IFN1Ym1pdHRlZDoK
PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIw
MjQwNjI0MjAwMDU2LjQ0MDE1NC0xLWFwZXJlekBpZ2FsaWEuY29tLwo+IAo+IFRlc3RlZCBidWls
ZGluZyBmb3IgUmFzcGJlcnJ5UGkgMyAoMzItYml0KSBhbmQgdGhlIDQgKDY0LWJpdCkuCgpZZXMs
IHRoaXMgZml4ZXMgbXkgYnVpbGQgYW5kIGFsc28gd29ya3Mgb24gdGhlIGRldmljZSAodGkgYW01
NzI4KS4gVGhhbmsgeW91IQoKVGVzdGVkLWJ5OiBNaWNoYWVsIE5vc3Rob2ZmIDxidWlsZHJvb3RA
aGVpbmUudGVjaD4KCmJ1aWx0IHdpdGggCkJSMl9hcm09eQpCUjJfY29ydGV4X2ExNT15CkJSMl9B
Uk1fRlBVX05FT05fVkZQVjQ9eQpCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKClJlZ2FyZHMsCk1p
Y2hhZWwKPiAKPiBTb3JyeSwgSSB3YXMgQUZLIGFyb3VuZCBtaWRzdW1tZXIgYW5kIGNvdWxkbid0
IHNlbmQgaXQgZWFybGllciA6KQo+IAo+IENoZWVycywKPiDigJRBZHJpw6FuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
