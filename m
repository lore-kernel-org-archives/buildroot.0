Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C0FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 14:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9C4F41684;
	Fri, 28 Jan 2022 14:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FNAH2e_c5e9l; Fri, 28 Jan 2022 14:13:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 995F84088E;
	Fri, 28 Jan 2022 14:13:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A52E1C1162
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 14:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97054813ED
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 14:13:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0QgYVCn-TMib for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 14:13:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 961A581DA3
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 14:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rOE9c4udRJJNRY7qKtl0Z6S5HAQ3jXN2MsMLA5tP7sg=; b=Rw1I+VR6a/MIU32Ha/ocOiKT8i
 Q+gVNZExH+4MBWr/CQHbWAFVMi93MOyf7sstrQscLgnSiU5erYCUQKMyjTNFMvL1XcS14Co9Qs6dJ
 3duhWYqK5wcQ6zREyi+rwtQf7Lt5MX3rI8yMSYJSpyghqPvRBV0dnU3kmT9nHUSQ8YFFdRrsdoQ9S
 ngClD1nSuYgSXPOdUVDYo/ne0VuZ/GA7HlB19vgMrcYr3Jsa4ta/JiWoskefZjV8XNnyWUdBIHINJ
 UfYe/OLjrBMyKXkWnBydYYFRMshPb98IAfrbwSR9I30vupMWz09db5Jp5GlNfp/azdZ7Br67lXenl
 n7AJn/jA==;
