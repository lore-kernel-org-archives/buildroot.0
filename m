Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13A3C4332F
	for <buildroot@archiver.kernel.org>; Wed, 16 Nov 2022 01:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33CAA60F37;
	Wed, 16 Nov 2022 01:16:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33CAA60F37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D3-4iUSPeSbD; Wed, 16 Nov 2022 01:16:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FB9D60F34;
	Wed, 16 Nov 2022 01:16:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FB9D60F34
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C0241BF4DD
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 01:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3735981E60
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 01:16:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3735981E60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bruj_4SLlUXf for <buildroot@lists.busybox.net>;
 Wed, 16 Nov 2022 01:16:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D20381E32
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D20381E32
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 01:15:59 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.88.137])
 by Aruba Outgoing Smtp  with ESMTPSA
 id v71xo6ySa1jfKv71yoWUbM; Wed, 16 Nov 2022 02:15:58 +0100
Message-ID: <d6d839d9-7e68-6be2-7c38-98ad1294ffd2@benettiengineering.com>
Date: Wed, 16 Nov 2022 02:15:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20221019134823.12594-1-giulio.benetti@benettiengineering.com>
 <20221030210615.49866828@windsurf>
 <901ec05a-8d90-8658-29ac-381f50ae0eaa@benettiengineering.com>
In-Reply-To: <901ec05a-8d90-8658-29ac-381f50ae0eaa@benettiengineering.com>
X-CMAE-Envelope: MS4xfIz6M6U/AHIHp0Mt35OwBjMK50XRPB2obAHVmZQPlgYSDiBR1f1/vLjLAwb5tL6IEmStjmhTZPl2i7r3R8aJGkFO3qQBt++QqfosLY0aI5Mb7KhzNsAm
 YG14AXY2GxjVyD7Hng/GsUw+g0vh0idirRwszds5NBOfXtDQ4iH8xfh01x+jRQheJCDjK5UtqhYgcu8r+hLJIJmaviLQM+sv5clf8PQ6bLV9AAqWWQFS3oRd
 JykZK6Qi0LtKZC18P6CYCVkiIAx1MRMs2pVwKH0GSnTV+VB8kM9w1H7OMCg/jjQqz6TOW9Hps7OEGLa0rGr2wA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1668561358; bh=XzXffWIG29/eE4shUUGlR0mrEQsrbAFTBXhi/dC708U=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=O6dl76uCcsQeuDfpreGe9EIrD5kNQp7xmw9yH9S5IxcTbq5xhP2LBrxTKvXyCMyHf
 DwSIe9ByUvb0CffYz45plzbLfB5v68gSZK1xGiRlUhuIqXidZDEORX5vLM18szSpsP
 wBP5Xch4y07YTOdA2CRI1beqUK4oxVz4LqD35sFMZH/IoT4Te8812VdmW072tCAh9V
 mmmyaPz6AYXFNLmVUbL4F69nNPsL0CBRU4aFGA64EmODLTkPkEoM0Oy2UEVRnPb5XY
 a/VHkFWszYmHzq4zY8NrWk9vPzKwmK/wWIUMc967DbufMpIaxYJJc3yK5k4EgEDMyY
 Ixkwtqqv0ecsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=O6dl76uC
