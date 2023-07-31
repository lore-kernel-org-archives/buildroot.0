Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F71C001DF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 22:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92E7240C04;
	Mon, 31 Jul 2023 22:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92E7240C04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dhzbGkAIIeLg; Mon, 31 Jul 2023 22:07:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96B5740BD6;
	Mon, 31 Jul 2023 22:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96B5740BD6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43DF81BF369
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D569E600BA
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:07:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D569E600BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fIpnUJs2UDMK for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 22:07:46 +0000 (UTC)
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A45B5606EC
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 22:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A45B5606EC
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1bf0a1134d6so143568fac.3
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 15:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690841265; x=1691446065;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bbnEjXo8ZpilPC8H2xHjk4R13xcTsiUlOBG8W5Fwzlw=;
 b=PnhUvvCZbfECA/pc9RFdBfwPHY2q9RY8FPU01NxPdREoP150QuH+NUhc961Ch41rsZ
 3xphOsDTNBpedMnKjiYQYP6HlidbJcgpA1lo0JDrHkg70IDz+DwqGBvxh1vmNChfDU2n
 XUJDFQ6BG2joWpdEHftpTNM1dSwRTaLbEnST5ulYMhKvjrfnLke2051Ja6ZGl8Iafbmo
 QEolSZnPRcmJ4SMlzcwR0sdUgQuus5wlUGIpqwNGun9GaHelwRjl2GLwCMZbhe2g75v8
 1kVq+3RcxQHncxa1FmlAWjg3xbtm8psWCESMv2ZVsPUhwYMmwfO+Bqg0tGuvyDDkdUw6
 jvjQ==
X-Gm-Message-State: ABy/qLZIFBmSOLNDZxxhdqyUo1nuAxD7dUXWP/jcIAbS7bjeZE3U4w5Z
 2kQeTl2E3DCmd7XBKPxgT7g/hzJXpLRif1XUoLQ=
X-Google-Smtp-Source: APBJJlHjKJC2lkeS/1hvFaoV7C6jxYhygIN4PAr4Vyida6PP7kht6Y3/rvCwkdliQaDfwD0uaoDTx3MIAGqGuYA29XM=
X-Received: by 2002:a05:6870:41cc:b0:1b3:caa2:eedb with SMTP id
 z12-20020a05687041cc00b001b3caa2eedbmr12411376oac.44.1690841265597; Mon, 31
 Jul 2023 15:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230731214559.99648-1-james.hilliard1@gmail.com>
 <20230731235737.3a0eb6a5@windsurf>
In-Reply-To: <20230731235737.3a0eb6a5@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 31 Jul 2023 16:07:33 -0600
Message-ID: <CADvTj4qq-3JtTv4HgCEFZgNLVFgfshyDRs+zFH0+sG252xNQ-g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690841265; x=1691446065;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bbnEjXo8ZpilPC8H2xHjk4R13xcTsiUlOBG8W5Fwzlw=;
 b=EYB+plvpOsdoGHQuUyrGjDPu3tdjwcoIU4xUnupyVA3dkW7YU0D8u+pjh6V/PsszKA
 Piu7eOvodC8eVkFPks0Lpir5DMbDOjdUkDZQZmvvYxCxQ+iIpwEokzmfl5O8qeHiEIqO
 4egDRMeMRChDcR6i66rOlp5J7je9fsSPAVWnD3noWajqIV9bbqYS82T5OJFfg0quJDhx
 vshtH4g/lCdCi1yzoyilsGQkBJ8NuQXJd1O4215FcimRy/Lpw4CooJ5Zw/B96pBhT0oe
 xA8NuIPRwEWWTAo/BY39QTMuH4qGbQKdDdy13RLzNmuwTw9zbxfytVlm7NLKh0VGUVwL
 zMrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=EYB+plvp
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: select kdb
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
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBKdWwgMzEsIDIwMjMgYXQgMzo1N+KAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gSmFtZXMsCj4KPiBPbiBN
b24sIDMxIEp1bCAyMDIzIDE1OjQ1OjU5IC0wNjAwCj4gSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBXZSBuZWVkIHRvIHNlbGVjdCBCUjJfUEFD
S0FHRV9LQkQgd2hlbiBidWlsZGluZyBzeXN0ZW1kIHdpdGggdmNvbnNvbGUuCj4gPgo+ID4gRml4
ZXM6Cj4gPiBzeXN0ZW1kLXZjb25zb2xlLXNldHVwWzEyOV06IC91c3IvYmluL2xvYWRrZXlzIGZh
aWxlZCB3aXRoIGV4aXQgc3RhdHVzIDEuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGls
bGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4KPiBTYW1lIHF1ZXN0aW9uIGFzIGFs
d2F5czogc2luY2Ugd2hlbiBpcyB0aGlzIG5lZWRlZD8gSSBzdXBwb3NlIHNpbmNlCj4gY29tbWl0
IDM2ZDI3NWY2OTU5MzZiN2E1NDczOGMwMzU0NTcyOTQ0YzFmMDhkODcgKCJwYWNrYWdlL3N5c3Rl
bWQ6IGJ1bXAKPiB0byB2ZXJzaW9uIDI1NCIpLCBidXQgSSBkb24ndCBrbm93LCBhbmQgUGV0ZXIg
d2lsbCBoYXZlIGFuIGV2ZW4gaGFyZGVyCj4gdGltZSBmaWd1cmluZyB0aGlzIG91dCB3aGVuIGhl
IHdpbGwgdHJ5IHRvIGZpZ3VyZSBvdXQgd2hpY2ggY29tbWl0cyBpbgo+IG1hc3RlciBuZWVkIHRv
IGJlIGJhY2twb3J0ZWQgdG8gdGhlIHN0YWJsZSBicmFuY2guCgpJdCBsb29rcyBsaWtlIGl0IHNo
b3VsZCBiZSBiYWNrcG9ydGVkLCBJIGxvb2tlZCBhdCB0aGUgY29kZSBhbmQgZm91bmQgbm8gb2J2
aW91cwpyZWFzb24gd2h5IGl0IHNob3VsZCBoYXZlIHdvcmtlZCBwcmV2aW91c2x5IHdpdGhvdXQg
a2RiLgoKPgo+IFRoYW5rcyEKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28t
b3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5l
ZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
