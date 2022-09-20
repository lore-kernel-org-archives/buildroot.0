Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CA5C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 17:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3C7940C60;
	Tue, 20 Sep 2022 17:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3C7940C60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qK05MP4BA7JF; Tue, 20 Sep 2022 17:20:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF8BB40C57;
	Tue, 20 Sep 2022 17:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF8BB40C57
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 440B11BF2CE
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 17:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F28A60F7D
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 17:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F28A60F7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QJbDjeLzhPQU for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 17:20:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42FF860F4B
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42FF860F4B
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 17:20:33 +0000 (UTC)
Received: from smtpclient.apple ([146.241.95.233])
 by Aruba Outgoing Smtp  with ESMTPA
 id agvAoWOzXUncTagvAoVAa1; Tue, 20 Sep 2022 19:20:32 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 20 Sep 2022 19:20:31 +0200
Message-Id: <ACCBCFE4-EC11-441A-A5B3-1351FEB1A1B7@benettiengineering.com>
References: <1663693308.2395.5.camel@embeddedTS.com>
In-Reply-To: <1663693308.2395.5.camel@embeddedTS.com>
To: kris@embeddedts.com
X-Mailer: iPhone Mail (19G82)
X-CMAE-Envelope: MS4xfL54dNP7SmaxEHjM8M5GMXzJU2ufZDUJ2HSw7eo0HRxgnBzn1wayLHhg59Ebz+U4OqInV6B0ncGk5qn6o+5LKz3jzsunva2foNYPA3+1yvxNk01ReaFo
 j9cBybV5vI2BhA8Iatu9jYY1pj6mjvWRZzgahMVFLNh2L2z2duSJ/eZHWOJjOytc3MHz4QnISRTrqQjQ05RvS+OpXGrNKWlRtgDOsfT6ScjGBvJK70ZjPEb8
 Cxab4HF/lbTqkqgHoxMBTg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663694432; bh=T+SoOZxaAw1C5CAWH9/OxDc6fc6aqqvlDyrd4aUk+EA=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=D2fmIO+3qQ3UJBcRDd3+I/bSynSRO2G0q8gFvQoWluyZ3YwZE75P8FVIVZ0YJ34mj
 l+LcyuLorxYute1m25YkXInYa0GDB6HOW1XXd5grBZDnsecvLNo0CASaUBBaoQGsMy
 q4W03JJT/SJpRKm6e5HDnMS8mCHmPmhcYRd0C7ihIp2A/ae4y0LYudD60UyZCRFhqz
 mphOMcPW4+8nDAdYZKUiXz6ei8T1ihMVssluqtTuy6+s8ere7nj+caqk9HOIX5pzGj
 e0xn7OaxxjK5zmQkTG8KJGnwTvINQ2xgvIattjHQW+Z/Dg4YjeaToL5ppFwjprZZjU
 d1XFIQwsV82nw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=D2fmIO+3
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: fix build failure due
 to missing Linux options
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

