Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A429C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 15:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C35B6415EF;
	Mon,  6 Feb 2023 15:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C35B6415EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eDcfS9hSI2pS; Mon,  6 Feb 2023 15:05:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DD83415E2;
	Mon,  6 Feb 2023 15:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DD83415E2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 089B91BF3E0
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 15:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E45CA40459
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 15:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E45CA40459
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ceCY1gLT00J for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 15:05:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC5B24036F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC5B24036F
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 15:05:21 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3829720005;
 Mon,  6 Feb 2023 15:05:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pP33V-00DxBw-7j; Mon, 06 Feb 2023 16:05:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
 <20221127130739.1862398-18-ricardo.martincoski@gmail.com>
 <87v8kf9g9l.fsf@dell.be.48ers.dk>
Date: Mon, 06 Feb 2023 16:05:17 +0100
In-Reply-To: <87v8kf9g9l.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Mon, 06 Feb 2023 12:37:10 +0100")
Message-ID: <87k00u96mq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [next 17/25] package/gitlab-runner: ensure use of
 LIBCURL_OPENSSL
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:
 >> Currently this minimal config is accepted while it shouldn't:
 >> BR2_x86_i686=y
 >> BR2_PACKAGE_BEARSSL=y
 >> BR2_PACKAGE_LIBCURL_BEARSSL=y
 >> BR2_PACKAGE_GITLAB_RUNNER=y

 >> BR2_PACKAGE_GITLAB_RUNNER selects BR2_PACKAGE_LIBCURL_OPENSSL.
 >> Kconfig does not enforce a select when the symbol selected is part of a
 >> choice. See similar explanation on [1] and [2].

 >> Doing something similar to [3] and depending on the choice option
 >> instead of selecting it would create a Kconfig recursive dependency.

 >> Just dropping the ineffective select would keep the above defconfig
 >> snippet as an accepted one.

 >> Adding a comment to the menu, i.e.:
 >> comment "gitlab-runner must use BR2_PACKAGE_LIBCURL_OPENSSL"
 >> depends on BR2_PACKAGE_GITLAB_RUNNER
 >> depends on !BR2_PACKAGE_LIBCURL_OPENSSL
 >> could improve user experience but it also keeps the above defconfig
 >> snippet as an accepted one.

 >> So bail out the build when gitlab-runner is enabled and libcurl-openssl
 >> is not selected, similar to what is done in [4].

 >> [1] "a44b1c1405 legacy: update the BR2_PREFER_STATIC_LIB option"
 >> [2] "b1d5aa1bc2 package/qwt: Fix selecting OpenGL support in qt4"
 >> [3] "9fc652a373 package/libmodsecurity: needs dynamic library with
 >> libcurl and mbedtls"
 >> [4] "fda53f0791 package/Makefile.in: add detection for the lack of C
 >> library"

 >> Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
 >> Cc: Romain Naour <romain.naour@gmail.com>
 >> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

 > The change as such is fine, but why does gitlab-runner really need the
 > curl binary to use the openssl backend? Perhaps it is just about curl
 > having HTTPS support?

A that is presumably what was meant I have instead changed it to use
the BR2_PACKAGE_LIBCURL_FORCE_TLS option.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
