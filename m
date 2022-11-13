Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC00C433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 14:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91D9F4055D;
	Sun, 13 Nov 2022 14:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91D9F4055D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i1wWg35yuDw1; Sun, 13 Nov 2022 14:32:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8DB24020B;
	Sun, 13 Nov 2022 14:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8DB24020B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C64C51BF2CE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A091540890
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A091540890
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZvPmgaxYYAcX for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 14:32:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A444B4088E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A444B4088E
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 14:32:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 768921C0003;
 Sun, 13 Nov 2022 14:32:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ouE2J-005MXa-Jn; Sun, 13 Nov 2022 15:32:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20221030190028.3632333-1-james.hilliard1@gmail.com>
Date: Sun, 13 Nov 2022 15:32:39 +0100
In-Reply-To: <20221030190028.3632333-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Sun, 30 Oct 2022 13:00:28 -0600")
Message-ID: <875yfirkl4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-cmake.mk: MakeFiles ->
 Makefiles
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Fixes:
 > CMake Error: Could not create named generator Unix MakeFiles

 > Generators
 >   Green Hills MULTI            = Generates Green Hills MULTI files
 >                                  (experimental, work-in-progress).
 > * Unix Makefiles               = Generates standard UNIX makefiles.
 >   Ninja                        = Generates build.ninja files.
 >   Ninja Multi-Config           = Generates build-<Config>.ninja files.
 >   Watcom WMake                 = Generates Watcom WMake makefiles.
 >   CodeBlocks - Ninja           = Generates CodeBlocks project files.
 >   CodeBlocks - Unix Makefiles  = Generates CodeBlocks project files.
 >   CodeLite - Ninja             = Generates CodeLite project files.
 >   CodeLite - Unix Makefiles    = Generates CodeLite project files.
 >   Eclipse CDT4 - Ninja         = Generates Eclipse CDT 4.0 project files.
 >   Eclipse CDT4 - Unix Makefiles= Generates Eclipse CDT 4.0 project files.
 >   Kate - Ninja                 = Generates Kate project files.
 >   Kate - Unix Makefiles        = Generates Kate project files.
 >   Sublime Text 2 - Ninja       = Generates Sublime Text 2 project files.
 >   Sublime Text 2 - Unix Makefiles
 >                                = Generates Sublime Text 2 project files.

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
