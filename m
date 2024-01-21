Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D20C47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 20:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A254404F7;
	Sun, 21 Jan 2024 20:03:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A254404F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QqE6xQXrJvlH; Sun, 21 Jan 2024 20:03:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8260640493;
	Sun, 21 Jan 2024 20:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8260640493
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D163C1BF3C9
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 20:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6326401D8
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 20:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6326401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K_bseKf29V6R for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 20:03:21 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3C3E40136
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 20:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3C3E40136
Received: by mail.gandi.net (Postfix) with ESMTPSA id A24931BF203;
 Sun, 21 Jan 2024 20:03:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rRdVj-001wqr-0j;
 Sun, 21 Jan 2024 20:29:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240111105621.2321957-1-peter@korsgaard.com>
 <20240111105621.2321957-2-peter@korsgaard.com>
 <Za0YJSXFxMiKvO0j@landeda>
Date: Sun, 21 Jan 2024 20:29:29 +0100
In-Reply-To: <Za0YJSXFxMiKvO0j@landeda> (Yann E. MORIN's message of "Sun, 21
 Jan 2024 14:12:05 +0100")
Message-ID: <87zfwyh4di.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/micropython: drop GIT_DIR=.
 workaround
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
Cc: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2024-01-11 11:56 +0100, Peter Korsgaard spake thusly:
 >> Now that it is handled globally in TARGET_MAKE_ENV.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/micropython/micropython.mk | 5 -----
 >> 1 file changed, 5 deletions(-)
 >> 
 >> diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
 >> index e6eb536ea5..3d356c51d8 100644
 >> --- a/package/micropython/micropython.mk
 >> +++ b/package/micropython/micropython.mk
 >> @@ -14,11 +14,6 @@ MICROPYTHON_LICENSE = MIT, BSD-1-Clause, BSD-3-Clause, Zlib
 >> MICROPYTHON_LICENSE_FILES = LICENSE
 >> MICROPYTHON_DEPENDENCIES = host-pkgconf libffi host-python3
 >> 
 >> -# Set GIT_DIR so package won't use buildroot's version number
 >> -MICROPYTHON_MAKE_ENV = \
 >> -	$(TARGET_MAKE_ENV) \
 >> -	GIT_DIR=.

 > I was way too sloppy when applying this patch: MICROPYTHON_MAKE_ENV
 > previously contained $(TARGET_MAKE_ENV), but now it is totally unset,
 > and the expansions of it have not been replaced with TARGET_MAKE_ENV,
 > leading to all sorts of build faiulures, like:

 >     LINK build-standard/micropython
 >     arm-linux-gcc: ERROR: unsafe header/library path used in
 > cross-compilation: '-L/usr/lib64/../lib64'

 > I suspect it is also the issue reported by Julien in his micropython
 > runtime test:

 >     https://patchwork.ozlabs.org/project/buildroot/patch/20240116210556.589407-1-ju.o@free.fr/

 > I'll push a fixup patch that uses TARGET_MAKE_ENV

Argh, thanks! Sorry.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
