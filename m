Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8E9C4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD356846DB;
	Sun, 11 Feb 2024 21:20:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jt3po96aF5Wb; Sun, 11 Feb 2024 21:20:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0FF084706
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0FF084706;
	Sun, 11 Feb 2024 21:20:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75C901BF39A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61F7641695
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:20:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SMlNKDv_KPcj for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:20:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7BC6A41693
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BC6A41693
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BC6A41693
 for <buildroot@uclibc.org>; Sun, 11 Feb 2024 21:20:45 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-42a9c21f9ecso15823121cf.0
 for <buildroot@uclibc.org>; Sun, 11 Feb 2024 13:20:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707686444; x=1708291244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A2+73yuruP3SSSFgWpQHD1qXNKRvdeQlCQAegvBLfaA=;
 b=ARcobjB8RgzZplK6bXIPWu7+JHqezQRDT/zZZbAXeQKq1cgzmcKbri7ePTwDIgfs2R
 se1AvJAG6jXzyjmaunZWiFRU4YjWFqAXcPCCgYm31Aa7w+TKoyan8XiYXAa9rSBgSKkH
 /7PZss2Typ3QpeDFATIMGZ19zxPjJjCxGqmkhSTme0Mn6Crp49nDlRlRI6igKIP59uDG
 9YtoYs7jA/5nWQx99B/7fFQI6Wz/frk9qs5s35E10Bdd1MJJnNvSFqlbt6eqtwjoP46u
 uPWJM2UTki7MA2nPoHD4yU51JF6d2DdUoN6M/Pd/4L3poT7l7cVjTvZypDKdt/KAsG/e
 P9QA==
X-Gm-Message-State: AOJu0Yy2soUn3GuJ6Wqh5uD5mAfw3ojHM4Br9z26eNld5WDIVQNygfw6
 2YFT1YSp00BmdlyBOsjaNV0+TxuvY9uTtq/R1Btxv90Tf96BQehBokxJgxG8JsTlenCGeASPkoY
 fa0UPWj7a97bbkZ7R0ZevfS2wqUQrQSHEu/E=
X-Google-Smtp-Source: AGHT+IEY2C7dEI5QCPhNaM3YNDzo4X5+TpH/d2KULv8dr/gqE2uiD/uvCznHlqDg+K5ImhOSG1+7MgdNpEPA36huHbQ=
X-Received: by 2002:ac8:5b8f:0:b0:42a:ac1a:eaaa with SMTP id
 a15-20020ac85b8f000000b0042aac1aeaaamr8429825qta.40.1707686443951; Sun, 11
 Feb 2024 13:20:43 -0800 (PST)
MIME-Version: 1.0
References: <20240206222231.8950D87481@busybox.osuosl.org>
 <CALAjcgVd0VGDZCRpH3cpeikpNH0ZZOkV9c667cH6GQhMa8qtTg__833.063844923743$1707444930$gmane$org@mail.gmail.com>
 <pan$a29b1$235b0aec$c06a1ff$d5539253@ID-313208.user.individual.net>
In-Reply-To: <pan$a29b1$235b0aec$c06a1ff$d5539253@ID-313208.user.individual.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 11 Feb 2024 14:20:31 -0700
Message-ID: <CADvTj4pgwRLcuj10aJ19e+OHiwRacPf2OY2cu=v48GrzuFRWDw@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707686444; x=1708291244; darn=uclibc.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A2+73yuruP3SSSFgWpQHD1qXNKRvdeQlCQAegvBLfaA=;
 b=VMItl74ApehddZUNGUIIhNQkRxk6SMoKqgj1WwRH4zBjlGwegg8U1Rn289/SiuhL79
 fD3+KpBi5KdRBS0XAYwiBpLCgz2MiCJJn1s54AzKyK0pvRWfUaqAPPIxKArMqL9Tv2Xz
 ldU1D9NqU5LQDXJ30IRI3/flAuLtmYPC63Gz01JqDVXP3X1LvTR+ZbS4tZgVgiUGKaiY
 cM9oVvoHF7ysTLI6GJymTsqkpx/uSBmGhggzWT1e1TwKCMA6JtuBnm8IdVKNFLqbXXLK
 Yqb6xIajYFXwa8GRvqOLJwc3hv9kSfEgpIvCVsZJ+FaDNyLs+MGPEbIFagxcWQG4Bi7T
 sFmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VMItl74A
Subject: Re: [Buildroot] [git commit] package/python3: bump version to 3.12.1
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBGZWIgOSwgMjAyNCBhdCA5OjEx4oCvQU0gQmVybmQgS3VobHMgPGJlcm5kQGt1aGxz
Lm5ldD4gd3JvdGU6Cj4KPiBBbSBUaHUsIDggRmViIDIwMjQgMjE6MTQ6NTIgLTA1MDAgc2Nocmll
YiBKYW1lcyBLbmlnaHQ6Cj4KPiA+ICAgICAgICAgaW1wb3J0IG1hdGgKPiA+ICAgICBJbXBvcnRF
cnJvcjogL2xpYi94ODZfNjQtbGludXgtZ251L2xpYm0uc28uNjogdmVyc2lvbiBgR0xJQkNfMi4z
OCcKPiA+IG5vdCBmb3VuZCAocmVxdWlyZWQgYnkKPiA+IC9idWlsZHMvYnVpbGRyb290L291dHB1
dC9idWlsZC9weXRob24zLTMuMTIuMS9idWlsZC9saWIubGludXgtCj4geDg2XzY0LTMuMTIvbWF0
aC5jcHl0aG9uLTMxMi14ODZfNjQtbGludXgtZ251LnNvKQo+Cj4gSGkgSmFtZXMsCj4KPiBzYW1l
IGhlcmUgb24gRGViaWFuIDEyLjQvYm9va3dvcm0sIHRyeSB0aGlzIHBhdGNoOgo+IGh0dHBzOi8v
Z2l0aHViLmNvbS9ia3VobHMvYnVpbGRyb290L2NvbW1pdC8KPiBkY2E4YjViZWU3NzQyZmZlZGY4
MWEwMjdhZmZhZGQ0YjdlMThmYzNmCgpZZWFoLCB0aGlzIGZpeGVzIHRoZSBpc3N1ZSBmb3IgbWUg
YXMgd2VsbC4KCj4KPiBSZWdhcmRzLCBCZXJuZAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
