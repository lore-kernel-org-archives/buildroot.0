Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049ACC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 20:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A80140185;
	Sat,  8 Jan 2022 20:42:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K0_23z1LRoRB; Sat,  8 Jan 2022 20:42:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DC2A40122;
	Sat,  8 Jan 2022 20:42:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CD281BF847
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 20:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AED76076C
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 20:42:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C6Xe-ABr0bYE for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 20:42:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FEDB60745
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 20:42:24 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id o6so36578873edc.4
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 12:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nYgJcDJ6hlXDf1Vz+F4KNqKDb9aabqm6GgDCkqWwhE0=;
 b=B8F4YdHvX820IMvs7UjZnLWj6GHeinCQpYiOachWIFLIf07k6ltC3ewkCMoDgEPwjt
 JLI2lBTsht4ac3+Ohjpy9vftyGa86eLCQAFJQkjZx0XipITHCJ3Ei9E0CKx9uk6i43af
 qiJE7AWjWmiBAROtEMIFS1BqXOPiQyTQj1BAprefTcYoWtLYWANTwhwSStixBYZdWVqU
 j3lWi9/sUtSKsjsXr9rHxgQ99kedb2RvtSsZqLkCTHo7wpzNkpPlouUHmqT0CsmsiNKV
 kncLdOIFwxuBrzhzIU38MwVLDp4Ib52aV8wLTEVslzdlIApQoZ2nrfeCqJ3U5zQgNvUy
 iwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nYgJcDJ6hlXDf1Vz+F4KNqKDb9aabqm6GgDCkqWwhE0=;
 b=nuBXMK3mVwyF/uuxK/BFtVw+Ey5+W72xSMt7u8KffKoKN6R0a6lkrv1uRniYAjKplC
 cDPywXHqPyaL6PMHVL1khe48p0xucrNdaxa1HeSE50SFHf54fghzVGF6hU0TdBDHobkD
 t3gdMFxOHs/FC3Zo2bwWVM7Dftf3BobJdClIbr/VRKxldwzZToAnkFtUW0BBJKYRaQ1p
 SFDWdKrodRLxwbqloS1xYpxJC9VaclHgHGkIiDwGxjpqJnLBc1xzUdEwA7ACvPXfp35c
 5K40p6uIRRGudssL5V7jzNWckXSo/JHLDjvEUYxeUNcMm93pehfMfolg7IDg3s/47ftI
 gGQQ==
X-Gm-Message-State: AOAM533wUSxtHCj5IxnOSszr+Z1mUkmRTuN4zDdorSOK/hHcQi37856v
 UT5Izssw87N+TVc6wb2/My5ACPlKYbYA3YSrM+s=
X-Google-Smtp-Source: ABdhPJwktxv//ayf9uYiDJIWhwsU87IkNKyDPGhe47oRRkaaqoK+mqc8KgwE3fM+NesmXIki8hlFA1Tl/hOlNhy+j+Y=
X-Received: by 2002:a05:6402:2813:: with SMTP id
 h19mr68819143ede.365.1641674542912; 
 Sat, 08 Jan 2022 12:42:22 -0800 (PST)
MIME-Version: 1.0
References: <20220104205455.3632671-1-fontaine.fabrice@gmail.com>
 <20220108115140.760e195f@windsurf>
 <CAPi7W82_k_toe+-1DdZv8wr2ArKjeZfb9qdarm5oewv52vsh4g@mail.gmail.com>
 <20220108183919.238c1885@gmx.net> <20220108193800.5f91ac3b@windsurf>
 <b78ed45f-2483-9ae2-179f-a30664001bb2@mind.be>
