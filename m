Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7283C61CE7
	for <buildroot@archiver.kernel.org>; Wed, 11 Jun 2025 07:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B46C42182;
	Wed, 11 Jun 2025 07:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LdDod8N0Y_R8; Wed, 11 Jun 2025 07:50:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C62841DA6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C62841DA6;
	Wed, 11 Jun 2025 07:50:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BE78237
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 07:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DEA140A91
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 07:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzzXzkozheqD for <buildroot@buildroot.org>;
 Wed, 11 Jun 2025 07:50:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7C64F401D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C64F401D6
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C64F401D6
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 07:50:12 +0000 (UTC)
X-CSE-ConnectionGUID: //b6hFgtSIG5ykxD12nWDQ==
X-CSE-MsgGUID: a584tLE4TB2DH2aJ0zG4jQ==
Received: from unknown (HELO opfedv3rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 09:50:10 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jun 2025 09:50:11 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Wed, 11 Jun 2025 09:50:09 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 11 Jun 2025 09:50:08 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: 54e6WEWFQQul6NtvdakU+g==
X-CSE-MsgGUID: WIF/nTAHRMS7oJFeekzksA==
X-IronPort-AV: E=Sophos;i="6.16,227,1744063200"; d="scan'208";a="298979564"
Date: Wed, 11 Jun 2025 09:50:08 +0200
To: =?utf-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
CC: <buildroot@buildroot.org>, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <aEk1MGp3wfzbN3UL@yd-6wlzhs3>
References: <20250610125323.68124-1-flavio.tapajos@newtesc.com.br>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250610125323.68124-1-flavio.tapajos@newtesc.com.br>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX203.corporate.adroot.infra.ftgroup (10.115.26.8)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1749628213; x=1781164213;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=MK7T2NtKLQBbPJPY/AgeslUYLtnKwPfJmiwbYM+4Skk=;
 b=EEyYndYsUJbgyYIKqJAU7HjorAzE9XRAE8AClRp0Sc8oyKba/rY4eUEW
 q8XcHHm8eisrQYydJn10MzHo6LTHL9DAdLm+WTplfS5jB6qqjyge0OyJh
 2HhVhq+tBGoQ0q19Zi3VEd+euWJw1uRCk9ZvMqpoom1iee/qmXcCfeyK4
 ibIIOIhkmTmZfl1G2AZm0Xg7OaBV+qjgx4oGUhXaXBTuwnvYaMrEbqmnJ
 tDpKEHDE4UCeWPG2bucEJqh5rrWGXgzDXb1l5oCcNzVj+BOwQ1+fFJER8
 cUjPBxi4Y04kwtHvBMTbNNqC6mnkBOmJYR4eXd5b59F2WZmJhMIpqYHi/
 w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=EEyYndYs
Subject: Re: [Buildroot] [PATCH 1/1] nanomq: new package
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

RmzDoXZpbywgQWxsLAoKT24gMjAyNS0wNi0xMCAwOTo1MyAtMDMwMCwgRmzDoXZpbyBUYXBhasOz
cyBzcGFrZSB0aHVzbHk6Cj4gU2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8Zmxhdmlv
LnRhcGFqb3NAbmV3dGVzYy5jb20uYnI+Cj4gLS0tClstLVNOSVAtLV0KPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9uYW5vbXEvQ29uZmlnLmluIGIvcGFja2FnZS9uYW5vbXEvQ29uZmlnLmluCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi41MmUxMDlkMzE0Cj4gLS0tIC9k
ZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvbmFub21xL0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsMTMg
QEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX05BTk9NUQo+ICsJYm9vbCAibmFub21xIgo+ICsJZGVw
ZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzUKPiArCWhlbHAKPiArCSAgQW4g
VWx0cmEtbGlnaHR3ZWlnaHQgYW5kIEJsYXppbmctZmFzdCBNUVRUIEJyb2tlciBmb3IgSW9UIEVk
Z2UKPiArCj4gKwkgIGh0dHBzOi8vbmFub21xLmlvLwoKSW50ZXJlc3RpbmcgTVFUVCBicm9rZXIu
IDotKQoKPiArY29uZmlnIEJSMl9QQUNLQUdFX05BTk9NUV9OQU5PX0NMSQo+ICsJYm9vbCAibmFu
b21xX2NsaSIKPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTkFOT01RCj4gKwloZWxwCj4gKwkg
IE1xdHQgY2xpIGNsaWVudAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL25hbm9tcS9TNTBuYW5vbXEg
Yi9wYWNrYWdlL25hbm9tcS9TNTBuYW5vbXEKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAuLmE5ZjEyNzlhNWQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9u
YW5vbXEvUzUwbmFub21xCgpQbGVhc2UgaGF2ZSBhIGxvb2sgYXQgdGhlIHNlY3Rpb24gYWJvdXQg
dGhlIHN0YXJ0dXAgc2NyaXB0cyBpbiB0aGUKbWFudWFsOgogICAgaHR0cHM6Ly9idWlsZHJvb3Qu
b3JnL2Rvd25sb2Fkcy9tYW51YWwvbWFudWFsLmh0bWwjYWRkaW5nLXBhY2thZ2VzLXN0YXJ0LXNj
cmlwdAoKWy0tU05JUC0tXQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL25hbm9tcS9uYW5vbXEubWsg
Yi9wYWNrYWdlL25hbm9tcS9uYW5vbXEubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAuLmE0YzcyMTU2ZGUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9u
YW5vbXEvbmFub21xLm1rCj4gQEAgLTAsMCArMSw0MiBAQAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwo+ICsjCj4gKyMgbmFub21xCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAr
Cj4gK05BTk9NUV9WRVJTSU9OID0gMC4yMy44Cj4gKyMgdGFyIGZpbGUgaXMgcHJvdmlkZWQsIGJ1
dCBpdCBsYWNrcyBzdWJtb2R1bGVzCj4gK05BTk9NUV9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29t
L25hbm9tcS9uYW5vbXEuZ2l0Cj4gK05BTk9NUV9TSVRFX01FVEhPRCA9IGdpdAo+ICtOQU5PTVFf
R0lUX1NVQk1PRFVMRVMgPSBZRVMKClRoZXJlIGFyZSB0aHJlZSBzdWJtb2R1bGVzOgogICAgaHR0
cHM6Ly9naXRodWIuY29tL25hbm9tcS9OYW5vTk5HLmdpdAogICAgaHR0cHM6Ly9naXRodWIuY29t
L25hbm9tcS9uZnRwLWNvZGVjLwogICAgaHR0cHM6Ly9naXRodWIuY29tL0dsaXRjaGVkUG9seWdv
bnMvbDh3OGp3dC5naXQKClVzdWFsbHksIHdlIHRyeSBoYXJkIHRvIG5vdCB1c2UgYnVuZGxlZCBk
ZXBlbmRlbmNpZXMsIGJ1dCB1c2UgZ2xvYmFsbHkKaW5zdGFsbGVkIG9uZXMuIFNvLCB5b3Ugc2hv
dWxkIHByb2JhYmx5IGV4cGxhaW4gaW4gdGhlIGNvbW1pdCBsb2cgd2h5CnRoYXQgY2FuJ3QgYmUg
ZG9uZSBoZXJlLgoKPiArTkFOT01RX0NNQUtFX0JBS0VORCA9IG5pbmphCj4gK05BTk9NUV9MSUNF
TlNFID0gTUlUCj4gK05BTk9NUV9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS50eHQKPiArCj4gKyMg
V2hlbiBCVUlMRF9TSEFSRURfTElCUyBpcyBPTiwgbm8gZXhlY3V0YWJsZSBpcyBjcmVhdGVkIGZv
ciBuYW5vbXEKCkl0J3Mgbm90IGp1c3QgYWJvdXQgQlVJTERfU0hBUkVEX0xJQlM7IEJVSUxEX1NU
QVRJQ19MSUIgYWxzbyBkaXNhYmxlcwpidWlsZGluZyB0aGUgZXhlY3V0YWJsZS4gU28sIEknZCBw
aHJhc2UgdGhhdCBkaWZmZXJlbnRseTsKCiAgICAjIElmIGVpdGhlciBCVUlMRF9TSEFSRURfTElC
UyBvciBCVUlMRF9TVEFUSUNfTElCIGlzIHNldCwgb25seSBhCiAgICAjIGxpYnJhcnkgaXMgYnVp
bHQsIGFuZCBubyBleGVjdXRhYmxlIGlzLgoKKGFsc28gbm90ZSB0aGUgZGlzY3JlcGFuY3kgYmV0
d2VlbiB0aGUgdHdvIHZhcmlhYmxlczogb25lIGVuZHMgd2l0aCBhbgonUycsIHRoZSBvdGhlciBk
b2VzIG5vdDsgdGhlcmUgaXMgbm8gdHlwby4pCgpbLS1TTklQLS1dCj4gK2lmZXEgKCQoQlIyX1BB
Q0tBR0VfTkFOT01RX05BTk9fQ0xJKSx5KQo+ICsgIE5BTk9NUV9DT05GX09QVFMgKz0gLURCVUlM
RF9DTElFTlQ9T04KPiArZWxzZQo+ICsgICMgTk5HIHByb3h5IGJsdWlkcyBjbGkKClNvcnJ5LCBJ
J20gbm90IHN1cmUgSSB1bmRlcnN0b29kIHRoaXMgY29tbWVudC4gRGlkIHlvdSBtZWFuIHRoYXQs
IHdpdGgKQlVJTERfQ0xJRU5UPU9GRiwgdGhlbiBOTkcgKGZyb20gdGhlIE5ORyBzdWItbW9kdWxl
KSB3b3VsZCBidWlsZCBpdHMgb3duCmNsaWVudCwgdW5sZXNzIHRvbGQgb3RoZXJ3aXNlPwoKPiAr
ICBOQU5PTVFfQ09ORl9PUFRTICs9IC1EQlVJTERfQ0xJRU5UPU9GRiAtREJVSUxEX05OR19QUk9Y
WT1PRkYKPiArZW5kaWYKPiArCj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfU1FMSVRFKSx5KQo+ICsg
IE5BTk9NUV9DT05GX09QVFMgKz0gLUROTkdfRU5BQkxFX1NRTElURT1PTgoKWW91IHNob3VsZCBh
bHNvIHByb3ZpZGUgdGhlICdlbHNlJyBjbGF1c2UgdG8gZXhwbGljaXRseSBkaXNhYmxlIHNxbGl0
ZQpzdXBwb3J0LgoKSXQgd291bGQgYmUgYWxzbyBpbnRlcmVzdGluZyB0byBhZGQgYSBjb25kaXRp
b25hbCBkZXBlbmRlbmN5IHRvIG1iZWR0bHMKdG9vLCB0byBoYXZlIE1RVFQgb3ZlciBUTFMgKE1R
VFRzKSBzdXBwb3J0LgoKT3ZlcmFsbCwgSSB0aGluayB5b3UgbmVlZCB0byBwcm92aWRlIGEgYml0
IG1vcmUgZXhwbGFuYXRpb25zIGluIHRoZQpjb21taXQgbG9nLi4uCgpUaGFua3MhCgpSZWdhcmRz
LApZYW5uIEUuIE1PUklOLgoKPiArZW5kaWYKPiArCj4gKyQoZXZhbCAkKGNtYWtlLXBhY2thZ2Up
KQo+IC0tIAo+IDIuNDkuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290CgotLSAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fX19f
X19fX19fXwouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS06ICAgICAgIF8g
ICAgOi0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1i
ZWRkZWQgfCAgICBfXy8gKSAgIHwgLyJcIEFTQ0lJIFJJQkJPTiB8CnwgICAgICAgICAgICAgICAg
IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgIF8vIC0gLycgICB8IFwgLyBDQU1QQUlHTiAgICAgfAp8
ICszMyA2MzguNDExLjI0NSAnLS0tLS0tLS0tLS0tLS0tLS0tLS06IChfICAgIGAtLSwgfCAgWCAg
QUdBSU5TVCAgICAgIHwKfCB5YW5uLm1vcmluIChhdCkgb3JhbmdlLmNvbSAgICAgICAgICAgfF89
IiAgICAsLS0nIHwgLyBcIEhUTUwgTUFJTCAgICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLTpfX19fX18vX19fX186LS0tLS0tLS0tLS0tLS0tLS0tJwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpDZSBtZXNzYWdlIGV0
IHNlcyBwaWVjZXMgam9pbnRlcyBwZXV2ZW50IGNvbnRlbmlyIGRlcyBpbmZvcm1hdGlvbnMgY29u
ZmlkZW50aWVsbGVzIG91IHByaXZpbGVnaWVlcyBldCBuZSBkb2l2ZW50IGRvbmMNCnBhcyBldHJl
IGRpZmZ1c2VzLCBleHBsb2l0ZXMgb3UgY29waWVzIHNhbnMgYXV0b3Jpc2F0aW9uLiBTaSB2b3Vz
IGF2ZXogcmVjdSBjZSBtZXNzYWdlIHBhciBlcnJldXIsIHZldWlsbGV6IGxlIHNpZ25hbGVyDQph
IGwnZXhwZWRpdGV1ciBldCBsZSBkZXRydWlyZSBhaW5zaSBxdWUgbGVzIHBpZWNlcyBqb2ludGVz
LiBMZXMgbWVzc2FnZXMgZWxlY3Ryb25pcXVlcyBldGFudCBzdXNjZXB0aWJsZXMgZCdhbHRlcmF0
aW9uLA0KT3JhbmdlIGRlY2xpbmUgdG91dGUgcmVzcG9uc2FiaWxpdGUgc2kgY2UgbWVzc2FnZSBh
IGV0ZSBhbHRlcmUsIGRlZm9ybWUgb3UgZmFsc2lmaWUuIE1lcmNpLg0KDQpUaGlzIG1lc3NhZ2Ug
YW5kIGl0cyBhdHRhY2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgb3IgcHJpdmlsZWdl
ZCBpbmZvcm1hdGlvbiB0aGF0IG1heSBiZSBwcm90ZWN0ZWQgYnkgbGF3Ow0KdGhleSBzaG91bGQg
bm90IGJlIGRpc3RyaWJ1dGVkLCB1c2VkIG9yIGNvcGllZCB3aXRob3V0IGF1dGhvcmlzYXRpb24u
DQpJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGVtYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5
IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSB0aGlzIG1lc3NhZ2UgYW5kIGl0cyBhdHRhY2htZW50cy4N
CkFzIGVtYWlscyBtYXkgYmUgYWx0ZXJlZCwgT3JhbmdlIGlzIG5vdCBsaWFibGUgZm9yIG1lc3Nh
Z2VzIHRoYXQgaGF2ZSBiZWVuIG1vZGlmaWVkLCBjaGFuZ2VkIG9yIGZhbHNpZmllZC4NClRoYW5r
IHlvdS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
