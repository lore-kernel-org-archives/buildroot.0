Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F079DC001DC
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 11:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96D7B40AA2;
	Sun, 23 Jul 2023 11:24:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96D7B40AA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rrqMKqx-Kxdp; Sun, 23 Jul 2023 11:24:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D74A840A96;
	Sun, 23 Jul 2023 11:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D74A840A96
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 001561BF3B9
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 11:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDF3681E86
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 11:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDF3681E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gNgRUqhEXaI1 for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 11:24:52 +0000 (UTC)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6ECA181E81
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 11:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ECA181E81
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b9540031acso47538811fa.3
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 04:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690111490; x=1690716290;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y2bDWChMY3upBydfQg/5hAsm4en68AjXUtNBDVCiY7M=;
 b=LyyAZzy4rpu+mnTZxUB6Yyvuw27eOt8rSmug21axZzUR7ScjIUoiHYBV6ZQkKxXjCH
 182mNTOHXpfrSYxD5q8GgiVVM8nNfTRKjTGfSXNrnpLa58X7vOexqwJ2JOiFUaQgQjIg
 JCvMA43eWTUnqO1XgzsQaSF7lvQaNGMV1a8fY0oWARHYSesAYdKfwSzxZ2vMghEah8zB
 k/9wpaI3QkUPYJrOfZRKs71/3gUT9vulYangGnrIvFRxf9KQg87RUe/Ikox9AV6dC+7r
 D2iPxZbPFTXjZCFf+ofRtPcOdvdHI0UIVgIC5EtdFKpOA52PrlRuxxKQy3yyc++wL0Tx
 2Jlw==
X-Gm-Message-State: ABy/qLZJwipQDBx/2y2H7ME/5XYSOQNeqmRPr6Lg2BM0stWynnVHhmLm
 D12WCeBju71Zf0Rd4z1gVJqx8ffENrIbdOrZHJU=
X-Google-Smtp-Source: APBJJlH6Xn6pYWvZdIySFvq7f17+rpQ0dWi6ifumUkOkMYCq+uI+JcrCl2NmG2kVtFswX7nIgaBZfHf5OaEhk6rww90=
X-Received: by 2002:a05:6512:553:b0:4fb:89e3:5ac6 with SMTP id
 h19-20020a056512055300b004fb89e35ac6mr3277886lfl.62.1690111489678; Sun, 23
 Jul 2023 04:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230717091727.2658078-1-yegorslists@googlemail.com>
 <20230718231951.349b78e0@windsurf>
In-Reply-To: <20230718231951.349b78e0@windsurf>
Date: Sun, 23 Jul 2023 13:24:38 +0200
Message-ID: <CAGm1_ku3nCqe7L0wRQCPLGTnifQYbD7ZD0DQdgk0r8xR9uZ01A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20221208; t=1690111490; x=1690716290;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y2bDWChMY3upBydfQg/5hAsm4en68AjXUtNBDVCiY7M=;
 b=XaX+Da8iNI8UqIPgGpQZhe2DHSQ+NQorvYNxE0MSApl4ssL0l78fsJ9UOXlxAM+IxU
 kQXpcMpcdJc92UJElO8rFvSXZgu3Dd2NeqbbwlbIQAFAQaaQZhCWWV/0WdEKWLfW18kQ
 Tv5Fpm+bwjiew7P4ZvtDFloCDelVJ82e/PPSwTHfzrisdnI1qQt+C8hfDpzyNy5Td7Ac
 KYPS3oGw7lP74+DlRmvsGaLJMnCV8/tzeFdaWSaGCHyRYgVUHIoIUxY07qi5SCR1uf1s
 bDz6Ma0GnvOxdh4yQfXLCK3j1kgaCESsf5mNwLL/82oQS0NussK+f9PpgKqAI7/SYoUh
 99XA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20221208 header.b=XaX+Da8i
Subject: Re: [Buildroot] [PATCH] package/python-pysmb: add the missing
 runtime dependency
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: james.hilliard1@gmail.com, Asaf Kahlon <asafka7@gmail.com>,
 yegorslists--- via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gVHVlLCBKdWwgMTgsIDIwMjMgYXQgMTE6MTnigK9QTSBUaG9tYXMgUGV0
YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IE9uIE1vbiwg
MTcgSnVsIDIwMjMgMTE6MTc6MjcgKzAyMDAKPiB5ZWdvcnNsaXN0cy0tLSB2aWEgYnVpbGRyb290
IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4KPiA+IEZyb206IFllZ29yIFllZnJl
bW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KPiA+Cj4gPiBweXRob24tdHFkbSBkZXBl
bmRlbmN5IHdhcyBpbnRyb2R1Y2VkIGluIDEuMi45Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFll
Z29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIHBh
Y2thZ2UvcHl0aG9uLXB5c21iL0NvbmZpZy5pbiB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQo+Cj4gQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4gV2VpcmQgdGhhdCB0
aGlzIGRlcGVuZGVuY3kgd2FzIG1hZGUgYQo+IG1hbmRhdG9yeSBkZXBlbmRlbmN5LCBpdCdzIGFw
cGFyZW50bHkgb25seSB1c2VkIHRvIGRpc3BsYXkgc29tZSBmYW5jeQo+IHByb2dyZXNzIGJhcnMu
Li4gc29mdHdhcmUgaXMgZ2V0dGluZyBibG9hdGVkIGF0IGEgdmVyeSBoaWdoIHNwZWVkIDovCgpJ
IHRvdGFsbHkgYWdyZWUgd2l0aCB5b3UgOi0oIEkndmUgc2VudCBhIHRlc3QgZm9yIHRoZSBweXNt
YiBwYWNrYWdlLgoKWWVnb3IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
