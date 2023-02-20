Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C703C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B026270291;
	Tue, 21 Feb 2023 02:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B026270291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UBDZzOQEX_aw; Tue, 21 Feb 2023 02:08:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC18D7019E;
	Tue, 21 Feb 2023 02:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC18D7019E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BAC91BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5AFB8176C
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5AFB8176C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ezyY9zYh1nq4 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 21:07:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C42B81D34
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C42B81D34
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 21:07:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 742F5E0002;
 Mon, 20 Feb 2023 21:07:42 +0000 (UTC)
Date: Mon, 20 Feb 2023 22:07:41 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230220220741.1f38012c@windsurf>
In-Reply-To: <20230219232301.1795196-1-fontaine.fabrice@gmail.com>
References: <20230219232301.1795196-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676927262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XVFdoaiH06TlDGcsULNldZza6v3cHV39p/Z66J59A9o=;
 b=YU0W6CETLpnEEVRUtZhr7ABzc65nFJoYoUN9wLZ4ms+2f+eAPdJiAh/3JUHsu9msvqzzV+
 d0ec3GtUHe9kwEKmFZDqoi3eXtrZApB8f9yBiB42skm2nmJwZGPv9ZnznKLVPk8DC6R2zF
 5umd+X1kelltMMgpM3OQAOME5y880LFEQrZERJ77xT83wbTdAM568iNtJW9sfMoDBXbOP/
 PYAJmrvE4eappSM8n98Lsyk4g/OoSZ3C/etHRKkd5HeEkm2FThTXLZgf6jlBGMpb7TwnoK
 urN5QgtzoJVutBt8gLAfhyR/P1wO0MUlptKtfmk1kuRN7YvkgwmoqLZPySACLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YU0W6CET
Subject: Re: [Buildroot] [PATCH 1/1] package/tmux: fix BR2_SHARED_STATIC_LIBS
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Mon, 20 Feb 2023 00:23:01 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> tmux uses custom --enable-static option, instead of standard libtool
> directive resulting in the following build failure with systemd or
> utf8proc raised since commits
> 1f618aa388535181c281c85e2b5264532de4ef0f and
> e279599d255a79c08ef20b97b96eb248689d52a9:

I am rather confused by the reasoning here.

> checking for utf8proc.h... yes
> checking for library containing utf8proc_charwidth... no
> configure: error: "utf8proc not found"

So this one is:

  http://autobuild.buildroot.net/results/6e8/6e8523d8d514bf6d8fc3377d05e5edbe7fc2d5bb/build-end.log
  http://autobuild.buildroot.net/results/623/62309091c9da69eb29c3e9464aa95d089ce886f8/build-end.log

I think here the problem is indeed that tmux interprets --enable-static
as "please provide a statically linked binary" instead of the standard
"please build/install static libraries".

So, when it tries to detect libutf8proc, it doesn't find it:

/home/autobuild/autobuild/instance-13/output-1/host/lib/gcc/or1k-buildroot-linux-musl/11.3.0/../../../../or1k-buildroot-linux-musl/bin/ld: cannot find -lutf8proc: No such file or directory

because utf8proc is based on CMake, and CMake is not able to build both
shared and static libraries, so in the BR2_STATIC_SHARED_LIBS=y case,
it only installs shared libraries. Because the above utf8proc library
test is done with -static, it requires a static variant of libutf8proc,
which isn't there.

So indeed, for this case, it makes sense to not pass --enable-static to
tmux, but it's both due to tmux having a non-standard behavior for
--enable-static *AND* the fact that utf8proc also doesn't behave
properly in the BR2_STATIC_SHARED_LIBS=y case.

> In file included from tmux.h:34,
>                  from alerts.c:23:
> compat.h:379:18: error: conflicting types for 'forkpty'; have 'pid_t(int *, char *, struct termios *, struct winsize *)' {aka 'int(int *, char *, struct termios *, struct winsize *)'}
>   379 | pid_t            forkpty(int *, char *, struct termios *, struct winsize *);
>       |                  ^~~~~~~


However this one, I am really, really confused as to how it can be
related to BR2_STATIC_SHARED_LIBS and --enable-static. Could you
provide some more details on the reasoning?

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
