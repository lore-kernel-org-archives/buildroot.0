Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA6DC636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 14:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3E776110F;
	Wed,  8 Feb 2023 14:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3E776110F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pYjEZFSiBTEY; Wed,  8 Feb 2023 14:47:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36E0C61119;
	Wed,  8 Feb 2023 14:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36E0C61119
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A40D21BF2C7
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B54061119
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B54061119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kxrx-xPhpiNm for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 14:47:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 385FD6110F
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 385FD6110F
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 14:47:46 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B0AF4E000F;
 Wed,  8 Feb 2023 14:47:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pPljb-00GGGq-Ua; Wed, 08 Feb 2023 15:47:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Sebastian Weyer <sebastian.weyer@smile.fr>
References: <20230208110551.187828-1-sebastian.weyer@smile.fr>
Date: Wed, 08 Feb 2023 15:47:43 +0100
In-Reply-To: <20230208110551.187828-1-sebastian.weyer@smile.fr> (Sebastian
 Weyer's message of "Wed, 8 Feb 2023 12:05:51 +0100")
Message-ID: <871qn05i40.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/rust: fix boostrap build
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Sebastian" == Sebastian Weyer <sebastian.weyer@smile.fr> writes:

 > The update to v1.67.0 of rust broke the boostrap build. This patch

s/boostrap/bootstrap/ ;)

 > applies an upstream patch to fix this:
 > https://github.com/rust-lang/rust/commit/3fe64ebbce21e79adb64099984e96dfb79bdd0f9

 > Fixes:
 > http://autobuild.buildroot.org/results/214/214fcbb3458893784b7f85b60f7ee1edb428c77f/build-end.log

 > Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
 > Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 > Cc: James Hilliard <james.hilliard1@gmail.com>

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
