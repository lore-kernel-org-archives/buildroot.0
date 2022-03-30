Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D83C433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 07:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCFC8416C3;
	Wed, 30 Mar 2022 07:23:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iP4cO5biHj1Y; Wed, 30 Mar 2022 07:23:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9106D40991;
	Wed, 30 Mar 2022 07:23:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 010DF1BF5E0
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F04E0611B2
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:23:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNXqSj3oDJaV for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 07:23:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41F0E611B1
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 07:23:16 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-df26ea5bfbso3655903fac.1
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 00:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aPIL7QmW4iif3yX1c8cXh9bJiiVehX4zIfIj9la+r/Q=;
 b=WXQVMmyY7xEwMQJiSzawVHHlESVgGVtI1Oo+H7dtYo524INafNi8jrLn+3pJ/pgqGr
 Bfj6/a7uDEPNdOXURL/n1BtKHqG/LrB79kQex3M3izXjNOA0zkSktricPnsiD4BjMUWn
 f5R1GWENYuBUv5U5pNZIeNfGQjXneygEGBTL4SC0AnETs6dkivD7LI+Coyuhxc0mjiCi
 djIc+8j7XwbkKTqWp5piERYq2VqVFYjjLVcY7HqQsxk9oh4rmrYDPy8mNYy3z3wDxoyI
 +NPTkU25ODu0dv43pkLrY/AX+acbXwCEVNwFmnbmDEPP5BX+8MX/oazrD0H5i4M22i+s
 +KWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aPIL7QmW4iif3yX1c8cXh9bJiiVehX4zIfIj9la+r/Q=;
 b=xGgzMoZ/wXTUnG0CYM1kdGO8mZZvTswLAWWOp+s2NhKX6iMfx/A2oZ3TunI1RyYHw3
 fxG82iIuCx5EJKmLGgP7M2Y820ft4O0yESzyiYiueuK9NOslHqvWSFr6isABa4lXOtvX
 ov/WmbHqPSRA0pf/n2YqIMA5kqViQYDqxFxDAMTXQHnXVlQVynxarmZ76Ik09222p7Fr
 owZeFdvtVsNkadHMX41zf5z12YWuRgK9vP3hu+QkflSCQbnQKoJO7bR59Azn7XvoYZVY
 2OIg7b1jqS0I9641yIyXC66xFeTK18w6Q/i6iNcYerB6fq+MfZQkHIyyP+qWGpFlJYHY
 LBpQ==
X-Gm-Message-State: AOAM533fMIoBEboBsqa3xjMDFe13bA4DAq8BrX8VZ6BnffWN0n8eocy0
 zSXxz7evMMJBDagIiTgrIeVVgGbl4vqP9eF1z4IyiX2Rs+o=
X-Google-Smtp-Source: ABdhPJyXd5Tr7fXjI08QE+23rnaoHQiQ1pzTK/+fiVN/CUzLA6UCpAqzAlmKAjgBXx3u7tk2FmW9szD2lTTYXDr78ek=
X-Received: by 2002:a05:6870:d0c4:b0:dd:c7f6:2d62 with SMTP id
 k4-20020a056870d0c400b000ddc7f62d62mr1541323oaa.99.1648624995096; Wed, 30 Mar
 2022 00:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAM70yxDW2GTLva+_JQ7wH1z+MQiXYxn__wNSu4KQ-w-MJnJ2gw@mail.gmail.com>
 <CADvTj4qWax3zJXamtBgGEyPE31Pp-fH6Ge=ZYvk1c7XzcisntQ@mail.gmail.com>
 <CAM70yxB3EJmtX6PtBMB0UJtrzX6_8yhnRWBkGhbgK1Hxcm7fAA@mail.gmail.com>
In-Reply-To: <CAM70yxB3EJmtX6PtBMB0UJtrzX6_8yhnRWBkGhbgK1Hxcm7fAA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 30 Mar 2022 01:23:04 -0600
Message-ID: <CADvTj4rNA_vsqU5-2Hu6XT4LjpRhmuO09FsZOEk8w16VMri6xw@mail.gmail.com>
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

On Wed, Mar 30, 2022 at 1:19 AM Emile Cormier
<emile.cormier.jr@gmail.com> wrote:
>
>
>
> On Wed, Mar 30, 2022 at 4:07 AM James Hilliard <james.hilliard1@gmail.com> wrote:
>>
>> On Tue, Mar 29, 2022 at 10:06 PM Emile Cormier
>> <emile.cormier.jr@gmail.com> wrote:
>> >
>> > - --purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
>> > + --purelib=$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
>> >   --headers=$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
>> >   --scripts=$(HOST_DIR)/usr/bin \
>> >   --data=$(HOST_DIR)/usr
>>
>> For the host I think all these paths should not be under /usr.
>
>
> For me output/host/usr is a simlink to output/host:

Yeah, I think it usually works but should not have /usr for consistency.

> ls -l output/host
> total 48
> drwxr-xr-x  3 emile emile  4096 Mar 30 01:27 arm-buildroot-linux-gnueabihf
> drwxr-xr-x  2 emile emile 12288 Mar 30 01:40 bin
> drwxr-xr-x  3 emile emile  4096 Mar 30 01:38 doc
> drwxr-xr-x  5 emile emile  4096 Mar 30 01:40 etc
> drwxr-xr-x 19 emile emile  4096 Mar 30 01:39 include
> drwxr-xr-x  7 emile emile  4096 Mar 30 01:39 lib
> lrwxrwxrwx  1 emile emile     3 Mar 30 01:27 lib64 -> lib
> drwxr-xr-x  2 emile emile  4096 Mar 30 01:32 libexec
> drwxr-xr-x  3 emile emile  4096 Mar 30 01:28 opt
> drwxr-xr-x  2 emile emile  4096 Mar 30 01:29 sbin
> drwxr-xr-x 22 emile emile  4096 Mar 30 01:38 share
> lrwxrwxrwx  1 emile emile     1 Mar 30 01:27 usr -> .
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