Subject: Re: [Buildroot] [PATCH v2] package/rtl8188eu: remove wrong
 description in Config.in
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTYvMTEvMjIgMDE6MzMsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+IEhpIFRob21hcywgTHVj
YSwKPiAKPiBPbiAzMC8xMC8yMiAyMTowNiwgVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290
IHdyb3RlOgo+PiBPbiBXZWQsIDE5IE9jdCAyMDIyIDE1OjQ4OjIzICswMjAwCj4+IEdpdWxpbyBC
ZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPj4K
Pj4+IFRoaXMgcnRsODE4OGV1IGRyaXZlciBpcyBub3QgdGhlIHNhbWUgYXMgdGhlIG9uZSBpbiBt
YWlubGluZSBMaW51eCB0aGF0Cj4+PiBzdGlsbCBoYXMgcGVuZGluZyB3b3JrIHRvIGJlIGRvbmUg
dGhhdCBpbiB0aGlzIGRyaXZlciBpcyBkb25lLCBjaGVjazoKPj4+IGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2Ry
aXZlcnMvc3RhZ2luZy9yODE4OGV1L1RPRE8KPj4+IHNwZWNpZmljYWxseToKPj4+ICogU3dpdGNo
IHRvIHVzZSBMSUI4MDIxMS4KPj4+ICogU3dpdGNoIHRvIHVzZSBNQUM4MDIxMS4KPj4+ICogU3dp
dGNoIHRvIHVzZSBDRkc4MDIxMS4KPj4+IFNvIGxldCdzIHJlbW92ZSB0aGUgZGVzY3JpcHRpb24g
dGhhdCBpcyBub3QgdmFsaWQgYW55bW9yZS4KPj4+Cj4+PiBTdWdnZXN0ZWQtYnk6IEx1Y2EgQ2Vy
ZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBHaXVs
aW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPj4+IC0t
LQo+Pj4gVjEtPlYyOgo+Pj4gKiBpbXByb3ZlIENvbmZpZy5pbiBkZXNjcmlwdGlvbiBhcyBwb2lu
dGVkIGJ5IEx1Y2EgQ2VyZXNvbGkKPj4+IC0tLQo+Pj4gwqAgcGFja2FnZS9ydGw4MTg4ZXUvQ29u
ZmlnLmluIHwgNyArKysrLS0tCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3J0bDgxODhldS9D
b25maWcuaW4gYi9wYWNrYWdlL3J0bDgxODhldS9Db25maWcuaW4KPj4+IGluZGV4IDc2ZDkwODUy
OTcuLjJmYWIxZmQ1YzAgMTAwNjQ0Cj4+PiAtLS0gYS9wYWNrYWdlL3J0bDgxODhldS9Db25maWcu
aW4KPj4+ICsrKyBiL3BhY2thZ2UvcnRsODE4OGV1L0NvbmZpZy5pbgo+Pj4gQEAgLTQsOSArNCwx
MCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfUlRMODE4OEVVCj4+PiDCoMKgwqDCoMKgIGRlcGVuZHMg
b24gQlIyX0xJTlVYX0tFUk5FTAo+Pj4gwqDCoMKgwqDCoCBoZWxwCj4+PiDCoMKgwqDCoMKgwqDC
oCBBIHN0YW5kYWxvbmUgZHJpdmVyIGZvciB0aGUgUlRMODE4OEVVIFVTQiBXaS1GaSBhZGFwdGVy
Lgo+Pj4gLcKgwqDCoMKgwqAgVGhpcyBpcyBuZWVkZWQgb25seSBmb3IgTGludXgga2VybmVscyBi
ZWZvcmUgMy4xMi4KPj4+IC3CoMKgwqDCoMKgIFNpbmNlIDMuMTIsIHRoZXJlIGlzIGEgKHN0YWdp
bmcpIGRyaXZlciBpbiBtYWlubGluZSwgd2l0aCBhCj4+PiAtwqDCoMKgwqDCoCBzaW1pbGFyIGNv
ZGViYXNlLgo+Pj4gK8KgwqDCoMKgwqAgVGhpcyBydGw4MTg4ZXUgZHJpdmVyIGlzIG5vdCB0aGUg
c2FtZSBhcyB0aGUgb25lIGluIG1haW5saW5lCj4+PiArwqDCoMKgwqDCoCBMaW51eCB0aGF0IHN0
aWxsIGhhcyBwZW5kaW5nIHdvcmsgdG8gYmUgZG9uZSB0aGF0IGluIHRoaXMKPj4+ICvCoMKgwqDC
oMKgIGRyaXZlciBpcyBkb25lLCBjaGVjazoKPj4+ICsgICAgICAKPj4+IGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVl
L2RyaXZlcnMvc3RhZ2luZy9yODE4OGV1L1RPRE8KPj4KPj4gSSBkb24ndCBzZWUgYW55IHRoaW5n
IGluIHRoaXMgVE9ETyB0aGF0IGV4cGxhaW5zIHdoeSB0aGUgb3V0LW9mLXRyZWUKPj4gZHJpdmVy
IGlzIGJldHRlciB0aGFuIHRoZSBtYWlubGluZSBkcml2ZXIuCj4+Cj4+IFRoZSBvdXQtb2YtdHJl
ZSBkcml2ZXIgaGFzIGJlZW4gaW50ZWdyYXRlZCBpbnRvIGRyaXZlcnMvc3RhZ2luZy8sIGFuZAo+
PiB0aGlzIFRPRE8gZmlsZSBsaXN0cyB3aGF0IHNob3VsZCBiZSBpbXByb3ZlZCBpbiB0aGUgZHJp
dmVyIHNvIHRoYXQgaXQKPj4gY2FuIGJlIGdyYWR1YXRlZCB0byBtb3ZlIG91dHNpZGUgb2YgZHJp
dmVycy9zdGFnaW5nLyBpbnRvIHRoZSBwcm9wZXIKPj4gZHJpdmVycy9uZXQvd2lyZWxlc3MvIGxv
Y2F0aW9uLgo+Pgo+PiBJIGRvbid0IHNlZSBhbnl0aGluZyBpbiB0aGlzIFRPRE8gdGhhdCBpbmRp
Y2F0ZXMgdGhhdCB0aGUgb3V0LW9mLXRyZWUKPj4gZHJpdmVyIGhhcyAibW9yZSBmZWF0dXJlcyIg
dGhhbiB0aGUgbWFpbmxpbmUgZHJpdmVyLCBzbyB0byBtZSB0aGUKPj4gQ29uZmlnLmluIGhlbHAg
dGV4dCBzdGlsbCBtYWtlcyBzZW5zZS4KPj4KPj4gQ291bGQgeW91IGdpdmUgc29tZSBtb3JlIGRl
dGFpbHM/Cj4gCj4gVGhlIFRPRE8gZmlsZVswXSBpcyBvdXRkYXRlZCBiZWNhdXNlIGl0IHN0YXRl
cyB0aGF0Ogo+ICogU3dpdGNoIHRvIHVzZSBMSUI4MDIxMS4KPiAqIFN3aXRjaCB0byB1c2UgTUFD
ODAyMTEuCj4gKiBTd2l0Y2ggdG8gdXNlIENGRzgwMjExLgo+IGFyZSBzdGlsbCBwZW5kaW5nLCBi
dXQgaXQncyB0cnVlIG5vdCBiZWNhdXNlIGlmIHdlIGNoZWNrIHRoZSBLY29uZmlnWzFdCj4gd2Ug
ZmluZCAnZGVwZW5kcyBvbiBDRkc4MDIxMScgYW5kIExJQjgwMjExLiBBbHNvIGlmIHdlIGNoZWNr
IGZvcgo+IGllZWU4MDIxMV8qKCkgY2FsbHNlIGludCBkcml2ZXJzL3N0YWdpbmcvcjgxODhldSBm
b2xkZXIgd2UgZmluZCBhIGxvdCBvZgo+IGNhbGxzLiBTbyBJIHRoaW5rIHRoaXMgbW9kdWxlIGlz
IG9ubHkgYSBjb3B5IG9mIHRoZSBMaW51eCBkcml2ZXIgdGhhdAo+IGNhbiB3b3JrIGFzIHNwZWNp
ZmllZCBpbiB0aGUgYWN0dWFsIGhlbHAod2l0aCBMaW51eCB2ZXJzaW9uIGJlZm9yZSAzLjEyLgo+
IAo+IERvZXMgaXQgbWF5YmUgbWFrZSBzZW5zZSB0byBhZGQgaW4gdGhlIGhlbHAgc2VjdGlvbjoK
PiBgYGAKPiBJZiB1c2luZyBMaW51eCAzLjEyKyBpdCdzIHJlY29tbWVuZGVkIHRvIHVzZSBMaW51
eCBkcml2ZXIKPiBgYGAKPiA/Cj4gT3Igd2UgY2FuIHJlbmFtZSB0aGUgcGFja2FnZSBuYW1lIHdp
dGggdGhlIHN1ZmZpeCAtbGVnYWN5Pwo+IAo+IFJlZ2FyZGluZyB0aGUgb3RoZXIgd2lmaSBkcml2
ZXJzIEkndmUgY2hlY2tlZCBhbmQgdGhleSBhcmUgbm90IHN1cHBvcnRlZAo+IGluIExpbnV4LCBu
b3Igc3RhZ2luZyBub3IgbmV0L3dpcmVsZXNzLCBleGNlcHQgcnRsODcyM2J1WzJdLCBzbyBtYXli
ZSBpdAo+IG1ha2VzIHNlbnNlIHRvIGRyb3AgcnRsODcyM2J1IHBhY2thZ2UuCgpQYXJkb24sIG5v
dCBkcm9wIHRoZSBwYWNrYWdlLCBidXQgdG8gaW1wcm92ZSBoZWxwIHNlY3Rpb24gcG9pbnRpbmcg
dGhhdAppcyBmb3IgTGludXggdmVyc2lvbih0byBjaGVjayB3aGVuIExpbnV4IGRyaXZlciBoYXMg
YmVlbiBhZGRlZCkgYW5kCmVuY291cmFnZSB0aGUgdXNlIG9mIExpbnV4IGRyaXZlciBvdGhlcndp
c2UuCgpCZXN0IHJlZ2FyZHMKLS0gCkdpdWxpbyBCZW5ldHRpCkNFTy9DVE9AQmVuZXR0aSBFbmdp
bmVlcmluZyBzYXMKCj4gCj4gV2hhdCBkbyB5b3UgdGhpbms/Cj4gCj4gWzBdOiAKPiBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5n
aXQvdHJlZS9kcml2ZXJzL3N0YWdpbmcvcjgxODhldS9UT0RPCj4gWzFdOiAKPiBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQv
dHJlZS9kcml2ZXJzL3N0YWdpbmcvcjgxODhldS9LY29uZmlnCj4gWzJdOiAKPiBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQv
dHJlZS9kcml2ZXJzL25ldC93aXJlbGVzcy9yZWFsdGVrL3J0bDh4eHh1L3J0bDh4eHh1Xzg3MjNi
LmMjbjIzOAo+IAo+IFRoYW5rIHlvdQo+IEJlc3QgcmVnYXJkcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