SGkgS3JpcywKCj4gSWwgZ2lvcm5vIDIwIHNldCAyMDIyLCBhbGxlIG9yZSAxOToxMCwgS3JpcyBC
YWhuc2VuIDxrcmlzQGVtYmVkZGVkdHMuY29tPiBoYSBzY3JpdHRvOgo+IAo+IO+7v09uIFR1ZSwg
MjAyMi0wOS0yMCBhdCAxNTozMiArMDIwMCwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+IEVuYWJs
ZSBMaW51eCBvcHRpb25zIGRlcGVuZGluZyBvbiB0aGUgYnVzIGhhcyBiZWVuIGNob3Nlbiwgc286
Cj4+IDEpIGVuYWJsZSBieSBkZWZhdWx0IGNvbW1vbiBMaW51eCBvcHRpb25zOgo+PiBDT05GSUdf
TkVUCj4+IENPTkZJR19XSVJFTEVTUwo+PiBDT05GSUdfQ0ZHODAyMTEKPj4gQ09ORklHX0NSQ19J
VFVfVAo+PiBDT05GSUdfQ1JDNwo+PiAyKSBlbmFibGUgZm9yIFNESU8gYnVzOgo+PiBDT05GSUdf
TU1DCj4+IDMpIGVuYWJsZSBmb3IgU1BJIGJ1czoKPj4gQ09ORklHX1NQSQo+PiAKPj4gRml4ZXM6
Cj4+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2Q4YzRmMGY5NTlkZDJl
YzExMGRiOGE3NTk4MGYxMzE3MmMzYzExNmMvCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8g
QmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPj4gLS0tCj4+
IHBhY2thZ2Uvd2lsYy1kcml2ZXIvd2lsYy1kcml2ZXIubWsgfCAxNiArKysrKysrKysrKysrKysr
Cj4+IDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS93aWxjLWRyaXZlci93aWxjLWRyaXZlci5tayBiL3BhY2thZ2Uvd2lsYy1kcml2ZXIv
d2lsYy1kcml2ZXIubWsKPj4gaW5kZXggYTg5YWYzMGUyOS4uYTdhOTAyYjZkYiAxMDA2NDQKPj4g
LS0tIGEvcGFja2FnZS93aWxjLWRyaXZlci93aWxjLWRyaXZlci5tawo+PiArKysgYi9wYWNrYWdl
L3dpbGMtZHJpdmVyL3dpbGMtZHJpdmVyLm1rCj4+IEBAIC0xMywxMSArMTMsMTcgQEAgV0lMQ19E
UklWRVJfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPj4gaWZlcSAoJChCUjJfUEFDS0FHRV9XSUxD
X0RSSVZFUl9TUEkpLHkpCj4+IFdJTENfRFJJVkVSX01PRFVMRV9NQUtFX09QVFMgKz0gXAo+PiAg
ICBDT05GSUdfV0lMQ19TUEk9bQo+PiArZGVmaW5lIFdJTENfRFJJVkVSX1NQSV9MSU5VWF9DT05G
SUdfRklYVVBTCj4+ICsgICAgJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfU1BJKQo+
PiArZW5kZWYKPj4gZW5kaWYKPj4gCj4+IGlmZXEgKCQoQlIyX1BBQ0tBR0VfV0lMQ19EUklWRVJf
U0RJTykseSkKPj4gV0lMQ19EUklWRVJfTU9EVUxFX01BS0VfT1BUUyArPSBcCj4+ICAgIENPTkZJ
R19XSUxDX1NESU89bQo+PiArZGVmaW5lIFdJTENfRFJJVkVSX1NESU9fTElOVVhfQ09ORklHX0ZJ
WFVQUwo+PiArICAgICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX01NQykKPj4gK2Vu
ZGVmCj4+IGVuZGlmCj4+IAo+PiBpZmVxICgkKEJSMl9QQUNLQUdFX1dJTENfRFJJVkVSX1NESU9f
T09CKSx5KQo+PiBAQCAtMjUsNSArMzEsMTUgQEAgV0lMQ19EUklWRVJfTU9EVUxFX01BS0VfT1BU
UyArPSBcCj4+ICAgIENPTkZJR19XSUxDX0hXX09PQl9JTlRSPXkKPj4gZW5kaWYKPj4gCj4+ICtk
ZWZpbmUgV0lMQ19EUklWRVJfTElOVVhfQ09ORklHX0ZJWFVQUwo+PiArICAgICQoY2FsbCBLQ09O
RklHX0VOQUJMRV9PUFQsQ09ORklHX05FVCkKPj4gKyAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVf
T1BULENPTkZJR19XSVJFTEVTUykKPj4gKyAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENP
TkZJR19DRkc4MDIxMSkKPj4gKyAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19D
UkNfSVRVX1QpCj4+ICsgICAgJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfQ1JDNykK
Pj4gKyAgICAkKFdJTENfRFJJVkVSX1NQSV9MSU5VWF9DT05GSUdfRklYVVBTKQo+PiArICAgICQo
V0lMQ19EUklWRVJfU0RJT19MSU5VWF9DT05GSUdfRklYVVBTKQo+PiArZW5kZWYKPj4gKwo+PiAk
KGV2YWwgJChrZXJuZWwtbW9kdWxlKSkKPj4gJChldmFsICQoZ2VuZXJpYy1wYWNrYWdlKSkKPiAK
PiBSZXZpZXdlZC1ieTogS3JpcyBCYWhuc2VuIDxLcmlzQGVtYmVkZGVkVFMuY29tPgo+IAo+IAo+
IFRoYW5rcyBmb3IgdGhhdCEKCk5vIHByb2JsZW0hCgo+IEkgd2FzIG5vdCByZWFkaWx5IGF3YXJl
IG9mIHRoYXQgc3ludGF4IGZvciBrZXJuZWwgY29uZmlnIGZpeHVwcy4KClRoZXkgYXJlIHZlcnkg
aGVscGZ1bCBhbmQgZWFzeSB0byB1c2UuCgo+IEkndmUgYWxzbyBhZGRlZCBhdXRvLWJ1aWxkcyB0
byBteSBmaWx0ZXIgZXhjZXB0aW9uIHJ1bGVzIHNvIEkgc2hvdWxkIGJlIGFibGUKPiB0byBtb3Jl
IHJlYWRpbHkgbG9vayB0aG9zZSBvdmVyIGluIHRoZSBmdXR1cmUuCgpBd2Vzb21lIDotKQoKVGhh
bmtzIGZvciByZXZpZXdpbmcgYW5kCktpbmQgcmVnYXJkcwrigJQKR2l1bGlvIEJlbmV0dGkKQmVu
ZXR0aSBFbmdpbmVlcmluZyBzYXMKCj4gCj4gLUtyaXMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
