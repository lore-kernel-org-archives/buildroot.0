Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1B9C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 08:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 923F341829;
	Fri, 18 Mar 2022 08:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pd3jxCH47AfB; Fri, 18 Mar 2022 08:31:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1991416D2;
	Fri, 18 Mar 2022 08:31:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17F4A1BF215
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 08:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15C95416D2
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 08:31:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dt9UdUsWe1QW for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 08:31:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F077C4168F
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 08:31:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A1BAE10000B;
 Fri, 18 Mar 2022 08:31:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nV81R-00DdEH-Ln; Fri, 18 Mar 2022 09:31:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220309173503.527227-1-fontaine.fabrice@gmail.com>
Date: Fri, 18 Mar 2022 09:31:45 +0100
In-Reply-To: <20220309173503.527227-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 9 Mar 2022 18:35:03 +0100")
Message-ID: <87k0crr79q.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gnutls: fix build without
 threads
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure without threads raised since bump to
 > version 3.7.3 in commit 212b020bb43f13121d6cde464f871d5d1cf6cfbe:

 > kx.c: In function '_gnutls_nss_keylog_write':
 > kx.c:164:33: error: 'keylog_mutex' undeclared (first use in this function); did you mean 'keylog_once'?
 >   164 |   if (gnutls_static_mutex_lock(&keylog_mutex) < 0) {
 >       |                                 ^~~~~~~~~~~~
 >       |                                 keylog_once

 > Fixes:
 >  - http://autobuild.buildroot.org/results/e092bc11ce4b5908cb6285aa77a3594b8626eeec

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
