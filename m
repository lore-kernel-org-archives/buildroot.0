Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F0DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 22:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AA1641A00;
	Sun, 29 May 2022 22:20:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qj9agHLXbSAy; Sun, 29 May 2022 22:20:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0275419F2;
	Sun, 29 May 2022 22:20:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 605811BF2CE
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 22:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F2D8840B6
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 22:20:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ahPMn5je1759 for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 22:20:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70C1E840B0
 for <buildroot@buildroot.org>; Sun, 29 May 2022 22:20:31 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-f16a3e0529so12232777fac.2
 for <buildroot@buildroot.org>; Sun, 29 May 2022 15:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AeIzCRFIWHDvgpbzmi8R6AVmT8+oOrJkU1DztHIOiiw=;
 b=jrSjoMMPQoKS8H6wKxlF9LsNZucOeTT7dKNZOhddumf0+gIZKeudzXPGC7fwDPu1Gy
 THYvoQ5P74N9hQkNqdnpsTge5s9V96lNQRHAtDdmughrj/LMNiITcMVlsQtEySF1woG8
 L9kq8jkNGbn/piIJl4+4jRgDErCOrfCXJkoh10vefkmnKvCvvQpHonibR2ha02NkwDfr
 KbGApQ7y1VOEemdcfm40DTONpaRJDqF6O1yFZJjDRHcSSGFUBBUphx6vZ9lJ8aUR1x9W
 m/hr81EYVR+14I1RU7TE+i9fjndlJtOxUL4cckzhY2US3XM3dsgM7clRIGcD4Fei1s/V
 emLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AeIzCRFIWHDvgpbzmi8R6AVmT8+oOrJkU1DztHIOiiw=;
 b=zojDxRIynvHq6so6ZcFgQW5M4yB/4i4QlarrvS6e6UCFoJsMj5rKXX81MyE9dDJ6h2
 64FdMF0Nrz9jUmAAYf2hYTRKLLU9lTHJAeguelP9Ouk1Llyn2HpWnDyZOoifD4unW5k9
 J5+GUDVFWFAVXRDzHF3FbZscIfJJQw5DvY4bgcz1ffaa4gR48fxFRhZknmQHsvGvj8XI
 wVt90wpPr/YAg5UeeUflWMdLHIJkCWTBTChw/jBHTsciGQZiQdWRIB+z7MkvzR9JQXDl
 wu984a5xBZaKi7qfNtHnrJIh/47LztvEbheyq3fDTXwMKDla8ST9cMdze69yFpshwTj9
 KSGw==
X-Gm-Message-State: AOAM5318fq9A8+lWH1gc0+5f9G8/oZ3AqJxxeNigNdtbYEHFNMaGP9nk
 EvDLGtZbfWeP1l3MTu43YfHjc+ObZgiCflaA0BNEvReAS8E=
X-Google-Smtp-Source: ABdhPJxCx7HoEOemtpTTCh4d+aYBq0iKt/KnFYEqepKjkir5LFS7ImdcSxHz4UgR8GAMVy5I6h7gvha3vxra3I4gelk=
X-Received: by 2002:a05:6870:d0ce:b0:f3:3856:f552 with SMTP id
 k14-20020a056870d0ce00b000f33856f552mr695195oaa.99.1653862830444; Sun, 29 May
 2022 15:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220517200923.1516695-1-james.hilliard1@gmail.com>
 <7585dcea-4e32-a582-e138-e7e225609398@gmail.com>
 <CADvTj4re+hCC9n=HRMsLQ+SaEPPH=XBkCG83mTp_U79rr9Nvyg@mail.gmail.com>
 <e3350a95-d9ca-8d7d-0f48-22c86289a3db@gmail.com>
 <CADvTj4rWQx=g3MK6AoV7bbRS7ZOA4K7SMR2Qb+OhaOdX4y8odg@mail.gmail.com>
 <20220529214657.GM993669@scaer>
