Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256C8C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 10:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 988D8813CD;
	Mon,  4 Jul 2022 10:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 988D8813CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GTFYe_XBArIR; Mon,  4 Jul 2022 10:14:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A996282416;
	Mon,  4 Jul 2022 10:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A996282416
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D84F41BF295
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 10:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B306C81C44
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 10:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B306C81C44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hs5Bkbi3_1zg for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 10:14:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC48182416
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC48182416
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 10:14:18 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id i126so12391841oih.4
 for <buildroot@buildroot.org>; Mon, 04 Jul 2022 03:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B+f4va739oXiwnKKQ+8qihPTEgfcy7eQGs4tS1xnEzQ=;
 b=zLxTOcpMuBTdbkBThJQSHoYbzxxCmc9hdVRwEOpIgknf1w4HMx/qCU+sUybsoe7Jb+
 9YIVruvdQNrnrD+eVxuRYRDFFuMA3SzI9HHb/YitxH1nVly0d1SF6q7b9dDfVAVq3v3N
 tqZWH6ALE4L2nPMle+HcciN3X+yykTcXfT7UzyIMkR01SgSyhayCrOWWsCzaeYmyis/5
 ANdEMtHxqeCyTUgovMJi+x1p89LFVKXWpxRWmau+6kqcz6UTyPZ+qABy09ByM5lKKvWi
 47jhj7fo3sTpaSfPqsbwCRtH9a1ct9N//c7AU4Ed7SZm2ML42ghO26BiaEKZ2KMiwwx1
 5uuw==
X-Gm-Message-State: AJIora8/8UmayF0UDoJAq/P6MXNNqbQKKI2P9VvRvdfIMWLubL+oGxlh
 nlq6eyXhaRph8bq75nX6Hf3+arkdfrZe3pKHrNKrC2dVEwg=
X-Google-Smtp-Source: AGRyM1uaWnxfGYIkdwUI6Veddlw+MsDN2YmYyBIWyLXqJu3PVrzANLtIwOoDuidhOIpkgIw4IiY+yYxrK0gP7u+umYs=
X-Received: by 2002:aca:44c1:0:b0:337:ba0e:3e7d with SMTP id
 r184-20020aca44c1000000b00337ba0e3e7dmr3063948oia.200.1656929657765; Mon, 04
 Jul 2022 03:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220704100836.17277-1-yegorslists@googlemail.com>
In-Reply-To: <20220704100836.17277-1-yegorslists@googlemail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 4 Jul 2022 04:14:06 -0600
Message-ID: <CADvTj4oXLMUUQdCM=tSys8Q98dHa9mM0Pbw1Nd6s3j6R-Xt01w@mail.gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=B+f4va739oXiwnKKQ+8qihPTEgfcy7eQGs4tS1xnEzQ=;
 b=EyHSJmLOS7e3pWuKUNnbOQBtNrAsNs+optbFb2/+YmPyPT/Q0MiO6c5uiMIgs2apbA
 kndv4hp0TOTOd6eu+53ovcSp+oQcFtCrAYAWUvtH15SQqE4/obemWcwxksZtJwav17+6
 BJ4i6thC5JmZUT5+huxdBTY1J2Oi28WdCEM+ONUD39TI2AJ/kNUS/ISNOm/IIZnW1D4F
 GJ+M2eLGxKywfJxZWPz51pcbt3fzX7yf7/SgCQn/AT0jXmrQcj+fjNSPj9S2ELncGdKi
 Go71q/MHdlrZuVGaZT07m/LEXL4eJyBE3nux66j7jRJnOKxBDtEHFK6lm32axXnvUzB7
 IxHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EyHSJmLO
Subject: Re: [Buildroot] [PATCH] package/python-argon2-cffi-bindings: add
 missing build-time dependency
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Jul 4, 2022 at 4:08 AM <yegorslists@googlemail.com> wrote:
>
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> python-argon2-cffi-bindings needs host-python-typing-extensions.

Actually this should go in host-python-setuptools-scm as it's only a
transient build
dependency for python-argon2-cffi-bindings.

>
> Fixes: http://autobuild.buildroot.net/results/3e0b4ad4b1b0714ef0fc877ab61933f32c0d47a0/
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  .../python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk   | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
> index f0d71e803a..7d666584c8 100644
> --- a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
> +++ b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
> @@ -13,6 +13,7 @@ PYTHON_ARGON2_CFFI_BINDINGS_LICENSE_FILES = LICENSE
>  PYTHON_ARGON2_CFFI_BINDINGS_DEPENDENCIES = \
>         host-python-cffi \
>         host-python-setuptools-scm \
> +       host-python-typing-extensions \
>         libargon2
>  PYTHON_ARGON2_CFFI_BINDINGS_ENV = ARGON2_CFFI_USE_SYSTEM=1
>
> --
> 2.17.0
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
