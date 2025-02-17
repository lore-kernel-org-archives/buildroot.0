Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED167C02198
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 02:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9775C60D5D;
	Mon, 17 Feb 2025 02:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7bg39872OLQ; Mon, 17 Feb 2025 02:48:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B60BA60D65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B60BA60D65;
	Mon, 17 Feb 2025 02:48:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 943A2C8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 02:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8322160D58
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 02:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n2PjS6Q6GdGn for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 02:48:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 135E060C2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 135E060C2C
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 135E060C2C
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 02:48:04 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-30920855d5bso26041571fa.0
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 18:48:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739760482; x=1740365282;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EKsAQqg4hboCcFWqIi3+N3tf1XT1N69OubCt8khaiCI=;
 b=iogJEKHdgnZHGwPZUS9dEwJPzeeYrCGO4kcVipk8hSyrFfy/jXMWL21mumG4hYRAQ5
 zokxUib/H1EZcO4nN0QiuXkM+09q8kY2AdnzDb/w+PiA5ZDvBlo53O4A86XWSP2vil1g
 Jb2dUvJQsPvhMCFfPMopWcRSJjBIE/WRQXv4fvFOnLy1f+cntOGjTQNz50h/1FOWxQgi
 m3SUI+i9ugHAaEwQY382MvZY59f5ILoSCW3B+yYR2jbFnTaCdJnFyR9OysSWaPqa3p40
 te6ViAdSYG6TRcuRWJgozoGMgGwskwNaZlUn+EGn/cNppdw0LNlzbeC8CAw6PyE998zF
 geUg==
X-Gm-Message-State: AOJu0YyXPt5U6zqt6T+qAfpozXH6UHCnAjsa96TQ8z2vZ2mo92dvoIQT
 08OqCjYT/ai6Yn+U06bXJyzalvvsoHErqjVaoOQTxVyQzEtY+tDbnHaxy65F1R9PARKEj6H9eiu
 886HvY7Guedh6i2FpFtQbqA1+7B0=
X-Gm-Gg: ASbGncs9Kkpps2BMc8qzF1JYe4LYCy0DB2ye26TjjRDmOnA1cheo9bQz25yrvW28WAR
 lwpJFDoU2hkGbif+MbDZwmCyuZptOEq0+tz+REArzvxDbdefUe62LyfiPP7mfCfl/VMH4V0+fqg
 ==
X-Google-Smtp-Source: AGHT+IHC6/v5woC55vEJptHDnJsqqp+8lARFwC2H8RWuF6YVtXx8+WiWP7KtiuAf6gkYZUMlbVKvwr1j/s55i15oxKU=
X-Received: by 2002:a2e:80d4:0:b0:30a:257c:9652 with SMTP id
 38308e7fff4ca-30a257c9790mr12168121fa.16.1739760482253; Sun, 16 Feb 2025
 18:48:02 -0800 (PST)
MIME-Version: 1.0
References: <20250214021416.392363-1-fancp2007@gmail.com>
 <20250214074235.917242-1-fancp2007@gmail.com>
 <Z68NsSRTlm0aGSi4@waldemar-brodkorb.de>
 <CAFkzVZZzU+HQQ33Uun0c4fPu5HtLVbkQNF8xX4a0mq+Zc39mDg@mail.gmail.com>
In-Reply-To: <CAFkzVZZzU+HQQ33Uun0c4fPu5HtLVbkQNF8xX4a0mq+Zc39mDg@mail.gmail.com>
From: Scott Fan <fancp2007@gmail.com>
Date: Mon, 17 Feb 2025 10:47:50 +0800
X-Gm-Features: AWEUYZnUfDWS9msbiN0Z17D3psKErjQrqlmiPL3wZ-2P2NplKkBAAypyQbyRM-o
Message-ID: <CAFkzVZZcmS7fY77hf+aViwZiQ_gmN7emxzMCmc58wafg7dTWRg@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739760482; x=1740365282; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EKsAQqg4hboCcFWqIi3+N3tf1XT1N69OubCt8khaiCI=;
 b=m+ENlo5XA6P2hAwRDy/Vht+n5NOcTDAQQicaybnCFDQJWx0OcTWuYf1Wq2CettLbVT
 3cemcKZupNTn9mukgrp7omOXsiJJq+gsKLLaIYPbjrscHfxfa3Y57hXdFo6X5qxrbqBz
 bIXnJtCIDhS1a8FjnWhCbmxgM+hkYTXvyehBifS9gP2x6VIyLXH2t4HbYimeCghhacGf
 /IRSgOIzqBA4rQJXm4xF02xbDWo9/msfoS63Dxr7Vv6WJsnnM1uxwrckZhooDx02iHJ+
 hNv3xUoqHxGAtEW2KSA9EwsLgreOZN42zhdMUfF+wyKSJhatXi0RjaRXW8ssEhF18kl7
 cEAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=m+ENlo5X
Subject: Re: [Buildroot] [PATCH v2] package/sqlite: fix configure options
 for readline/editline support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

SGkgYWxsLAoKVGhlIHBhdGNoIGhhcyBiZWVuIHN1cGVyc2VkZWQgYnkgYW5vdGhlciByZS1zZW50
IHBhdGNoLCBhbmQgSSBhZGRlZCBhCmxpbmUgIlRlc3RlZC1ieSIgdG8gdGhlIGNvbW1pdCBtZXNz
YWdlLgoKUGxlYXNlIHNlZSB0aGUgbGluayBiZWxvdzoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI1MDIxNzAyMzgzNS4zNDk3NzAtMS1mYW5j
cDIwMDdAZ21haWwuY29tLwoKU2NvdHQgRmFuCgpPbiBTYXQsIEZlYiAxNSwgMjAyNSBhdCAxMDo1
MeKAr0FNIFNjb3R0IEZhbiA8ZmFuY3AyMDA3QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBKdWxp
ZW4sCj4KPiBPbiBGcmksIEZlYiAxNCwgMjAyNSBhdCA1OjMy4oCvUE0gV2FsZGVtYXIgQnJvZGtv
cmIgPHdieEBvcGVuYWRrLm9yZz4gd3JvdGU6Cj4gPgo+ID4gV29ya3Mgbm93LiBZb3UgY2FuIGFk
ZCBhCj4gPiBUZXN0ZWQtYnk6IFdhbGRlbWFyIEJyb2Rrb3JiIDx3YnhAb3BlbmFkay5vcmc+Cj4K
PiBQbGVhc2UgY29uc2lkZXIgaXQsIHRoYW5rcy4KPgo+IFNjb3R0IEZhbgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
