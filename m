Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C655C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 16:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 847FA408C2;
	Tue, 14 Dec 2021 16:25:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tXKlj4h07mnk; Tue, 14 Dec 2021 16:25:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1CBA408AF;
	Tue, 14 Dec 2021 16:25:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 499921BF2BB
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 16:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37B5F40560
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 16:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a8zBFiYhh_mJ for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 16:25:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B04FD4057B
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 16:25:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 26B6C1C0009
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 16:25:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mxAbw-00069B-Oz
 for buildroot@buildroot.org; Tue, 14 Dec 2021 17:25:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20211214121608.3309-1-peter@korsgaard.com>
Date: Tue, 14 Dec 2021 17:25:04 +0100
In-Reply-To: <20211214121608.3309-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 14 Dec 2021 13:16:07 +0100")
Message-ID: <87r1afrw67.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH-2021.02.x] package/busybox: security bump to
 version 1.33.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following vulnerabilities:
 > - CVE-2021-42374: An out-of-bounds heap read in Busybox's unlzma applet
 >   leads to information leak and denial of service when crafted
 >   LZMA-compressed input is decompressed

 > - CVE-2021-42375: An incorrect handling of a special element in Busybox's
 >   ash applet leads to denial of service when processing a crafted shell
 >   command, due to the shell mistaking specific characters for reserved
 >   characters.  This may be used for DoS under rare conditions of filtered
 >   command input

 > - CVE-2021-42376: A NULL pointer dereference in Busybox's hush applet leads
 >   to denial of service when processing a crafted shell command, due to
 >   missing validation after a \x03 delimiter character.  This may be used for
 >   DoS under very rare conditions of filtered command input.

 > - CVE-2021-42377: An attacker-controlled pointer free in Busybox's hush
 >   applet leads to denial of service and possible code execution when
 >   processing a crafted shell command, due to the shell mishandling the &&&
 >   string.  This may be used for remote code execution under rare conditions
 >   of filtered command input.

 > For details, see:
 > https://jfrog.com/blog/unboxing-busybox-14-new-vulnerabilities-uncovered-by-claroty-and-jfrog/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
