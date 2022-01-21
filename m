Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A8DC433F5
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 21:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F3C760F61;
	Fri, 21 Jan 2022 21:16:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0awSZb07Aqez; Fri, 21 Jan 2022 21:16:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0343760F0A;
	Fri, 21 Jan 2022 21:16:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 761021BF5EA
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 21:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DA5840189
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 21:16:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cVp4dzvfvQIs for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 21:16:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 624DA4012F
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 21:16:41 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 y11-20020a0568302a0b00b0059a54d66106so13427929otu.0
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 13:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pSajHjeqPAUkaZcV6C1RpdtIiZTRKax0vODdpjbnBfo=;
 b=Qg/ANsbPuDm0dUFIJo1jUJw76TYScaOAocOYga8aV/gskE1HgRj+ITlmh7vFxSZorO
 DqKzR5WtP98Bx1FLe9UaOaf53dYp4UxN1CQ+YiVLRCIYfjGMOudeH3rfM1F1QCJ0g4E5
 jR6+loxhth3UDT9zI+U5XfzzkrnFO0Dl807hyZ/DwaP1m7KXWrsCcwD+kq83iIS99mly
 1CSN9Qjv6Tfyqkw6cr9daCVbKfi4mMTXDvBdKtva8yJz+AUPiJM07cmyRDVtJTLnUsXT
 GSrdrEfCfhJYbrCiJFy1dI71LSXU5Az3nwIokZ2dr4hvlZnFM7EDEUJTjnqDpBnzjDDg
 fj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pSajHjeqPAUkaZcV6C1RpdtIiZTRKax0vODdpjbnBfo=;
 b=PgWo5ZX+k6EESmogMyRE3AERMBB5cx9RzMSzBGcvr6YETQdDOKWYdlnJi0/RKv/BdR
 y6hE6PGfa50cjJfbJE+xG38Rp6XwTDoQJnD1myXEmec9tS/6IFNEtZ/s1n6UssbOpQ04
 bLy8fXxEjUzxdnbCnc4/SriGH+tDGxkrccqTq3whRfI1A5IWiql1WRC42pr8eqKwwPck
 jCM1cecOgKr0DWqahX9d4jTSpNqoRNDvGhQ5FPoilMKIy8OvBvSl/Z3+9ZR8inr7INPe
 O6qDj3x0qT2lWXzUUHN8j7jZr/4K22j0YRgLaEx/NT9PEb/LVvB/rx5PjhLOSnx8AgRM
 27OA==
X-Gm-Message-State: AOAM530ZN6Nkcxa/gdOwtM30ibGVpCk3bnjVedZQiVGsGHJDYpcW3Gfh
 QDSlnKvcW7k/0CRoew6PnM7oSiJ4x1E61mUCJHtUNZNj
X-Google-Smtp-Source: ABdhPJxoopYbn7QPBERKykqEIqqVAatVAWoi6IuSdeJul4qwnpMoAonaKYU/ZEVx2UaFIXEqbPt3xC0o+FEW3efbAso=
X-Received: by 2002:a9d:63c3:: with SMTP id e3mr4139125otl.30.1642799800278;
 Fri, 21 Jan 2022 13:16:40 -0800 (PST)
MIME-Version: 1.0
References: <20220119084545.3642950-1-james.hilliard1@gmail.com>
 <20220119204518.GC3095239@scaer>
 <CADvTj4q2AWnzpQbbQHFRUWnKki_uRCcDTOiT7pwRZ4-Ao0o3fw@mail.gmail.com>
 <20220120222936.6e7b5aba@gmx.net>
 <CADvTj4rXQO8Kbe0sMA5YJdj6A2R98OELOB5sPD_xriZ_npkaFQ@mail.gmail.com>
 <20220121065850.GF3252931@scaer> <20220121084141.6eac525e@windsurf>
 <20220121075924.GG3252931@scaer> <20220121142623.7d5d72bc@windsurf>
In-Reply-To: <20220121142623.7d5d72bc@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 21 Jan 2022 14:16:29 -0700
Message-ID: <CADvTj4rBGJBc8cmGvByC=8iU7PZkzcRwbTZSzbP2wKLiR+O2Qg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/re2: switch to generic-package
 make build
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Jan 21, 2022 at 6:26 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Fri, 21 Jan 2022 08:59:24 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>
> > > I might be missing something in the whole discussion, but why not patch
> > > the CMake build system so that it also installs this .pc file, and
> > > contribute this fix upstream ?
> >
> > Because upstream have not been very enthusisatic about it, as James
> > pointed out when I suggested the same. ;-)
>
> Upstream is not enthusiastic about supporting pkg-config, about having
> their two possible build systems behave in the same way? What sort of
> odd upstream is that?

Best I can tell the cmake build is mostly intended for non-system
builds/installs
or something weird like that.

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
