Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31902C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E824B41722;
	Wed, 16 Mar 2022 21:39:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ml1Bc73pe1lS; Wed, 16 Mar 2022 21:39:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FDBF409A0;
	Wed, 16 Mar 2022 21:39:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 80D761BF2C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F71B84329
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D7ye14E16pTo for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:36:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21C4284336
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:36:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6da3:2756:3f87:4127])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CCFA413F854;
 Wed, 16 Mar 2022 22:36:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647466591;
 bh=saUhX7KZba9AYPqrBaaEf58hHFUjUmT5mEMEoFK+9Ko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=regxRjByzB7tOAWyfPWgFDqh+7VeevYBqCpyh3jXBbbugQZnqR30M68LCX5/bDHAe
 PzgECqKdNIpI/hSKT/6DaH3cisifD1Cl7XlhhFDoxOYOQ/tdG0rjefWZwdtjCbqAB8
 ywgb8XqdVGGxSn7rajOxY3EZECPiaZJey7V72QtIalP2Vd4/sgenPaj0gBQTBV42uZ
 vKO6uVMNFUGBKGwFInU8Zbr2wsC86fhgUyRNa7a3RSHh9YMayUG62sEmgKkaiuQ11g
 7vLe9pS28zaJNZWr8NIurDj2RMISeSp+GN883RzkOoqCuaefOg2+hlzEQFV/rla2ck
 N/HNOj1L7ouyA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 16 Mar 2022 22:36:26 +0100
