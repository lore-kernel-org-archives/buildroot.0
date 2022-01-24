Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD344C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 07:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46C5A60AEC;
	Mon, 24 Jan 2022 07:47:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qBwRwkYGPhmd; Mon, 24 Jan 2022 07:47:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E4FA60AD6;
	Mon, 24 Jan 2022 07:47:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A25311BF356
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 07:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94DAE60AD6
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 07:47:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qKUs-TWLKo3n for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 07:47:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [IPv6:2607:f8b0:4864:20::a32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3A8660AD2
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 07:47:28 +0000 (UTC)
Received: by mail-vk1-xa32.google.com with SMTP id b77so9578787vka.11
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 23:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LXRyNnqfJrSk0gZVE48OrnfuxdtKeGkjW8P34KEZNJI=;
 b=QNGzyz19NFoLwK3BLOY2jtx4RYVor3Pnjb67SyO0c+kGWNN+oLtq+b6/0K6HotIxYt
 GifrtiigkkoVmuM5VLML5r5IkoGMfqWYiqHgCtidZ0yluSa4YtZJFgUzfBut40AO3uHk
 Xtc5RP+xivkn9zQILjj2emgMzuUpN0glnzskEU6jyFm83g0fR+hFi8g2oWzoWeAcsN1H
 xP8A9bQ3kp9dWUAyhwwAr3iKf/W0QNjyjOjOb4UANUGeB8aTEZiH57l8dYsVjbW92WPm
 gadVv5vbIE7DI5RrNITYFq+3lzX/k/RXIxqbky/nlrSPoxId5P6QK8HjcVaZGH3d2JnR
 svZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LXRyNnqfJrSk0gZVE48OrnfuxdtKeGkjW8P34KEZNJI=;
 b=rinWiO4IwFE8LKZwQs/qXbN0TbCs7ARvpIa8kKkTIDnkMOwXoQeXcV1aju/4C1AlAQ
 WJ6J0EOz1rvCF1I5UzSe9Rm80vcZLdnk4KaKfynC+6ZSHGcpzQSGR9RMMl7Ms7Pnz9UM
 qVqdBVBNS4KmXrjd7qTLw/JF+q2SjQfvA4Xu/kaEzPfWmmHb+/omn1LIpPcn9wGWaM/X
 ZSY4st1Ux5wkV1Q81UG/yVBmfKQjr8Zttk7AFTnUZWxrihxYLFaoLl2onVISIpj146qy
 punBsJ1UgVTOO/pTE9h+BiQQoWab36rVwrlERhULEiyzQr4swW5J0O6eMkRq0QU7oWew
 PZQQ==
X-Gm-Message-State: AOAM5336CKY+EBbWYeMnpKBCNjYOxrQHson5O6pmkKkAb5aOh9O7Sqgo
 DAtG0Jx5ZRuNTGrzT+0jORtzPQmLE2l+lg==
X-Google-Smtp-Source: ABdhPJyVF3TH2b/UxagqX7XmbY3WrEwP2vtJaYIIv5Q37glp3w2dI55MYE1kY+07eoEfjRMnhzdIxQ==
X-Received: by 2002:a05:6122:1521:: with SMTP id
 g1mr3299784vkq.15.1643010447531; 
 Sun, 23 Jan 2022 23:47:27 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51])
 by smtp.gmail.com with ESMTPSA id n123sm2810163vkn.10.2022.01.23.23.47.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 23:47:26 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id l1so27412371uap.8
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 23:47:26 -0800 (PST)
X-Received: by 2002:ab0:2a4c:: with SMTP id p12mr2566468uar.120.1643010446399; 
 Sun, 23 Jan 2022 23:47:26 -0800 (PST)
MIME-Version: 1.0
References: <20220124072527.29954-1-christian@paral.in>
In-Reply-To: <20220124072527.29954-1-christian@paral.in>
Date: Sun, 23 Jan 2022 23:47:15 -0800
X-Gmail-Original-Message-ID: <CA+h8R2phyb2AgOc33BwVuftof56dSt9aRibkHTcuuW08vbZbng@mail.gmail.com>
Message-ID: <CA+h8R2phyb2AgOc33BwVuftof56dSt9aRibkHTcuuW08vbZbng@mail.gmail.com>
To: Christian Stewart <christian@paral.in>
Subject: Re: [Buildroot] [PATCH 1/1] package/delve: support building as host
 package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On Sun, Jan 23, 2022 at 11:25 PM Christian Stewart <christian@paral.in> wrote:
> +++ b/package/delve/Config.in.host
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_HOST_DELVE
> +       bool "delve"

This should be "host delve" - just caught it.

Thanks,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
