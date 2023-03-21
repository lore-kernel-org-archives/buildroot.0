Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99978C6FD1D
	for <buildroot@archiver.kernel.org>; Tue, 21 Mar 2023 13:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4394240BD1;
	Tue, 21 Mar 2023 13:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4394240BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E4e0UWUhawFg; Tue, 21 Mar 2023 13:55:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A57D40BCC;
	Tue, 21 Mar 2023 13:55:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A57D40BCC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 69AAD1BF39D
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 13:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4809F4150F
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 13:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4809F4150F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VOdv8b5Otefr for <buildroot@lists.busybox.net>;
 Tue, 21 Mar 2023 13:54:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C9BF41505
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C9BF41505
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 13:54:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 44D6B240009;
 Tue, 21 Mar 2023 13:54:56 +0000 (UTC)
Date: Tue, 21 Mar 2023 14:54:55 +0100
To: Simon Rowe <simon.rowe@nutanix.com>
Message-ID: <20230321145455.7dce4271@windsurf>
In-Reply-To: <DM8PR02MB81219477CD31D864F078BC8493819@DM8PR02MB8121.namprd02.prod.outlook.com>
References: <20230316113615.138847-1-simon.rowe@nutanix.com>
 <20230319172554.0d5ea60c@windsurf>
 <DM8PR02MB81219477CD31D864F078BC8493819@DM8PR02MB8121.namprd02.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679406896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OD355rOeG+Q0y/BtIMHkgGB6fLvfCI6fz5SaHzsRsTQ=;
 b=ZoLzZ81rT0ZqW3xLSeJU6BMusitzm2o44CWHtQknaxZUUulRPBSxmcUn0Ixgdo1HGbp3Yb
 oJrWP7mh2WwD9olx6upR9sAddXc+VyOyRVEXIl8mxQsalyCAqsWVh2r3/ZsRdYoHTq8B9w
 sq4H7Ii4/NB4R5jvjUY+pSI1f1UKB6rw8JuUU8Sz9zjNWEzn7vRWSksnt0pIPMVCmSRDEP
 OaTU8ITMlS1B0UdE6nPfOCiNKLgA8i5W0JR8sZBtWJb29kMvNUwP4AQ517Cyc/i5WEWlEH
 /RwL2aNmHLWNxxgYLz2mG1NAyxfsmPnrTw/STCS7OpHexIIhuTA0E853uTgEbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZoLzZ81r
