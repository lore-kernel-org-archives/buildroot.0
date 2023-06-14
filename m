Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF40EB64D8
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 06:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 842EB417B6;
	Wed, 14 Jun 2023 06:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 842EB417B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PjFN0v72JzO6; Wed, 14 Jun 2023 06:21:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 585B641734;
	Wed, 14 Jun 2023 06:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 585B641734
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDC371BF863
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 06:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C421540640
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 06:21:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C421540640
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jb8X-MqXITYz for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 06:21:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F341405D0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F341405D0
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 06:21:38 +0000 (UTC)
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M6VNX-1qBDhF204n-006zgy; Wed, 14 Jun 2023 08:21:32 +0200
Message-ID: <7031315e-4906-206e-8afc-f21784b4f822@vivier.eu>
Date: Wed, 14 Jun 2023 08:21:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: fr
To: Joel Stanley <joel@jms.id.au>
References: <20230613105015.739870-1-laurent@vivier.eu>
 <20230613105015.739870-5-laurent@vivier.eu>
 <CACPK8XfZL3j9AP-hkz3mNLW=6Ryy5TMo+o95DJNZ_vWBJxE2DQ@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <CACPK8XfZL3j9AP-hkz3mNLW=6Ryy5TMo+o95DJNZ_vWBJxE2DQ@mail.gmail.com>
X-Provags-ID: V03:K1:pmGXZ5cfmmnkTZy00vuZ100JZXAbX3S4/nVJclvlzrJ0+zq7BZ+
 /XtfwiXSmjlkuLwpQ/oRzTMPKllR9V6e/ps+Ot3zLQoRP8QhCewWJ8txMfVhkH0mPhPUKTL
 2ux/xoYyqE8aGw2mob3R1hE9YICm5kWkGdqClzBmOyM9/kXEu8CtWDmUUjbHRvr3u5Q8pzf
 cdNlXzuSM3o4yJjTt1meg==
UI-OutboundReport: notjunk:1;M01:P0:Mw5KCPl3cSE=;Bn22EQ10Tr/Skabh+CjNCNcaoLz
 sqKvnCcwfsBYJ8u0cnwwWrtoxJwYmwXu7EXxsKYzJReLbt8a3uE3y0MyVCs2TFyzHKZOXtSsG
 TEGLZxP9xr+dfIvzDsECqQa1pZj7ehKXWvm/cRFaMrFeHS5/sAtFBFzpOG8mVx686Cl3Ukcvk
 0AW8Lt963KuDXUcgBP+ULa51ScB54kKkES8o1uwZ6AE4iJkhQwDpcjE4SLinzcmYVbLDVbTKN
 BjnHyFpgj6Gb0WidnDiSeEPaAfWOS25WfBbuGS6+g9ceLovYc4gZsaxhrXdehkh3NWS/wby50
 G3QU9tfItOHN8sCIHOozs+E5NLlOuL39LfzTkqLiLDsPIiiP4ukPgNABWtKbHDUBvnlkEqzs1
 5B8GF+mCs3iFHst7z6mrYp5tV1idiusG3w5RM6cAQeDhAqErDkCoVpdhlR8gPmS8ENfK+xXD5
 Khp8YM845lJKHYdJ5Gz4E6yNRuisl/tYOP00pZzHH05ETxaL2vyxoIVn29KPaiX8SpbHFqEx6
 hNaLU9JCoIr2nv/4BtAXjKKY54bNh+y/Nxyd2A9Sd/fTjtzjRz2QmQEerVA0D/blIYOR+2YPO
 9+LDV0E6ICauQBRqBIOvFp8U/MaTALUutoQeJ38blYKhHB3p8N9d2ITW5WraM1OaUKw82/swH
 4bkXXYMrVlxGE4uVQTl2IjQnVRgp2JI+vkijDUF/pg==
