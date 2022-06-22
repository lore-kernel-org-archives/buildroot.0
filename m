Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F370DC43334
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 13:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50CDA41C7B;
	Wed, 22 Jun 2022 13:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50CDA41C7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XasSbvQnjdBg; Wed, 22 Jun 2022 13:01:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B0E641A1A;
	Wed, 22 Jun 2022 13:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B0E641A1A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 973621BF3EF
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 13:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7174E40012
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 13:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7174E40012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QZ_YscQDUAXJ for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 13:01:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC01B4053C
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC01B4053C
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 13:01:05 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-101ec2d6087so11868526fac.3
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 06:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Wrm2s0cGtgpnEeCB66Y4QB/whGPxeCo6AmQMRUC6nWk=;
 b=2gxOdx4DGSZGC2rKDfaPOc+2TUIB2k3p4vsYizfCsrRCogu7MxMKQlwEyKqgYlfaxv
 GSQHHTzmFAMYRmIMVKYabnevkDdOe5EA0InMBwvHJeh4rmN2yz4BI0ewQ5mhCC/6VNSq
 gfLiAyxq95IigzHWZ3EfAoZgUVCweHIKhAH18qr5N/A+o/OUx8u86RSgM2Vy5r/lyN00
 fJVdY1ESlZ0fM7ngSiuurAs/kVUskouvSpwvtPO4Cs81Ua6ilz55ZHcpTJegXgg58CdX
 ylITPaWTiN0hhG2oKeuUyJRC7ifJL4c48SEvZ9OSY3+m0i4xWZqyxKcqggfxXGCuoFRK
 Psvg==
X-Gm-Message-State: AJIora+WoiCKpykqLCgN3G5zpX4zS4N9uyy7gDp0Bj+yeH6otWU+cllO
 cNqBeCldhfUOAJ73chRYdMqKF7V6Mr6YX3is3E+8dg==
X-Google-Smtp-Source: AGRyM1uYCd6wZzTL0nTCbZ90WDsdrQIK+rlBbiAPpYCuETQIMfkTS9AHFuUS85N7pQAle2Sa0ejqG5lgjSPsgkCN9SQ=
X-Received: by 2002:a05:6870:51cb:b0:fb:5c97:bd1b with SMTP id
 b11-20020a05687051cb00b000fb5c97bd1bmr1988985oaj.104.1655902864203; Wed, 22
 Jun 2022 06:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220622083433.1201789-1-kory.maincent@bootlin.com>
 <CAN5uoS8OHpbtwOY8N0a0ECGO-7LU6VWA1v57ECTZBYNtnWWBXw@mail.gmail.com>
 <20220622143617.649fb05a@kmaincent-XPS-13-7390>
In-Reply-To: <20220622143617.649fb05a@kmaincent-XPS-13-7390>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Wed, 22 Jun 2022 15:00:53 +0200
Message-ID: <CAN5uoS-y5ni5mAr2esyoFpctPwpsQwEDU7eGowXGJqHVqBRy2A@mail.gmail.com>
To: =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Wrm2s0cGtgpnEeCB66Y4QB/whGPxeCo6AmQMRUC6nWk=;
 b=qsVhsM/Q40kljPGSZAXFanZ4xNArGc7dthvIbRXTbKBUo5jvUBb04NOFwr9wqqGtyX
 oJkz/yX3ML5Z5IckJn0kIWeNdPTeibVaMzn+VoAXxdoSJbQg7TkOiF+vCOOvlC+JLenU
 UB5igKeeBcFIbNWAfgQEdga5SUiWaaI7MgW6tbNBJvv3am3zlzsDFrQNHV9/wNqTrHfg
 E2WzGOaO1hjZeRNkdo5bYNvyhbNmBieAx9EG6n6qG3sUQQBwzTmtNcSM7vvg+sbJeaok
 ZElJMk6Fsx3FjtF2Th1jmVinwXDZDF4WitM2HTMnAY4Y/r9zV9ex7Q28lQRKFWgyF98m
 0qRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=qsVhsM/Q
Subject: Re: [Buildroot] [PATCH v2] boot/optee-os: add support for custom
 tarball URL
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAyMiBKdW4gMjAyMiBhdCAxNDozNiwgS8O2cnkgTWFpbmNlbnQgPGtvcnkubWFpbmNl
bnRAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gRXRpZW5uZSwKPgo+IE9uIFdlZCwgMjIg
SnVuIDIwMjIgMTI6Mjk6MDUgKzAyMDAKPiBFdGllbm5lIENhcnJpZXJlIDxldGllbm5lLmNhcnJp
ZXJlQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gPiA+ICtpZmVxICgkKEJSMl9UQVJHRVRfT1BURUVf
T1NfQ1VTVE9NX1RBUkJBTEwpLHkpCj4gPiA+ICtpZmVxICgkKGNhbGwgcXN0cmlwLCQoQlIyX1RB
UkdFVF9PUFRFRV9PU19DVVNUT01fVEFSQkFMTF9MT0NBVElPTikpLCkKPiA+Cj4gPiBIZXJlIHdl
IGV4cGVjdCBhIHRhcmJhbGwgZmlsZSBwYXRoLiBTaW5jZSB0aGUgY29uZmlnIHN3aXRjaCBpcyBk
ZWZhdWx0Cj4gPiBwb3B1bGF0ZWQgd2l0aCBhIHN0cmluZywgSSB0aGluayB0aGlzIHNob3VsZCB0
ZXN0IGZpbGUgcHJlc2VuY2UgcmF0aGVyCj4gPiB0aGFuIHN0cmluZyBleGlzdGVuY2U6Cj4KPiBO
bywgd2UgY2FuIGFsc28gdXNlIHRhcmJhbGwgd2ViIFVSTCwgdGhlbiB0aGUgd2lsZGNhcmQgZnVu
Y3Rpb24gd29uJ3Qgd29yayBpbgo+IGNhc2Ugb2Ygd2ViIFVSTC4KCk9rLCBmaW5lLgpSZXZpZXdl
ZC1ieTogRXRpZW5uZSBDYXJyaWVyZSA8ZXRpZW5uZS5jYXJyaWVyZUBsaW5hcm8ucm9nPiBmb3Ig
dGhlIHYyLgoKQmVzdCByZWdhcmRzLApldGllbm5lCgo+Cj4gUmVnYXJkcywKPgo+IEvDtnJ5Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
