Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0FAC433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 11:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7CDF405F9;
	Tue,  8 Mar 2022 11:49:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cv0yZN1YZDzZ; Tue,  8 Mar 2022 11:49:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF825404D7;
	Tue,  8 Mar 2022 11:49:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D9CA1BF870
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 11:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D471415B9
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 11:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tgbz8nc2YebV for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 11:49:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D531A415A8
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 11:49:10 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EE6F110000A;
 Tue,  8 Mar 2022 11:49:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nRYKv-001WqM-FO; Tue, 08 Mar 2022 12:49:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Johannes Agricola <marvin@0x53a.de>
References: <20220225171148.701977-1-romain.naour@gmail.com>
 <87zgm15yir.fsf@dell.be.48ers.dk>
 <d2685b34-a9d7-3196-ef38-68c59be02d9d@gmail.com>
 <EqrpQEFyCqF3gsB7R_tVdXsj5TjoB_zERTaX-8bOrxKIU0IRl1YjcLmUOETuZ0poddXoF1yxT_2dV7cYYi-4TT7GgE8yhg9gUt9Q0aLtmZo=@0x53a.de>
Date: Tue, 08 Mar 2022 12:49:05 +0100
In-Reply-To: <EqrpQEFyCqF3gsB7R_tVdXsj5TjoB_zERTaX-8bOrxKIU0IRl1YjcLmUOETuZ0poddXoF1yxT_2dV7cYYi-4TT7GgE8yhg9gUt9Q0aLtmZo=@0x53a.de>
 (Johannes Agricola's message of "Tue, 08 Mar 2022 11:37:13 +0000")
Message-ID: <87v8wo3bri.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/Makefile.in: year2038 makes time_t
 64-bit for glibc toolchains
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
Cc: Christophe Blaess <christophe.blaess@logilin.fr>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Johannes" == Johannes Agricola <marvin@0x53a.de> writes:

 > Good Day!
 > This seems to break the build of gcc-10.3 w/ glibc
 > 2.34-110. `libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp`
 > contains:

 >> #if SANITIZER_LINUX || SANITIZER_MAC
 >> // Tests in this file assume that off_t-dependent data structures match the
 >> // libc ABI. For example, struct dirent here is what readdir() function (as
 >> // exported from libc) returns, and not the user-facing "dirent", which
 >> // depends on _FILE_OFFSET_BITS setting.
 >> // To get this "true" dirent definition, we undefine _FILE_OFFSET_BITS below.
 >> #ifdef _FILE_OFFSET_BITS
 >> #undef _FILE_OFFSET_BITS
 >> #endif

Yes, we'll revert it for now and get it sorted out for 2022.05 instead.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
