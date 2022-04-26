Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218CDC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 20:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2E1B40B7E;
	Tue, 26 Apr 2022 20:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OEguqP4SyBbz; Tue, 26 Apr 2022 20:49:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C80FB40B82;
	Tue, 26 Apr 2022 20:49:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B60F01BF5AD
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 20:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A256E81389
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 20:49:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j4wqu79uLENG for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 20:49:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49D21801CC
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 20:49:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 58EF2200007;
 Tue, 26 Apr 2022 20:49:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1njS7O-002LFP-G2; Tue, 26 Apr 2022 22:49:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20220406172934.4009018-1-fontaine.fabrice@gmail.com>
 <9406710d-ed6f-d0cd-4a7a-60480a4d4872@mind.be>
Date: Tue, 26 Apr 2022 22:49:06 +0200
In-Reply-To: <9406710d-ed6f-d0cd-4a7a-60480a4d4872@mind.be> (Arnout
 Vandecappelle's message of "Thu, 14 Apr 2022 21:27:24 +0200")
Message-ID: <87bkwnk1tp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/boost: drop versioned layout
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 06/04/2022 19:29, Fabrice Fontaine wrote:
 >> boost.m4 embedded by cc-tool is not able to find boost libraries when
 >> they are versionned (e.g. libboost_program_options-gcc9-mt-sd-1_78.a):
 >> configure: error: cannot find the flags to link with Boost
 >> program_options
 >> azmq and i2pd also have the same issue:
 >> CMake Error at
 >> /nvmedata/autobuild/instance-8/output-1/host/share/cmake-3.18/Modules/FindPackageHandleStandardArgs.cmake:165
 >> (message):
 >> Could NOT find Boost (missing: Boost_INCLUDE_DIR system date_time thread
 >> chrono random) (Required is at least version "1.48")
 >> So drop versioned layout option

 >  This is probably going to cause problems for some custom packages
 >  that have a simple build system that assumes the versioned layout. Oh
 > well, bad luck.

So what do we do for 2022.02.x? We presumably have the same issue
there. Drop it as well?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
