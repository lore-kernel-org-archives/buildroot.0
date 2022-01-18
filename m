Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3BBC433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 06:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E20C040286;
	Tue, 18 Jan 2022 06:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b1MBvNet9i2d; Tue, 18 Jan 2022 06:58:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B59424028D;
	Tue, 18 Jan 2022 06:58:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93A6F1BF339
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 06:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81A8C60D51
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 06:58:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xB3DadzmczNa for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 06:58:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp3.osuosl.org (Postfix) with ESMTP id F041B60D50
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 06:58:43 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9iS1naWgQX0z79iS1nbN3C; Tue, 18 Jan 2022 07:58:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642489121; bh=FC2r+WeeCegj1NzLTCXPJiGiOSdVAhY5eiUBp+j7tMA=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=niA1mxNKB8ZrqMZhw3LXCFumSY+L1D5XOCtbOsmOBLfj5q/rRHhrZqVPHAYiUO/q3
 vfMz0UKI9NV+GJth5F19feujNuB2zbLe/5odCo32URpjARu3v9/VKJvqSPe1a7exLD
 M42AZzHFsRfwSVJP1lYHq74lcW4ARqnM1SLxFg8DfYfSubI0IVQkPwJZbw3ZaARHOB
 x5Sj6QK+y8SYXSNE5IABQJV44Qjg1u2uxYUuk8mpQCf0PiKPNolp2+mDJdViP1k71p
 mZNrhEUE/EySri+xCWtg0NFUxCJCtDiaLJ8rIBBYhTCD+nyx6FiJwvvBn1Vsr4NelF
 wnxFf6XfhP+ZA==
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220114211525.2697606-1-heiko.thiery@gmail.com>
 <752cc85f-d3d6-950b-cb5c-fb39e5020bc3@benettiengineering.com>
 <20220118000448.32ea764d@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <f8cc20f4-dc4d-3751-8dc3-eaddbc3bbcbb@benettiengineering.com>
Date: Tue, 18 Jan 2022 07:58:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220118000448.32ea764d@windsurf>
Content-Language: en-US
X-CMAE-Envelope: MS4wfChD3Ufm7kMROv51iPNHR2zfsZ5V9scqX/uK0InfaiD4jobXQHTijiYBumiomDMg3Wvl4hBqhSuyfr6WFqnk6RHbIx3NXJmyyEhM38tjQMqeb139nWty
 c8XkVzTdQStZilikVKliyCfuF8hRxNTc/CcfAe/C6bUehGe/y1zuTy2B+aLSAQiI8B/Wr60XJByJ8IN9LnZez6X2RY5eSpCgLa4P7r2orleec9+FCtaHlqqA
 V+P0vWvRJnf4ceHLGhq2BnmttPUCLF/5jkscKnRwHl2Om09MO2XBg4Y1pKZYWyLHCBj4naksx8Y/RChvlqfCjcsM5/iICrMoJYoTVlYWpzXCq226S//qk7QK
 rhsKnOfz
