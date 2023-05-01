Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80724C77B61
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 11:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14E91409AD;
	Mon,  1 May 2023 11:38:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14E91409AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LIk1d-IVmTKj; Mon,  1 May 2023 11:38:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54A41408C9;
	Mon,  1 May 2023 11:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54A41408C9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3243F1BF336
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 11:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B5254096A
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 11:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B5254096A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DkDhS8BtEev7 for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 11:38:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE60840965
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE60840965
 for <buildroot@buildroot.org>; Mon,  1 May 2023 11:38:53 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 82D596000A;
 Mon,  1 May 2023 11:38:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ptRrl-006kNv-Ht; Mon, 01 May 2023 13:38:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Maksim Kiselev <bigunclemax@gmail.com>
References: <20230427202802.69965-1-bigunclemax@gmail.com>
Date: Mon, 01 May 2023 13:38:49 +0200
In-Reply-To: <20230427202802.69965-1-bigunclemax@gmail.com> (Maksim Kiselev's
 message of "Thu, 27 Apr 2023 23:28:02 +0300")
Message-ID: <87r0s0e0xi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/sunxi-tools: fix build dependencies
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Maksim" == Maksim Kiselev <bigunclemax@gmail.com> writes:

 > This patch fixes the dependency on libfdt for host-sunxi-tools.
 > Also it fixes the dependency on zlib for sunxi-tools.

 > Fix the following host build failure raised since commit
 > 2e330dff6a7ce7965ceb0dccdc9dcbcb329167bb

 > fit_image.c:19:10: fatal error: libfdt.h: No such file or directory
 >    19 | #include <libfdt.h>
 >       |          ^~~~~~~~~~
 > compilation terminated.

 > Fixes: http://autobuild.buildroot.net/results/2677c69ac34642a7a501230e1dd22b193db0899d/
 > Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
