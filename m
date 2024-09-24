Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C07CF9C72
	for <buildroot@archiver.kernel.org>; Tue, 24 Sep 2024 03:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71E4F60A66;
	Tue, 24 Sep 2024 03:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ceXXDts9IQig; Tue, 24 Sep 2024 03:32:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21BE560A67
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21BE560A67;
	Tue, 24 Sep 2024 03:32:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A27FF1BF267
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 03:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9090240239
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 03:32:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5IGmCRRAk3no for <buildroot@lists.busybox.net>;
 Tue, 24 Sep 2024 03:32:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.3;
 helo=m16.mail.163.com; envelope-from=andyshrk@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2A6884022F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A6884022F
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A6884022F
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 03:32:45 +0000 (UTC)
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-111 (Coremail) ; Tue, 24 Sep 2024 11:32:40 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Tue, 24 Sep 2024 11:32:40 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Arnout Vandecappelle" <arnout@mind.be>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <7728aa00-20d0-4dd8-8db7-4b6c75265082@mind.be>
References: <20240922090713.20744-1-andyshrk@163.com>
 <7728aa00-20d0-4dd8-8db7-4b6c75265082@mind.be>
X-NTES-SC: AL_Qu2ZBf2ft08t5iaRZOlS+zN027ZZGIPiw4tinfIOfuALgRno+Sw7QGRAAUPr2/v75uXGZSFM3gVVuISOUdqB
MIME-Version: 1.0
Message-ID: <295f913.4081.19222169e77.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: bygvCgDXv43ZMvJmMxwCAA--.561W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqRhkXmbyLn95IQACsU
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=L/20zp8Kn4lJBhOjVqh/3TYC3rUs5D2kw0NmDyYE/VU=; b=F
 0NOsHjVf7/UL08aTYkqGzT2QWiA7K6AhFd99R2bWNdojmTjJIl4jBZo7l6Ml8QRr
 ae9krVsVFAW3pATZNd8EgOPecaLn7RfNDlt7Av2S5L6c+LA+2SlkEbEiUs81aZat
 zFFW+FCuuWJQXphAo6vdy7hUEXyp2F8DlFvUzuFhYs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=F0NOsHjV
Subject: Re: [Buildroot] [PATCH] package/io: New package
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

