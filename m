Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED597C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 20:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84510408C5;
	Sat,  5 Feb 2022 20:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GY5PQ2rjHqYU; Sat,  5 Feb 2022 20:40:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B87E340881;
	Sat,  5 Feb 2022 20:40:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5287E1BF5A4
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 20:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B3EF40881
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 20:40:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QB-eD_lCP0H4 for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 20:40:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64F884087C
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 20:40:39 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id m10so12828914oie.2
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 12:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uPsxArIaIkk2/n0Pw7zv+yyME7NCIynuFm4aXwZCUQU=;
 b=S5Z6UaFDw9bSR/vDiY6IUEJDG/ek0U3MzE+89FuqDIp7VvghahuLMlOywGviz3urON
 ZCV2T44l8rFu963AQdDwd2pAkuOZh/77wPzEvQeZvGZxGqXOgItgAsYF5qiZTeaVrUbq
 IpcirDRjSDnmb6D6HgxQAvN4uhrCAIFTnuU3/o52DUOei7JZr07E3oe3ws2ITcz173gB
 fN7XPg8Mgl4IbROHzbOmfyXmTfjKRUX+DE4LG/EZxoaUJo3iaVjeqX8BUU31Vq1LyEBM
 X+eeDb+zLhCEulu/yx1tCELGZUQx5xYqbs54aTnmdm6aluepAd6OhGc/1xma6pX0QBIo
 3CvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uPsxArIaIkk2/n0Pw7zv+yyME7NCIynuFm4aXwZCUQU=;
 b=iqp3xTjfSBQf8TuayM5zZol9CcUjJQIiugvr3vrVRoiD+kb1dqVYkKDYbmjkWsfYK5
 FAW8iWol0nesLEQ9VYvnEmhIR2eSv8z6E4nje8SyglZo2RSe6QaLQrcelvRb8T18iiSN
 qWBLoMyxQvJaQdVxt+dWwHcno6LAZRRWmarD7wiQjlL6Y/LlKMHinBkXodb0gaan1qyR
 Yv3W2lephgmiO01gmbDVj+WBla6ZU7Y9NrCoAjXnaUo2t/wAbqugi4vNHzSWnwbpaAe5
 4CwrPoPAwqgdfWJYZKHCdaBLNxWCUS6JvEHAxXbL8V9/nBnsVeGNgfRoS8bd0EjyOmVQ
 8bQQ==
X-Gm-Message-State: AOAM532VhaG5/SRz3nAPrhXv74NfeADqwQqOxm0UJ1fpkCSKeeJMB8A7
 A2V2hIvWWM1DG+UqU9thrHlEc6A9zG1tdDndeyI=
X-Google-Smtp-Source: ABdhPJy7Dw4BoOrrVnJYYTb9ZiNgmzYDZWAGfUFyx8QTBevE7LO4f56r2g7wrKd+rStngYdvfDiQpE2OdEiQlODVl/g=
X-Received: by 2002:a05:6808:1184:: with SMTP id
 j4mr2369373oil.73.1644093638381; 
 Sat, 05 Feb 2022 12:40:38 -0800 (PST)
MIME-Version: 1.0
References: <20220205201837.3324085-1-james.hilliard1@gmail.com>
 <20220205201837.3324085-4-james.hilliard1@gmail.com>
 <20220205212349.17db6aa4@windsurf>
In-Reply-To: <20220205212349.17db6aa4@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 5 Feb 2022 13:40:27 -0700
Message-ID: <CADvTj4r7OV7DAPhBMRzzvwL_XxfmVZY9-wBr7fTAKrzYHZFjQw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v6 4/8] package/qt5/qt5base: enable ccache
 via configure option
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Gilles Talis <gilles.talis@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot <buildroot@buildroot.org>,
 Martin Bark <martin@barkynet.com>,
 =?UTF-8?B?R2HDq2wgUG9ydGF5?= <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Feb 5, 2022 at 1:23 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sat,  5 Feb 2022 13:18:33 -0700
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> >  # This allows to use ccache when available
> > -define QT5BASE_CONFIGURE_HOSTCC
> > -     $(SED) 's,^QMAKE_CC\s*=.*,QMAKE_CC = $(HOSTCC),' $(@D)/mkspecs/common/g++-base.conf
> > -     $(SED) 's,^QMAKE_CXX\s*=.*,QMAKE_CXX = $(HOSTCXX),' $(@D)/mkspecs/common/g++-base.conf
> > -endef
>
> This this variable is dropped, then surely the place it was used should also be modified?

Oh, forgot to remove it from there.

>
> > +ifeq ($(BR2_CCACHE),y)
> > +QT5BASE_CONFIGURE_OPTS += -ccache
> > +endif
>
> Are we sure this is going to use Buildroot's ccache and not the system
> ccache?

Looks to be detecting it properly at least(my system also has a system ccache):
Checking for ccache...
Searching for file ccache.
    Found at /home/buildroot/buildroot/output/per-package/qt5base/host/bin/ccache.
test config.qtbase.tests.ccache succeeded

>
> Indeed, $(HOSTCC) and $(HOSTCXX) are defined as:
>
> CCACHE = $(HOST_DIR)/bin/ccache
> HOSTCC = $(CCACHE) $(HOSTCC_NOCCACHE)
> HOSTCXX = $(CCACHE) $(HOSTCXX_NOCCACHE)
>
> so we know that it's the Buildroot ccache that will be used.

The gn build system in qt5webengine has some special ccache conditional handling
that doesn't get properly enabled with this method as it enables based
on the qt5base
ccache flag instead AFAIU.

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
