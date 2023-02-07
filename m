Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825FBC636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ABC16100F;
	Tue,  7 Feb 2023 17:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ABC16100F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YJ9vvcmJmaUL; Tue,  7 Feb 2023 17:12:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F7556100C;
	Tue,  7 Feb 2023 17:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F7556100C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3BF51BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 778776100C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 778776100C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gbze-rWNSIaD for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:12:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB10560BB1
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB10560BB1
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:12:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0ED23100008;
 Tue,  7 Feb 2023 17:12:10 +0000 (UTC)
Date: Tue, 7 Feb 2023 18:12:09 +0100
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Message-ID: <20230207181209.6e69b852@windsurf>
In-Reply-To: <20220803200629.3172370-1-Ben.Wolsieffer@hefring.com>
References: <20220803200629.3172370-1-Ben.Wolsieffer@hefring.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675789931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ib1yk2UaI6FxZ245LXsPafnqMLtXX41Ea+UwyPJn2Hg=;
 b=fHPoFrGc9cSn3Mj9csjAWCcC0Qjl9EWQ74lkrYkoZMsVliKHOeQgs6dPBl5g9Irxt859Qe
 nJOVqr0Yv4IW8V0qxUZxswSS7cC4i9hFYIqHtKK+hWlZ5u3UYTcvNM1NF7kvFwSxIZ9wSF
 wvzhjbas9jq5I24LliZcb0XrChjRkhmu32qoiiaeWh1qyDwUKgjsoPkd9SMHvkg1Isx+Yh
 E127xOCoPx4oVTZ31IkiHiXCcC2Qi+0+8hPkaxFPabZJWwVPPwWxR/7ARolNfjdDuy3qUF
 tVkBSFuQ4i3UDaSvkZ8ZE2xVSM+ivhLeb0471XV7I13yEDnRSKzP3+bwcVyyXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fHPoFrGc
Subject: Re: [Buildroot] [PATCH v2] package/uclibc: fix usage of DODEBUG
 option
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ben,

On Wed,  3 Aug 2022 16:06:29 -0400
Ben Wolsieffer <ben.wolsieffer@hefring.com> wrote:

> The DODEBUG option passes -O0 and -DDEBUG to the compiler, which has a
> significant impact on runtime behavior and performance. Currently,
> DODEBUG is enabled by BR2_ENABLE_DEBUG, but it makes more sense for it
> to be enabled by BR_ENABLE_RUNTIME_DEBUG.
> 
> This patch implements the above change, and also disables the DOSTRIP
> option, allowing Builroot to decide whether binaries should be stripped.
> 
> Lastly, this patch adds $(TARGET_DEBUGGING) to the compiler flags, to
> enable debug symbols when appropriate.
> 
> Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
> ---
> Changes in v2:
>   - Always disable DOSTRIP.
>   - Only add $(TARGET_DEBUGGING) to CFLAGS, to avoid any unintended side
>     effects.

So after quite some time, I finally took care of your patch (sorry for
the delay!). I ended up splitting it into 3 separate commits, because
even though they are related, the 3 aspects are distinct. So here you
are:

commit f9867a725c12975af52dda9dffbdc33c3b0312db
Author: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Date:   Tue Feb 7 17:53:37 2023 +0100

    package/uclibc: enable DODEBUG when BR2_ENABLE_RUNTIME_DEBUG
    
    The DODEBUG=y option of uClibc causes uClibc to be built with -O0 and
    -DDEBUG, which has a significant runtime performance
    impact. Currently, DODEBUG=y is passed when BR2_ENABLE_DEBUG=y, but
    BR2_ENABLE_DEBUG is only about enabling debugging symbols, not about
    runtime debugging additions. The more recently added
    BR2_ENABLE_RUNTIME_DEBUG option is precisely designed for that, so we
    changed the logic to pass DODEBUG=y when BR2_ENABLE_RUNTIME_DEBUG=y,
    and not BR2_ENABLE_DEBUG=y.
    
    This allows to build uClibc with debugging symbols when
    BR2_ENABLE_DEBUG=y, without disabling optimizations and adding more
    debugging features that have a runtime performance impact.
    
    Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
    [Thomas: extracted from
    https://patchwork.ozlabs.org/project/buildroot/patch/20220803200629.3172370-1-Ben.Wolsieffer@hefring.com/
    and split into its own independent patch.]
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

commit 17481bd0bf6abff260ccc579974b813050f91d4e
Author: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Date:   Tue Feb 7 17:52:21 2023 +0100

    package/uclibc: pass $(TARGET_DEBUGGING) flags
    
    In order to have debugging symbols in uClibc, let's pass
    $(TARGET_DEBUGGING) in UCLIBC_EXTRA_CFLAGS.
    
    Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
    [Thomas: extracted from
    https://patchwork.ozlabs.org/project/buildroot/patch/20220803200629.3172370-1-Ben.Wolsieffer@hefring.com/
    and split into its own independent patch.]
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

commit cf92dcfaa92f6564830d10d4e18ae00fd8102ab2
Author: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Date:   Tue Feb 7 17:50:59 2023 +0100

    package/uclibc: don't let uClibc build system strip uClibc
    
    Let Buildroot handle this, so we can have an unstripped uClibc if
    needed.
    
    Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
    [Thomas: extracted from
    https://patchwork.ozlabs.org/project/buildroot/patch/20220803200629.3172370-1-Ben.Wolsieffer@hefring.com/
    and split into its own independent patch.]
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