Received: from 91-152-140-238.elisa-laajakaista.fi ([91.152.140.238]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nDS0J-00065o-3l; Fri, 28 Jan 2022 15:13:31 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 07ca5a73;
 Fri, 28 Jan 2022 14:13:18 +0000 (UTC)
Date: Fri, 28 Jan 2022 16:13:14 +0200
Message-ID: <20220128161314.GB770598@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas.devoogdt@gmail.com>
In-Reply-To: <CACXRmJi3_D1n3tJNXgm+6azeVqY8=cA7gPvfWT8xMbR3Dk8eWA@mail.gmail.com>
References: <20220128105917.30421-1-thomas.devoogdt@barco.com>
 <20220128105917.30421-2-thomas.devoogdt@barco.com>
 <20220128134223.GB765275@momiji>
 <CACXRmJi3_D1n3tJNXgm+6azeVqY8=cA7gPvfWT8xMbR3Dk8eWA@mail.gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] libsoup3 migration (was: Re: [PATCH 2/2]
 package/libsoup: bump to version 3.0.4)
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1723331999985210072=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1723331999985210072==
Content-Type: multipart/signed; boundary="qmj6QaSPXcXo7FoG"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--qmj6QaSPXcXo7FoG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gVGhvbWFzLCBhbGwsCgpPbiBGcmksIDI4IEphbiAyMDIyIDEzOjMzOjMyICswMTAwIFRo
b21hcyBEZXZvb2dkdCA8dGhvbWFzLmRldm9vZ2R0QGdtYWlsLmNvbT4gd3JvdGU6Cj4gSGVsbG8g
QWRyacOhbiwgYWxsLAo+IAo+IEkgdGVzdGVkIGluZGVlZCBsaWJzb3VwMyBhZ2FpbnN0IHdlYmtp
dGd0ayAyLjM0LjQgWzFdLiBCeSBkcm9wcGluZwo+IC1EVVNFX1NPVVAyPU9OCj4gZnJvbSB5b3Vy
IGNvbW1pdCwgSSB3YXMgYWJsZSB0byBidWlsZCB3ZWJraXRndGsgMi4zNC40Lgo+IAo+IFlvdSBh
cmUgcmlnaHQsIG90aGVyIHBhY2thZ2VzIHdpbGwgaGF2ZSB0byBtaWdyYXRlIGFzIHdlbGwsCj4g
ZS5nLiBhIEdTdHJlYW1lciBidW1wIHRvIDEuMTkuMyBpcyBuZWVkZWQgWzJdLgo+IAo+IEEgcXVp
Y2sgc2VhcmNoIGxlYXJucyBtZSB0aGF0IEJSMl9QQUNLQUdFX0xJQlNPVVAgaXMvY2FuIGJlIHNl
bGVjdGVkIGluL2ZvcjoKPiAgLSBCUjJfUEFDS0FHRV9HTVBDIChubyBleHBsaWNpdCBzdXBwb3J0
IG1lbnRpb25lZCB5ZXQpCj4gIC0gQlIyX1BBQ0tBR0VfR1NTRFAgKHN1cHBvcnQgb24gbWFzdGVy
IGJyYW5jaCBbM10pCj4gIC0gQlIyX1BBQ0tBR0VfR1VQTlBfVE9PTFMgKG5vIGV4cGxpY2l0IHN1
cHBvcnQgbWVudGlvbmVkIHlldCkKPiAgLSBCUjJfUEFDS0FHRV9HVkZTIChubyBleHBsaWNpdCBz
dXBwb3J0IG1lbnRpb25lZCB5ZXQpCj4gIC0gQlIyX1BBQ0tBR0VfTElCT1NUUkVFIChubyBleHBs
aWNpdCBzdXBwb3J0IG1lbnRpb25lZCB5ZXQpCj4gIC0gQlIyX1BBQ0tBR0VfTUlET1JJIChubyBl
eHBsaWNpdCBzdXBwb3J0IG1lbnRpb25lZCB5ZXQpCj4gIC0gQlIyX1BBQ0tBR0VfV1BFV0VCS0lU
IChubyBleHBsaWNpdCBzdXBwb3J0IG1lbnRpb25lZCB5ZXQpCj4gCj4gIC0gQlIyX1BBQ0tBR0Vf
R1NUMV9QTFVHSU5TX0dPT0QgKHN0YXJ0aW5nIGZyb20gMS4xOS4zKQo+ICAtIEJSMl9QQUNLQUdF
X0dTVEQgKHN0YXJ0aW5nIGZyb20gMS4xOS4zKQo+ICAtIEJSMl9QQUNLQUdFX1dFQktJVEdUSyAo
c3RhcnRpbmcgZnJvbSAyLjM0LjQpCgpUaGVyZSBpcyBhIHRyYWNraW5nIHRhYmxlIGZvciB0aGUg
bGlic291cDMgbWlncmF0aW9uIHRoYXQgb25lIG9mIG15IHdvcmsgbWF0ZXMKaGFzIGJlZW4gbWFp
bnRhaW5pbmcgdXAgdG8gZGF0ZTsgeW91IGNhbiBmaW5kIGl0IGhlcmU6CgogIGh0dHBzOi8vZ2l0
bGFiLmdub21lLm9yZy9HTk9NRS9saWJzb3VwLy0vaXNzdWVzLzIxOAoKRm9yIG1vc3Qgb2YgdGhl
IHBhY2thZ2VzIGZyb20gQnVpbGRyb290IHRoYXQgeW91IGxpc3RlZCB0aGVyZSBhcmUgcGF0Y2hl
cwpmaWxlZCB0byB0aGVpciBjb3JyZXNwb25kaW5nIHVwc3RyZWFtcy4gCgpUaGUgd2F5IEkgc2Vl
IGl0LCB0aGVyZSBhcmUgdGhyZWUgcG9zc2libGUgd2F5cyBmb3IgYSBtaWdyYXRpb246CgotIEtl
ZXAgYm90aCBsaWJzb3VwMiBhbmQgbGlic291cDMgaW4gdGhlIHRyZWUsIG1pZ3JhdGUgcGFja2Fn
ZXMgdG8gbGlic291cDMKICB3aGVyZSBwb3NzaWJsZSBhbmQgd2hlcmUgd2UgZG8gbm90IHNlZSBj
b25mbGljdHMgKGxpa2UgbG9hZGluZyBib3RoIHZlcnNpb25zCiAgaW4gdGhlIHNhbWUgcHJvY2Vz
cykgbGlrZWx5IHRvIGhhcHBlbi4KCi0gUmVwbGFjZSBsaWJzb3VwMiB3aXRoIGxpYnNvdXAzICpu
b3cqLCBpbXBvcnQgcGF0Y2hlcyBpbnRvIHRoZSBCdWlsZHJvb3QgdHJlZQogIGZvciB0aGUgcGFj
a2FnZXMgd2hpY2ggZG8gbm90IHlldCBoYXZlIHJlbGVhc2VzIGNvbXBhdGlibGUgd2l0aCBsaWJz
b3VwMy4KCi0gUmVwbGFjZSBsaWJzb3VwMiB3aXRoIGxpYnNvdXAzICpsYXRlciosIG9uY2UgYWxs
IHVwc3RyZWFtcyBvZiBwYWNrYWdlcwogIHByZXNlbnQgaW4gQnVpbGRyb290IHB1dCBvdXQgcmVs
ZWFzZXMgdGhhdCB3b3JrIHdpdGggbGlic291cDMuCgpQZXJzb25hbGx5IEkgdGVuZCB0byB0aGlu
ayB0aGUgbGFzdCBvcHRpb24gaXMgbGlrZWx5IHRvIGJlIHRoZSBiZXN0LCB0byBhdm9pZApjb25m
dXNpb25zIGFuZCB0aGUgcG9zc2liaWxpdHkgdGhhdCBwZW9wbGUgd2hvIHVzZSBCdWlsZHJvb3Qg
YXMgYmFzaXMgZm9yCnRoZWlyIHdvcmsgZ2V0IGludG8gbmFzdHkgc2l0dWF0aW9ucyBkdWUgdG8g
Ym90aCBsaWJzb3VwMiBhbmQgbGlic291cDMgYmVpbmcKYXZhaWxhYmxlLgoKT3BpbmlvbnM/Cgo+
IC0tLQo+IFsxXQo+IGh0dHBzOi8vZ2l0LnNyLmh0L35hcGVyZXpkYy9idWlsZHJvb3QvY29tbWl0
LzVkYzQwMmQ1ODY1OWEzNWEzMGFmZDFkZTFhOGZiODA3NTAzNGYzZmMKPiBbMl0gaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL2dzdHJlYW1lci9nc3RyZWFtZXIvLS9tZXJnZV9yZXF1ZXN0
cy8xMDQ0Cj4gWzNdIGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9nc3NkcC8tL21lcmdl
X3JlcXVlc3RzLzcKPiAKPiAKPiBPcCB2ciAyOCBqYW4uIDIwMjIgb20gMTI6NDIgc2NocmVlZiBB
ZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDwKPiBhcGVyZXpAaWdhbGlhLmNvbT46Cj4gCj4gPiBIZWxs
byBUaG9tYXMsIGFsbCwKPiA+Cj4gPiBPbiBGcmksIDI4IEphbiAyMDIyIDExOjU5OjE3ICswMTAw
IFRob21hcyBEZXZvb2dkdCA8Cj4gPiB0aG9tYXMuZGV2b29nZHRAZ21haWwuY29tPiB3cm90ZToK
PiA+ID4gRHJvcCB1cHN0cmVhbWVkIHBhdGNoOgo+ID4gPgo+ID4gaHR0cHM6Ly9naXRsYWIuZ25v
bWUub3JnL0dOT01FL2xpYnNvdXAvLS9jb21taXQvNWMzZDQzMWJkYjA5NGM1OTk5N2YyYTIzZTMx
ZTgzZjgxNWFiNjY3Ywo+ID4gPgo+ID4gPiBUaGUgZ25vbWUgb3B0aW9uIHdhcyBkcm9wcGVkIGlu
Ogo+ID4gPgo+ID4gaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL2xpYnNvdXAvLS9jb21t
aXQvM2ZjYWE4ODJjNGViMjlmZDc1NGNkYjZkZDA2MTk1NjMyY2I0YjUyYQo+ID4gPgo+ID4gPiBB
IG5ldyAibGlibmdodHRwMiIgZGVwZW5kZW5jeSBpcyBhZGRlZCBzaW5jZSBsaWJzb3VwIDIuOTku
NiAoSFRUUDIKPiA+IGJhY2tlbmQpOgo+ID4gPgo+ID4gaHR0cHM6Ly9naXRsYWIuZ25vbWUub3Jn
L0dOT01FL2xpYnNvdXAvLS9jb21taXQvMWExZDI5YzMxMTRjYTg2YzY3M2QwYzBiMDJhNDkyZDA5
NjJkY2ZlOAo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgRGV2b29nZHQgPHRob21h
cy5kZXZvb2dkdEBiYXJjby5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgQ29uZmlnLmluLmxlZ2FjeSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKysrCj4gPiA+ICAuLi4vMDAwMS1tZXNv
bi5idWlsZC1zZXQtY19zdGQtdG8tZ251OTkucGF0Y2ggfCA0MCAtLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gPiA+ICBwYWNrYWdlL2xpYnNvdXAvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgfCAg
NiArLS0KPiA+ID4gIHBhY2thZ2UvbGlic291cC9saWJzb3VwLmhhc2ggICAgICAgICAgICAgICAg
ICB8ICA0ICstCj4gPiA+ICBwYWNrYWdlL2xpYnNvdXAvbGlic291cC5tayAgICAgICAgICAgICAg
ICAgICAgfCAxMSArKy0tLQo+ID4gPiAgcGFja2FnZS9taWRvcmkvQ29uZmlnLmluICAgICAgICAg
ICAgICAgICAgICAgIHwgIDEgLQo+ID4gPiAgNiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspLCA1NiBkZWxldGlvbnMoLSkKPiA+ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NAo+ID4gcGFja2Fn
ZS9saWJzb3VwLzAwMDEtbWVzb24uYnVpbGQtc2V0LWNfc3RkLXRvLWdudTk5LnBhdGNoCj4gPgo+
ID4gTm90ZSB0aGF0IGxpYnNvdXAzIGhhcyBhIG5ldyBBUEkgWzFdIChhbmQgQUJJLCB0aGVyZWZv
cmUpLiBQYWNrYWdlcyB1c2luZwo+ID4gbGlic291cDIgbWF5IG5vdCBldmVuIGNvbXBpbGUgd2l0
aCBsaWJzb3VwMywgb3IgbWF5IGNyYXNoIGF0IHJ1bnRpbWUgaW4KPiA+IHVuZXhwZWN0ZWQgd2F5
cy4KPiA+Cj4gPiBZb3Ugd2lsbCBuZWVkIGZvbGxvd3VwIHBhdGNoZXMgdG8gbW9kaWZ5IHBhY2th
Z2VzIHRoYXQgZGVwZW5kIG9uIGxpYnNvdXAKPiA+IHRvIG1ha2UgdGhlbSB1c2UgbGlic291cDIu
IEZvciBleGFtcGxlIGluIHBhY2thZ2Uvd3Bld2Via2l0Lm1rIHdlIGFyZQo+ID4gY3VycmVudGx5
IHBhc3NpbmcgLURVU0VfU09VUDI9T04gdG8gQ01ha2UsIHdoaWNoIG5lZWRzIHRvIGJlIGNoYW5n
ZWQgdG8KPiA+IE9GRi4KPiA+Cj4gPiBTb21lIHBhY2thZ2VzIG1heSBub3QgZXZlbiBzdXBwb3J0
IHlldCBidWlsZGluZyB3aXRoIGxpYnNvdXAzLiBUaGVyZWZvcmUKPiA+IHdlIG1heSBuZWVkIHRv
IGtlZXAgdGhlIGxpYnNvdXAyIHBhY2thZ2UuIFRoaXMgaXMgcG9zc2libGUsIGFzIGJvdGgKPiA+
IHZlcnNpb25zCj4gPiBhcmUgcGFyYWxsZWwtaW5zdGFsbGFibGUuIEJ1dCB0aGVuIHRoZXJlIGlz
IG9uZSBtb3JlIGlzc3VlOiBvbmUgY2Fubm90IHVzZQo+ID4gYm90aCBsaWJyYXJpZXMgaW4gdGhl
IHNhbWUgcHJvY2Vzcy4gV2hpY2ggbWVhbnMsIGZvciBleGFtcGxlLCBpZiB3cGV3ZWJraXQKPiA+
IGdldHMgY2hhbmdlZCB0byB1c2UgbGlic291cDMsIHRoZW4gR1N0cmVhbWVyICphbHNvKiBuZWVk
cyB0byBiZSBjaGFuZ2VkCj4gPiBiZWNhdXNlIGJvdGggYXJlIHVzZWQgaW5zaWRlIFdlYktpdC4K
PiA+Cj4gPiBUaGVzZSBhcmUgYWxsIHJlYXNvbnMgd2h5IEkgaGF2ZSBub3QgeWV0IHNlbnQgcGF0
Y2hlcyB0byBkbyB0aGUgc3dpdGNoLgo+ID4gUHJvYmFibHkgd2Ugd2FudCB0byBkaXNjdXNzIGhv
dyB0byBnbyBhaGVhZCB3aXRoIHRoZSBsaWJzb3VwMyBtaWdyYXRpb24gaW4KPiA+IEJ1aWxkcm9v
dC4KPiA+Cj4gPiBDaGVlcnMsCj4gPiDigJRBZHJpw6FuCj4gPgo+ID4gLS0tCj4gPiBbMV0gaHR0
cHM6Ly9saWJzb3VwLm9yZy9saWJzb3VwLTMuMC9jaDAyLmh0bWwKPiA+CgpDaGVlcnMsCuKAlEFk
cmnDoW4K

--qmj6QaSPXcXo7FoG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYfP5+gAKCRCRxVnb5MkS
OwNVAJ0YHpyE7VSfwXJuqKesT2w7t+oSHgCfTakPTAHxyXh1B19BR9sbQpNKX+M=
=f3Yc
-----END PGP SIGNATURE-----

--qmj6QaSPXcXo7FoG--

--===============1723331999985210072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1723331999985210072==--
