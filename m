Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335F3C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 18:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5BE481B69;
	Tue, 25 Jan 2022 18:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5YywfgSrHPWt; Tue, 25 Jan 2022 18:59:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36F5281B48;
	Tue, 25 Jan 2022 18:59:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B5421BF2C8
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6621C607CE
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:59:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wn-1SaOzBFdu for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 18:59:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03BAD6079D
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 18:59:33 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id BDCFA200002;
 Tue, 25 Jan 2022 18:59:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nCR2Q-000177-3I; Tue, 25 Jan 2022 19:59:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20211228214236.BD2C582B78@busybox.osuosl.org>
Date: Tue, 25 Jan 2022 19:59:30 +0100
In-Reply-To: <20211228214236.BD2C582B78@busybox.osuosl.org> (Yann E. MORIN's
 message of "Tue, 28 Dec 2021 22:47:41 +0100")
Message-ID: <87wnink5f1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/erlang-rebar: fix linking
 failure on shared library
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=b00c034fe58ad2ae87b2289e07912b6c10d19ee1
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Add patch to fix linking failure while creating shared library. As
 > explained in the patch itself, there is no specific variable for when we
 > link a shared library and rebar itself rely on the default LDFLAGS. Since
 > by default every CFLAGS is filled with -fPIC we need to make sure that
 > every LDFLAGS is the same, so not having any other *_LDFLAGS variable to
 > fille with -fPIC let's add it to the main LDFLAGS.

 > Fixes:
 > http://autobuild.buildroot.net/results/602/60296a48210e7ffc6bc9fa50ee586441a8957e85/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
