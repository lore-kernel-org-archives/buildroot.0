Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCC7C61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 18:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9FB5409FC;
	Sun,  5 Mar 2023 18:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9FB5409FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c0xxIMoBgkCq; Sun,  5 Mar 2023 18:22:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE5D34097E;
	Sun,  5 Mar 2023 18:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE5D34097E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FC8D1BF3DA
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 465E64097E
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 465E64097E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CVNu-xBXPhDI for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 18:22:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 346304015E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 346304015E
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 18:22:41 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3C9CC40008;
 Sun,  5 Mar 2023 18:22:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pYt0H-001kdu-Vr; Sun, 05 Mar 2023 19:22:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Sebastian Weyer <sebastian.weyer@smile.fr>
References: <20230303093754.2180686-1-sebastian.weyer@smile.fr>
Date: Sun, 05 Mar 2023 19:22:37 +0100
In-Reply-To: <20230303093754.2180686-1-sebastian.weyer@smile.fr> (Sebastian
 Weyer's message of "Fri, 3 Mar 2023 10:37:53 +0100")
Message-ID: <87cz5n6osy.fsf@dell.be.48ers.dk>
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

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
