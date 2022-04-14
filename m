Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9DCC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 16:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2493481919;
	Thu, 14 Apr 2022 16:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Fv86a-OJ1vY; Thu, 14 Apr 2022 16:44:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CA928186E;
	Thu, 14 Apr 2022 16:44:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 249BB1BF34D
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 16:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2067A403E0
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 16:44:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vIwmTFvjMUBq for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 16:44:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 343D840187
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 16:44:19 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-e2442907a1so5806066fac.8
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 09:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1411o/stbSgTdx/BNmf9PdLtjUlrdQvSFrkXZVqIrm8=;
 b=FybSVmPEISyxFiIqGGFoSEZiqjKaBHopFmSdavghLlVfQvNbVn2oRIdnRsOXPtv5fm
 dehVfhU4peGMDPKxi/uJRg7gIukoyR7BPJ2KaJS/k/vGBHar1C0zoRKDWf4XAhVnKDpI
 6fAwsJkqM1vUY/b9Lh+mP4zmDCOLh0gRiDWpwK9GtM0d3OGElQLzLiQMtxdy+ra9u48n
 3AXM34AUJZ++WMq2hlCr2dTpVKXyjUUCb3r/wsC3vBLG1iawTC4EJH+IDOrlJQ/Vg+C6
 DZ2w0BmWVFJ1qrXJYPRmoCihbj3gx4fLsGZ5cH1n+cMg/JT6rxScWGjHp9S/b2RYbCAE
 O9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1411o/stbSgTdx/BNmf9PdLtjUlrdQvSFrkXZVqIrm8=;
 b=szi0vZhHShl2rinNIAyKTVyNZZ8qSN7aKKrFEX2GPZg4pn0qkyAYdiRQz8KjI5a5t2
 8CYV25ItJVMF9rixcldMwJh8DVgYn6MCem0/76UVXaAs1hnKPy/Z+ye6zky9GH3rZ1pd
 zRgO9FYZHRhxNOmg3XswRkHTWO05hMDuKkOAki7vPVi72QBP8Og+QIT0oeBGaPbI6uii
 3sIKUTh9ZwH9gJjITfTPDOa40EURX4IByFS7/zPW06VvpQUdCr4rc4w83ckygdr2Ox0t
 0dV+l8MFlmsM6QQP5r6S7E7RFteRmdvKdhd9jzCOW5erzNYiBi9hSTMN+vcXQkfue4sc
 IVpQ==
X-Gm-Message-State: AOAM532Fpg90ad4RR8hyMuSo2ZFjgQsdHX9NFLMLrLWKNBrGDaMy8Ekb
 dqlvGWAqUweGm8lqa4A5GNVoeMWliEfn2xW/L7E=
X-Google-Smtp-Source: ABdhPJwI3lVox/6uYRUEBMFm13g84CN7OZJNp6ldilZWDE8pD9LvlMJhm1dPbRS1wlK7w/TI0MUOZxJpFmS0Zz5mltA=
X-Received: by 2002:a05:6870:d28d:b0:da:b3f:3234 with SMTP id
 d13-20020a056870d28d00b000da0b3f3234mr1630116oae.228.1649954658148; Thu, 14
 Apr 2022 09:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220403100318.2581647-1-fontaine.fabrice@gmail.com>
 <8735ims60b.fsf@dell.be.48ers.dk>
 <d1a1ead3-98a8-35fe-4c4c-e7fd3f02e058@microchip.com>
 <CAPi7W81VbAArhoyDEJrNMeseVXgmJzu2+K39njx1j5y3_5mb5g@mail.gmail.com>
 <8735iifser.fsf@dell.be.48ers.dk>
 <34fddc8f-8710-65f9-330d-81fefe64354a@microchip.com>
 <87y20aeb04.fsf@dell.be.48ers.dk>
 <CAPi7W83dikm9d7KWjKfqYwr7mP3U4WzAzdw6iLF6gmOkTgwB-Q@mail.gmail.com>
 <8d53da79-2a90-8649-6f46-22b33b7bdbe5@microchip.com>
 <87bkx5crop.fsf@dell.be.48ers.dk>
 <d864ae21-b68f-b30b-ce07-cd66b473e4f9@microchip.com>
 <CAPi7W82XAg4jMw6z5LR=rg-HoZGBbfDC13XbpXtr0hppW92QEw@mail.gmail.com>
