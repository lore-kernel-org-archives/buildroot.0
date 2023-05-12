Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E323FC77B75
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 15:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 821F5418B8;
	Fri, 12 May 2023 15:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 821F5418B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sj5mK_6VU2nr; Fri, 12 May 2023 15:23:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B1B8417D9;
	Fri, 12 May 2023 15:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B1B8417D9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B4651BF2CB
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 15:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4A05417D9
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 15:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4A05417D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VLiPPjF3fz1d for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 15:23:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2E18417CA
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2E18417CA
 for <buildroot@buildroot.org>; Fri, 12 May 2023 15:23:31 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DA0D24000B;
 Fri, 12 May 2023 15:23:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pxUcC-00G9df-KI; Fri, 12 May 2023 17:23:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Andreas Ziegler <br015@umbiko.net>
References: <20230512110438.233473-1-br015@umbiko.net>
Date: Fri, 12 May 2023 17:23:28 +0200
In-Reply-To: <20230512110438.233473-1-br015@umbiko.net> (Andreas Ziegler's
 message of "Fri, 12 May 2023 13:04:38 +0200")
Message-ID: <874joh4lqn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] linux/linux.mk: fix commit
 d06dca38bb0373a13736a349f7795713458a2188 - remove extra bracket
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

>>>>> "Andreas" == Andreas Ziegler <br015@umbiko.net> writes:

 > Commit d06dca38bb0373a13736a349f7795713458a2188 (linux: cleanup 
 > kconfig fixup processing) moved the initramfs setup out of an 
 > enclosing statement but kept the closing bracket. 

 > Remove the extra bracket to fix a syntax error in sed processing.

 > Fixes:
 >>>> linux 6.4-rc1 Updating kernel config with fixups
 >   /bin/bash: -c: line 1: syntax error near unexpected token `)'
 >   /bin/bash: -c: line 1: `/usr/bin/sed -i -e '/^\(# \)\?CONFIG_INITRAMFS_ROOT_GID\>/d' /home/data/buildroot.experimental/build/linux-6.4-rc1//.config && echo 'CONFIG_INITRAMFS_ROOT_GID=0' >> /home/data/buildroot.experimental/build/linux-6.4-rc1//.config)'

 > Signed-off-by: Andreas Ziegler <br015@umbiko.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
