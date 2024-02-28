Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4073CC5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 16:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F015B60E4D;
	Wed, 28 Feb 2024 16:41:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 41_DLXgWyKGQ; Wed, 28 Feb 2024 16:41:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D20F60E6B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D20F60E6B;
	Wed, 28 Feb 2024 16:41:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F61B1BF2B3
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D766821A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:41:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SxuPDghilRTH for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 16:41:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6DF3B821A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DF3B821A6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DF3B821A6
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 16:41:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CA1D20007;
 Wed, 28 Feb 2024 16:41:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfMzw-001mlc-1a;
 Wed, 28 Feb 2024 17:41:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20240127200855.3B760865AE@busybox.osuosl.org>
Date: Wed, 28 Feb 2024 17:41:36 +0100
In-Reply-To: <20240127200855.3B760865AE@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sat, 27 Jan 2024 21:07:46 +0100")
Message-ID: <877ciopmm7.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/environment-setup: do not
 export GIT_DIR
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=48874afb9d03cb02b0207fd53bf2cdf0c37c8fa0
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit c07aafa08792 (package/Makefile.in: set GIT_DIR=.  in {HOST,
 > TARGET}_MAKE_ENV) added GIT_DIR=.  to TARGET_MAKE_ENV (which is included in
 > TARGET_CONFIGURE_OPTS) to work around issues with packages getting confused
 > when building in a subdir of the Buildroot git repo.

 > This unfortunately also causes git commands to fail when
 > output/host/environment-setup is sourced:

 > git status
 > fatal: not a git repository: '.'

 > So strip GIT_DIR= from TARGET_CONFIGURE_OPTS when generating
 > environment-setup.

 > Reported-by: Mircea Gliga <gliga.mircea@gmail.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
