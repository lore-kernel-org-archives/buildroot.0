Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0C6C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:07:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1B0960EE5
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1B0960EE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD94B6065D;
	Thu,  5 Aug 2021 20:07:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GNSXp1fHBOMM; Thu,  5 Aug 2021 20:07:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08C4A60600;
	Thu,  5 Aug 2021 20:07:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00BCE1BF3FD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E471283026
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KKQUD02gOX5a for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:07:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C595B83BC7
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:07:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4BA3720002;
 Thu,  5 Aug 2021 20:07:07 +0000 (UTC)
Date: Thu, 5 Aug 2021 22:07:06 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Bartosz Bilas <b.bilas@grinn-global.com>
Message-ID: <20210805220706.065d88c8@windsurf>
In-Reply-To: <20191117113345.159653-1-b.bilas@grinn-global.com>
References: <20191117113345.159653-1-b.bilas@grinn-global.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/systemd: set machine id file
 instalation as optional choice
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: =?UTF-8?B?SsOpcsOpbXk=?= ROSEN <jeremy.rosen@smile.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gQmFydG9zeiwKCk9uIFN1biwgMTcgTm92IDIwMTkgMTI6MzM6NDQgKzAxMDAKQmFydG9z
eiBCaWxhcyA8Yi5iaWxhc0Bncmlubi1nbG9iYWwuY29tPiB3cm90ZToKCj4gSW4gY2FzZSBvZiBl
Lmcgd3JpdGFibGUgc3lzdGVtcyB0aGVyZSBpcyBubyBuZWNjZXNpdHkgdG8gaGF2ZQo+IHByZS1p
bnN0YWxsZWQgZW1wdHkgbWFjaGluZS1pZCBmaWxlIG9uIHRhcmdldCBiZWNhdXNlIHN5c3RlbWQK
PiBnZW5lcmF0ZXMgdGhhdCBhdXRvbWF0aWNhbGx5IGR1cmluZyBzeXN0ZW0gYm9vdC4KPiBBbHNv
IGluIGNhc2Ugb2YgaGF2aW5nIGVtcHR5IG1hY2hpbmUtaWQgZmlsZSB3ZSBhcmUgbm90IGFibGUK
PiB0byB1c2UgYSBzZXJ2aWNlIHdpdGggQ29uZGl0aW9uRmlyc3RCb290IGJlY2F1c2Ugc3lzdGVt
ZCByZWNvZ25pemVzCj4gbWFjaGluZS1pZCBmaWxlIGluIHN5c3RlbSB0aGVyZWZvcmUgd2UgY2Fu
J3QgZGV0ZWN0IG5ldyBzeXN0ZW0gaW5zdGFuY2UgYm9vdHMgdXAuCj4gU2V0IHRoaXMgb3B0aW9u
IGFzIGVuYWJsZSBieSBkZWZhdWx0IHRvIGtlZXAgY29tcGF0aWJpbGl0eSB3aXRoIG9sZCBidWls
ZHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBCaWxhcyA8Yi5iaWxhc0Bncmlubi1nbG9i
YWwuY29tPgo+IC0tLQo+ICBwYWNrYWdlL3N5c3RlbWQvQ29uZmlnLmluICB8IDEzICsrKysrKysr
KysrKysKPiAgcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsgfCAgMiArKwo+ICAyIGZpbGVzIGNo
YW5nZWQsIDE1IGluc2VydGlvbnMoKykKClRoaXMgc2VyaWVzIG9mIHR3byBwYXRjaGVzIGhhcyBi
ZWVuIHNpdHRpbmcgb24gdGhlIG1haWxpbmcgbGlzdCBmb3IgYQpsb25nIHRpbWUuIFRoZSBmZWVk
YmFjayBvZiBKw6lyw6lteSB3YXMgbm90IHZlcnkgcG9zaXRpdmUgKGkuZSBxdWl0ZQpuZWdhdGl2
ZSkgYW5kIHlvdSBzYWlkIHlvdXJzZWxmIG9uIHRoaXMgcGF0Y2ggIkkgaGFkIGZpbmFsbHkgYSBj
b3VwbGUKb2YgdGltZSB0byBkb3VibGUtY2hlY2sgdGhhdCBhbmQgSSBhZ3JlZSB3aXRoIEplcmVt
eSB0aGF0IEkgd2FzIHdyb25nCnRoZXJlZm9yZSBsZXQncyByZWplY3QgdGhpcyBwYXRjaCBhcyBp
dCB0dXJuZWQgb3V0IGFzIGFuIHVudGhvdWdodAppZGVhLiIsIGJ1dCB0aGVuIHlvdSBzYWlkIHlv
dSB3ZXJlIG1pc3Rha2VuLCBKZXJlbXkgYXNrZWQgZm9yCmNsYXJpZmljYXRpb25zIHdoaWNoIHdl
cmUgbmV2ZXIgZ2l2ZW4uCgpTbyBhdCB0aGlzIHBvaW50LCBJJ20gZ29pbmcgdG8gbWFyayB0aG9z
ZSB0d28gcGF0Y2hlcyBhcyBSZWplY3RlZC4KSG93ZXZlciwgaWYgeW91IGJlbGlldmUgdGhlcmUg
aXMgc3RpbGwgc29tZXRoaW5nIHRvIGltcHJvdmUsIGRvIG5vdApoZXNpdGF0ZSB0byByZW9wZW4g
dGhlIGRpc2N1c3Npb24uCgpUaGFua3MgYSBsb3QhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpv
bmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0
dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0
cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
