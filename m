Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFB1C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 18:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8DA3404DB;
	Sat, 22 Jan 2022 18:21:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wJ39GWur-Yrf; Sat, 22 Jan 2022 18:21:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECBDC4058F;
	Sat, 22 Jan 2022 18:21:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD3041BF2C2
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 18:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB138408DF
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 18:21:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mGZO_31POFhH for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 18:21:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DC5F40895
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 18:21:21 +0000 (UTC)
Received: from smtpclient.apple ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPA
 id BL0pnv7pgiF0aBL0pnQ0kN; Sat, 22 Jan 2022 19:21:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642875680; bh=eME60cQ3d2cVTmrXP4IBSlMK4Urv0W5tCuWPW8mo8Y0=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=V0Y6+mSOQVHk1t13homaRyuDzq9O1tORmu/+fHSRw5rteeLa8uIA0v2z809hfharY
 cefnLLIWRtfNt3Fn1qlQ4yF4iSUYEGlAqHIG0pUu2RcyTR3VJsIvA7TrEAOUe/8cQw
 vOh1903XbKonCjB4EVy8r6Jb1V694Ihp8k8udzIhE+9A1nhlg8/eM1OXjeA4Xilaog
 /DSwZljeRDknGZvsE/nUncLRmp+OcBEZCbIrv50rm6vsIkI/TgalGS6c5zqXu2S4Xf
 O31I6RVlBD2vJD+QqlTj8r1BXi86qvWBxwFiQxZFDMfI83mWyqo/wx9Kpf0gP5MNDe
 AcOmvm9BwIYvQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 22 Jan 2022 19:21:19 +0100
Message-Id: <2DE5F820-FFD4-4E75-9566-25B881883586@benettiengineering.com>
References: <YexIspJ7Tw4LKRzm@pevik>
In-Reply-To: <YexIspJ7Tw4LKRzm@pevik>
To: Petr Vorel <petr.vorel@gmail.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfKwa4FAa34YTMTiX6NLk/xLH4TDL7haInlscrFOKxlybb0h8d6+Aw6lJvdIMkM0L4zXjyCCawUXdf6PLoCReWrfbe9OMry5TKdYp8AKDqMrwKxT2swh1
 5+YQjBaEoQ79vGZxRjXFIlp2BwoimAB0epCtoP66WUzD1kOLAE9hirO4Rgevcv7yj40r2M9+GKPkmLUdooFZW/5eIQpFqgb9NeLwP8ptIvrADKTY9UypQOWV
 ElXrW1J5k9cntmCy4r9sVw==
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: bump version to 2.6.1
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

SGkgUGV0ciwKCj4gSWwgZ2lvcm5vIDIyIGdlbiAyMDIyLCBhbGxlIG9yZSAxOToxMSwgUGV0ciBW
b3JlbCA8cGV0ci52b3JlbEBnbWFpbC5jb20+IGhhIHNjcml0dG86Cj4gCj4g77u/SGkgYWxsLAo+
IAo+IG5vdGUgdGhpcyB2ZXJzaW9uIGRvZXMgbm90IHN1cHBvcnQgTkZTdjIgYW55IG1vcmUuCj4g
RG9lcyBpdCBuZWVkIHRvIGJlIG1lbnRpb25lZCB0byB0aGUgY29tbWl0IG1lc3NhZ2U/CgpZZXMs
IGl04oCZcyBhIHZlcnkgZ29vZCBpZGVhLiAKSSB3b3VsZCBhbHNvIGFkZCBhIG5vdGUgaW4gQ29u
ZmlnLmluIGhlbHAgc2VjdGlvbiBsaXN0aW5nIHRoZQpzdXBwb3J0ZWQgTkZTIHZlcnNpb25zIGF2
YWlsYWJsZS4KQ2FuIHlvdSBkbyB0aGF0IGFuZCBzZW5kIGEgdjIgcGF0Y2g/CgpUaGFuayB5b3Uh
CuKAlC0KR2l1bGlvIEJlbmV0dGkKQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKCj4gSSBkaWRuJ3Qg
YWRkIGl0LCBiZWNhdXNlIGV2ZW4gTkZTdjMgaXMgcXVpdGUgb2xkIChhbmQgSSByZWNvbW1lbmQg
dG8gdXNlCj4gTkZTdjQuMikuCj4gCj4gS2luZCByZWdhcmRzLAo+IFBldHIKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
