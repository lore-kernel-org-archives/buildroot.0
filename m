Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF8BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 06:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF01784CB1;
	Sat, 28 May 2022 06:48:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZMXwSgKXBSSd; Sat, 28 May 2022 06:48:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DA0C84CAE;
	Sat, 28 May 2022 06:48:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D99F1BF5DC
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 06:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B82D42AC4
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 06:48:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oMY7Jv0ht9ay for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 06:48:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD86E42AC3
 for <buildroot@buildroot.org>; Sat, 28 May 2022 06:48:55 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 16CD4240003;
 Sat, 28 May 2022 06:48:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nuqFp-002sKx-7H; Sat, 28 May 2022 08:48:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220502082656.461316-1-james.hilliard1@gmail.com>
 <20220502082656.461316-2-james.hilliard1@gmail.com>
Date: Sat, 28 May 2022 08:48:53 +0200
In-Reply-To: <20220502082656.461316-2-james.hilliard1@gmail.com> (James
 Hilliard's message of "Mon, 2 May 2022 02:26:56 -0600")
Message-ID: <87r14ef8yy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] linux: do not allow selecting RTAI for
 latest/cip kernels
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

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > RTAI is only supported on very specific kernel versions that are
 > different from the latest/cip kernel versions, so we should not
 > allow selecting RTAI when building with latest/cip kernels.

 > Fixes:
 >  - http://autobuild.buildroot.net/results/412/412492e19b41f95ff2445df6b7564cb0fa48873b
 >  - http://autobuild.buildroot.net/results/32c/32c9ffd8e965eb690ca0b0471e9c1cc16bb2fa66
 >  - http://autobuild.buildroot.net/results/0bc/0bc178dcb11aa23e5f8bf75c958d8a56c6c38964

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
