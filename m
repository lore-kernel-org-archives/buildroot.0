Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690ABC001E0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 18:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D274C418BC;
	Wed,  9 Aug 2023 18:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D274C418BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DgPK9yhE8o76; Wed,  9 Aug 2023 18:07:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB09D418B9;
	Wed,  9 Aug 2023 18:07:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB09D418B9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D5411BF30D
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 18:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C77CD60F94
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 18:07:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C77CD60F94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R7doi5b0d_Jl for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 18:07:46 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2232160F19
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 18:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2232160F19
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3154640003;
 Wed,  9 Aug 2023 18:07:43 +0000 (UTC)
Date: Wed, 9 Aug 2023 20:07:42 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230809200742.5968181b@windsurf>
In-Reply-To: <ZNOMtm7TTVd12BQ3@waldemar-brodkorb.de>
References: <ZNOMtm7TTVd12BQ3@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691604463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DAxx0HDLrrY59C1uUZYNaRKGmt2AWEY251MP6Gai08M=;
 b=DNcX+hs6GDkKAVVvBBFaYrGVN2QMBYXFpSDtkYam3nFcs3NR3g8EZejPb+aPs68hNZ+n5P
 tkpmoik30NXCZ9drLgOx77uK9xwURQTigtk9uPs9Olcd6x6U81sBUhdqGV4fIsgXNAYyeJ
 e6wEJ5iq1iVVYx/CnH0kOlavzWhIO8AA6dA6t1Jz8Pmk1vmRajFYd/vbiZqbTG4Y9Qa2N6
 z2AoZ7H4G+88w4ZIy4q9J0ViCXrjXy0DrKizEqA8Qf+uA9YowGlaDgmqHbjXdAVU74bPdz
 08enfuzgtOj6LHLUruYIWj0Y6PwWP8c71rBPe4rQjS1ZKHVfPe1ExwQoLnaEUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DNcX+hs6
Subject: Re: [Buildroot] [PATCH] package/perl: threads support needs locales
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

On Wed, 9 Aug 2023 14:55:18 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> The thread support in perl needs locales enabled in the C library.
> Otherwise it fails with:
> POSIX.xs:3386:13: error: 'MBLEN_LOCK' undeclared (first use in this function); did you mean 'MUTEX_LOCK'?

Doesn't that seem really really weird, that thread support would depend
on locale support?

If we look at perl.h, which defines MBLEN_LOCK, we see something like
this:

/* Locale/thread synchronization macros. */
#if ! (   defined(USE_LOCALE)                                               \
       &&    defined(USE_ITHREADS)                                          \
       && (  ! defined(USE_THREAD_SAFE_LOCALE)                              \
           || (   defined(HAS_LOCALECONV)                                   \
               && (  ! defined(HAS_LOCALECONV_L)                            \
                   ||  defined(TS_W32_BROKEN_LOCALECONV)))                  \
           || (   defined(HAS_NL_LANGINFO)                                  \
               && ! defined(HAS_THREAD_SAFE_NL_LANGINFO_L))                 \
           || (defined(HAS_MBLEN)  && ! defined(HAS_MBRLEN))                \
           || (defined(HAS_MBTOWC) && ! defined(HAS_MBRTOWC))               \
           || (defined(HAS_WCTOMB) && ! defined(HAS_WCRTOMB))))
[...]
#  define MBLEN_LOCK                NOOP
[...]
#else
[...]
#  if defined(HAS_MBLEN) && ! defined(HAS_MBRLEN)
#    define MBLEN_LOCK   LOCALE_LOCK_
#    define MBLEN_UNLOCK LOCALE_UNLOCK_
[...]

Shouldn't the first #define MBLEN_LOCK NOOP correspond to our case
where no locale support is available?

There was a massive rework of this stuff in upstream commit
https://github.com/Perl/perl5/commit/d9e22c6a8a05aab7fffdbf810f74ddfcb4efd752,
which perhaps broke things.

I think I'll apply your patch anyway. I don't care very much about
!locale configs, and debugging the internals of Perl is beyond my
motivation.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
