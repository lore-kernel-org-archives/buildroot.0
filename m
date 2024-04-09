Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35F4C67861
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 23:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B05460651;
	Tue,  9 Apr 2024 23:55:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eoJjyqxZ2BQD; Tue,  9 Apr 2024 23:55:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6797F60663
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6797F60663;
	Tue,  9 Apr 2024 23:55:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 939DB1BF2A5
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 23:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 808E74012F
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 23:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWvBn34u7K-s for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 23:55:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7B1EE40127
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B1EE40127
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B1EE40127
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 23:55:17 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id uLInr6MAlGFWQuLJ4rt5zS; Wed, 10 Apr 2024 01:55:14 +0200
Message-ID: <e230853d-4ad5-4287-bc49-1c8d6a4d8e9d@benettiengineering.com>
Date: Wed, 10 Apr 2024 01:54:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Don <dterry_engineer@yahoo.com>
References: <e2634bc6-2e68-4331-8354-49407b40f191.ref@yahoo.com>
 <e2634bc6-2e68-4331-8354-49407b40f191@yahoo.com>
 <6068206a-9a0c-4ef4-a5bb-9e6f35218297@benettiengineering.com>
 <cf44979d-3e49-4c55-80cb-8e776d570a23@yahoo.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <cf44979d-3e49-4c55-80cb-8e776d570a23@yahoo.com>
X-CMAE-Envelope: MS4xfMAixDY2EkvM/GkklNJxTeaaepf+qsN2XddvNKkliOMQAeIYy0EJL59OOVH0bTg6eOjoRHZFrw88Ik8FPmzn2DlZlPbiSkgCm3PBRT2Z3+Dax2c5khrq
 ZbYXRRtsLpiEz/PBDIbOdaE0lRiKwHVhZCOMiLcoMt/vhFXWFo2EcaJJjpaBEIc6BfoaBNzcW0zWEjWbklylPaaZCTgXDnvqSeaO+dcamS47IVaH4PgdtwPD
 9ry9Nff27p/uBpZyVXOGcQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1712706914; bh=o46oLWIY/OXRZkn7c51/554V67l8DgAOcbNXj7vCTmk=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=ZgSjm81/ktGOJQp5fgHXQNsUhvyMlpwp9zDyF/ohwH/12diSw6NlP9G1X07rFQnbh
 dadrFe/YcscXyApnK1FL3q9olODo8uEGcKi1m8IDTYMb3jTmDDTnbWn63MbMRApxG9
 By5UzCsFyj9jd6/ldpoxHeC5ZybOFrbMteDGpfv6JccMp/LdC4XhywANCvlBTi3Dc2
 IgMmKU9t76CFPF1xm3zIwMZ34mDIOJWH07uaNozFNiurxIArzWhu/RJeaPPr1n5/Cb
 sj83dUPo9C1matwY6BEmJ+A0vIPfb6b6Z02pE4WVjAmE2OIZjA1rKQ7JZqBl2mKYGD
 mR23kYtKPb8kw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ZgSjm81/
