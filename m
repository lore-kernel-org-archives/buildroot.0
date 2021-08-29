Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A02C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 21:50:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B466360231
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 21:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B466360231
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AE7380C84;
	Sun, 29 Aug 2021 21:50:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IKSYSt9GdOnO; Sun, 29 Aug 2021 21:50:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C846180CDC;
	Sun, 29 Aug 2021 21:50:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 98B131BF350
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 21:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 886F2605F5
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 21:50:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nuqlajuQlkwX for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 21:50:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb155.aruba.it (smtpweb155.aruba.it [62.149.158.155])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68770605F6
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 21:50:02 +0000 (UTC)
Received: from [192.168.47.129] ([89.164.21.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id KSghmqiqJa4UMKSghmyVY2; Sun, 29 Aug 2021 23:50:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1630273801; bh=hDdN/JHwKsfpidBS+DkxhM9Wy7HhTLqw3C5CjOd6sXc=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=CErEwXnbUc9qZ60szRIq1YlRbz1snm15SIO7vo7OicxV23RsMu82zVZgGabPuJ1B9
 A7QW6i43cEDePT0z11oegbBM2q37B5CoaPSKYomDsya9x6Q4/rDT81gsC4EjdGdkHt
 WFXhV1lhf/Rg3Hl1EIoO1pKO1ksyRRLGDVj7WrdIJhqMC5D75Fob2nGzerhFIa1I7k
 82dFSD7IE2fKAbJsesT4CHXeI7fnz3HBW7+Qgq/7ZMfJltZj8YB6PZaBptQC+FO+Vw
 vVCBibhxYleiZJQ9o9uTCUkQRhVAoKofzSATC1YhExvzZm8w4/Jzaew0U0GIkJb4e5
 yje7qKVkjtYmA==
To: Arnout Vandecappelle <arnout@mind.be>
References: <86602fc9-9d62-0b7b-4ce3-25bf3de27254@mind.be>
 <7FE9A46C-9CD8-4143-99DE-CE8D786A459C@benettiengineering.com>
 <761985a1-2152-7a7b-e430-54b7b4ed31f3@mind.be>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20869f88-4ac4-a4e2-268b-c8d364298583@benettiengineering.com>
Date: Sun, 29 Aug 2021 23:49:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <761985a1-2152-7a7b-e430-54b7b4ed31f3@mind.be>
Content-Language: en-US
X-CMAE-Envelope: MS4wfM3tQ6YD1hOXeTZ1bd5hlz1x5C1OAq/UTGYvpURnyT7H4cDyzWjDDFdEJM1rGbsGI0Mei+1ky15iJhphv8CciMAmc7kKzi2jlJv9GWs1RJ77KFWvkpnq
 iW3ME7sdtyanY1C9dWIugv6aycyYfkpgfbV4Vk/O5ZYiDfhD3qFI+xC3PUvjOZN75LFFb9uKK5C4p8aP46+/FwaFTM9wR5dbZ0wJoUwYl+3EV+Z4/A7OyNO/
 2dpPE+5fpyKL4lodqO4A43kYRanEsZPp5dI52iFMKHOMQ/Dtg/4PnvdKuTPXW9bJWy+DbPqxJU1bWPLcK0FV9TWlC0s0Mx79osM54LDHHiPms4fmK09eSe1S
 kK9TiAQV
Subject: Re: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_83143
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGkgQXJub3V0LAoKT24gOC8yOS8yMSA1OjIzIFBNLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90
ZToKPiAKPiAKPiBPbiAyOC8wOC8yMDIxIDE0OjM5LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPj4g
SGkgQXJub3V0LAo+Pgo+Pj4gSWwgZ2lvcm5vIDI4IGFnbyAyMDIxLCBhbGxlIG9yZSAxNDowNiwg
QXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiBoYSBzY3JpdHRvOgo+Pj4KPj4+
IO+7vwo+Pj4KPj4+PiBPbiAyOC8wOC8yMDIxIDAwOjM0LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToK
Pj4+PiBydWJ5IHBhY2thZ2UgZmFpbHMgdG8gYnVpbGQgZm9yIHRoZSBTSDQgYXJjaGl0ZWN0dXJl
IHdpdGggb3B0aW1pemF0aW9uCj4+Pj4gZW5hYmxlZCB3aXRoIGdjYyA9IDkuMy4wOgo+Pj4+IGh0
dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2Y1Ny9mNTc0MmU3ZmI2ZTgxNDJi
Y2RiNTNiN2Y0ZjVlOWMxYmVhMzU1OGNkLwo+Pj4+Cj4+Pj4gSXQncyBhbHJlYWR5IGJlZW4gcmVw
b3J0ZWQgdXBzdHJlYW06Cj4+Pj4gaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1
Zy5jZ2k/aWQ9ODMxNDMKPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxn
aXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+Pj4+IC0tLQo+Pj4+IHRvb2xj
aGFpbi9Db25maWcuaW4gfCA5ICsrKysrKysrKwo+Pj4+IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2Vy
dGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS90b29sY2hhaW4vQ29uZmlnLmluIGIvdG9v
bGNoYWluL0NvbmZpZy5pbgo+Pj4+IGluZGV4IGJmMmJiM2VmZTQuLjQ0MTk0NDM5MzAgMTAwNjQ0
Cj4+Pj4gLS0tIGEvdG9vbGNoYWluL0NvbmZpZy5pbgo+Pj4+ICsrKyBiL3Rvb2xjaGFpbi9Db25m
aWcuaW4KPj4+PiBAQCAtMTMzLDYgKzEzMywxNSBAQCBjb25maWcgQlIyX1RPT0xDSEFJTl9IQVNf
R0NDX0JVR182ODQ4NQo+Pj4+ICAgICBib29sCj4+Pj4gICAgIGRlZmF1bHQgeSBpZiBCUjJfbWlj
cm9ibGF6ZQo+Pj4+Cj4+Pj4gKyMgaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1
Zy5jZ2k/aWQ9ODMxNDMKPj4+PiArIyBFcnJvcjogaW52YWxpZCBvcGVyYW5kcyAoKlVORCogYW5k
IC50ZXh0IHNlY3Rpb25zKSBmb3IgYC0nIG9uIHNoNC4KPj4+PiArIyBUaGlzIGJ1ZyBubyBsb25n
ZXIgZXhpc3RzIGluIGdjYyAxMC54IGJ1dCByZWFwcGVhcmVkIG9uIGdjYyAxMS54IGFuZAo+Pj4+
ICsjIGl0IHN0aWxsIG5vdCBiZWVuIGZpeGVkIHlldC4KPj4+PiArY29uZmlnIEJSMl9UT09MQ0hB
SU5fSEFTX0dDQ19CVUdfODMxNDMKPj4+PiArICAgIGJvb2wKPj4+PiArICAgIGRlZmF1bHQgeSBp
ZiAhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfMTAKPj4+Cj4+PiBUaGUgY29uZGl0aW9uIGRv
ZXNuJ3QgY29ycmVzcG9uZCB0byB0aGUgY29tbWVudCBhYm92ZS4uLgo+Pgo+PiBJ4oCZdmUgdHJp
ZWQgaXQgYW5kIGNoZWNrZWQgLmNvbmZpZwo+PiBJIGZpbmQgaXQgZW1pdHRlZCBvbiBnY2MgOSBh
bmQgMTEgd2hpbGUgb24gZ2NjIDEwIG5vdCBhcyBkZXNjcmliZWQuCj4gCj4gICBJIGRvbid0IGtu
b3cgd2hhdCB5b3UgZGlkIGRpZmZlcmVudGx5LCBidXQgdGhhdCdzIG5vdCB3aGF0IEkgaGF2ZS4u
Lgo+IAo+IFdpdGggdGhpcyBkZWZjb25maWc6Cj4gCj4gQlIyX3NoPXkKPiBCUjJfR0NDX1ZFUlNJ
T05fMTFfWD15Cj4gCj4gZ3JlcCBHQ0NfQlVHXzgzMTQzIC5jb25maWcKPiAKPiBwcm9kdWNlcyBu
byBvdXRwdXQsIHdoaWxlIHdpdGggdGhpcyBkZWZjb25maWc6Cj4gCj4gQlIyX3NoPXkKPiBCUjJf
R0NDX1ZFUlNJT05fOV9YPXkKPiAKPiBpdCBkb2VzIHNob3cgaXQuCgpNeSBiYWQsIEkndmUgb25s
eSBpc3N1ZWQgJ21ha2UgbWVudWNvbmZpZycgYW5kIHNhdmVkIGFmdGVyIGFkZGluZyB0aGUgCmJ1
ZyBhbmQgc29tZSBtZXNzIGNhbWUgb3V0LiBTbyBub3cgZG9pbmcgbWFrZSBhIF9kZWZjb25maWcg
ZnJvbSBzY3JhdGNoIApnaXZlcyBtZSB5b3VyIHNhbWUgcmVzdWx0LgoKPiAKPiAgIEJUVywgSSBk
aWRuJ3Qgbm90aWNlIGJlZm9yZSwgYnV0OiB3aHkgaXMgdGhpcyBvbmx5IGZvciBzaDQsIGFuZCBu
b3QgYW55IG90aGVyCj4gU3VwZXJIPyBJIG1lYW4sIGFyZSB5b3Ugc3VyZSBpdCdzIG9ubHkgb24g
c2g0PyBzaDQgaXMgdGhlIG9ubHkgb25lIHRlc3RlZCBpbiB0aGUKPiBhdXRvYnVpbGRlcnMsIG9m
IGNvdXJzZSwgYnV0IGl0J3Mga2luZCBvZiBsaWtlbHkgdGhhdCBvdGhlciBTdXBlckggc3VmZmVy
IGZyb20KPiB0aGUgc2FtZSBidWcuLi4KClRoaXMgbWFrZXMgYSBsb3Qgb2Ygc2Vuc2UsIGluZGVl
ZCBJJ20gdHJ5aW5nIHRvIGJ1aWxkIGZvciBzaDJhIHdpdGggQmlnIApFbmRpYW4gZm9yIGV4YW1w
bGUgYW5kIEkndmUgZm91bmQgYSBidWcgd2hpbGUgdHJ5aW5nIHRvIGJ1aWxkIApnY2M5LzEwLWZp
bmFsIGZvciBpdDoKeGdjYzogZXJyb3I6IFNIMmEgZG9lcyBub3Qgc3VwcG9ydCBsaXR0bGUtZW5k
aWFuCkkgbmVlZCB0byBmaW5kIHRoZSByZWFzb24sIHNpbmNlOgpCUjJfRU5ESUFOPSJCSUciCnBy
b2JhYmx5IGEgYnVnIGluIGdjYz8gTmVlZCB0byBmaW5kLgoKSSB0cnkgd2l0aCBhbm90aGVyIHNo
IGFyY2ggdGhlbiBJIHRyeSB0byBidWlsZCBydWJ5IGFuZCBjaGVjayBpZiB0aGUgCmVycm9yIGlz
IHRoZSBzYW1lLCB0aGF0IGlzIHZlcnkgbGlrZWx5IHRvIGhhcHBlbiBhbmQgdGhlbiBJIGNvdWxk
IAp0cmFuc2Zvcm0gQlIyX3NoNCB0byBCUjJfc2guIEFuZCBzYW1lIGdvZXMgZm9yIG90aGVyIHNo
NCBidWdzIGFscmVhZHkgCnByZXNlbnQuIEJ1dCBuZWVkIHRvIHJlLXRlc3QgdGhlbS4KCj4gCj4+
IEl04oCZcyBhbHdheXMgZGlmZmljdWx0IHRvIG1lIHRvIHVuZGVyc3RhbmQgaG93IHRoYXQgdmFy
aWFibGUgd29ya3MuCj4gCj4gICBJdCdzIHZlcnkgc2ltcGxlOiBBVF9MRUFTVF8xMF9YIGlzIHRy
dWUgZm9yIGFsbCBHQ0MgPj0gMTAuMCwgc28gYWxzbyBmb3IgR0NDCj4gMTEuIElmIHlvdSB3YW50
IGV4YWN0bHkgb25lIHZlcnNpb24sIGl0J3MgQVRfTEVBU1RfMTAgJiYgIUFUX0xFQVNUXzExLiBJ
biB0aGlzCj4gY2FzZSwgeW91IHdhbnQgdGhlIG5lZ2F0aXZlIG9mIHRoYXQsIHNvICFBVF9MRUFT
VF8xMCB8fCBBVF9MRUFTVF8xMS4KCk9rLCB0aGFuayB5b3UuIEluZGVlZCBhdCB0aGUgbW9tZW50
IGl0IG9ubHkgZW1pdHMgdGhhdCBidWcgd2l0aCBnY2MgOSAKb25seS4gSW5zdGVhZCB3aXRoICFB
VF9MRUFTVF8xMCB8fCBBVF9MRUFTVF8xMSBpdCB3b3JrcyBhcyBkZXNjcmliZWQuCgpUaGFuayB5
b3UgZm9yIGV4cGxhaW5pbmchCgpCZXN0IHJlZ2FyZHMKLS0gCkdpdWxpbyBCZW5ldHRpCkJlbmV0
dGkgRW5naW5lZXJpbmcgc2FzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0
dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
