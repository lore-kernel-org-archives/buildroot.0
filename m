Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC905C83F11
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 19:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FA5181E69;
	Sat, 26 Aug 2023 19:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FA5181E69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9wt9tAZ8gJEB; Sat, 26 Aug 2023 19:23:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88A9381E33;
	Sat, 26 Aug 2023 19:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88A9381E33
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D1471BF82C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 19:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45FED60BAE
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 19:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45FED60BAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O_hJI8Y-V3vE for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 19:23:50 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C501060BA6
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 19:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C501060BA6
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fee8b78097so17701075e9.0
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 12:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693077828; x=1693682628;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RJIR195ClHcwvtwBKRiOJgcLPFv2JvNzj7K9TVpdbBo=;
 b=aj3X9NGDHLx/l847f1OtMexbUZ91OTRzisMQAmzmvsNDInayLhGfw4rztKuhWa1L+T
 rQ0q1v7n/3fpZ3RwqhdbggOVta9QqQaWVFUVTAtVFeoKzSfi3I1tJityZgMWdYuaE7Gd
 UwBEzpTA0kF/ROs8lZrZ9960zBX7DbIDYdZtl4BIVY1Yz7ke7rNN8Qs5i++0tEVlgWgD
 qlLq61vZwyOtL/TDwOWpY6Yputj2iM+2ujTkZzI4Z6UKSCrxZsYCVLjobwYbNxFdDJzQ
 NiSGNboJzwdVjzr6VGYZEDBUMt9+D6ebvZHuvq7k+W40/nqDTL8TGt/nJ+5rYMALznVx
 Tm9A==
X-Gm-Message-State: AOJu0Yznjz/R4W5tqNzfPwfctHTdFiFAKQIdp4asdxuOlqGK4/iTNBpH
 RUIBp3bOe5sTwjBaDaZpa/F//g==
X-Google-Smtp-Source: AGHT+IHQNb2o3jDrIgukuIzUZ8aeWwDhpcDkxCnqktPO2mkS2ZClvRBmqXya6RbK7Q8X6A6W28xLZg==
X-Received: by 2002:a7b:c453:0:b0:401:b7e0:a43c with SMTP id
 l19-20020a7bc453000000b00401b7e0a43cmr3672037wmi.24.1693077827586; 
 Sat, 26 Aug 2023 12:23:47 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a1c7211000000b003feef5b0baesm8902983wmc.26.2023.08.26.12.23.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Aug 2023 12:23:47 -0700 (PDT)
Message-ID: <4cf979f7-33e7-7d2c-694d-72bd9ad9c9f2@smile.fr>
Date: Sat, 26 Aug 2023 21:23:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: fr, en-US
To: Fabio Estevam <festevam@gmail.com>, Romain Naour <romain.naour@gmail.com>
References: <20230826165628.31792-1-romain.naour@gmail.com>
 <CAOMZO5CHX4adZ_kmdSEr5nR2ZYUUsN+Mk62e3h_6jm63h2tQSw@mail.gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CAOMZO5CHX4adZ_kmdSEr5nR2ZYUUsN+Mk62e3h_6jm63h2tQSw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1693077828; x=1693682628;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RJIR195ClHcwvtwBKRiOJgcLPFv2JvNzj7K9TVpdbBo=;
 b=OhJ21ih1bigwyeyYQwNB/AVKF//Dc5gcONYEsRdbbB2iVT2QvxsxialuUagp7xL2ME
 /oionDtZj8r0Cmso5+GkJ+P7BQiQeYWdlXJDlG7MhbZ/baS+jkaEQgehxs/VaC+vf8wH
 z6PsYByWyoJuC+yNZIh8aPcDAYDCP1K18v5Z0WA7zQw3NxbwlnBSPIZ445MZn/oDUxf2
 ZtBK6hGCCNg0Yr/l3zS3+MtFqDCIBO6lgih4lQOkfNxT6L6yrGngRLB/VAZvgRQBj03e
 ROc1wTZK/wTqmB1m9GtNbxL6vF+LAgFksWlGdMFhE628HbcFXIKN4S4I3obqvgWTE0Os
 mn4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=OhJ21ih1
