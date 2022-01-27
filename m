Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52F1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 20:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50ADE60BBD;
	Thu, 27 Jan 2022 20:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sodBmNZVMbdR; Thu, 27 Jan 2022 20:31:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 978B860BBC;
	Thu, 27 Jan 2022 20:31:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11CCB1BF317
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 20:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 008BF60B9C
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 20:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gsoQkKU4eFTa for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 20:31:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51F6060B3A
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 20:31:23 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id az20so460827vsb.8
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 12:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5yWcVJ7mCbJxOQ681Du/In/4Z60NM6jEWlmt5kJlzWk=;
 b=FmW/h/HqIXdNtNr3nfxakNOpc5yPCkeqtDIX1kyXJsJOUeT43t+V1uLRVhN10ZTxbg
 gQBzug95AbFHA1+uFWf2T6+Su4QHcVXB22ZHM3ghODpSMgZIBQtKCGK5KkZE3C/6unk+
 FU35UPuiqdAovg4fM1UWLtEdqycQYIdm4izqtcmo9Ho6isdXbqVPIOliZ0wooIeMDI8l
 NnCwRIx2lwhhdxQh/BiVl/MIaE8gYc19mnjWzs8k/Mkw1iAohnZegU9itlVALcjVF5Ou
 dXnf/nKlF8TB/wwNbv1o+8Hn62JhSHbB8q8tjsMDdadrZZzOoy5dI+MolxGyelBrosAQ
 5GjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5yWcVJ7mCbJxOQ681Du/In/4Z60NM6jEWlmt5kJlzWk=;
 b=37iqkUEVtabYCeVzzZOAzuEitzxlFSKg2FuSN6I0uN/vWBgn1MIqPd2cgYW1I38eno
 fq0SkT1okd+EFvACa4y9gDrpcSikWDVeI/nIfiXtXKraRNt2ZgzcOSVRy6xe5LJa4sIa
 0WMTC+/GqXZ0ixYsNCvZyxoeI5IhA3beIfJcfqCznCzyfW9lFT1//exxVGRcDlm/bo80
 oUZpTWh2/3llPqyvZq0I+sgSj1twYGJ4JOUS2WdRz53VQggmbegNTgXRtVKyZ3ukDdLG
 znUiIK8hi4KLHZHKndnuoVaKwB5WoCK6RuVFGZPIVvIhlXxNK8q5jD2liX1DznPKpa3s
 liLw==
X-Gm-Message-State: AOAM531AVTZxjvg8lZC2Civ0PkSaHFJcChjvsDqMqScbMeZGtdv3nQAy
 yXhgCimT4rq2MGM/4JKLOw9pChuazWV03Q==
X-Google-Smtp-Source: ABdhPJznWJLCTkSHNBO4Ljr+gCeKrB4jUHjnSFJO6OnSaRVWBwi4CCh8g5pi3ByeEQFgAXr92r88JQ==
X-Received: by 2002:a67:e190:: with SMTP id e16mr2545261vsl.54.1643315481815; 
 Thu, 27 Jan 2022 12:31:21 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com.
 [209.85.217.47])
 by smtp.gmail.com with ESMTPSA id g22sm897338vkm.3.2022.01.27.12.31.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 12:31:20 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id az20so460727vsb.8
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 12:31:20 -0800 (PST)
X-Received: by 2002:a67:ac09:: with SMTP id v9mr2535706vse.85.1643315480081;
 Thu, 27 Jan 2022 12:31:20 -0800 (PST)
MIME-Version: 1.0
References: <20220127062504.1835450-1-christian@paral.in>
 <20220127062504.1835450-2-christian@paral.in>
 <20220127090141.7d0645f2@windsurf>
In-Reply-To: <20220127090141.7d0645f2@windsurf>
Date: Thu, 27 Jan 2022 12:31:09 -0800
X-Gmail-Original-Message-ID: <CA+h8R2oKO-hhmn9eOQoj4fX9ZYXBCVPqqe8knbrOq46c3s6E9w@mail.gmail.com>
Message-ID: <CA+h8R2oKO-hhmn9eOQoj4fX9ZYXBCVPqqe8knbrOq46c3s6E9w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v3 2/2] package/buildah: new package
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
Cc: Christian Stewart <christian@paral.in>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,


On Thu, Jan 27, 2022 at 12:01 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Considering that there are runtime dependency concerns, it would be
> nice to have a simple test case in support/testing/.

OK, something like "buildah pull" or so?

> > +BUILDAH_DEPENDENCIES = libgpgme
>
> Is libgpgme really a runtime dependency, as noted in your changelog? If

Gpg is a runtime dependency, libgpgme is a build dependency.


> > +HOST_BUILDAH_BUILD_TARGETS = $(BUILDAH_BUILD_TARGETS)
> > +HOST_BUILDAH_TAGS = $(BUILDAH_TAGS)
> > +HOST_BUILDAH_LDFLAGS = $(BUILDAH_LDFLAGS)
> > +HOST_BUILDAH_INSTALL_BINS = $(BUILDAH_INSTALL_BINS)
>
> That "repetition" also makes me think we should have some level of
> inheritance between target and host variables in the golang-package
> infrastructure. For BUILD_TARGETS, TAGS and INSTALL_BINS, it sounds
> fine to do it.

Yes - unless the package overrides them - this should be fine.

I was a bit surprised that it, on default, tries to build the binary
named "host-runc" as well as a Go package named "host-runc". Of
course, this is not the name of neither the binary nor the package.

So the host-golang infra should remove the host- prefix for the
default BUILD_TARGETS and INSTALL_BINS.

This would also be fixed if those values were inherited from the target package.

> However, for LDFLAGS, it's a bit weird, as normally,
> LDFLAGS are different between host and target. However here, there are
> mostly used to pass these version-related -X options, that are in fact
> the same between host and target. Should we have a separate variable to
> pass those flags ? Not sure.

They are quite common for Go packages - could call them DEFINES or
something similar.

The syntax overrides the value of a global variable in a package.

Best regards,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
