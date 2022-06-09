Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364ECC433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0380884268;
	Thu,  9 Jun 2022 20:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CVIHCJLEMTyB; Thu,  9 Jun 2022 20:32:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 179528425F;
	Thu,  9 Jun 2022 20:32:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D47E1C1135
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B52B409C1
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:31:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y5DQCkg657ac for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:31:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7ABD340327
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:31:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 19A9AE0003;
 Thu,  9 Jun 2022 20:31:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nzOoj-002MD7-2c; Thu, 09 Jun 2022 22:31:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220606101316.366344-1-fontaine.fabrice@gmail.com>
Date: Thu, 09 Jun 2022 22:31:45 +0200
In-Reply-To: <20220606101316.366344-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 6 Jun 2022 12:13:16 +0200")
Message-ID: <87wndpziha.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mono: needs NPTL
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > mono unconditionally uses pthread_attr_get_np and so needs NTPL since
 > version 4.0.1.43 and
 > https://github.com/mono/mono/commit/748fefa1d7199f008c6e56499ba482fb17fe1583:

 > mono-threads-linux.c: In function 'mono_threads_platform_get_stack_bounds':
 > mono-threads-linux.c:26:15: error: implicit declaration of function
 > 'pthread_getattr_np'; did you mean 'pthread_attr_init'?
 > [-Werror=implicit-function-declaration]
 >    26 |         res = pthread_getattr_np (pthread_self (), &attr);
 >       |               ^~~~~~~~~~~~~~~~~~
 >       |               pthread_attr_init

 > Fixes:
 >  - http://autobuild.buildroot.org/results/6534ee4ae699c17ee98f6f89a8a1212936e04481

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
