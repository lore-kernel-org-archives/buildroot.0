Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B362BC6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 13:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5956B41936;
	Wed, 15 Mar 2023 13:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5956B41936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QJRrtdDZCCIk; Wed, 15 Mar 2023 13:06:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 677C041917;
	Wed, 15 Mar 2023 13:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 677C041917
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E733B1BF31D
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 13:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C29F840B64
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 13:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C29F840B64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0HWhccRZq2_0 for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 13:06:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1025840948
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1025840948
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 13:06:47 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ED78C20017;
 Wed, 15 Mar 2023 13:06:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pcQq5-0024bA-9N; Wed, 15 Mar 2023 14:06:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Sebastian Weyer <sebastian.weyer@smile.fr>
References: <20230303093754.2180686-1-sebastian.weyer@smile.fr>
Date: Wed, 15 Mar 2023 14:06:45 +0100
In-Reply-To: <20230303093754.2180686-1-sebastian.weyer@smile.fr> (Sebastian
 Weyer's message of "Fri, 3 Mar 2023 10:37:53 +0100")
Message-ID: <87wn3i2mfu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/bash: fix naming of
 target-finalize-hook
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

>>>>> "Sebastian" == Sebastian Weyer <sebastian.weyer@smile.fr> writes:

 > When the target-finalize-hook for bash was added in commit
 > 311c9eebc4dcfb764e3a7082706daf68e0603188 in order to write bash into
 > /etc/shells, it was done at the same time as for package/mksh and it was
 > incorrectly copied and MKSH still appeared in the name of the hook.

 > The hook is now correctly named BASH_ADD_BASH_TO_SHELLS

 > Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
