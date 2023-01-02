Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CD7C46467
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 22:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E39F80BF3;
	Mon,  2 Jan 2023 22:29:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E39F80BF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iIGW1dv0xQQU; Mon,  2 Jan 2023 22:29:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 494A480B84;
	Mon,  2 Jan 2023 22:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 494A480B84
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 541F91BF2CF
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 22:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F2AA4031F
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 22:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F2AA4031F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H2n_8t27Gkws for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 22:29:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D983F40472
Received: from smtp-out3.electric.net (smtp-out3.electric.net [208.70.128.187])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D983F40472
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 22:28:59 +0000 (UTC)
Received: from 1pCTIf-0009Jk-TV by out3d.electric.net with emc1-ok (Exim
 4.94.2) (envelope-from <kris@embeddedTS.com>)
 id 1pCTIg-0009Ki-Th; Mon, 02 Jan 2023 14:28:58 -0800
Received: by emcmailer; Mon, 02 Jan 2023 14:28:58 -0800
Received: from [66.210.251.27] (helo=mail.embeddedts.com)
 by out3d.electric.net with esmtps (TLS1.2) tls TLS_DHE_RSA_WITH_SEED_CBC_SHA
 (Exim 4.94.2) (envelope-from <kris@embeddedTS.com>)
 id 1pCTIf-0009Jk-TV; Mon, 02 Jan 2023 14:28:57 -0800
Received: from tsdebian (unknown [75.164.37.1])
 by mail.embeddedts.com (Postfix) with ESMTPSA id 87AFF5CB6;
 Mon,  2 Jan 2023 15:28:56 -0700 (MST)
Message-ID: <1672698535.3896.5.camel@embeddedTS.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Date: Mon, 02 Jan 2023 14:28:55 -0800
In-Reply-To: <CB65BA13-5218-4C00-86E0-CB128E71F322@benettiengineering.com>
References: <20221229095800.64a5f115@windsurf>
 <CB65BA13-5218-4C00-86E0-CB128E71F322@benettiengineering.com>