In-Reply-To: <20220529214657.GM993669@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 29 May 2022 16:20:19 -0600
Message-ID: <CADvTj4rxnoRp-ZZPhfB2ANhw3+294F97A2smcmhULR4WfDsqrg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask: bump to version
 2.1.2
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
Cc: Romain Naour <romain.naour@gmail.com>, Lionel Flandrin <lionel@svkt.org>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBNYXkgMjksIDIwMjIgYXQgMzo0NyBQTSBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmlu
LjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4KPiBKYW1lcywgQWxsLAo+Cj4gT24gMjAyMi0wNS0yOSAx
NDoxNyAtMDYwMCwgSmFtZXMgSGlsbGlhcmQgc3Bha2UgdGh1c2x5Ogo+ID4gT24gU3VuLCBNYXkg
MjksIDIwMjIsIDE6NTMgUE0gUm9tYWluIE5hb3VyIDwgWzFdcm9tYWluLm5hb3VyQGdtYWlsLmNv
bT4gd3JvdGU6Cj4gPiAgIExlIDI5LzA1LzIwMjIgw6AgMjE6NDEsIEphbWVzIEhpbGxpYXJkIGEg
w6ljcml0IDoKPiA+ICAgPiBPbiBTdW4sIE1heSAyOSwgMjAyMiwgMToyOSBQTSBSb21haW4gTmFv
dXIgPCBbMl1yb21haW4ubmFvdXJAZ21haWwuY29tCj4gPiAgID4gPG1haWx0bzogWzNdcm9tYWlu
Lm5hb3VyQGdtYWlsLmNvbT4+IHdyb3RlOgo+IFstLVNOSVAtLV0KPiA+ICAgPiAgICAgRG8geW91
IGtub3cgaWYgYnVtcGluZyBweXRob24tZmxhc2ggYW5kIHB5dGhvbi13ZXJremV1ZyBtYXkgaW50
cm9kdWNlIG90aGVyCj4gPiAgID4gICAgIHJ1bnRpbWUgaXNzdWU/IElzIGFueSBmb2xsb3d1cCB2
ZXJzaW9uIGJ1bXAgcmVxdWlyZWQ/Cj4gPiAgID4gSSBzZW50IGEgZmV3IHB5dGhvbiBwYWNrYWdl
IGJ1bXBzIHRoYXQgc2hvdWxkIGZpeCBpdC4KPiA+ICAgT2ssIGJ1dCBpdCdzIG5vdCBleHBsaWNp
dGx5IHN0YXRlZCBpZiBpdCdzIGludGVuZGVkIGZvciBtYXN0ZXIgKHVwY29taW5nCj4gPiAgIDIw
MjIuMDUpIG9yIG5leHQgYnJhbmNoLgo+ID4gICBDYW4geW91IGxpc3Qgd2hpY2ggcGF0Y2ggbXVz
dCBiZSBtZXJnZWQgaW4gbWFzdGVyPwo+ID4gSSB0aGluayBhbGwgbXkgcHl0aG9uIHBhdGNoZXMg
dGhhdCB3ZXJlIHNlbnQgaW4gdGhlIDE3dGg6Cj4gPiBbNl1odHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xpc3QvP3N1Ym1pdHRlcj02NjMwMQo+Cj4gV2Ugd2Vy
ZSByZWFsbHkgbGF0ZSBpbiB0aGlzIGN5Y2xlLCBidXQgcmMxIHdhcyB0YWdnZWQgb24gdGhlIDE4
dGgsIGp1c3QKPiBhIGRheSBhZnRlciB5b3Ugc2VudCB5b3VyIHB5dGhvbiBidW1wcywgc28gdGhl
eSBjb3VsZCBub3QgYWxsIGJlCj4gYXBwbGllZCwgZXhjZXB0IGZvciBweXRob24tZmxhc2sgYW5k
IHB5dGhvbi13ZXJremV1ZyB3aGljaCBkbyBmaXggYQo+IHJ1bnRpbWUgdGVzdC4KPgo+IElmIHRo
ZSByZXN0IGFyZSByZWxhdGVkIHRvIHRoZSBmbGFzayBhbmQgd2Vya3pldWcgYW5kIG5lZWQgdG8g
YmUgdXBkYXRlZAo+IHRvZ2V0aGVyIGluIGxvY2stc3RlcCwgdGhlbiB0aGV5IHNob3VsZCBoYXZl
IGJlZW4gZ3JvdXBlZCBpbiBhIHNlcmllcwo+IHRvZ2V0aGVyLgoKWWVhaCwgdGhlIGluZGl2aWR1
YWwgYnVtcHMgd2VyZSBmb3Igc3R1ZmYgdGhhdCB3YXMgYnJva2VuIGFscmVhZHkgZHVlIHRvCnB5
eWFtbCBicmVha2FnZSBzbyB3YXMgYSBsaXR0bGUgdG9vIGxhdGUgYnkgdGhhdCBwb2ludCB0byBk
byBhIHByb3BlciBzZXJpZXMKc2luY2UgZXZlcnl0aGluZyBmbGFzayByZWxhdGVkIHdhcyBraW5k
YSBhbHJlYWR5IGJyb2tlbi4KCkkgZGlkIGEgc2VyaWVzIGZvciBweXRob24tZmxhc2stanNvbnJw
YyB3aGljaCBmaXhlcyBjb21wYXRpYmlsaXR5IHdpdGggdGhlCm5ld2VyIGZsYXNrIHZlcnNpb246
Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvbGlzdC8/c2Vy
aWVzPTMwMDc0NQoKVGhlc2UgYXJlIHJldmVyc2UgZGVwIGJ1bXBzIG5lZWRlZCBmb3IgY29tcGF0
aWJpbGl0eSB3aXRoIGxhdGVzdApweXRob24tZmxhc2s6Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFi
cy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMjA1MTcyMDI0MjIuMTUyMjU3NC0xLWph
bWVzLmhpbGxpYXJkMUBnbWFpbC5jb20vCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJv
amVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMjA1MTcyMDI4MDUuMTUyNDUwMS0xLWphbWVzLmhpbGxp
YXJkMUBnbWFpbC5jb20vCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWls
ZHJvb3QvcGF0Y2gvMjAyMjA1MTcyMDMyMzUuMTUyNTk5OC0xLWphbWVzLmhpbGxpYXJkMUBnbWFp
bC5jb20vCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0
Y2gvMjAyMjA1MTcyMjAyNTMuMTU1NDA4OC0xLWphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20vCgpJ
IHRoaW5rIHRoZXNlIGFyZSBhbGwgcGFydCBvZiB0aGUgcHl0aG9uLWZsYXNrIHVwZGF0ZSBkZXBl
bmRlbmN5IHRyZWUgYW5kCnNob3VsZCBiZSBhcHBsaWVkIGFzIHdlbGwgdG8gcHJldmVudCBwb3Rl
bnRpYWwgY29tcGF0aWJpbGl0eSBpc3N1ZXM6Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMjA1MTcyMDE1NTAuMTUxOTg4NC0xLWphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20vCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9i
dWlsZHJvb3QvcGF0Y2gvMjAyMjA1MTcyMDE5MTYuMTUyMTM5OC0xLWphbWVzLmhpbGxpYXJkMUBn
bWFpbC5jb20vCgo+Cj4gQW55d2F5LCBsZXQncyBzZWUgd2hhdCBvdXIgZ2l0bGFiLWNpIHBpcGVs
aW5lIHNob3dzIHdpdGgganVzdCBmbGFzayBhbmQKPiB3ZXJremV1Zy4KPgo+IFJlZ2FyZHMsCj4g
WWFubiBFLiBNT1JJTi4KPgo+IC0tCj4gLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5u
IEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmlj
cycgY29uc3BpcmFjeTogfAo+IHwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVy
IHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cj4gfCArMzMgNTYxIDA5
OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhl
cmUgaXMgbm8gIHwKPiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8g
XCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0t
LS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
