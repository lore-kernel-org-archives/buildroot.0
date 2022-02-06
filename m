Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961C5C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 15:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 538164026D;
	Sun,  6 Feb 2022 15:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zsqTSEy7HwdE; Sun,  6 Feb 2022 15:34:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EB2140246;
	Sun,  6 Feb 2022 15:34:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D5B6A1BF325
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 15:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF04681377
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 15:34:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYPq9n06BEHX for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 15:34:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A14D781375
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 15:34:26 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2B32160006;
 Sun,  6 Feb 2022 15:34:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nGjYW-00037k-FV; Sun, 06 Feb 2022 16:34:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20220128124538.31789-1-ps.report@gmx.net>
 <20220128124538.31789-2-ps.report@gmx.net>
Date: Sun, 06 Feb 2022 16:34:24 +0100
In-Reply-To: <20220128124538.31789-2-ps.report@gmx.net> (Peter Seiderer's
 message of "Fri, 28 Jan 2022 13:45:37 +0100")
Message-ID: <87iltsuhz3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 2/3] package/log4cxx: fix boost-fallback
 (only check for boost if really needed)
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > - add patch 0002-boost-fallback-only-check-for-boost-if-really-needed.patch
 >   to check for boost if really needed (in case of legacy c++ standard < c++17)

 > Fixes:

 >   - http://autobuild.buildroot.net/results/8d49ab7cd9952f6a13bdd330e875012d0601f1d2

 >   -- Found Boost: .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include (found version "1.78.0") found components: thread chrono missing components: date_time atomic
 >   CMake Error at .../build/log4cxx-0.12.0/boost-fallback-compile-tests/CMakeFiles/CMakeTmp/CMakeLists.txt:19 (add_executable):
 >     Target "cmTC_aac37" links to target "Boost::date_time" but the target was
 >     not found.  Perhaps a find_package() call is missing for an IMPORTED
 >     target, or an ALIAS target is missing?

 >   CMake Error at .../build/log4cxx-0.12.0/boost-fallback-compile-tests/CMakeFiles/CMakeTmp/CMakeLists.txt:19 (add_executable):
 >     Target "cmTC_aac37" links to target "Boost::atomic" but the target was not
 >     found.  Perhaps a find_package() call is missing for an IMPORTED target, or
 >     an ALIAS target is missing?

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