Organization: embeddedTS
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-Outbound-IP: 66.210.251.27
X-Env-From: kris@embeddedTS.com
X-Proto: esmtps
X-Revdns: wsip-66-210-251-27.ph.ph.cox.net
X-HELO: mail.embeddedts.com
X-TLS: TLS1.2:DHE-RSA-SEED-SHA:128
X-Authenticated_ID: 
X-VIPRE-Scanners: virus_bd;virus_clamav;
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=embeddedTS.com; s=mailanyone20220121;
 h=Mime-Version:References:In-Reply-To:Date:To:From:Message-ID;
 bh=dEQwzidMbaVK+qpcbgzArvsJt4L/1ZFL4g9HUjxVphY=;
 b=AKQXRRMYgPgXD1zj/oZB47TCgXfiOSbEpuy6qVCTZrZ5TTxiXXyj5bbN/RFVZtF6nQfZjVW/vTz7hW4ZBqP3Y+/P8ZH85Ly79gQpWO+bOPWsKjpiTdCC6XyBZxBsIvJhceVqYZ7o5oFCZT34NQsuggzIR039iA0HoV6GB3l9Raw7TugGK0i9pAshd4zgjOZdeJdIPutZhvACZ+xkx6znseesKlou+eNiL5BFbTfIP6y93psoWtT3c5PTxClzd3SXyyoFojNXuaWSHoZWXRe0guv+2r5EUxkMVAAOG/6EiFdvWRgqpwluAz9Pc6UIlyl6wyc1opnIjQ1hcCP+igeVoQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=embeddedTS.com header.i=@embeddedTS.com
 header.a=rsa-sha256 header.s=mailanyone20220121 header.b=AKQXRRMY
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: fix build failure up
 to Linux 6.1
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: kris@embeddedTS.com
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxsLAoKSSBhY2NpZGVudGFsbHkgcmVwbGllZCBvdXQgb2YgdGhlIHRocmVhZCBhbmQgSSB3YW50
ZWQgdG8gZm9sbG93IHVwCmhlcmUganVzdCB0byBtYWtlIHN1cmUgaXQgZ290IG9yZ2FuaXplZCBp
biB0aGUgcmlnaHQgcGxhY2UuIFNlZSBteQpwcmV2aW91cyBtZXNzYWdlIGhlcmU6Cmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjMtSmFudWFyeS82NTkx
NjQuaHRtbAoKT24gVGh1LCAyMDIyLTEyLTI5IGF0IDIzOjA0ICswMTAwLCBHaXVsaW8gQmVuZXR0
aSB3cm90ZToKPiBIaSBUaG9tYXMsCj4gCj4gPiBJbCBnaW9ybm8gMjkgZGljIDIwMjIsIGFsbGUg
b3JlIDA5OjU4LCBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29t
PiBoYSBzY3JpdHRvOgo+ID4gCj4gPiDvu79PbiBXZWQsIDI4IERlYyAyMDIyIDIxOjUzOjIzICsw
MTAwCj4gPiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5n
LmNvbT4gd3JvdGU6Cj4gPiAKPiA+ID4gQWRkIHBhdGNoZXMgcGVuZGluZyB1cHN0cmVhbVswXSB0
byBoYW5kbGUgdmFyaW91cyBkYXRhIHR5cGVzIGFuZCBhcGkKPiA+ID4gY2hhbmdlcyB1cCB0byBM
aW51eCA2LjEuCj4gPiA+IAo+ID4gPiBbMF06IGh0dHBzOi8vZ2l0aHViLmNvbS9lbWJlZGRlZFRT
L3dpbGMzMDAwLWV4dGVybmFsLW1vZHVsZS9wdWxsLzIKPiA+ID4gCj4gPiA+IEZpeGVzOgo+ID4g
PiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy82YWE3NDc1YTIxYTYwNjBl
OWZjZTM1NTJmNzNlNmU3MTAwYThiMmFhCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHaXVs
aW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPiA+ID4g
LS0tCj4gPiA+IC4uLm1pc3NpbmctcHJhbmRvbV91MzItd2l0aC1MaW51eC02LjEuMC5wYXRjaCB8
ICAzNCArKysKPiA+ID4gLi4uZml4LWJ1aWxkLWZhaWx1cmUtb24tcmVtb3ZlLWNhbGxiYWNrLnBh
dGNoIHwgIDQ0ICsrKysKPiA+ID4gLi4udWlsZC1mYWlsdXJlLXdpdGgtTGludXgtNS4xOS1hbmQt
Ni4xLnBhdGNoIHwgIDk4ICsrKysrKysrCj4gPiA+IC4uLm9uX3BhcmFtZXRlcnMtTGludXgtNi4x
LWJ1aWxkLWZhaWx1ci5wYXRjaCB8IDIxNiArKysrKysrKysrKysrKysrKysKPiA+ID4gNCBmaWxl
cyBjaGFuZ2VkLCAzOTIgaW5zZXJ0aW9ucygrKQo+ID4gPiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS93aWxjLWRyaXZlci8wMDAxLWNmZzgwMjExLmMtZml4LW1pc3NpbmctcHJhbmRvbV91MzIt
d2l0aC1MaW51eC02LjEuMC5wYXRjaAo+ID4gPiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS93
aWxjLWRyaXZlci8wMDAyLXNwaS5jLWZpeC1idWlsZC1mYWlsdXJlLW9uLXJlbW92ZS1jYWxsYmFj
ay5wYXRjaAo+ID4gPiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS93aWxjLWRyaXZlci8wMDAz
LWNmZzgwMjExLmMtZml4LWJ1aWxkLWZhaWx1cmUtd2l0aC1MaW51eC01LjE5LWFuZC02LjEucGF0
Y2gKPiA+ID4gY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvd2lsYy1kcml2ZXIvMDAwNC1GaXgt
c3RydWN0LXN0YXRpb25fcGFyYW1ldGVycy1MaW51eC02LjEtYnVpbGQtZmFpbHVyLnBhdGNoCj4g
PiAKPiA+IEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuIEhvd2V2ZXIsIGl0IGlzIHdvcnRoIG1l
bnRpb25pbmcgdGhhdCB0aGUKPiA+IHJlYWwgInVwc3RyZWFtIiBmb3IgdGhpcyBkcml2ZXIgaXMg
dGhlIGxpbnV4NHNhbSBMaW51eCB0cmVlIGF0Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vbGludXg0
c2FtL2xpbnV4LWF0OTEuCj4gCj4gQWgsIHllcwo+IAo+ID4gVGhleSBhcmUgY3VycmVudGx5IGJh
c2VkIG9uCj4gPiA1LjE1LCBidXQgSSBzdXBwb3NlIHRoZXkgd2lsbCByZWJhc2Ugc29vbiBvbiA2
LjEsCj4gCj4gSSB0aGluayBzbyB0b28KPiAKPiA+IHNvIHRoZXkgbWlnaHQgYmUKPiA+IGludGVy
ZXN0ZWQgaW4geW91ciBmaXhlcy4KPiAKPiBIb3cgY2FuIEkgcG9pbnQgbXkgZml4ZXM/IERvIHlv
dSB0aGluayBpdOKAmXMgZW5vdWdoIHRvIG9wZW4gYW4gSXNzdWUgaW4gbGludXgtYXQ5MSBHaXRI
dWI/Cj4gCj4gPiBJIGRvbid0IGtub3cgaWYvd2hlbiB0aGUgb3V0LW9mLXRyZWUgdmFyaWFudAo+
ID4gb2YgdGhlIFdJTEMgZHJpdmVyIGF0Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vZW1iZWRkZWRU
Uy93aWxjMzAwMC1leHRlcm5hbC1tb2R1bGUgZ2V0cyBzeW5jZWQgZnJvbQo+ID4gdGhlIGxpbnV4
NHNhbSB0cmVlLgo+IAo+IEnigJl2ZSBjb21wYXJlZCB0aGUgdHdvIGRyaXZlcnMgYW5kIHRoZXkg
YXJlIHByZXR0eSB0aGUgc2FtZSwgbm90IGNvbXBsZXRlbHkgYnV0IHZlcnkgY2xvc2UgZXhjbHVk
aW5nIHRoZSB2YXJpb3VzICNpZmRlZuKAmXMuCj4gSSBkb27igJl0IGVpdGhlciBrbm93IGhvdyB0
aGF0IHJlcG8gaXMgaGFuZGxlZCBidXQgSSBjYW4gbW9uaXRvciBpdC4KClRoZSBleHRlcm5hbCBp
cyBjdXJyZW50bHkgYSByZWxlYXNlIHRhZyAob3IgYSBmZXcpIGJlaGluZC4gVGhlIGxhdGVzdApj
aGFuZ2VzIGluIHRoZSBsaW51eDRzYW0ga2VybmVsIHRyZWUgcmVtb3ZlIGEgbG90IG9mIHRoZSAj
aWZkZWZzIGFzIHlvdQpub3RlZCB3aGljaCBlbmRzIHVwIHByZXZlbnRpbmcgaXQgZnJvbSBjb21w
aWxpbmcgYWdhaW5zdCBvbGRlciBrZXJuZWxzLgoKV2UndmUgdGVzdGVkIHRoZSBleHRlcm5hbCB0
cmVlIGFnYWluc3QgNC45LCA1LjEwLCBhbmQgNS4xNSB3aXRoIHN1Y2Nlc3MuCgotS3JpcwoKPiAK
PiBCZXN0IHJlZ2FyZHMKPiBHaXVsaW8KPiAKPiA+IAo+ID4gQmVzdCByZWdhcmRzLAo+ID4gCj4g
PiBUaG9tYXMKPiA+IC0tIAo+ID4gVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCj4gPiBF
bWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gPiBodHRwczovL2Jvb3RsaW4u
Y29tCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
