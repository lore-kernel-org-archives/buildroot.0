Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA82E728DD
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 19:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDD2D83D4B;
	Fri, 29 Sep 2023 19:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDD2D83D4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id izvpGdJL1zJJ; Fri, 29 Sep 2023 19:32:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B5AD83D49;
	Fri, 29 Sep 2023 19:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B5AD83D49
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8EB31BF83B
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 19:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B22DE83D4D
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 19:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B22DE83D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jC96TCs69JTT for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 19:32:35 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F2A083D48
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 19:32:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F2A083D48
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9837EFF809;
 Fri, 29 Sep 2023 19:32:33 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qmJE1-006EuM-0I; Fri, 29 Sep 2023 21:32:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20230911210917.1114974-1-romain.naour@gmail.com>
Date: Fri, 29 Sep 2023 21:32:32 +0200
In-Reply-To: <20230911210917.1114974-1-romain.naour@gmail.com> (Romain Naour's
 message of "Mon, 11 Sep 2023 23:09:16 +0200")
Message-ID: <87edigg4hb.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/{glibc,
 localedef}: bump to version
 2.38-13-g92201f16cbcfd9eafe314ef6654be2ea7ba25675
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Enable mathvec explicitely on aarch64(be) since it's now enabled by
 > default [1]. aarch64 mathvec requires at gcc-10 but Buildroot already
 > provide gcc-11 as minimum version.

 > Don't use --enable-fortify-source for now in order to keep original
 > behavior while doing the glibc version bump (and because some
 > architecture doesn't support well fortiry-source, i.e Microblaze).
 > Postpone this change to a follow up commit.

 > Keep the "deprecated" libcrypt enabled just in case if some
 > application are not yet ready to use an alternative such as libxcrypt.

 > Security related changes:

 >   CVE-2023-25139: When the printf family of functions is called with a
 >   format specifier that uses an <apostrophe> (enable grouping) and a
 >   minimum width specifier, the resulting output could be larger than
 >   reasonably expected by a caller that computed a tight bound on the
 >   buffer size.  The resulting larger than expected output could result
 >   in a buffer overflow in the printf family of functions.

It would have been handy to first bump to the 2.37.x version fixing this
issue for easy backporting, but OK - I will do it separately.

 > See:
 > https://lists.gnu.org/archive/html/info-gnu/2023-07/msg00010.html

 > Runtime tested with Qemu on Gitlab-ci:
 > https://gitlab.com/kubu93/buildroot/-/pipelines/998435203
 > https://gitlab.com/buildroot.org/toolchains-builder/-/pipelines/998926028

 > [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=cd94326a1326c4e3f1ee7a8d0a161cc0bdcaf07e

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
