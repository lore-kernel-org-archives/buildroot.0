Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13E0C04A94
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 20:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B43D409E6;
	Thu, 10 Aug 2023 20:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B43D409E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vs7PIReYix4u; Thu, 10 Aug 2023 20:53:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAE564052B;
	Thu, 10 Aug 2023 20:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAE564052B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E2FB91BF97F
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC9404052B
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC9404052B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8sl36KAAGgHj for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 20:53:30 +0000 (UTC)
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01279400DC
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 20:53:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01279400DC
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-640c5df2e6eso5048516d6.1
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 13:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691700809; x=1692305609;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QgFMDyLGUJL66MY3AIR9NB6RGLVRaJe/9Dq5i3ThS38=;
 b=O8aDZ97KIY+SzHA8F23Mv/gKgHHWYIQKQQ1X9c3p1j/zFv9e3lf/pyi3T38j1P/dLL
 mFM/Gj3qDnor4Jd+EFjPj66kCJt7K8oY0zDJMkM60XdHpFZNVULFsGlFkdmERp3B1bHO
 TTwnnevrjt1kI2re3IQOJ+st8A4cf9FihzCBFCB31vOye2KJB211Rd0XYZCoaiSzu4xB
 bF5Pe/sdsNOULa+6w3V55mul2W7SycoUBUVHTww5cNt8YIpmBe1qnLp62Gvqivmm1B6J
 ywq/tuApESKZuCBrK4kUUKeIYptZjbnuH6Ra4Bm8No7QxaERydkGNuu1HtQXDH/mmpI1
 nM7Q==
X-Gm-Message-State: AOJu0Yzz0zLHEyRqUgfvnU7BMudy2LCOdXJ1tLUaKgs8LuFwcmDOjafb
 j9P3dWi7zvJ7ilf8R2gbQnxlwBM0PjdTGuMuZ95DMLLJOFKXSw==
X-Google-Smtp-Source: AGHT+IHEtBS8taxz+zcqILZde8GPzGyJVQtlkEItvIc45WBxsMI05W4a7fjuOmrqHwUR8y6Hj03NfyoGql9aN+GT5S8=
X-Received: by 2002:a0c:da8b:0:b0:63d:203:eb3b with SMTP id
 z11-20020a0cda8b000000b0063d0203eb3bmr3481513qvj.36.1691700808840; Thu, 10
 Aug 2023 13:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <2691942.mvXUDI8C0e@kilian-aisec>
 <845846062.0ifERbkFSE@kilian-aisec>
 <CAOCHtYgFMQMYvubF7nU53dgZwB4zF=hycJkX4WjyvjbFfs+iwA@mail.gmail.com>
 <5712460.DvuYhMxLoT@kilian-aisec>
In-Reply-To: <5712460.DvuYhMxLoT@kilian-aisec>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Thu, 10 Aug 2023 15:53:02 -0500
Message-ID: <CAOCHtYhA0Msco4rEQvRB9PYsMT1VgUdvaeuTwLiByCS1tZ+R7w@mail.gmail.com>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691700809; x=1692305609;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QgFMDyLGUJL66MY3AIR9NB6RGLVRaJe/9Dq5i3ThS38=;
 b=Dm1eO/jQzG6vME6r6GxblIW9i4kYxnntK3fqz8tEaAxQtWnk7n0o7XzuFfMb9MHwdl
 HhBUVWcg7OmG9IB1EWtCw1ZfYzwa1Dmgh7gWoYHfh+2bMxN2+hnZymYCqFhLeD+h7ZEy
 7u+Ol2Rt37u7i2Z18vBIK1PRGKHbGDjUUY7tdaDp9Yb4i+NFGKx2s+8MQ/th8xz88OPT
 R+kygTzg2ylS/bYSUP1w3r36ud6t1LjEEF4OeP4w3SeVDO8yUtMjjCuMak+Gg38ZuqeX
 OJ219t3LAjSR+0FGyZm+SaYegtPFn/2SPH+rPzfH5vus4qVX6TriC/614KAGblnY5V5P
 /QYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Dm1eO/jQ
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

T24gVGh1LCBBdWcgMTAsIDIwMjMgYXQgMzozOOKAr1BNIEtpbGlhbiBaaW5uZWNrZXIKPGtpbGlh
bi56aW5uZWNrZXJAbWFpbC5kZT4gd3JvdGU6Cj4KPiBIZWxsbyBSb2JlcnQsCj4KPiBbLS1TTklQ
LS1dCj4KPiA+IFlvdSAnbmVlZCcgdHdvIG1hZ2ljYWwgY2xvc2VkIHNvdXJjZSBiaW5zOgo+ID4K
PiA+IGh0dHBzOi8vZ2l0LmJlYWdsZWJvYXJkLm9yZy9iZWFnbGV2LWFoZWFkL3h1YW50aWUtdWJ1
bnR1Ly0vdHJlZS9tYXN0ZXIvYmlucwo+ID4KPiA+IGxpZ2h0X2Fvbl9mcGdhLmJpbgo+ID4gbGln
aHRfYzkwNl9hdWRpby5iaW4KPiA+Cj4gPiBsaWdodF9hb25fZnBnYS5iaW46ICJhb24iIGlzIGFu
IGBBbHdheXMgT25gIGZwZ2EgYmluYXJ5IHVzZWQgZm9yIHBvd2VyCj4gPiBtYW5hZ2VtZW50Li4u
IElmIHlvdSBkb24ndCBoYXZlIHRoaXMsIHRoZSBib2FyZCB3aWxsIGJvb3QsIGJ1dCB0aGluZ3MK
PiA+IGxpa2UgY3B1ZnJlcSBkb24ndCB3b3JrLi4KPiA+IGxpZ2h0X2M5MDZfYXVkaW8uYmluOiBQ
cm9iYWJseSBBdWRpbywgbmV2ZXIgcmVhbGx5IHRlc3RlZCBpdCB0b28gbXVjaC4uLgo+Cj4gSWYg
d2UgbmVlZCB0aGVzZSBiaW5hcnkgYmxvYnMsIEkgdGhpbmsgd2UgYWxzbyBuZWVkIHRoZSBsaWNl
bnNpbmcgaW5mb3JtYXRpb24KPiBhYm91dCB0aGUgYmxvYnMuIFdlIGhhZCBhIHNpbWlsYXIgY2Fz
ZSB3aXRoIGJsb2JzIGZyb20gUm9ja2NoaXAgZm9yIHRoZSBSYWR4YQo+IFJvY2sgNUIuIENhbiB5
b3UgdGVsbCB3aGF0IHRoZSBsaWNlbnNlIGZvciB0aG9zZSBibG9icyBpcz8gRG8gdGhleSBvcmln
aW5hdGUKPiBmcm9tIGFub3RoZXIgcmVwb3NpdG9yeT8KClRoZXkgYXJlIHB1cmUgJ2Jsb2JzJywg
c2FkbHkgdGhleSBhcmUganVzdCBsaXN0ZWQgaGVyZToKCmh0dHBzOi8vZ2l0aHViLmNvbS9iZWFn
bGVib2FyZC94dWFudGllLXlvY3RvL3RyZWUvTGludXhfU0RLX1YxLjEuMi1saWdodC1iZWFnbGUv
bWV0YS1saWdodC9yZWNpcGVzLWJzcC9vcGVuc2JpL29wZW5zYmkKCm5vIGxpY2Vuc2Ugb3IgYW55
IG90aGVyIGluZm8uLgoKUmVnYXJkcywKCi0tIApSb2JlcnQgTmVsc29uCmh0dHBzOi8vcmNuLWVl
LmNvbS8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