CkhpIEFybm91dO+8jAoKQXQgMjAyNC0wOS0yNCAwMjo0NzowMiwgIkFybm91dCBWYW5kZWNhcHBl
bGxlIHZpYSBidWlsZHJvb3QiIDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4gIEhp
IEFuZHksCj4KPk9uIDIyLzA5LzIwMjQgMTE6MDcsIEFuZHkgWWFuIHdyb3RlOgo+PiBBIHV0aWxp
dHkgdG8gYWNjZXNzIG1lbW9yeS9yZWdpc3RlciB2aWEgcGh5c2ljYXMgYWRkcmVzczoKPj4gCj4+
IFJhdyBtZW1vcnkgaS9vIHV0aWxpdHkKPgo+ICBTbyB0aGlzIGlzIGJhc2ljYWxseSBidXN5Ym94
J3MgZGV2bWVtLCByaWdodD8KClllc++8jCBpdCB3b3JrcyBsaWtlIGJ1c3lib3ggZGV2bWVt77yM
YnV0IHdpdGggbW9yZSB1c2VmdWxsIGZlYXR1cmVz44CCClN1Y2ggYXMgaXQgY2FuIHJlYWQgYSBw
aWVjZSBvZiBtZW1vcnkgYXQgYSB0aW1l77yMIGFuZCBpZiBjYW4gZHVtcCBhCnBpZWNlIG9mIG1l
bW9yeSB0byBhIGZpbGXvvIwgb3Igd3JpdGUgYSBmaWxlIGNvbnRlbnQgdG8gYSBwaWVjZSBvZiBt
ZW1vcnnjgIIKCkl0IGlzIHZlcnkgdXNlZnVsbCB3aGVuIHdlIGRlYnVnIGEgaGFyZHdhcmUgSVAg
YmxvY2vjgIIKPgo+Cj4+IGlvIC12IC0xfDJ8NCAtcnx3IFstbCA8bGVuPl0gWy1mIDxmaWxlPl0g
PGFkZHI+IFs8dmFsdWU+XQo+PiAKPj4gICAgICAtdiAgICAgICAgIFZlcmJvc2UsIGFza3MgZm9y
IGNvbmZpcm1hdGlvbgo+PiAgICAgIC0xfDJ8NCAgICAgU2V0cyBtZW1vcnkgYWNjZXNzIHNpemUg
aW4gYnl0ZXMgKGRlZmF1bHQgYnl0ZSkKPj4gICAgICAtbCA8bGVuPiAgIExlbmd0aCBpbiBieXRl
cyBvZiBhcmVhIHRvIGFjY2VzcyAoZGVmYXVsdHMgdG8KPj4gICAgICAgICAgICAgICAgIG9uZSBh
Y2Nlc3MsIG9yIHdob2xlIGZpbGUgbGVuZ3RoKQo+PiAgICAgIC1yfHcgICAgICAgUmVhZCBmcm9t
IG9yIFdyaXRlIHRvIG1lbW9yeSAoZGVmYXVsdCByZWFkKQo+PiAgICAgIC1mIDxmaWxlPiAgRmls
ZSB0byB3cml0ZSBvbiBtZW1vcnkgcmVhZCwgb3IKPj4gICAgICAgICAgICAgICAgIHRvIHJlYWQg
b24gbWVtb3J5IHdyaXRlCj4+ICAgICAgPGFkZHI+ICAgICBUaGUgbWVtb3J5IGFkZHJlc3MgdG8g
YWNjZXNzCj4+ICAgICAgPHZhbD4gICAgICBUaGUgdmFsdWUgdG8gd3JpdGUgKGltcGxpZXMgLXcp
Cj4KPiAgLi4uIGJ1dCB3aXRoIGFkZGl0aW9uYWwgZmVhdHVyZXMuCgoKPgo+PiAKPj4gRXhhbXBs
ZXM6Cj4+ICAgICAgaW8gMHgxMDAwICAgICAgICAgICAgICAgICAgUmVhZHMgb25lIGJ5dGUgZnJv
bSAweDEwMDAKPj4gICAgICBpbyAweDEwMDAgMHgxMiAgICAgICAgICAgICBXcml0ZXMgMHgxMiB0
byBsb2NhdGlvbiAweDEwMDAKPj4gICAgICBpbyAtMiAtbCA4IDB4MTAwMCAgICAgICAgICBSZWFk
cyA4IHdvcmRzIGZyb20gMHgxMDAwCj4+ICAgICAgaW8gLXIgLWYgZG1wIC1sIDEwMCAyMDAgICAg
UmVhZHMgMTAwIGJ5dGVzIGZyb20gYWRkciAyMDAgdG8gZmlsZQo+PiAgICAgIGlvIC13IC1mIGlt
ZyAweDEwMDAwICAgICAgIFdyaXRlcyB0aGUgd2hvbGUgb2YgZmlsZSB0byBtZW1vcnkKPj4gCj4+
IE5vdGUgYWNjZXNzIHNpemUgKC0xfDJ8NCkgZG9lcyBub3QgYXBwbHkgdG8gZmlsZSBiYXNlZCBh
Y2Nlc3Nlcy4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHkgWWFuIDxhbmR5c2hya0AxNjMuY29t
Pgo+PiAtLS0KPj4gICBwYWNrYWdlL0NvbmZpZy5pbiAgICB8ICAxICsKPj4gICBwYWNrYWdlL2lv
L0NvbmZpZy5pbiB8ICA2ICsrKysrKwo+PiAgIHBhY2thZ2UvaW8vaW8ubWsgICAgIHwgMjAgKysr
KysrKysrKysrKysrKysrKysKPgo+Cj4gIFBsZWFzZSBhZGQgeW91cnNlbGYgdG8gdGhlIERFVkVM
T1BFUlMgZmlsZSBbMV0gZm9yIHRoaXMgcGFja2FnZS4gVGhpcyB3YXksIAo+eW91J2xsIGdldCBh
biBlLW1haWwgaWYgdGhlIHBhY2thZ2UgZmFpbHMgaW4gdGhlIGF1dG9idWlsZGVycywgb3Igd2hl
biBhIG5ldyAKPnZlcnNpb24gaXMgcmVsZWFzZWQgaWYgdGhlIHBhY2thZ2UgaXMgcmVnaXN0ZXJl
ZCBvbiByZWxlYXNlLW1vbml0b3Jpbmcub3JnLgo+Cj4gIFlvdSBhcmUgYWxzbyBtaXNzaW5nIGEg
aGFzaCBmaWxlIHdpdGggdGhlIGhhc2ggb2YgdGhlIGRvd25sb2FkZWQgdGFyYmFsbCBhbmQgCj5v
ZiB0aGUgbGljZW5zZSBmaWxlLgoKV2lsbCBhZGQgaW4gVjIKCj4KPj4gICAzIGZpbGVzIGNoYW5n
ZWQsIDI3IGluc2VydGlvbnMoKykKPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9pby9D
b25maWcuaW4KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9pby9pby5tawo+PiAKPj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KPj4gaW5k
ZXggNGVjY2Y3N2RkMy4uOTk4NTZmZjIzYiAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9Db25maWcu
aW4KPj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPj4gQEAgLTIzNjEsNiArMjM2MSw3IEBAIG1l
bnUgIk1pc2NlbGxhbmVvdXMiCj4+ICAgCXNvdXJjZSAicGFja2FnZS9nci1vc21vc2RyL0NvbmZp
Zy5pbiIKPj4gICAJc291cmNlICJwYWNrYWdlL2dzZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXMvQ29u
ZmlnLmluIgo+PiAgIAlzb3VyY2UgInBhY2thZ2UvaGF2ZWdlZC9Db25maWcuaW4iCj4+ICsJc291
cmNlICJwYWNrYWdlL2lvL0NvbmZpZy5pbiIKPj4gICAJc291cmNlICJwYWNrYWdlL2xpbnV4LXN5
c2NhbGwtc3VwcG9ydC9Db25maWcuaW4iCj4+ICAgCXNvdXJjZSAicGFja2FnZS9tb2JpbGUtYnJv
YWRiYW5kLXByb3ZpZGVyLWluZm8vQ29uZmlnLmluIgo+PiAgIAlzb3VyY2UgInBhY2thZ2UvbmV0
ZGF0YS9Db25maWcuaW4iCj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2lvL0NvbmZpZy5pbiBiL3Bh
Y2thZ2UvaW8vQ29uZmlnLmluCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAw
MDAwMDAuLmJhMmNjMmZjNGYKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9wYWNrYWdlL2lvL0Nv
bmZpZy5pbgo+PiBAQCAtMCwwICsxLDYgQEAKPj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9JTwo+PiAr
CWJvb2wgIlJhdyBtZW1vcnkgaS9vIHV0aWxpdHkiCj4+ICsJaGVscAo+PiArCSAgQSB1dGlsaXR5
IGZvciByZWFkL3dyaXRlIG1lbW9yeS9yZWdpc3Rlcgo+PiArCj4+ICsJICBodHRwczovL2dpdGh1
Yi5jb20vYW5keXNocmsvaW8uZ2l0Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2lvL2lvLm1rIGIv
cGFja2FnZS9pby9pby5tawo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAw
MDAwLi43NDU0ZjI1YjIyCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvcGFja2FnZS9pby9pby5t
awo+PiBAQCAtMCwwICsxLDIwIEBACj4+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+PiArIwo+
PiArIyBpbwo+PiArIwo+PiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPj4gKwo+PiArSU9fVkVS
U0lPTiA9IG1hc3Rlcgo+Cj4gIFdlIGRvbid0IHdhbnQgYSBicmFuY2gsIHdlIG9ubHkgd2FudCBh
IHRhZyBvciBjb21taXQgaGFzaC4KPgo+PiArSU9fU0lURSA9ICQoY2FsbCBnaXRodWIsYW5keXNo
cmssaW8sJChJT19WRVJTSU9OKSkKPgo+ICBZb3UgY291bGRuJ3Qga25vdyBvZiBjb3Vyc2UsIGJ1
dCB3ZSdyZSBtb3ZpbmcgYXdheSBmcm9tIHVzaW5nIHRoZSB0YXJiYWxscyBmb3IgCj5naXRodWIg
ZG93bmxvYWRzLCBhbmQgaW5zdGVhZCBwcmVmZXIgdGhlIGdpdCBkb3dubG9hZCBtZXRob2QuIFNv
IGNvdWxkIHlvdSAKPmNoYW5nZSB0aGlzIHRvIHNvbWV0aGluZyBsaWtlOgo+Cj5JT19TSVRFID0g
aHR0cHM6Ly9naXRodWIuY29tL2FuZHlzaHJrL2lvLmdpdAo+SU9fU0lURV9NRVRIT0QgPSBnaXQK
Pgo+Cj4+ICtJT19MSUNFTlNFID0gR1BMLTIuMCsKPj4gK0lPX0xJQ0VOU0VfRklMRVMgPSBDT1BZ
SU5HLkdQTAo+PiArCj4KPiAgSSBndWVzcyB0aGlzIHJlbGllcyBvbiBDT05GSUdfREVWTUVNIHRv
IGJlIHNldCBpbiB0aGUga2VybmVsLiBUaGlzIHNob3VsZCBiZSAKPm1lbnRpb25lZCBpbiB0aGUg
Q29uZmlnLmluIGhlbHAgdGV4dCwgYW5kIGlkZWFsbHkgc29tZXRoaW5nIGxpa2UgdGhpczoKCkkg
d2lsbCBtZW50aW9uIGl0IGluIENvbmZpZy5pbiwgYXMgc29tZXRpbWVzIHdlIG1heSBidWlsZCBh
IHJvb3RmcyB3aXRob3V0IGxpbnV4IGtlcm5lbCwKaSBhbSBub3Qgc3VyZSB3ZSBzaG91ZCBhZGQg
dGhpcyBMSU5VWF9DT05GSUdfRklYVVBTIG9yIG5vdC4KClRoYW5rcyBmb3IgeW91ciByZXZpZXcu
Cj4KPmRlZmluZSBJT19MSU5VWF9DT05GSUdfRklYVVBTCj4JJChjYWxsIEtDT05GSUdfRU5BQkxF
X09QVCxDT05GSUdfREVWTUVNKQo+ZW5kZWYKPgo+PiArZGVmaW5lIElPX0JVSUxEX0NNRFMKPj4g
KwkkKFRBUkdFVF9DQykgJChUQVJHRVRfQ0ZMQUdTKSAkKFRBUkdFVF9MREZMQUdTKSAkKEBEKS9p
by5jIC1vICQoQEQpL2lvCj4+ICtlbmRlZgo+PiArCj4+ICtkZWZpbmUgSU9fSU5TVEFMTF9UQVJH
RVRfQ01EUwo+PiArCSQoSU5TVEFMTCkgLW0gMDc1NSAtRCAkKEBEKS9pbyAkKFRBUkdFVF9ESVIp
L3Vzci9iaW4vaW8KPj4gK2VuZGVmCj4+ICsKPj4gKyQoZXZhbCAkKGdlbmVyaWMtcGFja2FnZSkp
Cj4KPgo+ICBSZWdhcmRzLAo+ICBBcm5vdXQKPgo+WzFdIGh0dHBzOi8vbmlnaHRseS5idWlsZHJv
b3Qub3JnLyNERVZFTE9QRVJTCj4KPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj5idWlsZHJvb3QgbWFpbGluZyBsaXN0Cj5idWlsZHJvb3RAYnVpbGRyb290
Lm9yZwo+aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