Subject: Re: [Buildroot] Problem with device tree
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
Cc: Buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRG9uLAoKSSByZS1hZGQgQnVpbGRyb290IE1haWxpbmcgTGlzdCBpbiBDYywKCnBsZWFzZSBk
b24ndCB0b3AtcG9zdCwgYW5zd2VyIGluLWxpbmUgYW5kIHVzZSBwbGFpbi10ZXh0IGFuZCBub3Qg
SFRNTCwKCk9uIDEwLzA0LzI0IDAwOjI0LCBEb24gd3JvdGU6Cj4gVGhhbmsgeW91LCBpdCBkb2Vz
IGhlbHAsIHRoYXQgaXMgc3VybHkgdGhlIHByb2JsZW0gYnV0IEkgaGF2ZSBub3QgZm91bmQgCj4g
dGhlIGNvcnJlY3QgcGF0aCB5ZXQuIEFjY29yZGluZyB0byB0aGUgdHV0b3JpYWwgSSBhbSB1c2lu
ZyAKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2
YWxkcy9saW51eC5naXQvCj4gd2hpY2ggc2hvd3Mgcm9vdC9hcmNoL2FybS9ib290L2R0cyAgYXQg
dGhlIHRvcCBvZiB0aGUgcGFnZSwgc28gSSBoYXZlIGJlZW4gdXNpbmcgaXQgd2l0aG91dCAncm9v
dCcuCgpJdCdzIG5vdCBjbGVhciB0byBtZSB3aGVyZSB5b3UndmUgZm91bmQgcm9vdC8sIGJ1dCB5
ZXMsIGl0J3Mgbm90IHBhcnQgb2YgCnRoZSBwYXRoLiBUaGUgcGF0aCB0byBhbTMzNXgtYm9uZWJs
YWNrLmR0cyBpczoKYXJjaC9hcm0vYm9vdC9kdHMvdGkvb21hcC9hbTMzNXgtYm9uZWJsYWNrLmR0
cwphbmQgdGhhdCBtdXN0IGJlIHBhc3NlZCB0bzoKQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRT
X05BTUUKYWZ0ZXIgZW5hYmxpbmc6CkJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQKCkkgc2Vl
IHRoYXQgSFRNTCBsaW5rIHBvaW50cyB0byBMaW51eCB2NS4xNS4gU28gaXQncyBub3QgY2xlYXIg
dG8gbWUKd2hpY2ggTGludXggdmVyc2lvbiB5b3UncmUgdXNpbmcuCgo+IFlvdSBzcGVjaWZpZWQg
YW5vdGhlciBwYXRoLCBpcyB0aGUgcGF0aCBkaWZmZXJlbnQgZm9yIExpbnV4IHZlcnNpb25zIGFi
b3ZlIDYuNT8KClllcywgc3RhcnRpbmcgZnJvbSBMaW51eCA2LjUgYWxsIGR0cyBmaWxlIG1vdmVk
IHVuZGVyIHNpbGljb24gdmVuZG9yIG5hbWVzLgoKRG8geW91IG1pbmQgdG8gcGFzdGViaW4geW91
ciBkZWZjb25maWc/ClRvIGRvIHNvIGRvbid0IHBhc3RlYmluIHlvdXIgZW50aXJlIC5jb25maWcg
YnV0IGlzc3VlOgokIG1ha2Ugc2F2ZWRlZmNvbmZpZwp0aGF0IHByb2R1Y2UgZmlsZToKZGVmY29u
ZmlnIG9yIHNhdmUgdGhhdCBmaWxlIGJhY2sgdG8gdGhlIG9uZSB5b3UndmUgdXNlZCBkdXJpbmcg
dGhlIGZpcnN0CnNldHVwIGJ5IGlzc3Vpbmc6CiQgbWFrZSBibGFoYmxhaF9kZWZjb25maWcKCkFs
c28gcGxlYXNlIHBvaW50IHdoaWNoIEJ1aWxkcm9vdCB2ZXJzaW9uIHlvdSdyZSB1c2luZyBzbyBJ
IGNhbgpyZXByb2R1Y2UgdGhlIHByb2JsZW0uCgpCZXN0IHJlZ2FyZHMKLS0gCkdpdWxpbyBCZW5l
dHRpCkNFTyZDVE9AQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKCj4gCj4gSGF2ZSBhIEJsZXNzZWQg
ZGF5IQo+IAo+IERvbgo+IAo+IE9uIDQvOS8yNCA0OjU5IFBNLCBHaXVsaW8gQmVuZXR0aSB3cm90
ZToKPj4gSGkgRG9uLAo+Pgo+PiBPbiAwOS8wNC8yNCAyMzoyMywgRG9uIHZpYSBidWlsZHJvb3Qg
d3JvdGU6Cj4+PiBUaGlzIGlzIG15IGZpcnN0IHRpbWUgdXNpbmcgYnVpbGRyb290LiBGb2xsb3dp
bmcgdGhlIGluc3RydWN0aW9ucyBvZiAKPj4+IGJvb3RsaW4uY29tL2RvYy90cmFpbmluZy9idWls
ZHJvb3QvYnVpbGRyb290LWxhYnMucGRmLCBidWlsZGluZyBmb3IgCj4+PiBCZWFnbGVib25lIEJs
YWNrIHRob3VnaCBub3QgdGhlIHdpcmVsZXNzIG9mIHRoZSB0cmFpbmluZyBwZGYuIFVuZGVyIAo+
Pj4gS2VybmVsIC0gc2VsZWN0ZWQgZGV2aWNlIHRyZWUgYmxvYiBhbmQgaW4tdHJlZSBkZXZpY2Ug
dHJlZSBuYW1lIEkgcHV0IAo+Pj4gYW0zMzV4LWJvbmVibGFjay4gSG93ZXZlciBJIGdldAo+Pj4K
Pj4+IERldmljZSBUcmVlIFNvdXJjZSAoYXJjaC9hcm0vZHRzL2FtMzM1eC0uZHRiKSBpcyBub3Qg
Y29ycmVjdGx5IAo+Pj4gc3BlY2lmaWVkLgo+Pj4gUGxlYXNlIGRlZmluZSAnQ09ORklHX0RFRkFV
TFRfREVWSUNFX1RSRUUnCj4+PiBvciBidWlsZCB3aXRoICdERVZJQ0VfVFJFRT08ZGV2aWNlX3Ry
ZWU+JyBhcmd1bWVudAo+Pj4KPj4+IFdoYXQgZG9lcyBpdCB3YW50PyBTb21ldGhpbmcgaXMgbWlz
c2luZyBidXQgSSBkb24ndCBrbm93IHdoYXQuCj4+Cj4+IFN0YXJ0aW5nIGZyb23CoCBMaW51eCB2
ZXJzaW9uIDYuNVswXSB5b3UgaGF2ZSB0byBzcGVjaWZ5IHRoZSAKPj4gbWFudWZhY3R1cmVyIGZv
bGRlciB0b28gY29tcGFyZWQgdG8gcHJldmlvdXMgdmVyc2lvbnMoaS5lLiA2LjRbMV0pLiBTbyAK
Pj4gaWYgeW91J3JlIHVzaW5nIGEga2VybmVsIG5ld2VyIHRoYW4gNi41IHlvdSBoYXZlIHRvIHNw
ZWNpZnkgc29tZXRoaW5nIAo+PiBsaWtlOgo+PiBhcmNoL2FybS9kdHMvdGkvb21hcC9hbTMzNXgt
LmR0Ygo+Pgo+PiBIb3BlIHRoaXMgaGVscHMuCj4+Cj4+IFswXTogaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjYuNS1yYzEvc291cmNlL2FyY2gvYXJtL2Jvb3QvZHRzCj4+IFsxXTog
aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNC4xNi9zb3VyY2UvYXJjaC9hcm0v
Ym9vdC9kdHMKPj4KPj4gQmVzdCByZWdhcmRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
