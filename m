Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38C2C77B73
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 09:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 474044170E;
	Sun, 23 Apr 2023 09:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 474044170E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9HX6xWLWaTuw; Sun, 23 Apr 2023 09:04:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4466C416D0;
	Sun, 23 Apr 2023 09:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4466C416D0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6EC811C2B5F
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45C2E40B53
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45C2E40B53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bu5ZeBh__0OO for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 09:04:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4893F40B23
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4893F40B23
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 09:04:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1FF4B20002;
 Sun, 23 Apr 2023 09:04:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pqVdh-002YE9-4z; Sun, 23 Apr 2023 11:04:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20230410083252.138426-1-james.hilliard1@gmail.com>
 <05d8d295-8b28-c95e-368c-3f43dfcc6056@mind.be>
Date: Sun, 23 Apr 2023 11:04:09 +0200
In-Reply-To: <05d8d295-8b28-c95e-368c-3f43dfcc6056@mind.be> (Arnout
 Vandecappelle's message of "Tue, 11 Apr 2023 09:40:38 +0200")
Message-ID: <87sfcr6kc6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 1/1] package/pkg-cargo: ensure
 host/target rustflags are properly split
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 10/04/2023 10:32, James Hilliard wrote:
 >> Set HOST_LDFLAGS RUSTFLAGS via the host-config feature, see:
 >> https://doc.rust-lang.org/nightly/cargo/reference/unstable.html#host-config
 >> We have to enable this nightly feature first using:
 >> CARGO_UNSTABLE_HOST_CONFIG="true"
 >> Separately set target RUSTFLAGS for the target triple specific env
 >> variable.
 >> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

 >  Applied to master after a complete rewrite of the commit message, thanks.

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
