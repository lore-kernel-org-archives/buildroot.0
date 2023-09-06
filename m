Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D377EE14D3
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 19:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 030844158A;
	Wed,  6 Sep 2023 19:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 030844158A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iumdM1qbvv51; Wed,  6 Sep 2023 19:17:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BAE641566;
	Wed,  6 Sep 2023 19:17:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BAE641566
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A95B81BF46D
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81F9141B8C
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81F9141B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k8gufw24HU-M for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 19:17:29 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C0EE41B42
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 19:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C0EE41B42
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4898960005;
 Wed,  6 Sep 2023 19:17:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qdy1l-0082WQ-Gj; Wed, 06 Sep 2023 21:17:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Norbert Lange <nolange79@gmail.com>
References: <20230904124551.94741-1-nolange79@gmail.com>
 <CADYdroOi_QjoOorN6wji5Y4_sUMUe_=YSK42Eik0S8mqHiTosA@mail.gmail.com>
 <8734zri5aa.fsf@48ers.dk>
Date: Wed, 06 Sep 2023 21:17:25 +0200
In-Reply-To: <8734zri5aa.fsf@48ers.dk> (Peter Korsgaard's message of "Wed, 06
 Sep 2023 19:24:13 +0200")
Message-ID: <87ledjglh6.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/util-linux: fix build with old glibc
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Hi,

 >> I think this, together with the version bugfix bump to 2.39.2 should
 >> end up in BR 2023.08.

 > Can you give some more details about why? Is this a fix for a new issue
 > in 2.39.2 or already in 2.39.1? What is the relation between this and
 > commit 898bdbca1f11f (package/util-linux: fix compile issue with older
 > kernel headers)?

Apparently not in 2.39.1?

>>> util-linux 2.39.1 Patching

Applying 0001-libmount-fix-statx-includes.patch using patch:
patching file configure.ac
Hunk #1 succeeded at 315 (offset -11 lines).
Hunk #2 FAILED at 517.
Hunk #3 FAILED at 526.
2 out of 3 hunks FAILED -- saving rejects to file configure.ac.rej
patching file include/fileutils.h
Hunk #1 FAILED at 94.
1 out of 1 hunk FAILED -- saving rejects to file include/fileutils.h.rej
patching file libmount/src/hook_mount.c
Hunk #1 FAILED at 294.
1 out of 1 hunk FAILED -- saving rejects to file libmount/src/hook_mount.c.rej
patching file libmount/src/utils.c
Hunk #1 FAILED at 111.
1 out of 1 hunk FAILED -- saving rejects to file libmount/src/utils.c.rej
patching file meson.build
Hunk #1 FAILED at 79.
Hunk #2 succeeded at 175 with fuzz 2 (offset -2 lines).
Hunk #3 FAILED at 639.
2 out of 3 hunks FAILED -- saving rejects to file meson.build.rej

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
