Return-Path: <SRS0=trv6=NC=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78EA0C4338F
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 17:30:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3A1E61019
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 17:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3A1E61019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lucaceresoli.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EA6B4046D;
	Wed, 11 Aug 2021 17:30:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eBOfR43R8scO; Wed, 11 Aug 2021 17:30:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85868405B1;
	Wed, 11 Aug 2021 17:30:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E1C791BF398
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 17:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF59040145
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 17:30:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qbHUkG3IWtMW for <buildroot@lists.busybox.net>;
 Wed, 11 Aug 2021 17:29:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CE72400F4
 for <buildroot@buildroot.org>; Wed, 11 Aug 2021 17:29:56 +0000 (UTC)
Received: from [77.244.183.192] (port=63504 helo=[192.168.178.41])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1mDs36-001rSr-C8; Wed, 11 Aug 2021 19:29:52 +0200
To: Alvaro Gamez <alvaro.gamez@hazent.com>
References: <20210715062814.8076-1-alvaro.gamez@hazent.com>
 <6d922a5e-0796-2ba1-757b-91e6eb1892dc@lucaceresoli.net>
 <CAM+bi4touFieVsbCe8Tu__erw1UsBHcGJVbVykocNEjY6_KMYA@mail.gmail.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <43e05075-852a-53f6-3fe2-addce6acb705@lucaceresoli.net>
