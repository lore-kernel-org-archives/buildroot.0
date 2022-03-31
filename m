Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7087C433EF
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 11:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61E8541E0F;
	Thu, 31 Mar 2022 11:44:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mUpNl_BOW2Rg; Thu, 31 Mar 2022 11:44:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 420CB41C9F;
	Thu, 31 Mar 2022 11:44:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C5B8E1BF3D2
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 11:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B985C400F1
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 11:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UlvwJnaJdbBT for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 11:44:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D048400E4
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 11:44:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AC0ED1C0011;
 Thu, 31 Mar 2022 11:44:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nZtED-000iKx-EU; Thu, 31 Mar 2022 13:44:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20220325190934.24982-1-ps.report@gmx.net>
Date: Thu, 31 Mar 2022 13:44:37 +0200
In-Reply-To: <20220325190934.24982-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Fri, 25 Mar 2022 20:09:34 +0100")
Message-ID: <87v8vu4a8q.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/wireshark: fix compile with
 ccache enabled
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
Cc: Dan Ambrosio <dambrosio@outrider.ai>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > - use HOSTCC_NOCCACHE (instead of HOSTCC) for LEMON_C_COMPILER
 > Fixes:
 >   [...] /usr/bin/cmake [...] -DLEMON_C_COMPILER=.../host/bin/ccache /usr/bin/gcc [...]
 >   [...]
 >   [  0%] Building C object tools/lemon/CMakeFiles/lemon.dir/lemon.c.o
 >   .../host/bin/ccache: invalid option -- 'D'

 > Reported-by: Dan Ambrosio <dambrosio@outrider.ai>
 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2021.02.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