Subject: Re: [Buildroot] [PATCH 1/1] package/lvm2: enable package with musl
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gU2ltb24sCgpPbiBUdWUsIDIxIE1hciAyMDIzIDEzOjM5OjEyICswMDAwClNpbW9uIFJv
d2UgPHNpbW9uLnJvd2VAbnV0YW5peC5jb20+IHdyb3RlOgoKPiBJIGFtIG5vdCB0aGUgYXV0aG9y
IG9mIHRoZXNlIHBhdGNoZXMsIHdoaWNoIGlzIHdoeSBJIGRpZG7igJl0IGFkZCBhCj4g4oCYU2ln
bmVkLW9mZi1ieTrigJkuIEkgZm9sbG93ZWQgd2hhdCBJIHRob3VnaHQgdGhlIHByb2Nlc3Mgd2Fz
IGZvcgo+IHBhdGNoZXMgb3JpZ2luYXRpbmcgZnJvbSBlbHNld2hlcmUgYnkgYWRkaW5nIGEg4oCY
RmV0Y2ggZnJvbTrigJkgdG8gZWFjaAo+IHBhdGNoIGFzIG1lbnRpb25lZCBpbiAxOS40IG9mIHRo
ZSBtYW51YWwuIEkgY2FuIHJlZ2VuZXJhdGUgdGhlbSBpZgo+IHRoYXTigJlzIHRoZSBjb3JyZWN0
IGFwcHJvYWNoLgoKQSBTaWduZWQtb2ZmLWJ5IGlzIG5vdCBvbmx5IGFuIGluZGljYXRpb24gb2Yg
dGhlIGF1dGhvciwgYnV0IGFsc28gYW4KaW5kaWNhdGlvbiBvZiB0aGUgY2hhaW4gb2YgcGVvcGxl
IHRocm91Z2ggd2hpY2ggdGhlIHBhdGNoIHRyYXZlbGVkLiBGb3IKZXhhbXBsZSBpbiB0aGUgTGlu
dXgga2VybmVsLCBwYXRjaGVzIGhhdmUgYSBTb0IgZnJvbSB0aGUgYXV0aG9yLCB0aGVuIGEKU29C
IGZyb20gdGhlIG1haW50YWluZXIgdGFraW5nIHRoZSBwYXRjaCwgYW5kIHBvc3NpYmx5IGFub3Ro
ZXIgU29CIGZyb20KeWV0IGFub3RoZXIgbWFpbnRhaW5lciB0YWtpbmcgdGhlIHBhdGNoIGZyb20g
dGhhdCBwcmV2aW91cyBtYWludGFpbmVyLgoKSW4gQnVpbGRyb290LCB3ZSB0aGVyZWZvcmUgaGF2
ZSBwYXRjaGVzIHdpdGggdHdvIFNvQjogb25lIGZyb20gdGhlCm9yaWdpbmFsIGF1dGhvciwgYW5k
IG9uZSBmcm9tIHRoZSBkZXZlbG9wZXIgYnJpbmdpbmcgdGhlIHBhdGNoIGludG8KQnVpbGRyb290
LiBPciBhbHRlcm5hdGl2ZWx5IHBhdGNoZXMgd2l0aCBvbmx5IG9uZSBTb0IsIGZyb20gdGhlCmRl
dmVsb3BlciBicmluZ2luZyB0aGUgcGF0Y2ggaW50byBCdWlsZHJvb3QgKHlvdSBpbiB0aGlzIGNh
c2UpIHdoZW4gdGhlCm9yaWdpbmFsIHBhdGNoIGxhY2tzIGFuIFNvQi4KCj4gSeKAmXZlIG5vdCBn
b3QgYSB1c2UgY2FzZSBmb3IgbXVsdGlwYXRoIG15c2VsZiBieSBJ4oCZbGwgY2hlY2sgaWYgSSBj
YW4KPiBnZXQgaXQgdG8gYnVpbGQgd2l0aCB0aGVzZSBwYXRjaGVzLgoKR29vZCEKCj4gPiBBbm90
aGVyIHF1ZXN0aW9uIGlzIHRoZSB1cHN0cmVhbSBzdGF0dXMgb2YgdGhlIEdlbnRvbyBwYXRjaGVz
PyBIYXZlCj4gPiB0aGV5IGJlZW4gc3VibWl0dGVkIGZvciBpbmNsdXNpb24gYnkgdGhlIHVwc3Ry
ZWFtIGx2bTIgcHJvamVjdD8gIAo+IAo+IFRoZXJlIHNlZW1zIHRvIGJlIGEgc3VnZ2VzdGlvbiB0
aGF0IHdhcyBhdHRlbXB0ZWQgb24gdGhlIHRpY2tldAo+IAo+IGh0dHBzOi8vYnVncy5nZW50b28u
b3JnLzU0OTUwNgo+IAo+IGJ1dCB0aGF0IHdhcyBzb21lIHRpbWUgYWdvIGFuZCB0aGVyZeKAmXMg
bm8gc2lnbiBvZiB0aGVtIGJlaW5nIGFjY2VwdGVkLgoKSXQncyBiZWVuIGEgd2hpbGUgYWdvLiBQ
ZXJoYXBzIHRpbWUgdG8gZG8gYW5vdGhlciBhdHRlbXB0IGF0CnVwc3RyZWFtaW5nIHRob3NlIHBh
dGNoZXM/CgpUaGFua3MgYSBsb3QhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93
bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmlu
ZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
