Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED91C43334
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 20:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1EC1611DC;
	Wed,  1 Jun 2022 20:53:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5nQaELSHatzw; Wed,  1 Jun 2022 20:53:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F233D611D0;
	Wed,  1 Jun 2022 20:53:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E5C91BF2C7
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 20:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A98C409A6
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 20:53:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ZWy_KXDmSha for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 20:53:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D89F7409B5
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 20:53:29 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 51627100002;
 Wed,  1 Jun 2022 20:53:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nwVLJ-0095Kq-9V; Wed, 01 Jun 2022 22:53:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
References: <20220524170541.93208-1-jarkko.sakkinen@iki.fi>
Date: Wed, 01 Jun 2022 22:53:25 +0200
In-Reply-To: <20220524170541.93208-1-jarkko.sakkinen@iki.fi> (Jarkko
 Sakkinen's message of "Tue, 24 May 2022 20:05:40 +0300")
Message-ID: <877d602ji2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/linux-tools: openssl dependency
 for x86_64 selftests
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
Cc: Peter Seiderer <ps.report@gmx.net>, "Yann E.
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Jarkko" == Jarkko Sakkinen <jarkko.sakkinen@iki.fi> writes:

 > On x86_64, libssl is a dependency for kselftests. selftests/sgx depends on
 > it.  Thus, select it in "Config.in", and add it as a build dependency in
 > "linux-tool-selftests.mk.in".

 > Link: https://lore.kernel.org/buildroot/20220517224809.21f77949@gmx.net/
 > Suggested-by: Peter Seiderer <ps.report@gmx.net>
 > Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
 > ---
 > v2:
 > Config.in: BR2_PACKAGE_LIBOPENSSL => BR2_PACKAGE_OPENSSL

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
