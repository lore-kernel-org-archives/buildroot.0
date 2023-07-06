Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98749EB64DC
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 10:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C9A540550;
	Thu,  6 Jul 2023 10:57:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C9A540550
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3cHHZunWGAnm; Thu,  6 Jul 2023 10:57:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25E514018F;
	Thu,  6 Jul 2023 10:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25E514018F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D96901BF28A
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 10:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B30E9402A7
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 10:57:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B30E9402A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0O0MQuxESmUk for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 10:57:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D24D4027F
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D24D4027F
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 10:57:13 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fbac8b01b3so15092095e9.1
 for <buildroot@buildroot.org>; Thu, 06 Jul 2023 03:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688641031; x=1691233031;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o0hQFxdpDvsPg/uQ7bF4VGDeYwAjZf6Fzf2Er5Q6kus=;
 b=TO80Hl7sXw5gSjjNyajyuPjfqYsnChvdfJBIq+oD1u0/tJ/+knvOxE78V4f43pzf42
 A00K0s8HsOWjV+0hi/SsaBldxLQi0hrJ8CLqKfrrRI7HkoVQZ49Wjuq5bz6VCvyPXbcA
 I41aQoVkjP/PMh5kPM+szk2fJfwbKS1XENXQuibVGolOokjhkK8bdIKmKcyC31JH+0Cj
 Lda7OFimaqsg51fNbHNc29tlYO5Zktj5ynbSKWD/Fgavxw3YCnDt1vqx+ZbptKCuJHmm
 42dpFpnitLfzQTmZSiPwrFq0A6/OLaPmmONSGJeEFJvNx2Ba44rR9nQKQkHz/XSh2nVa
 eDcg==
X-Gm-Message-State: ABy/qLZOEaw9ettWjSf0NLjs8kD+ufR7eICQRWdY/qlBwZ4xzRDzKhw1
 S6swMlTdPdQkspDZ0GrIIrQP8l2LTET9MAEFbmr/vngJdvXxQrFGBtWxUQ==
X-Google-Smtp-Source: APBJJlG64Av6aCO6fPn/icO9IJ5OFLTAihixJxsYV/N8ibpBIbXzbAKAJ0VmkWN7vexPAL3NoUuNGrjrTz/T02TOK4Q=
X-Received: by 2002:a05:600c:3c86:b0:3fb:c257:9f48 with SMTP id
 bg6-20020a05600c3c8600b003fbc2579f48mr4723945wmb.16.1688641031076; Thu, 06
 Jul 2023 03:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230706105347.229550-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20230706105347.229550-1-dario.binacchi@amarulasolutions.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 6 Jul 2023 12:57:00 +0200
Message-ID: <CAOf5uwkVur=+EDyJxGRaHRUJWo=gi3L7fDxM5s+kdi88zcNPig@mail.gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1688641031; x=1691233031;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o0hQFxdpDvsPg/uQ7bF4VGDeYwAjZf6Fzf2Er5Q6kus=;
 b=FYyUubYG8076V6f/NlaJEnxI9xgu+eS0Rqu8Pad3QMih2Ri/QVJDDLSnt+T/dBeuVQ
 9VCnqQSTbEGP/PaQKvSZwnVEcqrjX4BfKwe9E7Bfh48GVPJ7Qsf7G2oohahZX1CxpBM4
 BvMjpirC8dgA9y/d9uL7FZtMcZ8VsNhMITIzo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=FYyUubYG
Subject: Re: [Buildroot] [PATCH 1/1] board/bsh/imx8mn-bsh-smm-s2/readme.txt:
 fix typo
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
Cc: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBKdWwgNiwgMjAyMyBhdCAxMjo1M+KAr1BNIERhcmlvIEJpbmFjY2hpCjxkYXJpby5i
aW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiBJdCB3YXMgYSBsZWZ0b3Zl
ciBmcm9tIHRoZSBjb3B5LWFuZC1wYXN0ZSBvZiB0aGUgcmVhZG1lLnR4dCBmaWxlIG9mIGl0cwo+
IGFsbW9zdCB0d2luIHNpc3RlciBCU0ggU01NIFMyIFBSTy4KPgo+IFNpZ25lZC1vZmYtYnk6IERh
cmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiAtLS0K
PiAgYm9hcmQvYnNoL2lteDhtbi1ic2gtc21tLXMyL3JlYWRtZS50eHQgfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBh
L2JvYXJkL2JzaC9pbXg4bW4tYnNoLXNtbS1zMi9yZWFkbWUudHh0IGIvYm9hcmQvYnNoL2lteDht
bi1ic2gtc21tLXMyL3JlYWRtZS50eHQKPiBpbmRleCAzNzA4MTA5MWU4NDkuLjZiOGNkMDMxOTkw
NyAxMDA2NDQKPiAtLS0gYS9ib2FyZC9ic2gvaW14OG1uLWJzaC1zbW0tczIvcmVhZG1lLnR4dAo+
ICsrKyBiL2JvYXJkL2JzaC9pbXg4bW4tYnNoLXNtbS1zMi9yZWFkbWUudHh0Cj4gQEAgLTIsNyAr
Miw3IEBAIGkuTVg4TU4gQlNIIFNNTSBTMgo+ICA9PT09PT09PT09PT09PT09PT0KPgo+ICBUaGlz
IHR1dG9yaWFsIGRlc2NyaWJlcyBob3cgdG8gdXNlIHRoZSBwcmVkZWZpbmVkIEJ1aWxkcm9vdAo+
IC1jb25maWd1cmF0aW9uIGZvciB0aGUgaS5NWDhNTiBCU0ggU01NIFMyIFBSTyBib2FyZC4KPiAr
Y29uZmlndXJhdGlvbiBmb3IgdGhlIGkuTVg4TU4gQlNIIFNNTSBTMiBib2FyZC4KClJldmlld2Vk
LWJ5OiBNaWNoYWVsIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4KCj4K
PiAgQnVpbGRpbmcKPiAgLS0tLS0tLS0KPiAtLQo+IDIuMzIuMAo+CgoKLS0gCk1pY2hhZWwgTmF6
emFyZW5vIFRyaW1hcmNoaQpDby1Gb3VuZGVyICYgQ2hpZWYgRXhlY3V0aXZlIE9mZmljZXIKTS4g
KzM5IDM0NyA5MTMgMjE3MAptaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KCkFtYXJ1bGEgU29sdXRpb25zIEJWCkpvb3AgR2Vlc2lu
a3dlZyAxMjUsIDExMTQgQUIsIEFtc3RlcmRhbSwgTkwKVC4gKzMxICgwKTg1IDExMSA5MTcyCmlu
Zm9AYW1hcnVsYXNvbHV0aW9ucy5jb20Kd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
