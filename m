Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8B9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 10:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A4EF83E15;
	Sun, 22 May 2022 10:16:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N6fQSBla5Grw; Sun, 22 May 2022 10:16:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4377882C3B;
	Sun, 22 May 2022 10:16:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B16E71BF47E
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0993417DA
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RhRPUCb04PHB for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 10:16:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A01141710
 for <buildroot@buildroot.org>; Sun, 22 May 2022 10:16:51 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2719AC0003;
 Sun, 22 May 2022 10:16:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nsidk-00BlPb-00; Sun, 22 May 2022 12:16:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220414203744.1819362-1-fontaine.fabrice@gmail.com>
Date: Sun, 22 May 2022 12:16:47 +0200
In-Reply-To: <20220414203744.1819362-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 14 Apr 2022 22:37:44 +0200")
Message-ID: <87zgj9zxbk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pure-ftpd: doesn't build with
 libressl
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > pure-ftpd doesn't build with libressl 3.4.3 which doesn't include
 > https://github.com/libressl-portable/openbsd/commit/f5674b4e2330b382bacefd3393affc8eb2ee2ba8
 > resulting in the following build failure:

 > tls.c: In function 'tls_init_options':
 > tls.c:329:5: warning: implicit declaration of function 'SSL_CTX_set_num_tickets'; did you mean 'SSL_CTX_set_options'? [-Wimplicit-function-declaration]
 >      SSL_CTX_set_num_tickets(tls_ctx, 0);
 >      ^~~~~~~~~~~~~~~~~~~~~~~
 >      SSL_CTX_set_options

 > Fixes:
 >  - http://autobuild.buildroot.org/results/f5d36180949278510199aa499e253780558c6ffe

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
