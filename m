Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE79C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 12:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7A2440879;
	Wed, 10 Aug 2022 12:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7A2440879
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FVoHMliKBNmV; Wed, 10 Aug 2022 12:43:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0C4D4042F;
	Wed, 10 Aug 2022 12:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0C4D4042F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AABD31BF312
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 12:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8620280C66
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 12:43:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8620280C66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oSl_dPJ0qq7a for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 12:43:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FC1E80C52
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FC1E80C52
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 12:43:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 92EA22000D;
 Wed, 10 Aug 2022 12:43:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oLl3p-002UoF-Mr; Wed, 10 Aug 2022 14:43:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220713115851.620731-1-thomas.petazzoni@bootlin.com>
 <20220717092020.GF2543@scaer> <20220717182632.32e8d732@windsurf>
 <20220717184749.13a817bf@windsurf> <20220717180544.GU2249625@scaer>
Date: Wed, 10 Aug 2022 14:43:45 +0200
In-Reply-To: <20220717180544.GU2249625@scaer> (Yann E. MORIN's message of
 "Sun, 17 Jul 2022 20:05:44 +0200")
Message-ID: <87fsi4p8u6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python-pillow: fix host package
 build
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
Cc: kory.maincent@bootlin.com,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIllhbm4iID09IFlhbm4gRSBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdy
aXRlczoKCiA+IFRob21hcywgQWxsLAogPiBPbiAyMDIyLTA3LTE3IDE4OjQ3ICswMjAwLCBUaG9t
YXMgUGV0YXp6b25pIHZpYSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5OgogPj4gT24gU3VuLCAxNyBK
dWwgMjAyMiAxODoyNjozMiArMDIwMAogPj4gVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6
em9uaUBib290bGluLmNvbT4gd3JvdGU6CiA+PiA+IFRoYXQgYmVpbmcgc2FpZCwgZ3JlcHBpbmcg
dGhyb3VnaCB0aGUgb3B0ZWVfb3MgY29kZSBmcm9tIFNULCBJIG5vCiA+PiA+IGxvbmdlciBzZWUg
d2hlcmUgcHl0aG9uLXBpbGxvdyBpcyB1c2VkLiBJJ3ZlIHN0YXJ0ZWQgYSB0ZXN0IGJ1aWxkIHRv
CiA+PiA+IGNoZWNrIHRoaXMgKGJ1dCBJJ20gcHJldHR5IHN1cmUgaXQgd2FzIG5lZWRlZCBhdCBz
b21lIHBvaW50LCBhcyBJCiA+PiA+IGxvb2tlZCBpbnRvIHRoaXMgd2l0aCBLw7ZyeSkuCiA+PiBT
ZWVtcyBsaWtlIHRoaXMgd2hvbGUgcHl0aG9uLXBpbGxvdyBkYW5jZSBpcyBpbiBmYWN0IG5vIGxv
bmdlcgogPj4gbmVlZGVkLi4uIGF0IGxlYXN0IEkgY2FuIGJ1aWxkIHRoZSBsYXRlc3QgT1BURUUt
T1MgZnJvbSBTVCB3aXRob3V0CiA+PiBob3N0LXB5dGhvbi1waWxsb3cgaW5zdGFsbGVkIChpbiBh
IGNsZWFuLCBtaW5pbWFsIFVidW50dSBEb2NrZXIKID4+IGNvbnRhaW5lcikuCgogPiBPSywgc286
IGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpJZiB0aGlzIHdhcyBvbmx5IG5lZWRlZCBmb3Ig
c29tZSBvbGRlciB2ZXJzaW9uIG9mIGEgU1QgdmVuZG9yIGZvcmsgb2YKb3B0ZWUsIHBlcmhhcHMg
d2Ugc2hvdWxkIGp1c3QgcmVtb3ZlIGl0IGFnYWluIGJlZm9yZSBpdCBlbmRzIHVwIGluIGEKQnVp
bGRyb290IHJlbGVhc2U/CgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