Subject: Re: [Buildroot] [PATCH v14 4/4] support/scripts/boot-qemu-image.py:
 manage petitboot interface
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
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMTQvMDYvMjAyMyDDoCAwNDowNSwgSm9lbCBTdGFubGV5IGEgw6ljcml0wqA6Cj4gT24gVHVl
LCAxMyBKdW4gMjAyMyBhdCAxMDo1MSwgTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2aWVyLmV1
PiB3cm90ZToKPj4KPj4gUGV0aXRib290IGRvZXNuJ3Qgc3RhcnQgYSBzaGVsbCBidXQgYSBHVUku
Cj4+IE1hbmFnZSB0aGUgbWVudSB0byBzd2l0Y2ggdG8gdGhlIHNoZWxsLgo+Pgo+PiBFbmFibGUg
dGhlIHRlc3QgZm9yIHFlbXVfbTY4S192aXJ0Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50
IFZpdmllciA8bGF1cmVudEB2aXZpZXIuZXU+Cj4+IC0tLQo+PiAgIHN1cHBvcnQvc2NyaXB0cy9i
b290LXFlbXUtaW1hZ2UucHkgfCA4ICsrKysrKy0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvc2Ny
aXB0cy9ib290LXFlbXUtaW1hZ2UucHkgYi9zdXBwb3J0L3NjcmlwdHMvYm9vdC1xZW11LWltYWdl
LnB5Cj4+IGluZGV4IGJhNTBlYTY5ZWU5YS4uYzk0YjdhNWM5NjlkIDEwMDc1NQo+PiAtLS0gYS9z
dXBwb3J0L3NjcmlwdHMvYm9vdC1xZW11LWltYWdlLnB5Cj4+ICsrKyBiL3N1cHBvcnQvc2NyaXB0
cy9ib290LXFlbXUtaW1hZ2UucHkKPj4gQEAgLTM2LDcgKzM2LDcgQEAgZGVmIG1haW4oKToKPj4g
ICAgICAgdGltZS5zbGVlcCgxKQo+Pgo+PiAgICAgICB0cnk6Cj4+IC0gICAgICAgIGNoaWxkLmV4
cGVjdChbImJ1aWxkcm9vdCBsb2dpbjoiXSwgdGltZW91dD02MDApCj4+ICsgICAgICAgIGlkeCA9
IGNoaWxkLmV4cGVjdChbImJ1aWxkcm9vdCBsb2dpbjoiLCAiRXhpdCB0byBzaGVsbCJdLCB0aW1l
b3V0PTYwMCkKPiAKPiBXaGF0J3MgaWR4IGdvaW5nIHRvIGNvbnRhaW4gaW4gdGhlIHBldGl0Ym9v
dCB2cyBnZXR0eSBjYXNlcz8KCnNlZSBodHRwczovL3BleHBlY3QucmVhZHRoZWRvY3MuaW8vZW4v
c3RhYmxlL2FwaS9wZXhwZWN0Lmh0bWwjcGV4cGVjdC5zcGF3bi5leHBlY3QKCiJUaGlzIHJldHVy
bnMgdGhlIGluZGV4IGludG8gdGhlIHBhdHRlcm4gbGlzdC4iCgoiYnVpbGRyb290IGxvZ2luOiIg
LT4gaWR4ID0gMAoiRXhpdCB0byBzaGVsbCIgLT4gaWR4ID0gMQoKVGhhbmtzLApMYXVyZW50Cgo+
IAo+PiAgICAgICBleGNlcHQgcGV4cGVjdC5FT0YgYXMgZToKPj4gICAgICAgICAgICMgU29tZSBl
bXVsYXRpb25zIHJlcXVpcmUgYSBmb3JrIG9mIHFlbXUtc3lzdGVtLCB3aGljaCBtYXkgYmUKPj4g
ICAgICAgICAgICMgbWlzc2luZyBvbiB0aGUgc3lzdGVtLCBhbmQgaXMgbm90IHByb3ZpZGVkIGJ5
IEJ1aWxkcm9vdC4KPj4gQEAgLTU1LDcgKzU1LDExIEBAIGRlZiBtYWluKCk6Cj4+ICAgICAgICAg
ICBwcmludCgiU3lzdGVtIGRpZCBub3QgYm9vdCBpbiB0aW1lLCBleGl0aW5nLiIpCj4+ICAgICAg
ICAgICBzeXMuZXhpdCgxKQo+Pgo+PiAtICAgIGNoaWxkLnNlbmRsaW5lKCJyb290XHIiKQo+PiAr
ICAgIGlmIGlkeCA9PSAwOgo+PiArICAgICAgICBjaGlsZC5zZW5kbGluZSgicm9vdFxyIikKPj4g
KyAgICBlbGlmIGlkeCA9PSAxOgo+PiArICAgICAgICB0aW1lLnNsZWVwKDEpCj4+ICsgICAgICAg
IGNoaWxkLnNlbmRsaW5lKCJcciIpCj4+Cj4+ICAgICAgIHRyeToKPj4gICAgICAgICAgIGNoaWxk
LmV4cGVjdChbIiMgIl0sIHRpbWVvdXQ9NjAwKQo+PiAtLQo+PiAyLjQwLjEKPj4KPj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYnVpbGRyb290IG1h
aWxpbmcgbGlzdAo+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+PiBodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
