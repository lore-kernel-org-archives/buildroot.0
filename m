Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC576CD8C8F
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 14:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47E5241B3C;
	Tue, 10 Oct 2023 14:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47E5241B3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wifiBF2J9U43; Tue, 10 Oct 2023 14:34:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CE0C41528;
	Tue, 10 Oct 2023 14:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CE0C41528
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1750C1BF86D
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 14:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4F4740B5E
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 14:34:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4F4740B5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4MPABBoEWs8x for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 14:34:31 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 151E740ACB
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 14:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 151E740ACB
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2c1807f3400so70081451fa.1
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 07:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696948469; x=1697553269;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hUKOUDZAOMT7YXblLl7OemnljgQU4gt0GIkZSAfXKHY=;
 b=LChglPJKL1b2DFXmBlcfn+ZeFVwWhUzlkKjFhChgyJU7dYhA7lT6Vi45F9iXRpfUjh
 J7b2FXZEjuutwnFuIYZrYEIlp2zOZgJsj4NNR4BX4J5Y6xs304duPkdhspsv7J2o08si
 tBfsF2wtrsEUVJ+YfucnlhAheFqV4EAT3VVFkXjfPtq9Dgw89dLJw438OPLcPclLQ1Uo
 64qOIe6eIkvThSeLE3WFH/RHUfm6NF1yL9kZHD5cHoMaK6vfwjWG8S6mbpOet6wn4rd2
 /wM/LtNtNnVrTC9CKwFvyrvMUypK1p9JEvAPAcBjVjVtjSg4CNYQ4Rr9CC2Tiz5TbaDV
 58IQ==
X-Gm-Message-State: AOJu0Yx3VrmdylGsrHMvvqBhXz7Y5mE9eUjsUkVMTIC/U6CsJOlqIwiY
 ZFrX+zIzhZOmWk1Nfw647arwX36GcsH0tQ==
X-Google-Smtp-Source: AGHT+IEPwa9vbyVDB4DKy1s02EEfhgOeIidaK82A5akLDr/XT7EJpJUbjG5v0XWq7IS1m6rdNdKHJg==
X-Received: by 2002:a05:651c:1699:b0:2c1:6d1c:2cef with SMTP id
 bd25-20020a05651c169900b002c16d1c2cefmr11602983ljb.14.1696948468390; 
 Tue, 10 Oct 2023 07:34:28 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51]) by smtp.gmail.com with ESMTPSA id
 g1-20020a2eb0c1000000b002b70a8478ddsm2453127ljl.44.2023.10.10.07.34.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 07:34:28 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5056ca2b6d1so6956245e87.1
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 07:34:27 -0700 (PDT)
X-Received: by 2002:a05:6512:1245:b0:504:20a5:7375 with SMTP id
 fb5-20020a056512124500b0050420a57375mr13053205lfb.29.1696948467782; Tue, 10
 Oct 2023 07:34:27 -0700 (PDT)
MIME-Version: 1.0
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Tue, 10 Oct 2023 16:34:16 +0200
X-Gmail-Original-Message-ID: <CACXRmJhWoMKh+8BC3Brf5YYcNfS0VS8s-+_z1-0bmRoaO2T95Q@mail.gmail.com>
Message-ID: <CACXRmJhWoMKh+8BC3Brf5YYcNfS0VS8s-+_z1-0bmRoaO2T95Q@mail.gmail.com>
To: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH] package/opengl/libegl: remove
 BR2_PACKAGE_HAS_LIBEGL_WAYLAND
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Yann, All,

What is the status of this patch? It seems useful to have
libegl/libgbm support in mesa without pulling in Wayland. Especially
for WebKitGTK,

Kr,

Thomas Devoogdt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
