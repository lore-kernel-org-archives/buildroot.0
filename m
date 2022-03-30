Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C87C433F5
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 19:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5098C41DAB;
	Wed, 30 Mar 2022 19:25:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e4cl1G_z03Ji; Wed, 30 Mar 2022 19:25:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C23C441D80;
	Wed, 30 Mar 2022 19:25:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40B411BF40D
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 19:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E725610B1
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 19:25:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IsyCto9xUP3p for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 19:25:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B28B60E6D
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 19:25:37 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 a17-20020a9d3e11000000b005cb483c500dso15583871otd.6
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 12:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W9lEvD13XAmGi5zmfE7w8lZ/NVMEgj/04BLi1w7sKuQ=;
 b=EMskiFioA5I0EjgQgXj3G8PN3EEhvTMSg+0Wq2+E95A8wEO76mXMP16ryF5pWhx+BK
 cLoDhnQ2otPrADAKzcAaFC5m7p3mjWHV0y8QwkMrLJ+dImS+hDJRGaY1M2IANAx/s4Ne
 yDdWeQfk0G/cmfMJ7mxX3lujeuVksrm4PzPTVrgpNcoeKtEAnGi7IxVvOxcYKVegHfrJ
 HZlvuri20grWJtwi3mW5Xj+J+rOfR2JFYXyIvx/dwEzT3owsnJGRQ8YcPkwU5Gey5H7D
 B201JbmJOtHWGsxdtSH7/XLQXcL5dzYnzuxwi4jWSgCYxodtILRUY55OP5aLP1ukqNXJ
 gvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W9lEvD13XAmGi5zmfE7w8lZ/NVMEgj/04BLi1w7sKuQ=;
 b=M5nkAx7lknVtyvnUxMJcyMB2wPqJCfEnVamO7JIz+tJWfcNFiXg71G97XoSXurOa1O
 TdFUbhMb8G8mvPC8Dt3OLc2hHG49fqbpGfMapWjxa75uWph1B5B5nmaslps/RRcGkDGj
 tYMLBTWlaOChdjw1EXhiJsCVcJD0edwhdBPni9NJVw4lUGfMAhOKuU3IMnaLkzjzfys1
 6wXFOtuzH4PE2ClHKeUT9cyBa3kDE6ING2eWJhwc/sEBzp/1IPduBsEDkNkmeZoeVYda
 SYyFHw+oBjq7aojFNytD1RVDZUPKBnWOv5B3piqhaIrF7TpJ90DbzFhdfDvS74zfVPwe
 7hcg==
X-Gm-Message-State: AOAM530FmIZvC7yI8wD3HFkbzmtRzFaoVuSfP40n7Z1NtNSD2Lb7C/gN
 HyPTGNJTyrU/JzUnDsnmKk+isU9j8uUA+HcT+xA=
X-Google-Smtp-Source: ABdhPJwaW3EUWRI03DQIPoQTh5jsQ8jQrorK5nsmM1bJyrxbP4yapn19ABa/6FjSlGehxYSZVq6wwACAn8wVZKh+Qn4=
X-Received: by 2002:a05:6830:4d3:b0:5cb:73f0:2f1a with SMTP id
 s19-20020a05683004d300b005cb73f02f1amr3963314otd.30.1648668336416; Wed, 30
 Mar 2022 12:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAM70yxDW2GTLva+_JQ7wH1z+MQiXYxn__wNSu4KQ-w-MJnJ2gw@mail.gmail.com>
 <CADvTj4qWax3zJXamtBgGEyPE31Pp-fH6Ge=ZYvk1c7XzcisntQ@mail.gmail.com>
 <CAM70yxB3EJmtX6PtBMB0UJtrzX6_8yhnRWBkGhbgK1Hxcm7fAA@mail.gmail.com>
 <CADvTj4rNA_vsqU5-2Hu6XT4LjpRhmuO09FsZOEk8w16VMri6xw@mail.gmail.com>
 <CAM70yxD=tU7FK1uf2iEpFVK_jDQyHv6j8xAdW9nEDz0r8njz6w@mail.gmail.com>
 <CADvTj4qo_ac-wizQH_xvMbn5Y7urEHnNyopLGTmF4RJ3HP=+Hw@mail.gmail.com>
 <CAM70yxB61g2r5+aHZYPbit+3TjaWG4khnb71vHC-2pfF+WoyfQ@mail.gmail.com>
 <CAM70yxCMj-_4q_Rix-PK2=sG+RcfVE0GQr8FK4UqrRT6c7AsSw@mail.gmail.com>
In-Reply-To: <CAM70yxCMj-_4q_Rix-PK2=sG+RcfVE0GQr8FK4UqrRT6c7AsSw@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 30 Mar 2022 13:25:25 -0600
Message-ID: <CADvTj4qO-YJDa4uqW8SzQpEHYyOPc948cxFrRonXCJMSO1m=7g@mail.gmail.com>
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

On Wed, Mar 30, 2022 at 12:52 PM Emile Cormier
<emile.cormier.jr@gmail.com> wrote:
>
> package/pkg-python.mk: fix PEP517 purelib deployment path
>
> This allows the Python interpreter to find packages built via the new Flit
> infrastructure and fixes bug #14721.
> Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
>
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 52ce402281..ab4f7af6a6 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -127,7 +127,7 @@ PKG_PYTHON_PEP517_ENV = \
>  PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
>   --interpreter=/usr/bin/python \
>   --script-kind=posix \
> - --purelib=$(TARGET_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> + --purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
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
> @@ -150,8 +150,8 @@ HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
>   --interpreter=/usr/bin/python \
>   --script-kind=posix \
>   --purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> - --headers=$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
> - --scripts=$(HOST_DIR)/usr/bin \
> + --headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR)  \
> + --scripts=$(HOST_DIR)/bin \
>   --data=$(HOST_DIR)/usr

I think it should be something like this for the host:
HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
--interpreter=/bin/python \
--script-kind=posix \
--purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
--headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR) \
--scripts=$(HOST_DIR)/bin \
--data=$(HOST_DIR)


>
>  ################################################################################
>
> On Wed, Mar 30, 2022 at 3:51 PM Emile Cormier <emile.cormier.jr@gmail.com> wrote:
>>
>> On Wed, Mar 30, 2022 at 3:01 PM James Hilliard <james.hilliard1@gmail.com> wrote:
>>>
>>> I think keep /usr for STAGING/TARGET OPTS but remove for HOST OPTS.
>>
>>
>> Alright, I've changed it as you suggested and it still works for me. I'll post an updated patch.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
