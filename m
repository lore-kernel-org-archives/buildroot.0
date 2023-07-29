Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C43C001DC
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 20:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBF6C40916;
	Sat, 29 Jul 2023 20:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBF6C40916
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5h1Yi250_r5Z; Sat, 29 Jul 2023 20:40:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD35140931;
	Sat, 29 Jul 2023 20:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD35140931
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 05C6F1BF576
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 20:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFA5340BF5
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 20:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFA5340BF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AYz-jumsE4Rx for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 20:40:51 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F12AA404B9
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 20:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F12AA404B9
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC3EA40003;
 Sat, 29 Jul 2023 20:40:47 +0000 (UTC)
Date: Sat, 29 Jul 2023 22:40:46 +0200
To: Petr Vorel <pevik@seznam.cz>
Message-ID: <20230729224046.11915c19@windsurf>
In-Reply-To: <20230521135013.528157-1-pevik@seznam.cz>
References: <20230521135013.528157-1-pevik@seznam.cz>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690663248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RPlZw2fgoTBTMu4gS010k8O9/FLvv3cTZ/z3a043kQU=;
 b=YGUSGodCoyWXMbhIx8Cf55egwfxuvJAfOvoEHEadKCZ5f2qDraEzzU36wtfvX0UeoIsHjw
 auH66b7ALDEruWawde3Da5t69FR709Ip76mB6V6aGbGFTmBjBexVX/ribu6Ig1SiE1DJoG
 rXMoWG/mvLKYLOQMYLQyYlTxBGUhRidXWjD2q6YuK9nXx8T9OUtWLRihytGWjkenUSLegF
 Ec2wv1cAbbyC4KJOXJ1w88vC6kmCXX++h2jdZMQ3QQe5mT9+Cg5uiNc/B0zvoKbK9HQWp2
 uBWfGnvzp/BhoKmSjT00nNZG+BTFay0zw8RrCBbvAi+1CD+SEVpKqhf2nuub+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YGUSGodC
