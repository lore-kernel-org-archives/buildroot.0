Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7D9C77B7E
	for <buildroot@archiver.kernel.org>; Sun, 28 May 2023 18:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 322DD418F9;
	Sun, 28 May 2023 18:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 322DD418F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h3REsflQbSlk; Sun, 28 May 2023 18:34:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1A8E418E5;
	Sun, 28 May 2023 18:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1A8E418E5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CFA21BF836
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 18:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D564D418E0
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 18:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D564D418E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hlwEEt9tE_JO for <buildroot@lists.busybox.net>;
 Sun, 28 May 2023 18:34:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 638B1418D7
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 638B1418D7
 for <buildroot@buildroot.org>; Sun, 28 May 2023 18:34:36 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 040B560004;
 Sun, 28 May 2023 18:34:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q3LDs-0083dJ-1G; Sun, 28 May 2023 20:34:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20230527211144.2136991-1-romain.naour@gmail.com>
Date: Sun, 28 May 2023 20:34:31 +0200
In-Reply-To: <20230527211144.2136991-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 27 May 2023 23:11:44 +0200")
Message-ID: <87v8gctidk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] support/dependencies: requires cmake >= 3.19
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > libjxl requires cmake 3.19 since version v0.7 due to the
 > new behavior of cmake [1].

 > -- Configuring done
 > CMake Error at cmake/FindLCMS2.cmake:40 (add_library):
 >   INTERFACE_LIBRARY targets may only have whitelisted properties.  The
 >   property "INCLUDE_DIRECTORIES" is not allowed.
 > Call Stack (most recent call first):
 >   third_party/CMakeLists.txt:114 (find_package)

 > The portability issue has already been reported upstream [2].

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819095

 > [1] https://gitlab.kitware.com/cmake/cmake/-/commit/afb998704e67d3d3ce5b24c112cb06e770fca78d
 > [2] https://github.com/libjxl/libjxl/issues/1425

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Julien Olivain <ju.o@free.fr>
 > ---
 > This will increase the build time in gitlab-ci since
 > our docker image provide cmake 3.18.

Not only that, also users on E.G. Debian stable. Libjxl was added back
in November, so we will also need to backport this to 2023.02.x :/

Do we have any alternatives?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
