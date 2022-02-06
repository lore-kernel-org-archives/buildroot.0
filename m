Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22A6C433FE
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 19:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E1AA401D6;
	Sun,  6 Feb 2022 19:51:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QZWuWL-lYhf4; Sun,  6 Feb 2022 19:51:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0682740186;
	Sun,  6 Feb 2022 19:51:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF27C1BF384
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 19:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DE08402AF
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 19:51:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X6d-Yooz03RE for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 19:51:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp4.osuosl.org (Postfix) with ESMTP id 494A5402AC
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 19:51:20 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GnZ7nct8gks1JGnZ8nWAnR; Sun, 06 Feb 2022 20:51:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644177079; bh=iFMgZqXok1wVzUPI2gmHNxbsf38PFynbLmna4Ut5Pb4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=XDqHIAc6bPBzArAyYh1VNlXW6bVvXJkbUwD3N6aJ1l0jwt8/4HB+xsm6Sab8vX1uU
 YqZk6vXK/QBoJGsfiQq4TduN1UFugFKM05cQ8RjWoehNYYVUabCtDNhWMJ6bxibJP7
 BJcEk8rJph6RK1YrtE3ntVbjHF5KF+uetl2HTWG8cPOtXLGCjqPtgaBxz0b5dROK2T
 Qe9UO/wy2ehwnuIhdUCsAOrHdiCThe2BEgV3wkVwFnX4xBW4lWLkqyKYPAC4T5G4IA
 kcknNWZeqWyA4IftLF/kdFVfmJxHsghuH8Fi12bUdhmP1dAAed0EHZyx/nEWhs5crq
 ld10CbFLuMFCg==
Message-ID: <888aa13f-277c-f4a0-2447-79d58145816d@benettiengineering.com>
Date: Sun, 6 Feb 2022 20:51:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Eugen.Hristev@microchip.com, thomas.petazzoni@bootlin.com
References: <20220206115156.6042cc1b@windsurf>
 <20220206112620.1637342-1-giulio.benetti@benettiengineering.com>
 <20220206112620.1637342-2-giulio.benetti@benettiengineering.com>
 <20220206131656.16e2c8a6@windsurf>
 <febd6a86-7b73-7263-ce66-2056fa102342@benettiengineering.com>
 <0f8fcb54-806c-fb0b-27ea-38eb938a725f@microchip.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <0f8fcb54-806c-fb0b-27ea-38eb938a725f@microchip.com>
X-CMAE-Envelope: MS4wfCSvnCohKaPnarolHoCZKKiJ6IyIKu903I4+D67h7fEFi6JiGnQsfJGf+0wYwzqqrnAVK2flC2OsDe6aSq7ilQ4fw6V7wPpdtNyRzh+ktdNdtc4uuX0B
 rSN9X23dZ40vHCIrNP26ENsenxRh3p24XFe9Dh37vHixc8oxIMjjNCYVBT26t7rNmbv8umrI8aZGUZgvjzxTsOMKKQ7AsO4VJ0lW3irVL4BpmaP6uoL8Gzpe
 KJs8vMib2LVEEmTvbOFxrs7r+nS/N3Dx9xCO2uky3smm2esvHOKfLSbSgkfA+QPVL3Z/CIzmZyBEcLTFSE52xFQc2Neda4B6KXVjSRy6Ueg=