Date: Wed, 11 Aug 2021 19:29:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAM+bi4touFieVsbCe8Tu__erw1UsBHcGJVbVykocNEjY6_KMYA@mail.gmail.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH] configs/digilent_genesys_zu_defconfig: add
 Digilent Genesys ZU board (ZynqMP SoC)
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGkgQWx2YXJvLAoKSSdtIHJlcGx5aW5nIGhlcmUgdG8gdG9waWNzIHRoYXQgYXBwbHkgYWxzbyBm
b3IgdjIuIEknbSBzZW5kaW5nIGEKc2VwYXJhdGUgcmV2aWV3IGZvciB0aGUgcmVzdC4KCk9uIDAz
LzA4LzIxIDEwOjE5LCBBbHZhcm8gR2FtZXogd3JvdGU6Cj4gSGkgTHVjYQo+IAo+IEVsIHZpZSwg
MzAganVsIDIwMjEgYSBsYXMgMDoyMSwgTHVjYSBDZXJlc29saQo+ICg8bHVjYUBsdWNhY2VyZXNv
bGkubmV0PikgZXNjcmliacOzOgo+Pgo+PiBIaSBBbHZhcm8sCj4+Cj4+IHRoYW5rcyBmb3IgeW91
ciBwYXRjaC4KPj4KPj4gQW5kIGFwb2xvZ2llcyBmb3IgdGhlIGxhdGUgcmVwbHkgLS0gdmFjYXRp
b24gdGltZS4KPiAKPiBEb24ndCB3b3JyeSwgd2UncmUgYWxsIGJ1c3khIFRoYW5rcyBmb3IgeW91
ciByZXZpZXcuCj4gCj4+IE9uIDE1LzA3LzIxIDA4OjI4LCBBbHZhcm8gR2FtZXogTWFjaGFkbyB3
cm90ZToKPj4+IFRoaXMgYWRkcyBzdXBwb3J0IHRoZSBEaWdpbGVudCBHZW5lc3lzIFpVIGRldmVs
b3BtZW50IGJvYXJkLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFsdmFybyBHYW1leiBNYWNoYWRv
IDxhbHZhcm8uZ2FtZXpAaGF6ZW50LmNvbT4KPj4+IC0tLQo+Pj4gIC4uLnZlLXJlZHVuZGFudC1Z
WUxPQy1nbG9iYWwtZGVjbGFyYXRpby5wYXRjaCB8ICAgIDUyICsKPj4+ICAuLi4vMDAwMS11Ym9v
dC1hZGQtZ2VuZXN5cy16dS5wYXRjaCAgICAgICAgICAgfCAgICAxMCArCj4+PiAgYm9hcmQvZGln
aWxlbnQvZ2VuZXN5cy16dS9HZW5lc3lzWlUuZHRzICAgICAgIHwgIDE2NTUgKwo+Pj4gIGJvYXJk
L2RpZ2lsZW50L2dlbmVzeXMtenUvUkVBRE1FLnR4dCAgICAgICAgICB8ICAgIDkyICsKPj4+ICBi
b2FyZC9kaWdpbGVudC9nZW5lc3lzLXp1L2dlbmltYWdlLmNmZyAgICAgICAgfCAgICAyOCArCj4+
PiAgYm9hcmQvZGlnaWxlbnQvZ2VuZXN5cy16dS9pbWFnZS5pdHMgICAgICAgICAgIHwgICAgNTkg
Kwo+Pj4gIGJvYXJkL2RpZ2lsZW50L2dlbmVzeXMtenUva2VybmVsX2RlZmNvbmZpZyAgICB8ICAg
NDE0ICsKPj4+ICBib2FyZC9kaWdpbGVudC9nZW5lc3lzLXp1L3BtX2NmZ19vYmouYyAgICAgICAg
fCAgIDYzMCArCj4+PiAgYm9hcmQvZGlnaWxlbnQvZ2VuZXN5cy16dS9wb3N0LWltYWdlLnNoICAg
ICAgIHwgICAgMTAgKwo+Pj4gIGJvYXJkL2RpZ2lsZW50L2dlbmVzeXMtenUvcHN1X2luaXRfZ3Bs
LmMgICAgICB8IDIxODE4ICsrKysrKysrKwo+Pj4gIGJvYXJkL2RpZ2lsZW50L2dlbmVzeXMtenUv
cHN1X2luaXRfZ3BsLmggICAgICB8IDM3NTQ1ICsrKysrKysrKysrKysrKysKPj4KPj4gVGhlc2Ug
ZmlsZXMgYXJlIGh1Z2UhIFlvdSBzaG91bGQgdXNlIHRoZQo+PiB0b29scy96eW5xbXBfcHN1X2lu
aXRfbWluaW1pemUuc2ggdG9vbCBpbiB0aGUgVS1Cb290IHNvdXJjZXMgYW5kIHN1Ym1pdAo+PiBm
b3IgQnVpbGRyb290IHRoZSByZWR1Y2VkIGZpbGVzLgo+IAo+IEkgZGlkbid0IGV2ZW4ga25vdyB0
aGF0IHRoaW5nIGV4aXN0ZWQsIEkgd2lsbCBzdXJlbHkgdXNlIGl0Lgo+IE15IGxhc3QgcGF0Y2gg
Z290IHJlamVjdGVkIGJ5IHRoZSBtYWlsaW5nIGxpc3QgZHVlIHRvIHRoZSBiaWcgc2l6ZS4KPiAK
PiAKPj4+IGRpZmYgLS1naXQgYS9ib2FyZC9kaWdpbGVudC9nZW5lc3lzLXp1LzAwMDEtc2NyaXB0
cy1kdGMtUmVtb3ZlLXJlZHVuZGFudC1ZWUxPQy1nbG9iYWwtZGVjbGFyYXRpby5wYXRjaCBiL2Jv
YXJkL2RpZ2lsZW50L2dlbmVzeXMtenUvMDAwMS1zY3JpcHRzLWR0Yy1SZW1vdmUtcmVkdW5kYW50
LVlZTE9DLWdsb2JhbC1kZWNsYXJhdGlvLnBhdGNoCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
Pj4gaW5kZXggMDAwMDAwMDAwMC4uNDhmNjgzYWZiZQo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4gKysr
IGIvYm9hcmQvZGlnaWxlbnQvZ2VuZXN5cy16dS8wMDAxLXNjcmlwdHMtZHRjLVJlbW92ZS1yZWR1
bmRhbnQtWVlMT0MtZ2xvYmFsLWRlY2xhcmF0aW8ucGF0Y2gKPj4+IEBAIC0wLDAgKzEsNTIgQEAK
Pj4+ICtGcm9tIGUzM2E4MTRlNzcyY2RjMzY0MzZjOGMxODhkOGM0MmQwMTlmZGE2MzkgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCj4+PiArRnJvbTogRGlyayBNdWVsbGVyIDxkbXVlbGxlckBzdXNl
LmNvbT4KPj4+ICtEYXRlOiBUdWUsIDE0IEphbiAyMDIwIDE4OjUzOjQxICswMTAwCj4+PiArU3Vi
amVjdDogW1BBVENIXSBzY3JpcHRzL2R0YzogUmVtb3ZlIHJlZHVuZGFudCBZWUxPQyBnbG9iYWwg
ZGVjbGFyYXRpb24KPj4+ICsKPj4+ICtnY2MgMTAgd2lsbCBkZWZhdWx0IHRvIC1mbm8tY29tbW9u
LCB3aGljaCBjYXVzZXMgdGhpcyBlcnJvciBhdCBsaW5rCj4+PiArdGltZToKPj4+ICsKPj4+ICsg
ICgudGV4dCsweDApOiBtdWx0aXBsZSBkZWZpbml0aW9uIG9mIGB5eWxsb2MnOyBkdGMtbGV4ZXIu
bGV4Lm8gKHN5bWJvbCBmcm9tIHBsdWdpbik6KC50ZXh0KzB4MCk6IGZpcnN0IGRlZmluZWQgaGVy
ZQo+Pj4gKwo+Pj4gK1RoaXMgaXMgYmVjYXVzZSBib3RoIGR0Yy1sZXhlciBhcyB3ZWxsIGFzIGR0
Yy1wYXJzZXIgZGVmaW5lIHRoZSBzYW1lCj4+PiArZ2xvYmFsIHN5bWJvbCB5eWxvYy4gQmVmb3Jl
IHdpdGggLWZjb21tb24gdGhvc2Ugd2VyZSBtZXJnZWQgaW50byBvbmUKPj4+ICtkZWZpbnRpb24u
IFRoZSBwcm9wZXIgc29sdXRpb24gd291bGQgYmUgdG8gdG8gbWFyayB0aGlzIGFzICJleHRlcm4i
LAo+Pj4gK2hvd2V2ZXIgdGhhdCBsZWFkcyB0bzoKPj4+ICsKPj4+ICsgIGR0Yy1sZXhlci5sOjI2
OjE2OiBlcnJvcjogcmVkdW5kYW50IHJlZGVjbGFyYXRpb24gb2YgJ3l5bGxvYycgWy1XZXJyb3I9
cmVkdW5kYW50LWRlY2xzXQo+Pj4gKyAgIDI2IHwgZXh0ZXJuIFlZTFRZUEUgeXlsbG9jOwo+Pj4g
KyAgICAgIHwgICAgICAgICAgICAgICAgXn5+fn5+Cj4+PiArSW4gZmlsZSBpbmNsdWRlZCBmcm9t
IGR0Yy1sZXhlci5sOjI0Ogo+Pj4gK2R0Yy1wYXJzZXIudGFiLmg6MTI3OjE2OiBub3RlOiBwcmV2
aW91cyBkZWNsYXJhdGlvbiBvZiAneXlsbG9jJyB3YXMgaGVyZQo+Pj4gKyAgMTI3IHwgZXh0ZXJu
IFlZTFRZUEUgeXlsbG9jOwo+Pj4gKyAgICAgIHwgICAgICAgICAgICAgICAgXn5+fn5+Cj4+PiAr
Y2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKPj4+ICsKPj4+ICt3aGlj
aCBtZWFucyB0aGUgZGVjbGFyYXRpb24gaXMgY29tcGxldGVseSByZWR1bmRhbnQgYW5kIGNhbiBq
dXN0IGJlCj4+PiArZHJvcHBlZC4KPj4+ICsKPj4+ICtTaWduZWQtb2ZmLWJ5OiBEaXJrIE11ZWxs
ZXIgPGRtdWVsbGVyQHN1c2UuY29tPgo+Pj4gK1NpZ25lZC1vZmYtYnk6IERhdmlkIEdpYnNvbiA8
ZGF2aWRAZ2lic29uLmRyb3BiZWFyLmlkLmF1Pgo+Pj4gK1tyb2JoOiBjaGVycnktcGljayBmcm9t
IHVwc3RyZWFtXQo+Pj4gK0NjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4+PiArU2lnbmVkLW9m
Zi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPj4+ICtTaWduZWQtb2ZmLWJ5OiBB
bHZhcm8gR2FtZXogTWFjaGFkbyA8YWx2YXJvLmdhbWV6QGhhemVudC5jb20+Cj4+Cj4+IElmIHRo
aXMgcGF0Y2ggY29tZXMgZnJvbSB1cHN0cmVhbSBpdCB3b3VsZCBiZSBuaWNlIHRvIGFkZCBhbiBV
Ukwgb2YKPj4gd2hlcmUgaXQgY2FuIGJlIGZvdW5kLgo+IAo+IEl0J3MganVzdCBhIGxpbnV4IGtl
cm5lbCBwYXRjaCwgdGhlIG9uZSByZWZlcmVuY2VkIG9uIHRoZSBmaXJzdCBsaW5lOgo+IEZyb20g
ZTMzYTgxNGU3NzJjZGMzNjQzNmM4YzE4OGQ4YzQyZDAxOWZkYTYzOSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKPiAKPiBJIGNhbiBjbGFyaWZ5IGl0IHNvbWV3aGVyZSBlbHNlLCBidXQgd2hlcmU/
IEp1c3QgYmVsb3cgdGhlIC0tLSBjb21taXQKPiBsaW5lIGlzIG9rPwo+IAo+Pgo+Pj4gZGlmZiAt
LWdpdCBhL2JvYXJkL2RpZ2lsZW50L2dlbmVzeXMtenUvR2VuZXN5c1pVLmR0cyBiL2JvYXJkL2Rp
Z2lsZW50L2dlbmVzeXMtenUvR2VuZXN5c1pVLmR0cwo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
Pj4+IGluZGV4IDAwMDAwMDAwMDAuLmRkZWJhNGI3MTUKPj4+IC0tLSAvZGV2L251bGwKPj4+ICsr
KyBiL2JvYXJkL2RpZ2lsZW50L2dlbmVzeXMtenUvR2VuZXN5c1pVLmR0cwo+Pgo+PiBEbyB5b3Ug
cGxhbiB0byBzdWJtaXQgdGhpcyBEVFMgdG8gbWFpbmxpbmUgTGludXg/IEl0IHdvdWxkIGJlIG5p
Y2UgdG8gZG8KPj4gaXQgYW5kLCBpbiB0aGF0IHByb2Nlc3MsIGhhdmUgaXQgcHJvcGVybHkgcmV2
aWV3ZWQuIEFmdGVyIHRoYXQgaXQgY2FuIGJlCj4+IHJlbW92ZWQgZnJvbSBCdWlsZHJvb3QuCj4g
Cj4gSSByZWFsbHkgc2hvdWxkLCBidXQgdGhpcyBEVFMgd29uJ3QgYmUgYWNjZXB0ZWQgYXMgaXMu
IFRoZSBwcm9wZXIgd2F5Cj4gd291bGQgYmUgcmVtb3ZpbmcKPiBtb3N0IG9mIGl0IGFuZCBqdXN0
IHVzZSAjaW5jbHVkZSAienlucW1wLmR0c2kiLiBJZiBJIGhhdmUgZW5vdWdoIHRpbWUKPiB0aGlz
IGNlbnR1cnkgSSByZWFsbHkgd2lsbC4KCllvdSBzaG91bGQgX3JlYWxseV8gZG8gaXQgaW4gdjMu
IENvbWUgb24sIGl0J3Mgbm90IGdvaW5nIHRvIHRha2UgdGhhdAptdWNoIHRpbWUhIDspCgo+Pj4g
ZGlmZiAtLWdpdCBhL2JvYXJkL2RpZ2lsZW50L2dlbmVzeXMtenUvdWJvb3RfZGVmY29uZmlnIGIv
Ym9hcmQvZGlnaWxlbnQvZ2VuZXN5cy16dS91Ym9vdF9kZWZjb25maWcKPj4+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4+PiBpbmRleCAwMDAwMDAwMDAwLi5mMjI4NTZlMTg0Cj4+PiAtLS0gL2Rldi9u
dWxsCj4+PiArKysgYi9ib2FyZC9kaWdpbGVudC9nZW5lc3lzLXp1L3Vib290X2RlZmNvbmZpZwo+
Pgo+PiBBcyBhYm92ZTogYW55IHBsYW4gdG8gc3VibWl0IHRoaXMgdG8gbWFpbmxpbmUgVS1Cb290
Pwo+IAo+IEFuZCB0aGUgYW5zd2VyIGlzIHlldCB0aGUgc2FtZS4uLiBUaGlzIGRlZmNvbmZpZyBp
cyBhbHNvIG5vdAo+IGFjY2VwdGFibGUgYXMgaXMgZm9yIG1haW5saW5lLCBzbwo+IGl0IHdvdWxk
IHJlcXVpcmUgbW9yZSB3b3JrLgoKQW5vdGhlciBxdWVzdGlvbiBpczogZG9lcyBhbnkgb2YgdGhl
IGRlZmNvbmZpZ3MgcHJvdmlkZWQgaW4gVS1Cb290IHdvcmsKZm9yIHlvdXIgYm9hcmQ/IFdoeSBu
b3Q/CgotLSAKTHVjYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDov
L2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
