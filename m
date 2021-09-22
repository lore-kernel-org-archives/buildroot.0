Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E080C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 03:09:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B163F6115A
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 03:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B163F6115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=live.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56044402A1;
	Wed, 22 Sep 2021 03:09:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4KyM7XiMt-5o; Wed, 22 Sep 2021 03:09:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8595402A6;
	Wed, 22 Sep 2021 03:09:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 32A391BF263
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 03:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F6FA80F65
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 03:09:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fnanfri9JqPq for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 03:09:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5192D80E7C
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 03:09:26 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id x2so1116200ila.11
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pvuW9eGXf0a+gDpIm/aUXwUUdt2e3F9QLpZGTdjqn1Q=;
 b=Wwp6OUjjgLfVp3sU584CpjigvGzSRttkyS5PXWbq0svqu8CILQ+PXOqdlLzIzNk8c5
 OPDhpWxr6ZiAYEUUfIy6xD1iDT60BAoZVTVQLzJyH8qM5sNIJucDj6F6ZPpl7UUan+z4
 y4AMO5qNw8xxV28ewDh17LpXVcEWirvbSPXERdlPLyg2KS4Eq73BZuaVhS/aJnOv4Agr
 qhRu7LUbWoVOHPjws/D0cVqDoJ/Lepjw7RvW3LdvHWOTfYtPewv2Dpn6PhnppugPpVWY
 4BWG4LnT3TtCfomfp+gLEbFxTPi574SZhPYVENQ0lau0tE0z3Un7RIMaOduO6wVirxAx
 T0NA==
X-Gm-Message-State: AOAM533JIPbOi1QxZ+NWrGsmOfPSrabqS1IVEVsrn3pLaI8VU0T+jQ4k
 TfDlASUAHkqea5u6JCk4/NzmqeuyRvk4Dexv7zekEw==
X-Google-Smtp-Source: ABdhPJzFr3HwyPwv32XQkfc98kqJ79H44A0rT7ns8HBgj/kqU6D+e0z2v7CE0LTXXm7WGOEnJ0yNJqag/3UCveQXHek=
X-Received: by 2002:a92:cd8b:: with SMTP id r11mr2606093ilb.291.1632280165998; 
 Tue, 21 Sep 2021 20:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210921210438.41808-1-petr.vorel@gmail.com>
 <20210921210438.41808-2-petr.vorel@gmail.com>
In-Reply-To: <20210921210438.41808-2-petr.vorel@gmail.com>
From: James Knight <james.d.knight@live.com>
Date: Tue, 21 Sep 2021 23:09:15 -0400
Message-ID: <CALAjcgWNGy=1CbbrOMO9Ocu9ncpqxHDaX-+33rC9uToVp2-3hA@mail.gmail.com>
To: Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [Buildroot] [RFC PATCH v3 1/2] support: utils: use python3
 explicitly
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 David Laight <David.Laight@aculab.com>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

On Tue, Sep 21, 2021 at 5:04 PM Petr Vorel <petr.vorel@gmail.com> wrote:
> Python 2 is EOL sice 2020 [1], it's still available on distros, but may not
> be installed by default (as being replaced by python3).

I do not mind if everyone wants to make a transition to Python 3-only
support utilities, but I just wanted to mention that RHEL still
supports Python 2.x until June 2024 [1]. I am not aware of what
environments may be using RHEL8 to perform Buildroot-related
development and RHEL8 does support Python 3, so it may not be an
issue.

[1]: https://access.redhat.com/support/policy/updates/rhel8-app-streams-life-cycle
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