In-Reply-To: <CAPi7W82XAg4jMw6z5LR=rg-HoZGBbfDC13XbpXtr0hppW92QEw@mail.gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 14 Apr 2022 18:44:06 +0200
Message-ID: <CAPi7W83uC=WLeMufRy9OC2G2m61BtUu1v_KX-nuiUBRFTwd8sQ@mail.gmail.com>
To: Eugen.Hristev@microchip.com
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgamV1LiAxNCBhdnIuIDIwMjIgw6AgMTE6NTksIEZhYnJpY2UgRm9udGFpbmUKPGZvbnRhaW5l
LmZhYnJpY2VAZ21haWwuY29tPiBhIMOpY3JpdCA6Cj4KPiBIZWxsbyBFdWdlbiwKPgo+IExlIGpl
dS4gMTQgYXZyLiAyMDIyIMOgIDExOjEwLCA8RXVnZW4uSHJpc3RldkBtaWNyb2NoaXAuY29tPiBh
IMOpY3JpdCA6Cj4gPgo+ID4gT24gNC8xMy8yMiAxMToyOSBBTSwgUGV0ZXIgS29yc2dhYXJkIHdy
b3RlOgo+ID4gPj4+Pj4+ICAgIDxFdWdlbi5IcmlzdGV2QG1pY3JvY2hpcC5jb20+IHdyaXRlczoK
PiA+ID4KPiA+ID4gICA+IE9uIDQvMTIvMjIgOToxNyBQTSwgRmFicmljZSBGb250YWluZSB3cm90
ZToKPiA+ID4gICA+PiBMZSBtYXIuIDEyIGF2ci4gMjAyMiDDoCAxNDozNCwgUGV0ZXIgS29yc2dh
YXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiBhIMOpY3JpdCA6Cj4gPiA+ICAgPj4+Cj4gPiA+ICAg
Pj4+Pj4+Pj4gPEV1Z2VuLkhyaXN0ZXZAbWljcm9jaGlwLmNvbT4gd3JpdGVzOgo+ID4gPiAgID4+
Pgo+ID4gPiAgID4+PiBIaSwKPiA+ID4gICA+Pj4KPiA+ID4gICA+Pj4gPj4gWWVhaC4gRXVnZW4s
IGlzIHRoZXJlIGFueSBzcGVjaWZpYyByZWFzb24gd2h5IHlvdSB1c2UgdGhlIGRoY3AgcGFja2Fn
ZQo+ID4gPiAgID4+PiA+PiBvdmVyIHRoZSBvdGhlciBESENQIGNsaWVudHMgd2UgcHJvdmlkZT8K
PiA+ID4gICA+Pj4KPiA+ID4gICA+Pj4gPiBIaXN0b3JpY2FsIHJlYXNvbnMsIGFuZCB0aGUgZmFj
dCB0aGF0IHBlb3BsZSBoYXZlIHdvcmtpbmcgY29uZmlndXJhdGlvbnMKPiA+ID4gICA+Pj4gPiB1
c2luZyB0aGlzIHBhY2thZ2UuLi4gSSB3YXMgdW5hd2FyZSB0aGF0IGl0IHdhcyBkdWUgdG8gYmUg
cmVtb3ZlZC4KPiA+ID4gICA+Pj4gPiBXZSB3aWxsIHRyeSB0byBzd2l0Y2ggdG8gYSBkaWZmZXJl
bnQgcGFja2FnZSBpbiB0aGUgZnV0dXJlLiBUaGFua3MgZm9yCj4gPiA+ICAgPj4+ID4gbGV0dGlu
ZyBtZSBrbm93Lgo+ID4gPiAgID4+PiA+IEhvd2V2ZXIsIGlmIHRoZSBwYWNrYWdlIGlzIHN0aWxs
IGluIHRoaXMgYnVpbGRyb290IHJlbGVhc2UsIGl0IGhhcyB0bwo+ID4gPiAgID4+PiA+IHdvcmsg
cmlnaHQgPwo+ID4gPiAgID4+Pgo+ID4gPiAgID4+PiBZZXMsIHRoYXQgaXMgdGhlIGlkZWEuIElm
IGl0IGlzIGRlYWQgdXBzdHJlYW0gYW5kIGhhcmQgdG8gZml4IHRoZW4gdGhhdAo+ID4gPiAgID4+
PiBuYXR1cmFsbHkgbWFrZXMgaXQgaGFyZGVyIHRvIGRvLCBidXQgdGhlIGludGVudGlvbiBpcyB0
byBmaXggaXQuCj4gPiA+ICAgPj4KPiA+ID4gICA+PiBUaGUgZm9sbG93aW5nIHBhdGNoIHNob3Vs
ZCBmaXggdGhlIGlzc3VlOgo+ID4gPiAgID4+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMjA0MTIxODE2MDcuMTQ1MTU4MC0xLWZvbnRhaW5l
LmZhYnJpY2VAZ21haWwuY29tLwo+ID4gPgo+ID4gPiAgID4gSGksCj4gPiA+Cj4gPiA+ICAgPiB5
b3VyIHBhdGNoIHRvZ2V0aGVyIHdpdGggdGhlIG90aGVyIG9uZSAoCj4gPiA+ICAgPiBodHRwczov
L3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoL0RVMFAyNTFNQjA3
Nzk3Q0FBRTgwQzk4NURDODk3NjMzNUUzRTc5QERVMFAyNTFNQjA3NzkuRVVSUDI1MS5QUk9ELk9V
VExPT0suQ09NLwo+ID4gPiAgID4gKSwKPiA+ID4KPiA+ID4gICA+IHNvbHZlIHRoZSBidWlsZCBw
cm9ibGVtIGZvciB0aGlzIHBhY2thZ2UuCj4gPiA+Cj4gPiA+IFRoZXkgYXJlIG5vdyBib3RoIGFk
ZGVkIHRvIHRoZSAyMDIyLjAyLnggYnJhbmNoLCB0aGFua3MuCj4gPiA+Cj4gPiA+IC0tCj4gPiA+
IEJ5ZSwgUGV0ZXIgS29yc2dhYXJkCj4gPiA+Cj4gPgo+ID4gSGVsbG8gYWdhaW4gRmFicmljZSwK
PiA+Cj4gPiBBZnRlciBtYW5hZ2luZyB0byBzdWNjZXNzZnVsbHkgYnVpbGQgYWxsIG91ciBkZWZj
b25maWdzIG5vdywgd2hpbGUKPiA+IHRlc3Rpbmcgb24gYW5vdGhlciBib2FyZCAoc2FtYTdnNWVr
KSwgSSBub3RpY2VkIHRoaXMgbWVzc2FnZSBhdCBib290IGxvZyA6Cj4gPgo+ID4gU3RhcnRpbmcg
REhDUCBzZXJ2ZXI6IC91c3Ivc2Jpbi9kaGNwZDogZXJyb3Igd2hpbGUgbG9hZGluZyBzaGFyZWQK
PiA+IGxpYnJhcmllczogbGliaXJzLnNvLjE2MTogY2Fubm90IG9wZW4gc2hhcmVkIG9iamVjdCBm
aWxlOiBObyBzdWNoIGZpbGUKPiA+IG9yIGRpcmVjdG9yeQo+ID4KPiA+IERpZ2dpbmcgeWllbGRz
IHRoYXQgbGliaXJzIGlzIHBhcnQgb2YgYmluZCBwYWNrYWdlLiBEbyB5b3Uga25vdyB3aHkgdGhp
cwo+ID4gaGFwcGVucyBhbmQgd2hhdCBjb3VsZCBiZSB0aGUgY2F1c2U/IENvdWxkIGxhdGVzdCBw
YXRjaGVzIGFmZmVjdCB0aGUgZGhjcGQgPwo+Cj4gSW5kZWVkLCB0aGUgaW50ZXJuYWwgYmluZCBs
aWJyYXJpZXMgKGluY2x1ZGluZyBsaWJpcnMuc28uMTYxKSBhcmUKPiBjb3JyZWN0bHkgaW5zdGFs
bGVkIGluIHN0YWdpbmcgZGlyZWN0b3J5IGJ1dCBub3QgaW4gdGhlIHRhcmdldAo+IGRpcmVjdG9y
eSBiZWNhdXNlIGRoY3AubWsgaXMgb3ZlcnJpZGluZyBESENQX0lOU1RBTExfVEFSR0VUX0NNRFMu
Cj4gSSdsbCBzZW5kIGEgcGF0Y2ggYnkgdGhlIGVuZCBvZiB0aGUgZGF5LgoKVGhlIGZvbGxvd2lu
ZyBwYXRjaCBzaG91bGQgZml4IHRoZSBpc3N1ZToKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9y
Zy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMDQxNDE2NDEwOS4xNzI0ODczLTEtZm9udGFp
bmUuZmFicmljZUBnbWFpbC5jb20vCgo+Cj4gPgo+ID4gVGhhbmtzICEKPiA+IEV1Z2VuCj4KPiBC
ZXN0IFJlZ2FyZHMsCj4KPiBGYWJyaWNlCgpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