In-Reply-To: <b78ed45f-2483-9ae2-179f-a30664001bb2@mind.be>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 8 Jan 2022 21:41:06 +0100
Message-ID: <CAPi7W81Mhh3BabseZJrSEdERNYnaku=P-ps5tMhfNVVdM-BMDQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH v2, 1/1] package/file: fix build with gcc 4.8
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgc2FtLiA4IGphbnYuIDIwMjIgw6AgMTk6NTAsIEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5v
dXRAbWluZC5iZT4gYSDDqWNyaXQgOgo+Cj4KPgo+IE9uIDA4LzAxLzIwMjIgMTk6MzgsIFRob21h
cyBQZXRhenpvbmkgd3JvdGU6Cj4gPiBPbiBTYXQsIDggSmFuIDIwMjIgMTg6Mzk6MTkgKzAxMDAK
PiA+IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4gd3JvdGU6Cj4gPgo+ID4+IFRo
ZSBkaWZmZXJlbmNlIHNlZW1zIHRvIGJlOgo+ID4+Cj4gPj4gICAgICAkIGRpZmYgLXJ1IGZpbGUt
NS4zOC9jb25maWd1cmUuYWMgZmlsZS01LjQxL2NvbmZpZ3VyZS5hYwo+ID4+IFsuLi5dCj4gPj4g
QEAgLTg4LDcgKzg4LDcgQEAKPiA+PiAgIEFDX1NVQlNUKFdBUk5JTkdTKQo+ID4+Cj4gPj4gICBk
bmwgQ2hlY2tzIGZvciBwcm9ncmFtcy4KPiA+PiAtQUNfUFJPR19DQ19TVERDCj4gPj4gK0FDX1BS
T0dfQ0MKPiA+PiAgIEFDX1VTRV9TWVNURU1fRVhURU5TSU9OUwo+ID4+ICAgQU1fUFJPR19DQ19D
X08KPiA+PiAgIEFDX0NfQklHRU5ESUFOCj4gPj4gWy4uLl0KPiA+Pgo+ID4+IEFjY29yZGluZyB0
byBbMV0gQUNfUFJPR19DQyBjaGVja3MvZW5hYmxlcyBjODkgYW5kIEFDX1BST0dfQ0NfU1REQyBj
aGVja3MvZW5hYmxzIEM5OSAob3IKPiA+PiB1c2UgQUNfUFJPR19DQ19DOTkgdG8gYmUgbW9yZSBl
eHBsaWNpdCkuLi4sIG5vdGUgdGhhdCB3aXRoIEFDX1BST0dfQ0MgdGhlIGFjX2N2X3Byb2dfY2Nf
Yzk5Cj4gPj4gZmVhdHVyZSBpcyBnb25lIChzdGlsbCB1c2VkIGZvciB0YXJnZXQvaG9zdCBpbiBw
YWNrYWdlL2ZpbGUvZmlsZS5taykuLi4KPiA+Cj4gPiBCdXQgd2h5IHRoZSBzb2x1dGlvbiB3ZSB1
c2UgZm9yIHRoZSB0YXJnZXQgcGFja2FnZSBkb2Vzbid0IHdvcmsgZm9yIHRoZQo+ID4gaG9zdCBw
YWNrYWdlPwo+ID4KPiA+IE9yIHBlcmhhcHMgd2UncmUgbm8gbG9uZ2VyIHRlc3RpbmcgdGhlIHRh
cmdldCBwYWNrYWdlIHdpdGggZ2NjIDQuOCA/Cj4KPiBzb3VyY2VyeS1hcm0qLmNvbmZpZyB1c2Vz
IHRoZSBDb2RlU291cmNlcnkgdG9vbGNoYWluIHdoaWNoIGhhcyBnY2MgNC44LCBzbyB5ZXMKPiB3
ZSBzaG91bGQgYmUgdGVzdGluZyBpdCB3aXRoIGdjYyA0LjguLi4KSGVyZSBpcyB0aGUgZmlyc3Qg
YnVpbGQgZmFpbHVyZSB3aXRoIGdjYyA0Ljg6Cmh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9y
Zy9yZXN1bHRzLzllNy85ZTc4NjhiZTAwZjJjZDE4MjA1YjJjZTY2NGJlOTVmOGI5ZTJiMDYzL2J1
aWxkLWVuZC5sb2cKPgo+ICAgUmVnYXJkcywKPiAgIEFybm91dApCZXN0IFJlZ2FyZHMsCgpGYWJy
aWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
