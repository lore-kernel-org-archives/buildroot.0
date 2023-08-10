Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D160CC001E0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 16:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FA2384007;
	Thu, 10 Aug 2023 16:35:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FA2384007
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cU9usiSl7tuo; Thu, 10 Aug 2023 16:35:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EBFF83F52;
	Thu, 10 Aug 2023 16:35:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EBFF83F52
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 09B2B1BF45A
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 16:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5B824179D
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 16:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5B824179D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h-jUD5TmYLTO for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 16:35:23 +0000 (UTC)
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CEAC541702
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 16:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEAC541702
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-79a2216a22fso335796241.0
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 09:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691685321; x=1692290121;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gu74OuqbzQ72zuECLvwkn2aeGC/vHxw1imBvTBXytVc=;
 b=hDaNdZy4ido/62NJFcLaFIuf+ArPiICT3pOF2RSVuLVjqyP2WLmQ7Kja+gaMghxngY
 jecp+Fo+5Iiq4HRLxCz+VzlUOpSkddJWyLROzg5BKg6Cn1ThiWs2vz5mXovGlt3++sVx
 yicE/F2dITYbDBrKia84E/Q/9hlUkj479tCvafPY8kw7fyhgMxnniuNlNw77n7xwEmki
 2axUHfHnDARdu7MW1y5pswdjRIsBFslO/mR/SdZNzG+SxRkTR1KPWVi7iuY+e7j1tyPV
 si/+ZG86YjzWlfyORoq6TcpNmkULrPE9mdjeQtfnC+IMiMNQXp3Q/M4bTm5lCaUgAZXB
 yTBw==
X-Gm-Message-State: AOJu0Yxo5DcnwNAZg2vmqTc4HVbAqRVu16xsWBVjICFF0z7+XulxFv2D
 pi4A6Kv3E+s+cewmnkFPEjbFPaV+X7+IwHlRICWCKUYWsvGsCg==
X-Google-Smtp-Source: AGHT+IF1gmnVBk50YohNwWsUb1hCauI2HzDPYGddFMQTKszQrmL+E++ghX2dwayYXVxEjUDAXJXIV+gCGLUxzsCUjr8=
X-Received: by 2002:a67:f30d:0:b0:447:4e3f:216b with SMTP id
 p13-20020a67f30d000000b004474e3f216bmr2333442vsf.25.1691685321466; Thu, 10
 Aug 2023 09:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <2691942.mvXUDI8C0e@kilian-aisec>
In-Reply-To: <2691942.mvXUDI8C0e@kilian-aisec>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Thu, 10 Aug 2023 11:34:55 -0500
Message-ID: <CAOCHtYjiGK+oKiYoPPosM6Ead+kcw1YEN8225FT3n=r=oqJ_Yw@mail.gmail.com>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691685321; x=1692290121;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gu74OuqbzQ72zuECLvwkn2aeGC/vHxw1imBvTBXytVc=;
 b=nv5ek1aXnV43GujGZkn+w94yVWDrGyrSrr/GIlHOMwlBF9+pS8N771y++hPnUh9yQH
 o1Z5JY1Xbcx88Bhfad9z4MhlgdwS9tJXooVx9IxS5gBnroExmT97QiliYASWZYD24ADo
 77576mVb4vSUMgbRXvZQiZM8R2Tbqzv7o9czMpVjG8Weteh5+sF8spfp3ASQ8FMd3lDe
 w5g9JSGrW9oVTWetU5M6R7ffJ4+tiRZr4BZFlJ3nw8ZYhOb58kIP7hRx+fPF9CiLFR2d
 gyt8gVx6B8hyHhxVNyTEpGh18YRLHTQhCygfS/HnrKrtqU2FH8HmfzituAtkjRX3Zir4
 sGeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=nv5ek1aX
Subject: Re: [Buildroot] Interested in board support for BeagleV-Ahead
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBBdWcgOSwgMjAyMyBhdCA4OjU34oCvQU0gS2lsaWFuIFppbm5lY2tlciB2aWEgYnVp
bGRyb290CjxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IEkg
YW0gaW50ZXJlc3RlZCBpbiBhZGRpbmcgYm9hcmQgc3VwcG9ydCBmb3IgdGhlIEJlYWdsZVYtQWhl
YWQuCj4KPiBJIGFscmVhZHkgc3RhcnRlZCB0cnlpbmcgdG8gc2V0dXAgdGhlIGJvYXJkIHN1cHBv
cnQsIGJ1dCBhdCB0aGUgbW9tZW50IGl0IGRvZXMKPiBub3Qgd29yayB5ZXQsIGR1ZSB0byBzb21l
IGdjYyAxMiBhbmQgemljc3IgYW5kIHppZmVuY2VpIFJpc2NWIGV4dGVuc2lvbiBpc3N1ZQo+IChz
ZWUgYmVsb3cpLgoKQXdlc29tZSB3b3JrIQoKQlRXLCBpJ3ZlIGNyZWF0ZWQgYSBzcGVjaWFsIHUt
Ym9vdCBicmFuY2ggZm9yIG1haW5saW5lIGdjYyBzaXR1YXRpb25zLAp3aXRoICotdWJ1bnR1IGV4
dGVuc2lvbiBvbiB0aGUgYnJhbmNoLi4KCmh0dHBzOi8vZ2l0LmJlYWdsZWJvYXJkLm9yZy9iZWFn
bGV2LWFoZWFkL2JlYWdsZXYtYWhlYWQtdS1ib290Ly0vdHJlZS9iZWFnbGV2LXYyMDIwLjAxLTEu
MS4yLXVidW50dQoKVXNpbmcga2VybmVsLm9yZydzIHg4Nl82NC1nY2MtMTMuMi4wLW5vbGliYy1y
aXNjdjY0LWxpbnV4LnRhci54egoKSSd2ZSBiZWVuIG1vc3RseSB3b3JraW5nIG9uIG1haW5saW5l
IGZvciB0aGUgYm9hcmQgd2l0aCBARHJldyBGdXN0aW5pCgpPdGhlcndpc2Ugb24gdGhlIG1haW5s
aW5lIHdlJ3ZlIGJlZW4gdXNpbmcgbWFpbiBicmFuY2ggb2Ygb3BlbnNiaSBhbmQKbGludSdzIDYu
NS54LXJjIChvbmx5IGVNTUMgd2lwIHN1cHBvcnQpLi4gbm90IG11Y2ggZWxzZSBvbiB0aGUKbWFp
bmxpbmUgYnJhbmNoIHlldC4uClJlZ2FyZHMsCgoKCi0tIApSb2JlcnQgTmVsc29uCmh0dHBzOi8v
cmNuLWVlLmNvbS8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