Subject: Re: [Buildroot] [PATCH v3 1/2]
 configs/microchip_sama7g5ek_mmc_defconfig: set custom linux version to
 5.15.21 and add host openssl for linux
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
Cc: Ludovic.Desroches@microchip.com, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRXVnZW4sIFRob21hcywgTHVkb3ZpYywKCk9uIDA2LzAyLzIyIDIwOjM5LCBFdWdlbi5Icmlz
dGV2QG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4gT24gMi82LzIyIDQ6MjUgUE0sIEdpdWxpbyBCZW5l
dHRpIHdyb3RlOgo+PiBIaSBUaG9tYXMsCj4+Cj4+IE9uIDA2LzAyLzIyIDEzOjE2LCBUaG9tYXMg
UGV0YXp6b25pIHdyb3RlOgo+Pj4gT24gU3VuLMKgIDYgRmViIDIwMjIgMTI6MjY6MTkgKzAxMDAK
Pj4+IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29t
PiB3cm90ZToKPj4+Cj4+Pj4gRml4ZXM6Cj4+Pj4gaHR0cHM6Ly9naXRsYWIuY29tL3ltb3Jpbi9i
dWlsZHJvb3QvLS9qb2JzLzIwMzU4MjEwOTgKPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEdpdWxp
byBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+Pj4KPj4+
IERpZCB5b3UgYWN0dWFsbHkgdGVzdCBvbiBIVyB0aGF0IDUuMTUuMjEgd2FzIHdvcmtpbmc/Cj4+
Cj4+IFVuZm9ydHVuYXRlbHkgSSBkb24ndCBoYXZlIGJvYXJkLCBzbyBuby4KPj4KPj4+IFNob3Vs
ZG4ndCB0aGlzIGJlCj4+PiBkb25lIGJ5IHRoZSBvcmlnaW5hbCBzdWJtaXR0ZXIgb2YgdGhlIGRl
ZmNvbmZpZy4KPj4+Cj4+PiBFdWdlbiwgTHVkb3ZpYz8KPiAKPiBJIGNhbiB0ZXN0IGl0LiBEbyB5
b3UgaGF2ZSBhIGJ1aWx0IGFscmVhZHkgZG9uZSB3aXRoIGl0IG9uIHRvcCB0aGF0IEkKPiBjb3Vs
ZCBkb3dubG9hZCA/ICh3b3VsZCBjZXJ0YWlubHkgc3BlZWQgdGhpbmdzIHVwKQoKSGVyZSBhcmUg
dGhlIDIgbGlua3Mgd2l0aCB0aGUgcHJlYnVpbHQgaW1hZ2VzIGZvciBib3RoIGJvYXJkczoKaHR0
cHM6Ly93d3cuZHJvcGJveC5jb20vcy9hdjl2ejI4NDU5aGFramwvbWljcm9jaGlwX3NhbWE3ZzVl
a19tbWNfZGV2LXNkY2FyZC5pbWc/ZGw9MApodHRwczovL3d3dy5kcm9wYm94LmNvbS9zLzc3dDJ0
cnU5NWY2bDB3ay9taWNyb2NoaXBfc2FtYTdnNWVrX21tYy1zZGNhcmQuaW1nP2RsPTAKCj4gSSBk
byBub3QgcmVhbGx5IHVuZGVyc3RhbmQgd2h5IHdlIG5lZWQgdG8gaGF2ZSBhIGZpeGVkIGtlcm5l
bCB2ZXJzaW9uLgo+IFRoaXMgYm9hcmQgd29ya3Mgd2l0aCBsYXRlc3QgTFRTIHN0YXJ0aW5nIGZy
b20gNS4xNS4gQ2FuJ3QgYnVpbGRyb290Cj4ganVzdCBzZWxlY3QgdGhhdCA/CgpJdCBjYW4ndCBi
ZWNhdXNlIG90aGVyd2lzZSwgb25jZSBCdWlsZHJvb3QgTGF0ZXN0IExpbnV4IHZlcnNpb24gZ2V0
cyAKYnVtcGVkKGxpa2UgNS4xNiBldGMuKSwgeW91ciBkZWZjb25maWcgd2lsbCBiZSBidWlsdCB3
aXRoIGEgbmV3IGFuZCAKdW50ZXN0ZWQgTGludXggdmVyc2lvbihpLmUgNS4xNikuIFNvIHdlIG5l
ZWQgdG8gc2V0IGEgc3BlY2lmaWMgdmVyc2lvbiwgCnRlc3QgaXQsIGNvbW1pdCBpdCwgYW5kIGlu
IHRoZSBmdXR1cmUgd2UgY2FuIGJ1bXAgaXQsIHdhaXQgZm9yIGEgSFcgCnRlc3RpbmcsIGNvbW1p
dCBpdCBldGMuCgo+IEFuZCB3aHkganVzdCBhZGRpbmcgdGhlIG1pc3NpbmcgZGVwZW5kZW5jeSBk
b2VzIG5vdCBmaXggdGhpbmdzLgoKQmVjYXVzZSB0aGF0IG9ubHkgY2hvb3NlcyB0aGUgIkN1c3Rv
bSBrZXJuZWwgaGVhZGVycyBzZXJpZXMiIGFuZCBub3QgCkxpbnV4IHZlcnNpb24sIHNvIG9uY2Ug
TGF0ZXN0IHZlcnNpb24gaXMgYnVtcGVkKGkuZS4gdG8gNS4xNikgaXQgd29uJ3QgCmJlIHZhbGlk
IGFueW1vcmUuIFRoZSBwb2ludCBoZXJlIGlzIHRoYXQgdGhpczoKQlIyX1BBQ0tBR0VfSE9TVF9M
SU5VWF9IRUFERVJTX0NVU1RPTV81XzE1CmlzIG5lZWRlZCBiZWNhdXNlIG9mIHRoZXNlOgpCUjJf
TElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVS
U0lPTl9WQUxVRT0iNS4xNS4yMSIKCmFuZCB0aGVzZSBeXl4gYWxsb3cgdXMgdG8gaGF2ZSBhIHN0
YWJsZSwgSFcgdGVzdGVkIGRlZmNvbmZpZy4KCj4gKEkgcmVtZW1iZXIgYnVpbGRyb290IGhhZCBz
b21ldGhpbmcgbGlrZSBrZXJuZWwgbGF0ZXN0IHZlcnNpb24gdG8gcGljayB1cCApLgoKVGhhdCBp
cyBub3Qgd2hhdCB3ZSB3YW50IGJlY2F1c2Ugb2YgYWJvdmUgZXhwbGFuYXRpb24uIEl0IGNhbiBy
ZXN1bHQgaW4gCmEgbm9uIHdvcmtpbmcgZGVmY29uZmlnLgoKQmVzdCByZWdhcmRzCi0tIApHaXVs
aW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
