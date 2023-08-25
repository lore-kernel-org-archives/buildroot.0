Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE6BC7EE2C
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 21:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5B8883542;
	Fri, 25 Aug 2023 21:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5B8883542
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x5a1yEu5oieA; Fri, 25 Aug 2023 21:35:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03CD483455;
	Fri, 25 Aug 2023 21:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03CD483455
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A30FD1BF2A5
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 21:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C76C4184A
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 21:34:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C76C4184A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HACyQ4XJaKJF for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 21:34:56 +0000 (UTC)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A495341843
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 21:34:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A495341843
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3a9b342c398so508051b6e.3
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 14:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692999295; x=1693604095;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ockmL3QF9gQiPS/LtUKdPYUwxhwoyRFy/qu/jLF9DZI=;
 b=Q0kHR25w0RXEtCK+V0IrUgisfpJhqDFhn395OQZ7cw6G6WeKsZf+ZDORJTvX9Klhmj
 HseE8aCZL/IFLFUNSMeaMj9LaQdRq6WeNpOhV3n7fyiB+6Z0y9gjAo6ak1sDlYpJmUSm
 RGQwluWj0OHtQsica0I3VlzOAL3cuVW5rkmGyQkzOP6Op746rMw/ve8CrG/DcsaxTPh4
 Sspq3Qhh495/FOalt61OTCY2+ctdxDxaPGvCeflxVjQiof0qkMvlGWfS0MxhXIoXfWEZ
 S7oQkPksLBPijvcyB5AxJPgckTPEEJIZnym6v197p70f92FXC8SdHaZPp992pSLpvEaT
 a1fQ==
X-Gm-Message-State: AOJu0YxX3khJC5eSI/fn6bH3tDV1pnM9WQ7oFYCUhUNVhzmzpQ9cx2SE
 hzElTidF80vsrUqGH5C/bjvQJSJAa/UKgZGeq8Y=
X-Google-Smtp-Source: AGHT+IHyYldzdTP88U7p7ZiHz1gItRyA3SzUu0v48ZLz04FcO7qKXAVax4F+6yDrNa0nMVUvE8vWrurI1yqMOV8Ex50=
X-Received: by 2002:a05:6358:5e08:b0:13a:6748:9312 with SMTP id
 q8-20020a0563585e0800b0013a67489312mr18727219rwn.19.1692999295632; Fri, 25
 Aug 2023 14:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230814102453.102735-1-james.hilliard1@gmail.com>
 <20230822201237.024570fd@windsurf>
In-Reply-To: <20230822201237.024570fd@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 25 Aug 2023 17:34:43 -0400
Message-ID: <CADvTj4qSDJkeb7uEjjS1_ZW7B+bjbkKeu_uFTA=AABcHt5O7kQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692999295; x=1693604095;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ockmL3QF9gQiPS/LtUKdPYUwxhwoyRFy/qu/jLF9DZI=;
 b=nP9kCJL0FzYxoYiKXqzvv7rX919EneoAuxf1QYtytzstOSKAq5zasY2sFauwxxy+5R
 L4F4gIdrltIgcvrd7yPiuiikucTrCaabsQ45EYyJJAzeOUPpCJhoaMKnBajEQ3GRn8tc
 t1KbGg8azJcP6YAv+ys84QyyBSn8bdZDD+DhF+yiQsTa8N+bB+BZ2fAULs7nO6txXXd+
 YlLhXrGvXxX6w9K76+hmI9f8KwSd8z0d/G0+Pt7kiIXgSxrBMT7YJQIyq7CaNcmQ7+5b
 A3Wksxg+LO9EtV6yIGLdHqJ+yaU5/7vM7ARv78S26fiiPavPtqmXHEUs63/GG4n7XKvf
 L/MA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=nP9kCJL0
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.71.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBBdWcgMjIsIDIwMjMgYXQgMjoxMuKAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gSmFtZXMsCj4KPiBPbiBN
b24sIDE0IEF1ZyAyMDIzIDA0OjI0OjUzIC0wNjAwCj4gSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBMaW5rIHRvIFJ1c3QgMS43MS4xIGFubm91
bmNlbWVudDogaHR0cHM6Ly9ibG9nLnJ1c3QtbGFuZy5vcmcvMjAyMy8wOC8wMy9SdXN0LTEuNzEu
MS5odG1sCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxp
YXJkMUBnbWFpbC5jb20+Cj4KPiBEaWQgeW91IHJ1biB0aGUgUnVzdCB0ZXN0IGNhc2VzIGFmdGVy
IHRoaXMgdmVyc2lvbiBidW1wPwoKWWVhaCwgdGVzdHMgcGFzcy4KCj4KPiAuL3N1cHBvcnQvdGVz
dGluZy9ydW4tdGVzdHMgLW8gL291dHB1dCB0ZXN0cy5wYWNrYWdlLnRlc3RfcnVzdC5UZXN0UnVz
dCB0ZXN0cy5wYWNrYWdlLnRlc3RfcnVzdC5UZXN0UnVzdEJpbgo+Cj4gVGhhbmtzIQo+Cj4gVGhv
bWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4g
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiBodHRw
czovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
