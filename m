Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D40AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 07:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 044F841C13;
	Wed, 30 Mar 2022 07:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iwWxWX9JYEs2; Wed, 30 Mar 2022 07:07:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A376341A18;
	Wed, 30 Mar 2022 07:07:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A019C1BF5E0
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 874BD40B1C
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:07:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iEoIdOHVHEJ6 for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 07:07:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B84D9409D6
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 07:07:05 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 w3-20020a4ac183000000b0031d806bbd7eso3465703oop.13
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 00:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l5lIECrElSiy6zhf+6UaoINf307yrduJ5ZmdStRRRYM=;
 b=W9z1sdggHmaZCUpCYQfXGjLPQqHSrF5XF1ncgcyfPkJ//5U6m1CBg1ujJ20bTweCX9
 jfBrbLX5V8Kkdyfo3f52af11DLWzZ6pY45JpzMLvkUQukHl6aYh9ND96hq2vwrQffzIT
 4Qz0wqUBW+Dl2Rar68mW8q3myg/4p93QXuTSyw2BokI59fLDQv/PdpWJASX9FMA+8Lmq
 u5QWH+clj4x9lGTpYeZ1gWrkPlDWldqEI1KykUtdy91GdY8ku4jfpQf6ZPth1vOlxt2/
 L662EOiINtRAIFScfqThux4rNw7fEHkr6k7+CwqpqTwRy3a0618U3gMSGktq0MutmV9o
 8QjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l5lIECrElSiy6zhf+6UaoINf307yrduJ5ZmdStRRRYM=;
 b=lcProqKSWUHuUV0FLR7GgwO6OOGroSUEILx47tFT+CkFUMUijJottOPztUAKY4deAV
 4/FeofWGIKDJHOI+CrHm1K4SlZJFP801L9234f8QwcGahklrg3kVJQFkc1g4fUXanAdm
 lTCDkG7tNfA5A+QaKqT4f4SN9eMUKOV/4h4Z8rS3Zjm+z9yI0AacKc6FuaiP6hHagwsl
 CCLZPmHx8P7lIGQ3x6cnwVeYdOiC5SKCZ0qvCUoEVCQzh85w45TfPft4Ppl84u139BJg
 iAZ1eMpGsNStPwBfhDjYXon/iVc7c/EqNXArCC2AlX9qYNxgNNzjLxbzKae/8PxNbZSr
 MnSA==
X-Gm-Message-State: AOAM5318F7o11/ytwoRnjmxPLmP4qn8zPUY5m3C9npHEeesMhirZafMl
 taVVs308ODfQrEelGRba6eOxcZ5Pi9VHxG/h3Kiq5eCnPgQ=
X-Google-Smtp-Source: ABdhPJy4sy94luOEZbdZ3LdHjucHWlaIrrg59PkDepsJmozZTh9n+qFOf4ABRI/I8yvS/PalInroJHY2viwqABH81Zs=
X-Received: by 2002:a05:6820:174:b0:320:fbeb:da58 with SMTP id
 k20-20020a056820017400b00320fbebda58mr2397879ood.22.1648624024604; Wed, 30
 Mar 2022 00:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAM70yxDW2GTLva+_JQ7wH1z+MQiXYxn__wNSu4KQ-w-MJnJ2gw@mail.gmail.com>
In-Reply-To: <CAM70yxDW2GTLva+_JQ7wH1z+MQiXYxn__wNSu4KQ-w-MJnJ2gw@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 30 Mar 2022 01:06:53 -0600
Message-ID: <CADvTj4qWax3zJXamtBgGEyPE31Pp-fH6Ge=ZYvk1c7XzcisntQ@mail.gmail.com>
To: Emile Cormier <emile.cormier.jr@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-python.mk: fix PEP517
 purelib deployment path
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Mar 29, 2022 at 10:06 PM Emile Cormier
<emile.cormier.jr@gmail.com> wrote:
>
> package/pkg-python.mk: fix PEP517 purelib deployment path
>
> This allows the Python interpreter to find packages built via the new Flit
> infrastructure and fixes bug #14721.
> Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
>
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 52ce402281..6aaca1f465 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -127,7 +127,7 @@ PKG_PYTHON_PEP517_ENV = \
>  PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
>   --interpreter=/usr/bin/python \
>   --script-kind=posix \
> - --purelib=$(TARGET_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> + --purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \

I must have copy pasted that wrong, usually /usr/lib is merged with
/usr so worked
for me when runtime testing.

>   --headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
>   --scripts=$(TARGET_DIR)/usr/bin \
>   --data=$(TARGET_DIR)/usr
> @@ -135,7 +135,7 @@ PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
>  PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
>   --interpreter=/usr/bin/python \
>   --script-kind=posix \
> - --purelib=$(STAGING_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> + --purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
>   --headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
>   --scripts=$(STAGING_DIR)/usr/bin \
>   --data=$(STAGING_DIR)/usr
> @@ -149,7 +149,7 @@ HOST_PKG_PYTHON_PEP517_ENV = \
>  HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
>   --interpreter=/usr/bin/python \
>   --script-kind=posix \
> - --purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> + --purelib=$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
>   --headers=$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
>   --scripts=$(HOST_DIR)/usr/bin \
>   --data=$(HOST_DIR)/usr

For the host I think all these paths should not be under /usr.

> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
