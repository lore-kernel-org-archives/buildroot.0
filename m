Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974DDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 19:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4164980C9C;
	Sun, 27 Feb 2022 19:58:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c4hNKgq4WQ1S; Sun, 27 Feb 2022 19:58:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 260F680C12;
	Sun, 27 Feb 2022 19:58:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46B331BF3EC
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3169040B06
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:58:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ww0AgTcVYlP2 for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 19:58:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7CA84054B
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 19:58:29 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 321911BF205;
 Sun, 27 Feb 2022 19:58:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nOPgX-00E2Nn-11; Sun, 27 Feb 2022 20:58:25 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20220202214357.2640301-1-giulio.benetti@benettiengineering.com>
Date: Sun, 27 Feb 2022 20:58:24 +0100
In-Reply-To: <20220202214357.2640301-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Wed, 2 Feb 2022 22:43:57 +0100")
Message-ID: <875yp02ian.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] board/intel/galileo: fix build failure with
 host gcc 10
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
Cc: Nicholas Sielicki <sielicki@yandex.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Building galileo_defconfig throws error:
 > ```
 > /usr/bin/ld: arch/x86/tools/relocs_64.o:(.bss+0x0): multiple
 > definition of `per_cpu_load_addr';
 > arch/x86/tools/relocs_32.o:(.bss+0x0): first defined here
 > ```

 > To fix this let's add an upstreamed patch[1] and add BR2_GLOBAL_PATCH_DIR
 > to galileo_defconfig to point to where patch is.

 > [1]:
 > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eeeda4cd06e828b331b15741a204ff9f5874d28d.patch

 > Fixes:
 > https://gitlab.com/ymorin/buildroot/-/jobs/2035821039

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
