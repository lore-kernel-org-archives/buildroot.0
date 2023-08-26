Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880DEC83F01
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 18:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21B9D40232;
	Sat, 26 Aug 2023 18:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21B9D40232
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5fPU-mCQHiQY; Sat, 26 Aug 2023 18:18:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6601540278;
	Sat, 26 Aug 2023 18:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6601540278
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B90B61BF37C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91215416D6
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91215416D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MdOulmHWghdr for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 18:18:14 +0000 (UTC)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FB3A40308
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 18:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FB3A40308
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-34bb33a3cf4so610665ab.0
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 11:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693073893; x=1693678693;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mt3mIl+EdTjsrow/VHGkjBPkWky0Bu9slHCed9wKviU=;
 b=ZF6M2QgEhhGdHF/N6UfHVKjSMCwIFt6Mayq9b4wJ6fndtvr5A3VR6H3dOY3LksNFc3
 lmQTcaQuUs1JfTENcZUFy/yeH82ZeRy7o7KE+TlJRjw75x0SCt7xhYeB1gxbwpI5byVc
 44zEGWX6qMiI2l7R46LrP1j4KiXxHIaAw/FX+pdJrDl0E9JgbAXkR6hMUOOZm8Oxp6E/
 zlGUZdTmUn/E2NYj8mXmZJtY84femhNBYCLdBQVUUUVll8e4Y9nUisdI/Y8fR7Oz403U
 Tlb4a29uMXruZ1md0+uMN6LKmpH028XuI4BmZ6t1DBqT5ayVrn00QL92PySplaNbTzw6
 DQkg==
X-Gm-Message-State: AOJu0Yw1IE83YOTYKN1FZ+BbCbHQWa9g21wgPtOOlO+blh20rxwg3n8S
 Wd2keH5pHV/vg4f/J1BzjiNn8Nq2ElLM9NfvWeY=
X-Google-Smtp-Source: AGHT+IG6nu/iRq0TtCakrz1RhE5ZYA0VuqxiwBjCNInDXTrXQ8ScxFHKhsP8qWJ7eiK40pyAReb9fJeCt6dM/QnWJoM=
X-Received: by 2002:a05:6602:3a17:b0:791:e6af:a72f with SMTP id
 by23-20020a0566023a1700b00791e6afa72fmr26271334iob.1.1693073893076; Sat, 26
 Aug 2023 11:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230826165628.31792-1-romain.naour@gmail.com>
In-Reply-To: <20230826165628.31792-1-romain.naour@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 26 Aug 2023 15:18:01 -0300
Message-ID: <CAOMZO5CHX4adZ_kmdSEr5nR2ZYUUsN+Mk62e3h_6jm63h2tQSw@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693073893; x=1693678693;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mt3mIl+EdTjsrow/VHGkjBPkWky0Bu9slHCed9wKviU=;
 b=gIoAzXRVPsi3P2qYpafI9n6l/cso9dv4KtIFidTW8hQ0kaoUNXaKfTfIhn/VbZQeLa
 T4tAyYsOHsG9pl+ggWp5MmlXNjEwhsIKh4SWseubjFYB3LKfOGCpAqhXdNRyXk7JQBNn
 52907xDQjeCreRqrz/Z/C/nXd/uR/y7DSC3VbpwN6wEkqqGxOljqGwWlaV5T63UIHe1d
 //F20nwD/2o4Va+jzGpHgLTe01hWegS1HAkCgnj2/MDWRhCiNXAzBJlW5wPiw0AWSisb
 gSVLzaNRaFeNBbvIUGrmf0jbqi4lwswuiaQm8Ye0rOGw2ID7zMu2CHRjo5ZqnZqH3i1k
 AfHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=gIoAzXRV
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

SGkgUm9tYWluLAoKT24gU2F0LCBBdWcgMjYsIDIwMjMgYXQgMTo1NuKAr1BNIFJvbWFpbiBOYW91
ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBXaGlsZSBzd2l0Y2hpbmcgQVRG
IHRvIGdpdGh1YiwgdGhlIEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX0dJVD15CgpBVEY/CgpJIHRo
aW5rIHlvdSBtZWFudDoKCiJXaGlsZSBzd2l0Y2hpbmcgdGhlIGtlcm5lbCByZXBvc2l0b3J5IGZy
b20gY29kZWF1cm9yYSB0byBnaXRodWIiCgo+IHN5bWJvbCB3YXMgbm90IHJlbW92ZWQuIFNpbmNl
IHRoZW4gdGhpcyBkZWZjb25maWcgZmFpbCB0byBidWlsZAo+IGluIGdpdGxhYi1jaSBkdWUgdG8g
aW52YWxpZCBkZWZjb25maWcgY2hlY2suCj4KPiAgIFdBUk46IGRlZmNvbmZpZyAuL2NvbmZpZ3Mv
ZnJlZXNjYWxlX2lteDZxc2FicmVzZF9kZWZjb25maWcgY2FuJ3QgYmUgdXNlZDoKPiAgICAgICAg
IE1pc3Npbmc6IEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX0dJVD15Cj4KPiBbMV0gZGQ0MmIxNTlh
NWY3NTI5MjFlZTYwMjUzMGQyODljODEwYWQ3ZWU1MQo+Cj4gRml4ZXM6Cj4gaHR0cHM6Ly9naXRs
YWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy80ODg5NDM2NjEyCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Cj4gLS0tCj4g
VGhpcyBkZWZjb25maWcgd2lsbCBmYWlsIGFueXdheSBkdWUgdG8gdG9vIG9sZCBBVEYgcGFja2Fn
ZSAocHJlIFYyLjkgdmVyc2lvbikKPiBhbmQgYmludXRpbHMgMi4zOSsuIEJ1dCBpdCBzaG91bGQg
YmUgYmFja3BvcnRlZCB1cCB0byAyMDIzLjAyLgoKSSBhbSBjb25mdXNlZCBieSB0aGlzIHN0YXRl
bWVudCBhcyB0aGlzIGRlZmNvbmZpZyBkb2VzIG5vdCB1c2UgQVRGLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