Subject: Re: [Buildroot] [PATCH] package/ltp-testsuite: bump version to
 20230516
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAyMSBNYXkgMjAyMyAxNTo1MDoxMyArMDIwMApQZXRyIFZvcmVsIDxwZXZpa0BzZXpu
YW0uY3o+IHdyb3RlOgoKPiBGcm9tOiBQZXRyIFZvcmVsIDxwZXRyLnZvcmVsQGdtYWlsLmNvbT4K
PiAKPiBSZW1vdmUgcGF0Y2ggYWNjZXB0ZWQgaW4gdGhpcyByZWxlYXNlLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFBldHIgVm9yZWwgPHBldHIudm9yZWxAZ21haWwuY29tPgoKSSB0aGluayB3ZSBjYW4n
dCBhcHBseSB1bnRpbCB0aGUgYWJvdmUgaXMgcmVzb2x2ZWQsIGFzIGl0IHdpbGwgYWZmZWN0IGEK
c2lnbmlmaWNhbnQgbnVtYmVyIG9mIGJ1aWxkcy4gU2VlIGJlbG93IGZvciBzb21lIGhpbnRzIG9u
IHdoYXQgSQpiZWxpZXZlIGlzIGdvaW5nIG9uLgoKPiBGWUkgYm9vdGxpbi14ODYtNjQtZ2xpYmMg
ZmFpbHMgb24gbmV3IEtWTSB0ZXN0cy4gSSBzdXNwZWN0IGl0J3MgYSBnbGliYwo+IGJ1ZywgYmVj
YXVzZSBpdCB3b3JrcyB3ZWxsIG9uIGFsbCBjbGFzc2ljIGRpc3RybyBuYXRpdmUgZ2NjL2NsYW5n
Cj4gdG9vbGNoYWlucyAoQ2VudE9TIDcsIHZhcmlvdXMgRGViaWFuIGFuZCBVYnVudHUsIG9wZW5T
VVNFLCAuLi4pOgo+IAo+IENDIHRlc3RjYXNlcy9rZXJuZWwva3ZtL2xpYl94ODYubwo+IGt2bV9z
dm0wMS5jOiBJbiBmdW5jdGlvbiDigJhndWVzdF9tYWlu4oCZOgo+IGt2bV9zdm0wMS5jOjQyOjEz
OiB3YXJuaW5nOiBhcnJheSBzdWJzY3JpcHQgMCBpcyBvdXRzaWRlIGFycmF5IGJvdW5kcyBvZiDi
gJh1aW50MzJfdFswXeKAmSB7YWthIOKAmHVuc2lnbmVkIGludFtd4oCZfSBbLVdhcnJheS1ib3Vu
ZHNdCj4gICAgNDIgfCAgICAgICAgIGlmICgqYXZpY19wdHIgIT0gMHhhYWFhYWFhYSkKPiAgICAg
ICB8ICAgICAgICAgICAgIF5+fn5+fn5+fgo+IGt2bV9zdm0wMS5jOjQ1Ojk6IHdhcm5pbmc6IGFy
cmF5IHN1YnNjcmlwdCAwIGlzIG91dHNpZGUgYXJyYXkgYm91bmRzIG9mIOKAmHVpbnQzMl90WzBd
4oCZIHtha2Eg4oCYdW5zaWduZWQgaW50W13igJl9IFstV2FycmF5LWJvdW5kc10KPiAgICA0NSB8
ICAgICAgICAgKmF2aWNfcHRyID0gQVZJQ19URVNUX1ZBTDsKPiAgICAgICB8ICAgICAgICAgXn5+
fn5+fn5+Cj4ga3ZtX3N2bTAxLmM6IEluIGZ1bmN0aW9uIOKAmG1haW7igJk6Cj4ga3ZtX3N2bTAx
LmM6OTM6MTM6IHdhcm5pbmc6IGFycmF5IHN1YnNjcmlwdCAwIGlzIG91dHNpZGUgYXJyYXkgYm91
bmRzIG9mIOKAmHVpbnQzMl90WzBd4oCZIHtha2Eg4oCYdW5zaWduZWQgaW50W13igJl9IFstV2Fy
cmF5LWJvdW5kc10KPiAgICA5MyB8ICAgICAgICAgaWYgKCphdmljX3B0ciAhPSBBVklDX1RFU1Rf
VkFMKSB7Cj4gICAgICAgfCAgICAgICAgICAgICBefn5+fn5+fn4KPiBici10ZXN0LXBrZy9ib290
bGluLXg4Ni02NC1nbGliYy9ob3N0L29wdC9leHQtdG9vbGNoYWluL2Jpbi8uLi9saWIvZ2NjL3g4
Nl82NC1idWlsZHJvb3QtbGludXgtZ251LzEyLjIuMC8uLi8uLi8uLi8uLi94ODZfNjQtYnVpbGRy
b290LWxpbnV4LWdudS9iaW4vbGQ6IGxpYl94ODYubzogaW4gZnVuY3Rpb24gYGt2bV9pbml0X2d1
ZXN0X3ZtY2InOgo+IGxpYl94ODYuYzooLnRleHQrMHg3YzMpOiB1bmRlZmluZWQgcmVmZXJlbmNl
IHRvIGBfX3N0YWNrX2Noa19mYWlsJwo+IGNvbGxlY3QyOiBlcnJvcjogbGQgcmV0dXJuZWQgMSBl
eGl0IHN0YXR1cwo+IG1ha2VbNF06ICoqKiBbYnItdGVzdC1wa2cvYm9vdGxpbi14ODYtNjQtZ2xp
YmMvYnVpbGQvbHRwLXRlc3RzdWl0ZS0yMDIzMDUxNi90ZXN0Y2FzZXMva2VybmVsL2t2bS9NYWtl
ZmlsZTo1OToga3ZtX3N2bTAxLXBheWxvYWQub10gRXJyb3IgMQo+IG1ha2VbNF06ICoqKiBXYWl0
aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCj4gYnItdGVzdC1wa2cvYm9vdGxpbi14ODYtNjQt
Z2xpYmMvaG9zdC9vcHQvZXh0LXRvb2xjaGFpbi9iaW4vLi4vbGliL2djYy94ODZfNjQtYnVpbGRy
b290LWxpbnV4LWdudS8xMi4yLjAvLi4vLi4vLi4vLi4veDg2XzY0LWJ1aWxkcm9vdC1saW51eC1n
bnUvYmluL2xkOiBsaWJfeDg2Lm86IGluIGZ1bmN0aW9uIGBrdm1faW5pdF9ndWVzdF92bWNiJzoK
PiBsaWJfeDg2LmM6KC50ZXh0KzB4N2MzKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19zdGFj
a19jaGtfZmFpbCcKPiBjb2xsZWN0MjogZXJyb3I6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXMK
PiBtYWtlWzRdOiAqKiogW2JyLXRlc3QtcGtnL2Jvb3RsaW4teDg2LTY0LWdsaWJjL2J1aWxkL2x0
cC10ZXN0c3VpdGUtMjAyMzA1MTYvdGVzdGNhc2VzL2tlcm5lbC9rdm0vTWFrZWZpbGU6NTk6IGt2
bV9wYWdlZmF1bHQwMS1wYXlsb2FkLm9dIEVycm9yIDEKPiBDQyB0ZXN0Y2FzZXMva2VybmVsL2t2
bS9saWJfaG9zdC5vCj4gbWFrZVszXTogKioqIFsuLi8uLi9pbmNsdWRlL21rL2dlbmVyaWNfdHJ1
bmtfdGFyZ2V0LmluYzoxMDg6IGFsbF0gRXJyb3IgMgo+IG1ha2VbMl06ICoqKiBbLi4vaW5jbHVk
ZS9tay9nZW5lcmljX3RydW5rX3RhcmdldC5pbmM6MTA4OiBhbGxdIEVycm9yIDIKPiAKPiBJdCdk
IGFsc28gZmFpbCBvbiBib290bGluLXg4Ni02NC1tdXNsLCBidXQgaXQncyBiZWluZyBza2lwcGVk
IGR1ZQo+IDVlMWMyMzhiNzIuCj4gCj4gQW55IGhpbnQgaG93IHRvIHdvcmthcm91bmQgdGhpcyBp
cyBhcHByZWNpYXRlZC4KCkkgZG9uJ3QgdGhpbmsgaXQncyBhIGdsaWJjIGJ1Zy4gVGhlIGNvZGUg
YmVpbmcgYnVpbHQgaW4KdGVzdGNhc2VzL2tlcm5lbC9rdm0vIGlzIHNvbWUgYmFyZS1tZXRhbCBj
b2RlLiBUaGUgcHJvYmxlbSBpcyB0aGF0IGl0CmlzIGJlaW5nIGJ1aWx0IHdpdGggU3RhY2sgU21h
c2hpbmcgUHJvdGVjdGlvbiAoLWZzdGFjay1wcm90ZWN0b3IpLAp3aGljaCByZXF1aXJlcyBydW50
aW1lIHN1cHBvcnQgZnJvbSB0aGUgZ2NjIHJ1bnRpbWUuLi4gYnV0IHRoYXQgZG9lc24ndApleGlz
dCBmb3IgYmFyZS1tZXRhbCBjb2RlLgoKV2hhdCdzIHN0cmFuZ2UgaXMgdGhhdCB0ZXN0Y2FzZXMv
a2VybmVsL2t2bS9NYWtlZmlsZSBwcm9wZXJseSBhY2NvdW50cwpmb3IgdGhhdCBhbmQgcGFzc2Vz
IC1mbm8tc3RhY2stcHJvdGVjdG9yOgoKR1VFU1RfQ0ZMQUdTID0gLWZmcmVlc3RhbmRpbmcgLU8y
IC1XYWxsIC1mbm8tYXN5bmNocm9ub3VzLXVud2luZC10YWJsZXMgLW1uby1tbXggLW1uby1zc2UK
R1VFU1RfTERGTEFHUyA9IC1ub3N0ZGxpYiAtV2wsLS1idWlsZC1pZD1ub25lIC1mbm8tc3RhY2st
cHJvdGVjdG9yIC16IG5vZXhlY3N0YWNrCgphbmQgdGhlbiB0aGVzZSBmbGFncyBhcmUgdXNlZCBh
cyB0aGUgQ0ZMQUdTL0NQUEZMQUdTCgpsaWJfZ3Vlc3QubyAkKEFSQ0hfT0JKKTogQ1BQRkxBR1Mg
ICAgICAgOj0gJChHVUVTVF9DUFBGTEFHUykKbGliX2d1ZXN0Lm8gJChBUkNIX09CSik6IENGTEFH
UyAgICAgICAgIDo9ICQoR1VFU1RfQ0ZMQUdTKQoKQWxzbywgdGhlIGNvbXBpbGVyIHdyYXBwZXIg
aXMgcGFzc2luZyAtZnN0YWNrLXByb3RlY3RvciBpZiB5b3UgaGF2ZSBvbmUKb2YgdGhlIEJSMl9T
U1BfKiBvcHRpb25zIGVuYWJsZWQuCgpTbyBpbiBvcmRlciB0byB1bmRlcnN0YW5kIHdoYXQncyBn
b2luZyBvbiwgY291bGQgeW91OgoKKDEpIFJ1biB0aGUgYnVpbGQgb2YgbHRwLXRlc3RzdWl0ZSBp
biB2ZXJib3NlIG1vZGUsIHNvIHRoYXQgd2UgZ2V0IHRoZQogICAgYWN0dWFsIGNvbXBpbGVyL2xp
bmtlciBjb21tYW5kIGxpbmUsIHdpdGggYWxsIGZsYWdzLgoKKDIpIFJ1biB0aGUgYnVpbGQgd2l0
aCBCUjJfREVCVUdfV1JBUFBFUj0yIHRvIGdldCB0aGUgZGV0YWlscyBvZiB3aGF0CiAgICB0aGUg
d3JhcHBlciBpcyBkb2luZyA/CgpBbHNvLCB3aGljaCB2YWx1ZSBhcmUgeW91IHVzaW5nIGZvciB0
aGUgQlIyX1NTUF8qIEJ1aWxkcm9vdCBvcHRpb25zPwoKVGhhbmtzIQoKVGhvbWFzCi0tIApUaG9t
YXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFu
ZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
