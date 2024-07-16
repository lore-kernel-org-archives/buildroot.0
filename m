Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8145AC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 19:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15DE4401FE;
	Tue, 16 Jul 2024 19:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m668eW_OFVmu; Tue, 16 Jul 2024 19:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C247E401DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C247E401DA;
	Tue, 16 Jul 2024 19:39:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50D1A1BF37C
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 19:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DE1C400D6
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 19:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4-inPJOaJeob for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 19:39:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D39F7400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D39F7400AB
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D39F7400AB
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 19:39:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B23EC60005;
 Tue, 16 Jul 2024 19:39:47 +0000 (UTC)
Date: Tue, 16 Jul 2024 21:39:46 +0200
To: Fred Lefranc <fred.lefranc.evs@gmail.com>
Message-ID: <20240716213946.43077ab4@windsurf>
In-Reply-To: <CAGkXw1WpytUyJK+bjDp77LA6-i93=anNqth57SYV5YNbj0hmxw@mail.gmail.com>
References: <20240715111003.1296141-1-fred.lefranc+evs@gmail.com>
 <20240716075933.1315047-1-fred.lefranc+evs@gmail.com>
 <20240716162323.48fb829b@windsurf>
 <CAGkXw1WpytUyJK+bjDp77LA6-i93=anNqth57SYV5YNbj0hmxw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721158787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hUAd4Iny7zue+g6BuZ7d6hZ0FgancgVu1E/Fe6ubc0g=;
 b=N+OkJ9QgWOyjx03Em5tn3S7Ih/jKWf10WvwZAz+yjYQUAWkI78PaIumw/cLrdWHwYDJjTM
 +6CxEWyCvxB8sBNbN2YbWqDNXgs4x+WQgdwmd9oiNUQ/3YHc7v/BYD+uBNrsnCKefm0wUA
 gWlFQJX8ZHnH9apqlyxa5ARSJ482sgG8zupxIrR8Emkfp8AhmL2nmZqmGbUcCbo598GPHr
 835ovXeA7V6+J4SzYvRJmVotgKSOuPTlIMBVVToSdCXzjdMGroM8dXZjPIJTeBmlZcSa+u
 lyXdxUdk0fDG3H6VwSpSFR5QWFsdLNSNWQBlW1OELkmcin9/2E0lnRKXddmDRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N+OkJ9Qg
Subject: Re: [Buildroot] [PATCH v3] package/busybox: fix build with glibc
 2.39
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Fred Lefranc <fred.lefranc+evs@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fred,

On Tue, 16 Jul 2024 19:32:05 +0200
Fred Lefranc <fred.lefranc.evs@gmail.com> wrote:

> Here is a revised version:

This is much better. Minor comments.

> When glibc was bumped to version 2.39 in commit
> b5680f53d60acf8ff6010082f873438a39bd5d97
> it removed the deprecated libcrypt support.
> 
> Busybox has internal crypt functions that are enabled by default. However,
> a user
> can choose to use the system's crypt function instead by disabling
> CONFIG_USE_BB_CRYPT.
> In such situations, glibc's libcrypt was providing busybox's libcrypt
> dependency
> and so busybox builds are broken when using glibc version 2.39 with
> CONFIG_USE_BB_CRYPT
> disabled.

In this last sentence, the usage of English tenses doesn't seem correct
to me (even though I'm not a native speaker). What about:

In such situation, until the upgrade of glibc to 2.39, Busybox could
rely on the libcrypt provided by glibc. However, this the bump of glibc
to 2.39, glibc no longer provides libcrypt, causing a build failure
with Busybox configurations that have CONFIG_USE_BB_CRYPT disabled.

> 
> To fix this, add the libxcrypt dependency to busybox when
> BR2_PACKAGE_LIBXCRYPT is
> selected. The user still has to select the libxcrypt package for this patch
> to work
> properly.

Replace last sentence with:

The user is still responsible for enabling BR2_PACKAGE_LIBXCRYPT when
their Busybox configuration has CONFIG_USE_BB_CRYPT disabled.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