Date: Wed, 16 Mar 2022 22:36:26 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>, Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220316213626.GZ283544@scaer>
References: <20220315205405.9291-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220315205405.9291-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1] package/libopenssl: bump version to
 1.1.1n
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UGV0ZXIsIEFsbCwKCitQZXRlciBLLjogY2FuZGlkYXRlIHRvIGJlIGJhY2twb3J0ZWQsIHRoYXQn
cyBhIHNlY3VyaXR5IGZpeC4KCk9uIDIwMjItMDMtMTUgMjE6NTQgKzAxMDAsIFBldGVyIFNlaWRl
cmVyIHNwYWtlIHRodXNseToKPiBDaGFuZ2VzIGJldHdlZW4gMS4xLjFtIGFuZCAxLjEuMW4gWzE1
IE1hciAyMDIyXQo+IAo+ICAgKikgRml4ZWQgYSBidWcgaW4gdGhlIEJOX21vZF9zcXJ0KCkgZnVu
Y3Rpb24gdGhhdCBjYW4gY2F1c2UgaXQgdG8gbG9vcCBmb3JldmVyCj4gICAgICBmb3Igbm9uLXBy
aW1lIG1vZHVsaS4KPiAKPiAgICAgIEludGVybmFsbHkgdGhpcyBmdW5jdGlvbiBpcyB1c2VkIHdo
ZW4gcGFyc2luZyBjZXJ0aWZpY2F0ZXMgdGhhdCBjb250YWluCj4gICAgICBlbGxpcHRpYyBjdXJ2
ZSBwdWJsaWMga2V5cyBpbiBjb21wcmVzc2VkIGZvcm0gb3IgZXhwbGljaXQgZWxsaXB0aWMgY3Vy
dmUKPiAgICAgIHBhcmFtZXRlcnMgd2l0aCBhIGJhc2UgcG9pbnQgZW5jb2RlZCBpbiBjb21wcmVz
c2VkIGZvcm0uCj4gCj4gICAgICBJdCBpcyBwb3NzaWJsZSB0byB0cmlnZ2VyIHRoZSBpbmZpbml0
ZSBsb29wIGJ5IGNyYWZ0aW5nIGEgY2VydGlmaWNhdGUgdGhhdAo+ICAgICAgaGFzIGludmFsaWQg
ZXhwbGljaXQgY3VydmUgcGFyYW1ldGVycy4KPiAKPiAgICAgIFNpbmNlIGNlcnRpZmljYXRlIHBh
cnNpbmcgaGFwcGVucyBwcmlvciB0byB2ZXJpZmljYXRpb24gb2YgdGhlIGNlcnRpZmljYXRlCj4g
ICAgICBzaWduYXR1cmUsIGFueSBwcm9jZXNzIHRoYXQgcGFyc2VzIGFuIGV4dGVybmFsbHkgc3Vw
cGxpZWQgY2VydGlmaWNhdGUgbWF5Cj4gICAgICB0aHVzIGJlIHN1YmplY3QgdG8gYSBkZW5pYWwg
b2Ygc2VydmljZSBhdHRhY2suIFRoZSBpbmZpbml0ZSBsb29wIGNhbiBhbHNvCj4gICAgICBiZSBy
ZWFjaGVkIHdoZW4gcGFyc2luZyBjcmFmdGVkIHByaXZhdGUga2V5cyBhcyB0aGV5IGNhbiBjb250
YWluIGV4cGxpY2l0Cj4gICAgICBlbGxpcHRpYyBjdXJ2ZSBwYXJhbWV0ZXJzLgo+IAo+ICAgICAg
VGh1cyB2dWxuZXJhYmxlIHNpdHVhdGlvbnMgaW5jbHVkZToKPiAKPiAgICAgICAtIFRMUyBjbGll
bnRzIGNvbnN1bWluZyBzZXJ2ZXIgY2VydGlmaWNhdGVzCj4gICAgICAgLSBUTFMgc2VydmVycyBj
b25zdW1pbmcgY2xpZW50IGNlcnRpZmljYXRlcwo+ICAgICAgIC0gSG9zdGluZyBwcm92aWRlcnMg
dGFraW5nIGNlcnRpZmljYXRlcyBvciBwcml2YXRlIGtleXMgZnJvbSBjdXN0b21lcnMKPiAgICAg
ICAtIENlcnRpZmljYXRlIGF1dGhvcml0aWVzIHBhcnNpbmcgY2VydGlmaWNhdGlvbiByZXF1ZXN0
cyBmcm9tIHN1YnNjcmliZXJzCj4gICAgICAgLSBBbnl0aGluZyBlbHNlIHdoaWNoIHBhcnNlcyBB
U04uMSBlbGxpcHRpYyBjdXJ2ZSBwYXJhbWV0ZXJzCj4gCj4gICAgICBBbHNvIGFueSBvdGhlciBh
cHBsaWNhdGlvbnMgdGhhdCB1c2UgdGhlIEJOX21vZF9zcXJ0KCkgd2hlcmUgdGhlIGF0dGFja2Vy
Cj4gICAgICBjYW4gY29udHJvbCB0aGUgcGFyYW1ldGVyIHZhbHVlcyBhcmUgdnVsbmVyYWJsZSB0
byB0aGlzIERvUyBpc3N1ZS4KPiAgICAgIChDVkUtMjAyMi0wNzc4KQo+ICAgICAgW1RvbcOhxaEg
TXLDoXpdCj4gCj4gICAqKSBBZGQgY2lwaGVyc3VpdGVzIGJhc2VkIG9uIERIRV9QU0sgKFJGQyA0
Mjc5KSBhbmQgRUNESEVfUFNLIChSRkMgNTQ4OSkKPiAgICAgIHRvIHRoZSBsaXN0IG9mIGNpcGhl
cnN1aXRlcyBwcm92aWRpbmcgUGVyZmVjdCBGb3J3YXJkIFNlY3JlY3kgYXMKPiAgICAgIHJlcXVp
cmVkIGJ5IFNFQ0xFVkVMID49IDMuCj4gCj4gICAgICBbRG1pdHJ5IEJlbHlhdnNraXksIE5pY29s
YSBUdXZlcmldCj4gCj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBn
bXgubmV0PgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCgoKUmVnYXJkcywKWWFubiBFLiBN
T1JJTi4KCj4gLS0tCj4gIHBhY2thZ2UvbGlib3BlbnNzbC9saWJvcGVuc3NsLmhhc2ggfCA0ICsr
LS0KPiAgcGFja2FnZS9saWJvcGVuc3NsL2xpYm9wZW5zc2wubWsgICB8IDIgKy0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbGlib3BlbnNzbC9saWJvcGVuc3NsLmhhc2ggYi9wYWNrYWdlL2xpYm9wZW5z
c2wvbGlib3BlbnNzbC5oYXNoCj4gaW5kZXggYTA1NWNiYzI3MC4uMjJiYjM2NWJjYyAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL2xpYm9wZW5zc2wvbGlib3BlbnNzbC5oYXNoCj4gKysrIGIvcGFja2Fn
ZS9saWJvcGVuc3NsL2xpYm9wZW5zc2wuaGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+IC0jIEZyb20g
aHR0cHM6Ly93d3cub3BlbnNzbC5vcmcvc291cmNlL29wZW5zc2wtMS4xLjFtLnRhci5nei5zaGEy
NTYKPiAtc2hhMjU2ICBmODkxOTliZThiMjNjYTQ1ZmM3Y2I5ZjFkOGQzZWU2NzMxMjMxODI4NmFk
MDMwZjUzMTZhY2E2NDYyZGI2Yzk2ICBvcGVuc3NsLTEuMS4xbS50YXIuZ3oKPiArIyBGcm9tIGh0
dHBzOi8vd3d3Lm9wZW5zc2wub3JnL3NvdXJjZS9vcGVuc3NsLTEuMS4xbi50YXIuZ3ouc2hhMjU2
Cj4gK3NoYTI1NiAgNDBkY2ViNTFhNGY2YTUyNzViZGUwZTZiZjIwZWY0YjkxYmZjMzJlZDU3YzA1
NTJlMmU4ZTE1NDYzMzcyYjE3YSAgb3BlbnNzbC0xLjEuMW4udGFyLmd6Cj4gIAo+ICAjIExpY2Vu
c2UgZmlsZXMKPiAgc2hhMjU2ICBjMzI5MTNiMzMyNTJlNzExOTBhZjIwNjZmMDgxMTVjNjliYzlm
ZGRhZGYzYmYyOTI5NmUyMGM4MzUzODk4NDFjICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbGlib3BlbnNzbC9saWJvcGVuc3NsLm1rIGIvcGFja2FnZS9saWJvcGVuc3NsL2xpYm9wZW5z
c2wubWsKPiBpbmRleCBiZDhlZjYxNDFhLi5hZTY2NThlZDQwIDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2UvbGlib3BlbnNzbC9saWJvcGVuc3NsLm1rCj4gKysrIGIvcGFja2FnZS9saWJvcGVuc3NsL2xp
Ym9wZW5zc2wubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwo+ICAKPiAtTElCT1BFTlNTTF9WRVJTSU9OID0gMS4xLjFtCj4gK0xJQk9QRU5TU0xfVkVS
U0lPTiA9IDEuMS4xbgo+ICBMSUJPUEVOU1NMX1NJVEUgPSBodHRwczovL3d3dy5vcGVuc3NsLm9y
Zy9zb3VyY2UKPiAgTElCT1BFTlNTTF9TT1VSQ0UgPSBvcGVuc3NsLSQoTElCT1BFTlNTTF9WRVJT
SU9OKS50YXIuZ3oKPiAgTElCT1BFTlNTTF9MSUNFTlNFID0gT3BlblNTTCBvciBTU0xlYXkKPiAt
LSAKPiAyLjM1LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1U
aW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cnwg
KzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8
ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0t
LS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3lt
b3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNv
bnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0t
LS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
