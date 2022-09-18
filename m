Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDBDC54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 09:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5897408DA;
	Sun, 18 Sep 2022 09:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5897408DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sI_a88b0NUJi; Sun, 18 Sep 2022 09:03:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3CC9402F2;
	Sun, 18 Sep 2022 09:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3CC9402F2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4298D1BF282
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E0E4402F2
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E0E4402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CXv5XSKM-pkY for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 09:03:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E12AC4011C
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E12AC4011C
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 09:03:31 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BDA18E0008;
 Sun, 18 Sep 2022 09:03:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZqD2-00BU0X-S6; Sun, 18 Sep 2022 11:03:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20220829202159.407642-1-romain.naour@gmail.com>
Date: Sun, 18 Sep 2022 11:03:28 +0200
In-Reply-To: <20220829202159.407642-1-romain.naour@gmail.com> (Romain Naour's
 message of "Mon, 29 Aug 2022 22:21:59 +0200")
Message-ID: <87v8plhx5r.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [for-master] package/gdb: include gdbarch.h in
 xtensa-linux-nat.c
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

 > It seems that gdb doesn't build for xtensa since a while, indeed commit
 > [1] merged in gdb 9 introduced a few number of build issues on several
 > architectures:

 > [Fix gdb build on macOS]
 > https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=b1c896b365f2dbcd14145a88d103623244cf0fb0

 > [gdb: Fix gdb build on mips64-linux]
 > https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=2208ee917050bcc901c7faefdee257ffbf8ef2ab

 > [gdb: Fix native build on Linux/Alpha.]
 > https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=7a27b85f6d9b5eea9bd1493f903158fbea4b2231

 > [Include gdbarch.h in m68k-linux-nat.c]
 > https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=a7cdaa914f4b937544d8f102679bb5129bb1ef08

 > [gdb: include gdbarch.h in hppa-linux-nat.c]
 > https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=ad75efa628656716982f2674008952bfd2c268af

 > Most of them has been fixed before the gdb 9 release but it seems
 > that xtensa is the last one on this list and still unfixed with
 > gdb 11 (not even noticed by Buildroot autobuilders).

 > [1]
 > https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=0d12e84cfc9bd36b7bbda01a3c8f83f65a832398

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Max Filippov <jcmvbkbc@gmail.com>
 > ---
 > gcc 12 is also broken due to too old xtensa overlay for gdb:

 > xtensa overlays form 2016 override gdb/xtensa-config.c breaking
 > the gdb 12 build due a recent changes from commit:
 > https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=345bd07cce33565f1cd66acabdaf387ca3a7ccb3

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
