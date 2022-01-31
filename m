Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68FBC433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 02:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E3AF83F73;
	Mon, 31 Jan 2022 02:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S66vuyxZCdgC; Mon, 31 Jan 2022 02:22:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C613583F6E;
	Mon, 31 Jan 2022 02:22:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E2CAD1BF471
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 02:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D06F94047C
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 02:22:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IBislqZtg95c for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 02:22:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB4AE40420
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 02:22:34 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id v67so24110738oie.9
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 18:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XWQdfIWeKQ2eekjWyNJnweo8WP24mNddL4RiIKmW6Ko=;
 b=BtL7PViYh9WjVbojz3It0Jm4tuwQCyCz7yMS1hh5Teh0f8eHnF5Tn/t4Pt3cPW0PZZ
 OzCnVwoMFsjXVRwRG/eya0B8TOGuJADFci7fy/g6BhD/nEKQLrwib5h2cR5gO+Hiw+AC
 rHHyo2GOZpEYuNyFt5Og+rHidGZi5xqs54NLzMqRv2oAwJNnqisjgdM4Yf47YPoN4WrH
 +QE/EUefcK631H4JNbZ1JzV64hT2IG8pmKYKi44SfM8If4xvo7sc3ZIxY+V4ocV1AaWu
 e7IxbMaDszdeBmanxQf2ZxPhFZMNUx290Mntocyrm5SnBXWdcVTnPU+JRar2EtBuZyRv
 REQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XWQdfIWeKQ2eekjWyNJnweo8WP24mNddL4RiIKmW6Ko=;
 b=n9SqLpuy1fKV0W1Xvo3P8yyhODt8dcB9w3LqUYhUqXxhyRaJ6qSv+cI7qJ+EMq0w/J
 w73uM3vXmnULRo32mDzwA9cb8kfsZBBAd2wzSTYmVKOYnxb/ItLOGtEZCEwXKn4vQye3
 OYiWaEnYJcYnO86UsZN8KminzzX4BHeRmwvXyJScfnddnVi8mEG2rUnfy87KPUYGzJr7
 VudDEZvUV76daNEJj9BkVzcpCtrKpIQYmVXUcfSPuv0krKHI/cGQ9ZRm1N4opyQFpDNO
 1l00feXz/Zpl4C3eNeHvXBGujHhvu1QfiwCdH7CQJccJWL/PmrcJk36SLlJ4QDdydvD7
 J70w==
X-Gm-Message-State: AOAM53112UevqM4STwZYTo9z4N1sSwAPzHzQnmmN/5mBUR/R/2YW1Pc9
 qjx9WWojsYRznwJXrobBEyabli06p/lxD+Vo+F0=
X-Google-Smtp-Source: ABdhPJywF4SMg2ENABBA9N7WzXeJ+oKu1g0XCJL9hDLk0AuoHjvWtyB2n3ws1BcXE1m62IWEskD95cYEJHnOAgJQjY4=
X-Received: by 2002:a05:6808:154:: with SMTP id
 h20mr12326533oie.103.1643595753441; 
 Sun, 30 Jan 2022 18:22:33 -0800 (PST)
MIME-Version: 1.0
References: <20210810064547.2579380-1-james.hilliard1@gmail.com>
 <20211228233314.7dfb8575@windsurf>
In-Reply-To: <20211228233314.7dfb8575@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 30 Jan 2022 19:22:22 -0700
Message-ID: <CADvTj4pVpK+chqNO0aP_EoW4vkOV_Qeo3m-G7aE34411T5YwrA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-headers: enable host build
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
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Dec 28, 2021 at 3:33 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Tue, 10 Aug 2021 00:45:46 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > This will be used for building tools that are included with the kernel,
> > such as host-bpftool.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> I'm sorry, but I fail to see how this can make sense, for a number of
> reasons:
>
>  * For external toolchains, package/linux-headers/Config.in.host is not
>    even included, which means that no version of kernel headers are
>    defined.
>
>  * Even for internal toolchains, the kernel headers version selected
>    for the target, which you re-use here for the host kernel headers,
>    has no correlation with the actual kernel running on the build
>    machine. If you are running an oldish 3.10 kernel on your build
>    machine, install host-linux-headers 5.15, and build host-bpftool
>    based on that, you'll run into issue.

Yeah, I wasn't sure if this would work, previously this tool was only available
integrated with the kernel, but it has now been separated like libbpf so we
can use that version instead which shouldn't require building from the kernel
tree anymore.

>
> So, perhaps the first thing is to figure out why the host variant of
> bpftool needs kernel headers. What are these tool doing on the host?
> What is the use case?

This tool is needed to generate bpf skeleton files, systemd needs this for
example to enable bpf-framework support.

>
> Then if we really want to build them for the host, I guess the only
> solution is to ask the user to install the kernel headers matching their
> build machine (so with some hidden option
> BR2_NEEDS_HOST_KERNEL_HEADERS, which is selected by your package, and
> then with logic in support/dependencies/ to check that).

I've made a patch to use the new stand-alone bpftool package instead:
https://patchwork.ozlabs.org/project/buildroot/patch/20220131021609.4117295-1-james.hilliard1@gmail.com/

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