Subject: Re: [Buildroot] [PATCH] configs/freescale_imx6qsabresd_defconfig:
 fix defconfig
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

SGVsbG8gRmFiaW8sCgpMZSAyNi8wOC8yMDIzIMOgIDIwOjE4LCBGYWJpbyBFc3RldmFtIGEgw6lj
cml0wqA6Cj4gSGkgUm9tYWluLAo+IAo+IE9uIFNhdCwgQXVnIDI2LCAyMDIzIGF0IDE6NTbigK9Q
TSBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBXaGls
ZSBzd2l0Y2hpbmcgQVRGIHRvIGdpdGh1YiwgdGhlIEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX0dJ
VD15Cj4gCj4gQVRGPwoKTXkgYmFkLCBJIHdhcyBsb29raW5nIGF0IG90aGVyIGlteC9mcmVlc2Nh
bGUgZGVmY29uZmlnIHdoaWxlIHdvcmtpbmcgb24gdGhpcwpvbmUuIEkndmUgcmVhZCBCUjJfVEFS
R0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9HSVQ9eSAoSSBkb24ndCBrbm93IGhvdy4u
LikKCj4gCj4gSSB0aGluayB5b3UgbWVhbnQ6Cj4gCj4gIldoaWxlIHN3aXRjaGluZyB0aGUga2Vy
bmVsIHJlcG9zaXRvcnkgZnJvbSBjb2RlYXVyb3JhIHRvIGdpdGh1YiIKCkluZGVlZC4KCj4gCj4+
IHN5bWJvbCB3YXMgbm90IHJlbW92ZWQuIFNpbmNlIHRoZW4gdGhpcyBkZWZjb25maWcgZmFpbCB0
byBidWlsZAo+PiBpbiBnaXRsYWItY2kgZHVlIHRvIGludmFsaWQgZGVmY29uZmlnIGNoZWNrLgo+
Pgo+PiAgIFdBUk46IGRlZmNvbmZpZyAuL2NvbmZpZ3MvZnJlZXNjYWxlX2lteDZxc2FicmVzZF9k
ZWZjb25maWcgY2FuJ3QgYmUgdXNlZDoKPj4gICAgICAgICBNaXNzaW5nOiBCUjJfVEFSR0VUX1VC
T09UX0NVU1RPTV9HSVQ9eQo+Pgo+PiBbMV0gZGQ0MmIxNTlhNWY3NTI5MjFlZTYwMjUzMGQyODlj
ODEwYWQ3ZWU1MQo+Pgo+PiBGaXhlczoKPj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vam9icy80ODg5NDM2NjEyCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJvbWFp
biBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPj4gLS0tCj4+IFRoaXMgZGVmY29uZmln
IHdpbGwgZmFpbCBhbnl3YXkgZHVlIHRvIHRvbyBvbGQgQVRGIHBhY2thZ2UgKHByZSBWMi45IHZl
cnNpb24pCj4+IGFuZCBiaW51dGlscyAyLjM5Ky4gQnV0IGl0IHNob3VsZCBiZSBiYWNrcG9ydGVk
IHVwIHRvIDIwMjMuMDIuCj4gCj4gSSBhbSBjb25mdXNlZCBieSB0aGlzIHN0YXRlbWVudCBhcyB0
aGlzIGRlZmNvbmZpZyBkb2VzIG5vdCB1c2UgQVRGLgoKTWUgdG9vIG5vdywgSSBzaG91bGQgZG91
YmxlIGNoZWNrIGNvbW1pdHMgbWFkZSBsYXRlIGluIHRoZSBldmVuaW5nIGJlZm9yZQpzZW5kaW5n
IGl0IHRvIHRoZSBtYWlsaW5nIGxpc3QuCgpJIGRpZCBhIGZ1bGwgYnVpbGQgd2l0aG91dCBhbnkg
b3RoZXIgaXNzdWUuIFN0aWxsIHRoaXMgcGF0Y2ggbmVlZHMgdG8gYmUgYmFja3BvcnRlZC4KCkJl
c3QgcmVnYXJkcywKUm9tYWluCgoKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