Subject: Re: [Buildroot] [PATCH v2] configs/kontron_bl_imx8mm_defconfig: new
 defconfig
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gMTgvMDEvMjIgMDA6MDQsIFRob21hcyBQZXRhenpvbmkgd3JvdGU6Cj4g
T24gTW9uLCAxNyBKYW4gMjAyMiAyMDo1ODo1MiArMDEwMAo+IEdpdWxpbyBCZW5ldHRpIDxnaXVs
aW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPiAKPj4+IGRpZmYgLS1n
aXQgYS9jb25maWdzL2tvbnRyb25fYmxfaW14OG1tX2RlZmNvbmZpZyBiL2NvbmZpZ3Mva29udHJv
bl9ibF9pbXg4bW1fZGVmY29uZmlnCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4gaW5kZXgg
MDAwMDAwMDAwMC4uNWI1NjQ4Y2MxNAo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4gKysrIGIvY29uZmln
cy9rb250cm9uX2JsX2lteDhtbV9kZWZjb25maWcKPj4+IEBAIC0wLDAgKzEsNTkgQEAKPj4+ICsj
IEFyY2hpdGVjdHVyZQo+Pj4gK0JSMl9hYXJjaDY0PXkKPj4+ICtCUjJfQVJNX0ZQVV9WRlBWMz15
Cj4+Cj4+IGkuTVg4TU0gc3VwcG9ydHMgVkZQdjQtRDE2LCBzbyBJIHdvdWxkIHN1YnN0aXR1dGUg
dGhpcyBeXl4gd2l0aDoKPj4gQlIyX0FSTV9GUFVfVkZQVjREMTYKPj4KPj4gVGhpcyBpcyB0byBh
Y2hpZXZlIHRoZSBtYXhpbXVtIHBlcmZvcm1hbmNlLgo+IAo+IE5vcGUsIHRoYXQncyBub3QgcmVh
bGx5IGhvdyBpdCB3b3Jrcy4gVkZQdjMgaXMgYmV0dGVyIHRoYW4gVkZQdjMtRDE2Lgo+IEluZGVl
ZCBWRlB2MyBtZWFucyB0aGF0IHRoZSB0aGUgRlBVIGhhcyAzMiBkb3VibGUgcHJlY2lzaW9uIHJl
Z2lzdGVycywKPiB3aGlsZSBWRlB2My1EMTYgbWVhbnMgdGhhdCBpdCBoYXMgIm9ubHkiIDE2IGRv
dWJsZSBwcmVjaXNpb24gcmVnaXN0ZXJzLgoKSSdtIGEgYml0IGNvbmZ1c2VkLiBUaGUgZGF0YXNo
ZWV0WzFdIHN0YXRlcyBhdCAxLjQuMToKYGBgCuKAoiBNZWRpYSBQcm9jZXNzaW5nIEVuZ2luZSAo
TVBFKSB3aXRoIE5FT04gdGVjaG5vbG9neSBzdXBwb3J0aW5nIHRoZQpBZHZhbmNlZCBTaW5nbGUg
SW5zdHJ1Y3Rpb24gTXVsdGlwbGUgRGF0YSBhcmNoaXRlY3R1cmUK4oCiIEZsb2F0aW5nIFBvaW50
IFVuaXQgKEZQVSkgd2l0aCBzdXBwb3J0IG9mIHRoZSBWRlB2NC1EMTYgYXJjaGl0ZWN0dXJlCmBg
YApbMV06IGh0dHBzOi8vd3d3Lm54cC5jb20vZG9jcy9lbi9kYXRhLXNoZWV0L0lNWDhNTUNFQy5w
ZGYKClNvIEkgZXhwZWN0IGl0IHRvIG9ubHkgaGF2ZSBWRlB2NC1EMTYuIEFuZCBhbHNvIE5FT04s
IGJ1dCB3ZSBjYW4ndCBtaXggCnRoZW0gdXAgaW4gQWFyY2g2NCBhcyBJIGtub3cuCgo+IFNvLCBp
ZiB0aGUgaS5NWDhNTSBoYXMgb25seSB0aGUgVkZQdjMtRDE2LCB0aGVuIGluZGVlZCBpdCBzaG91
bGQgYmUKPiBjaG9zZW4sIGJlY2F1c2UgY29kZSBjb21waWxlZCB3aXRoIFZGUHYzIG1heSBub3Qg
d29yaywgYXMgaXQgbWlnaHQgdXNlCj4gdG9vIG1hbnkgZG91YmxlIHByZWNpc2lvbiByZWdpc3Rl
cnMuCj4gCj4gT24gdGhlIG90aGVyIGhhbmQsIGlmIHRoZSBpLk1YOE1NIGhhcyB0aGUgZnVsbCBW
RlB2MywgdGhlbgo+IEJSMl9BUk1fRlBVX1ZGUFYzPXkgc2hvdWxkIGJlIHVzZWQuCgpJdCBvbmx5
IGhhcyBWRlB2NC1EMTYuIEkgdGhpbmsgSSd2ZSBleHBsYWluZWQgbXlzZWxmIGJhZC4gVGhpcyBp
cyBub3QgdG8gCmFjaGlldmUgbWF4aW11bSBwZXJmb3JtYW5jZSwgc2ltcGx5IGRhdGFzaGVldCBz
dGF0ZXMgaXQgb25seSBzdXBwb3J0cyAKVkZQdjQtRDE2WzFdIGFuZCBqdWRnaW5nIGZyb20gdGhp
czoKaHR0cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS9kb2N1bWVudGF0aW9uL2R1aTA0NzIvaC9DSkFE
RENJRiM6fjp0ZXh0PVZGUHYzJTIwaGFzJTIwMzIlMjBkb3VibGUlMkRwcmVjaXNpb24sVkZQdjMl
MjB3aXRoJTIwaGFsZiUyRHByZWNpc2lvbiUyMGV4dGVuc2lvbnMuJnRleHQ9VkZQdjQlMjBoYXMl
MjAzMiUyMGRvdWJsZSUyRHByZWNpc2lvbix0byUyMHRoZSUyMGZlYXR1cmVzJTIwb2YlMjBWRlB2
My4KClZGUHY0IGlzIHJldHJvLWNvbXBhdGlibGUgd2l0aCBWRlB2MywgYW5kIEknZCBleHBlY3Qg
VkZQNHY0LUQxNiB0byBiZSAKbGlrZSB0aGF0IHRvby4gSXMgaXQgcG9zc2libGUgdGhhdCBhdCB0
aGUgbW9tZW50LCBieSBtaXN0YWtlLCBpdCB3b3JrZWQgCndpdGhvdXQgdXNpbmcgbW9yZSB0aGFu
IDE2IHJlZ2lzdGVycyBhcyBWRlB2MyB0aGF0IGlzIHJldHJvLWNvbXBhdGlibGUgCndpdGggVkZQ
djQtRDE2KG1heWJlPykuCgo+IFRoYXQgYmVpbmcgc2FpZCwgdGhlIGdjYyBtYW4gcGFnZSBvbmx5
IGRvY3VtZW50cyB2ZnB2MywgdmZwdjMtZDE2LWZwMTYsCj4gdmZwdjMtZnAxNiBhcyBleHRlbnNp
b24gZm9yIGFybXY3LWEuIEludGVyZXN0aW5nLCB3b3VsZCBuZWVkIHRvIGxvb2sKPiBpbnRvIHRo
aXMuCgpZZXMsIGJ1dCBpLk1YOE1NIGlzIGEgY29ydGV4LUE1Mywgc28gYXJtdjgtYToKaHR0cHM6
Ly9kZXZlbG9wZXIuYXJtLmNvbS9pcC1wcm9kdWN0cy9wcm9jZXNzb3JzL2NvcnRleC1hL2NvcnRl
eC1hNTMKCnRoYXQgdGhlbiBpcyByZXRyby1jb21wYXRpYmxlIHRvIGFybXY3LWEgaWYgaW4gQWFy
Y2gzMi4KQnV0IGhlcmUgd2UgdXNlIGl0IGFzIEJSMl9hYXJjaDY0LCBzbyBhcm12OC1hOgpodHRw
czovL2djYy5nbnUub3JnL29ubGluZWRvY3MvZ2NjL0FSTS1PcHRpb25zLmh0bWwKCmFuZCBpdCBs
aXN0czoKYGBgCi1tZnB1PW5hbWUKVGhpcyBzcGVjaWZpZXMgd2hhdCBmbG9hdGluZy1wb2ludCBo
YXJkd2FyZSAob3IgaGFyZHdhcmUgZW11bGF0aW9uKSBpcyAKYXZhaWxhYmxlIG9uIHRoZSB0YXJn
ZXQuIFBlcm1pc3NpYmxlIG5hbWVzIGFyZTog4oCYYXV0b+KAmSwg4oCYdmZwdjLigJksIArigJh2
ZnB2M+KAmSwg4oCYdmZwdjMtZnAxNuKAmSwg4oCYdmZwdjMtZDE24oCZLCDigJh2ZnB2My1kMTYt
ZnAxNuKAmSwg4oCYdmZwdjN4ZOKAmSwgCuKAmHZmcHYzeGQtZnAxNuKAmSwg4oCYbmVvbi12ZnB2
M+KAmSwg4oCYbmVvbi1mcDE24oCZLCDigJh2ZnB2NOKAmSwg4oCYdmZwdjQtZDE24oCZLCAK4oCY
ZnB2NC1zcC1kMTbigJksIOKAmG5lb24tdmZwdjTigJksIOKAmGZwdjUtZDE24oCZLCDigJhmcHY1
LXNwLWQxNuKAmSwg4oCYZnAtYXJtdjjigJksIArigJhuZW9uLWZwLWFybXY44oCZIGFuZCDigJhj
cnlwdG8tbmVvbi1mcC1hcm12OOKAmS4gTm90ZSB0aGF0IOKAmG5lb27igJkgaXMgYW4gYWxpYXMg
CmZvciDigJhuZW9uLXZmcHYz4oCZIGFuZCDigJh2ZnDigJkgaXMgYW4gYWxpYXMgZm9yIOKAmHZm
cHYy4oCZLgpgYGAKClNvICJ2ZnB2NC1kMTYiIGlzIHBvc3NpYmxlLgoKSGVyZSBJIHRoaW5rIHdl
IG5lZWQgdmZwdjQtZDE2IGFuZCBub3QgdmZwdjMgYmVjYXVzZSBvZiBib3RoIERTIGFuZCBSTSAK
b2YgaS5NWDhNTS4KCkRvZXMgaXQgc291bmQgZ29vZCB0byB5b3U/CgpUaGFuayB5b3UKQmVzdCBy
ZWdhcmRzCi0tIApHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
