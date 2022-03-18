Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F080C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 11:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED6164098B;
	Fri, 18 Mar 2022 11:01:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 727P5vspoLCi; Fri, 18 Mar 2022 11:01:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 155404093E;
	Fri, 18 Mar 2022 11:01:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A69A1BF2A2
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 11:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16AF860E48
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 11:01:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qx7Zuj-NIg-g for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 11:01:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FE8060B47
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 11:01:15 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 r190-20020a1c2bc7000000b0038a1013241dso4626274wmr.1
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 04:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=i7v447HyWzIicsRxdl+cpFMPLLc/kAAEJptAljPLquM=;
 b=dREjN1aa0UaVcfXIjOaBrnhVAd6JM22FdOXlHZw8bz/niLpMNZNy4wGHP9ILMDxNgK
 R+xBAm+OnVNfu+WFmHSegPpD9xuE0peBQqDveGmtfpuenq73LzZbnbNLwavXAf8AIUYY
 6eCKT1A37jHWiGDTMALywhiAEIu2ZawQ6JFS72/JqpoZRcREt5Nc/zEO2Vpzg25ZdMas
 XqsEEZKb8Mzhu6cKKyXx023l0HKO8G6JQUeAtrJWv/KA3at67fTaxXm+fyJP+/GwxsIB
 nzhyG9VlsABiamM8QCs97rzJbrxSaJrNYeu9whd3a0wOSltp39hu3mmhSWGNbViQwQ9s
 2A3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=i7v447HyWzIicsRxdl+cpFMPLLc/kAAEJptAljPLquM=;
 b=1tS+yKeuWroNJA7iJbnwINtcx6eIsWKElER2R+ddIgL5aRmVH5rwUaCL6fCgWdyjKB
 r4QlSGqp3Tqengq3XtgSLHjOWcA/WyQ/fnh7nC/gOKzSQ1VIDtdNGAa78BnL1AEchBN5
 /MTxyzIw06P/87ULX5id81VhGF3j89HNvHGIqxX7OsjiJUwbLEgTYdTAobKoHzg2oAuq
 p8oUnkvDdXcDtyZd2x7MF/gje0ZnzG2ZBurbU2A/13FArm8eINobVgGf6NzCDJojMd/5
 n9Zagv7O/sa5lIDXenIJZrVw2EhUmBQc+F4T1q5mt935bl0g1kvOp2rxVoUSevtT4iQc
 fG7Q==
X-Gm-Message-State: AOAM533hEivIoaFpkU+GZkYWvONIBoz0iLKZFx5RT78Z3VUS+7vlEp7c
 ME+0RTd3OZfRS8tSVQjWUKJ16AnXq9rQvy0001o=
X-Google-Smtp-Source: ABdhPJzNsKdueMEXoTzz5UUjqK7jkHlOlLH1p6BpEnqPPFHg3JJdym6mj2e1v7hFUF2kWKnPgpNM3gNBasR3cJ0Z+Gc=
X-Received: by 2002:a05:600c:1e1f:b0:38b:d7ea:99b9 with SMTP id
 ay31-20020a05600c1e1f00b0038bd7ea99b9mr7711247wmb.8.1647601273327; Fri, 18
 Mar 2022 04:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeSuE2XuTiRYno_TJ=2RmJxjeSSca=Lx8vc5iYfhNRkx44Q@mail.gmail.com>
 <9fd77043-72b7-d337-d871-76918570ef35@mind.be>
 <CADYjeSsU6S94FJV+zHmbQF63+5vx2oMeGxW84LAKjVu2Os4fwg@mail.gmail.com>
In-Reply-To: <CADYjeSsU6S94FJV+zHmbQF63+5vx2oMeGxW84LAKjVu2Os4fwg@mail.gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 18 Mar 2022 12:01:01 +0100
Message-ID: <CAEyMn7Y6YvCujxV_OfNErnQGLCRCwHV=4FTbyCGcG7N46YQVWw@mail.gmail.com>
To: Sourabh Hegde <hrsourabh011@gmail.com>
Subject: Re: [Buildroot] How to run sshd deamon with read-only fs?
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

SGksCgpBbSBEby4sIDE3LiBNw6RyeiAyMDIyIHVtIDIzOjAxIFVociBzY2hyaWViIFNvdXJhYmgg
SGVnZGUKPGhyc291cmFiaDAxMUBnbWFpbC5jb20+Ogo+Cj4gSGVsbG8gQXJub3V0LAo+Cj4gVGhh
bmtzIGZvciB0aGUgYW5zd2VyLiBJIHdpbGwgdHJ5IHRvIGltcGxlbWVudCB0aGUgYWJvdmUgc29s
dXRpb24uCj4KPiBCdXQgSSB3YW50ZWQgc3NoIGNvbm5lY3Rpb24gdG8gdHJhbnNmZXIgZmlsZXMg
dG8gYm9hcmQuIEkgdHJpZWQgd2l0aCAic2NwIiBidXQgSSBnZXQ6Cj4KPiBzc2g6IGNvbm5lY3Qg
dG8gaG9zdCAxOTIuMTY4LngueHh4IHBvcnQgMjI6IENvbm5lY3Rpb24gcmVmdXNlZAo+IGxvc3Qg
Y29ubmVjdGlvbgo+Cj4gU2luY2UgdGhlcmUgaXMgbm8gc3NoZCBydW5uaW5nLCBzY3Agd29uJ3Qg
YmUgYW4gb3B0aW9uIEkgdGhpbmsuCj4KPiBJcyB0aGVyZSBhbnkgb3RoZXIgd2F5IHRvIGNvcHkg
ZmlsZXMgdG8gYm9hcmQ/Cgp3aHkgZG9uJ3QgeW91IHVzZSBzY3AgdGhlIG90aGVyIHdheSBhcm91
bmQgYW5kIGNvcHkgdGhlIGZpbGUgZnJvbQphbm90aGVyIGNvbXB1dGVyLCBlLmcuIHlvdXIgd29y
ayBjb21wdXRlciB0byB5b3VyIGJvYXJkPwoKc2NwIDxyZW1vdGUtaG9zdD46PHJlbW90ZS1sb2Nh
dGlvbj4gPGxvY2FsLWxvY2F0aW9uPgoKQW5vdGhlciBzb2x1dGlvbiB3b3VsZCBiZSB1c2luZyBu
ZXRjYXQ6Cmh0dHBzOi8vbmFra2F5YS5jb20vMjAwOS8wNC8xNS91c2luZy1uZXRjYXQtZm9yLWZp
bGUtdHJhbnNmZXJzLwoKW3NuaXBdCgotLSAKSGVpa28KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
