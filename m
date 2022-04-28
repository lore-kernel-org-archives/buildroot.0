Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB45EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 17:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 294326112A;
	Thu, 28 Apr 2022 17:39:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K5sZaCqEQ7-l; Thu, 28 Apr 2022 17:39:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 569BF610FA;
	Thu, 28 Apr 2022 17:39:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 48E611BF9C6
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 17:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36836610FA
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 17:39:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sSHkTGonrqCH for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 17:39:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2C0D610F9
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 17:39:24 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id p18so6354618edr.7
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 10:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=WxpxIkBkjQ37QJFQewI6fwM4XAfID8m8+rT3b3bHHxQ=;
 b=DOXVQFAxpMITpq5e3gaPpc1qCS/5mGLyJg/udYlbJbLeFXbxRlgEwSloBy2m7EeTxh
 m8bhHTkcFglu7sjJBNMhDnE3f5+P0N/mPJpHanWUl+bEhJhw4cx37jY3b3fXpg+5116u
 K2hOPTy7EEJen20hge+jwH2lVO+TU/pOVvYzmucvdKxdxe9qLB58QlAIxuh9lmdJFivZ
 KFFBfz+ypUu6ZkqVRAMR/IP8xzEuqZ2yXii+ISHigX7oNlpEikZTNoEqJMQ3TRlYhAtL
 Jz+XEDO9aRdi3RuPT/XeAsoZJ2t/3DEyFOmrfbPcziafS2/5fQQGdbZrXeJgjzkITWUo
 oyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=WxpxIkBkjQ37QJFQewI6fwM4XAfID8m8+rT3b3bHHxQ=;
 b=A7lo1HaPc6Si/i9tXuIKVLB89uLKbSic1RiqWTAs74HeKHD54U0XZdbkng49wD2/rC
 Dkib9k0yod+KZX/eFFaXdObjWnS0niAPE/3Y49xzW4AdBcQ/+kNTsmh/9sAY36Lif3YL
 2DoowDJ5Lg0FBGIOP3k4stEciyS5rBb1YNVhJQcyGQkyighQTtsqz2giZ3kAGcLYUiU4
 A4WXibwmZCCTybd/cWjMeqmJ3urHValoIM0lvMv1HO8IhCXajCyT8IjNzWQLbdXUzkEr
 j+Rr9j30Kwud5DEjrDHpPNIM2wgJGrvS66RGM2m5fZjFmOc3dzJaM0wGhjWqJ91I4Yim
 WcEg==
X-Gm-Message-State: AOAM533K6Sezj7X/dPJhbp6+104KXgVp3xuF7YYhKHPcqWE0K13lY4ox
 qYzAyVka363D8u0Gld3jFdxnW6IxiniHi6r6HuqJaznDCyQ=
X-Google-Smtp-Source: ABdhPJy00DNKgeG8UC1Gd9OW1+8etQgVS28M/HOc+1qSyQq1zuqRDTkd5o7wLPnOlPAmg6v09UsdL2Fv4plD8TGlwbU=
X-Received: by 2002:aa7:c789:0:b0:413:605d:8d17 with SMTP id
 n9-20020aa7c789000000b00413605d8d17mr36689758eds.100.1651167562472; Thu, 28
 Apr 2022 10:39:22 -0700 (PDT)
MIME-Version: 1.0
From: Kristof Havasi <havasiefr@gmail.com>
Date: Thu, 28 Apr 2022 19:39:11 +0200
Message-ID: <CADBnMvhgaozAgZgy3njckjL1i0U6bZ0fLrq-kdFF-qpGhFWgmw@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] Build regression after 2022.02.01
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgdGhlcmUhCgpJIGp1c3QgdXBkYXRlZCBmcm9tIDIwMjIuMDIgdG8gMjAyMi4wMi4wMS4KCk15
IGJ1aWxkIGJyb2tlIGR1ZSB0byA4OTQ1YmE0OTQ4MGE3ODg1ZDEwNDQ0CiJ0b29sY2hhaW4vdG9v
bGNoYWluLWV4dGVybmFsOiBlcnJvciBpZiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX1BBVEggaXMg
bm90IHNldCIKCkkgc2VsZWN0ZWQgYSBib290bGluIHRvb2xjaGFpbiBmb3IgYXJtdjcsIHdoaWNo
IGlzIGluc3RhbGxlZCBvbiB0aGUKYnVpbGQgc3lzdGVtIGFuZCBpcyBhdmFpbGFibGUKdmlhIFBB
VEguIEFzIHRoZSBoZWxwIHN0cmluZyBvZiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX1BBVEggZGVz
Y3JpYmVzLCBpZiBpdCBpcwplbXB0eSwgdGhlbiBQQVRIIHdpbGwgYmUgc2VhcmNoZWQuCgpJZiBJ
IHJldmVydCB0aGUgYWJvdmUgY29tbWl0IHRoZSBidWlsZCBzdWNjZWVkcyBsaWtlIGJlZm9yZS4K
CkkgY291bGQgc2VlIHRoZSByZWFzb24gYmVoaW5kIHRoZSBjaGVjayBpbiB0aGUgY29tbWl0IGZv
ciB0aGUgY2FzZSwKd2hlcmUgdGhlIHRvb2xjaGFpbiBpcyB5ZXQgdG8gYmUgZG93bmxvYWRlZCwg
YnV0IHRoZW4gdGhlIGxpbmVzIGVuZGVkCnVwIGluIHRoZSB3cm9uZwpicmFuY2ggb2YgdGhlIGlm
L2Vsc2Ugc3RhdGVtZW50LgoKSW4gY2FzZSB0aGUgdG9vbGNoYWluIGlzIGFscmVhZHkgYXZhaWxh
YmxlIHZpYSBQQVRILCBJIHN1Z2dlc3QgdG8KZm9sbG93IHRoZSBwcmV2aW91cyBsb2dpYwphbmQg
ZGVzY3JpcHRpb24gaW4gdGhlIGhlbHAgdGV4dDoKICAgICAiSWYgZW1wdHksIHRoZSBjb21waWxl
ciB3aWxsIGJlIHNlYXJjaGVkIGluICRQQVRILiIKCkJlc3QgUmVnYXJkcywKS3Jpc3TDs2YKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
