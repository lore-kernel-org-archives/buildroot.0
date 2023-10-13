Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82F5CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 09:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 576B9614FF;
	Fri, 13 Oct 2023 09:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 576B9614FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jnjOGrN9Fsbp; Fri, 13 Oct 2023 09:59:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FEC961503;
	Fri, 13 Oct 2023 09:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FEC961503
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1EA801BF21A
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 09:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB992614FF
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 09:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB992614FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WYkvrz8AatOS for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 09:59:48 +0000 (UTC)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2725D60E1A
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 09:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2725D60E1A
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-419c8911049so12289101cf.1
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 02:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697191187; x=1697795987;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TRk1fY39RPyKlg5Nh9KrYT+ri6+orb2l/qT/W+1wpD0=;
 b=gaVoM5anYh2nFG7QX+Dqq0hsnK8D9VT70cF1IWKPNEKOBTd+FxKMZOWgRh61s181vY
 A47ByG6DbHMjyczxdLYwlK+khyv8N/4jn6U1rVVv38e2ItKutOh9OSRop42PWNmmilIA
 hH1saxLb0kCJw9bJ8j17EitX2MG3zf3l7fuvMDFhiw4xodDCmmhzfJ9DsRQx3qsC4TkF
 uNGC2D+zlX5HqcL5+lP68yuOcO73lMBEnDBlatfE/ZAwNKY+BZSo605GmrHajk1zf9N4
 wCPSR8IsmNIIWP49ri5o/wVys6ETT+17Y8h6TX/Y9+fgb1cCvWClYI2XpEAlGp5h2j7o
 DeVw==
X-Gm-Message-State: AOJu0Yw867uWw9+/BcdJzlIH/+T+g7VoVWkaoiRufKv6pzuMqDuB+Duj
 +MjK1pOAX/9gEbJ1GkhFO4/nlE/BwKUt8C+PVbI=
X-Google-Smtp-Source: AGHT+IGMshHZvt4N4QdZP3kLes554syhth6480X7TZmnA4DEL/88sqzCa05Sipd8qLL6e9oqxAligX2tcY1r3A3DUIE=
X-Received: by 2002:ac8:5b09:0:b0:418:16d6:5a8d with SMTP id
 m9-20020ac85b09000000b0041816d65a8dmr34483020qtw.19.1697191186916; Fri, 13
 Oct 2023 02:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231013083037.1349119-1-adam.duskett@amarulasolutions.com>
In-Reply-To: <20231013083037.1349119-1-adam.duskett@amarulasolutions.com>
From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 13 Oct 2023 11:59:36 +0200
Message-ID: <CADYdroP_TVRB97mPy6ncE+vk0bKvcikDYaL=TS4Zih7TkJBWLA@mail.gmail.com>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697191187; x=1697795987; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TRk1fY39RPyKlg5Nh9KrYT+ri6+orb2l/qT/W+1wpD0=;
 b=gIGQXos6rf9n2b6/h+5nPGCTjPaMUAyOrHtB4ZimwC7r1JCHioZkoG+iklT29Zvf8U
 70aFAnUsvi5uSeatGENHFyCMOA+gCr4LAoxG4ZFIe/E0hyufC3lipb5xG0g9S5IgBOB1
 SxyPurZ4vTJO4owBvuDp5HfDYMn7TpJmfPFlxmCUTFvuBvzGd7muNmMpPmhORyBVZ4zu
 +kos6em9bzoqDf5SId09km4170jqpR6L3ZY3tU9XUDlmcWz8VTsq86O4rL2nCEKfMeQb
 Dol7lg0mOT2BPwhdKYO8fGj6isD9oibCoi1+hRYXgUMYknpqcwBiJXBpgXHtchWsGIWx
 azPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gIGQXos6
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: bump version to 254.5
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Sen Hastings <sen@phobosdpl.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Fr., 13. Okt. 2023 um 10:30 Uhr schrieb Adam Duskett
<adam.duskett@amarulasolutions.com>:
>
> All tests passed in Debian 11 with the following command:
>
> ./support/testing/run-tests tests.init.test_systemd
>
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Acked-by: Norbert Lange <nolange79@gmail.com>

> ---
>  package/systemd/systemd.hash | 2 +-
>  package/systemd/systemd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> index 10f4bc04fa..f0c3db60e7 100644
> --- a/package/systemd/systemd.hash
> +++ b/package/systemd/systemd.hash
> @@ -1,5 +1,5 @@
>  # sha256 locally computed
> -sha256  18db69c8fc33afebf95a40cfa3769df5f0e4a07bccdebd33b2fd81c8b75e7a02  systemd-254.tar.gz
> +sha256  41873783aa1c680e10d2f2626797a1c2fef8018d69b68c8c77639e140ee7846d  systemd-254.5.tar.gz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
>  sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index d220673572..d428765ec3 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -19,7 +19,7 @@
>  # - Diff sysusers.d with the previous version
>  # - Diff factory/etc/nsswitch.conf with the previous version
>  #   (details are often sprinkled around in README and manpages)
> -SYSTEMD_VERSION = 254
> +SYSTEMD_VERSION = 254.5
>  SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
>  SYSTEMD_LICENSE = \
>         LGPL-2.1+, \
> --
> 2.41.0
>

Using an identical patch for a few days, no problems to be expected.

Regards, Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
