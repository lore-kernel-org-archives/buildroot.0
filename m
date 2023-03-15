Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAC3C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 07:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 454DB8146D;
	Wed, 15 Mar 2023 07:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 454DB8146D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r3uCLOeA9MAQ; Wed, 15 Mar 2023 07:10:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9280181452;
	Wed, 15 Mar 2023 07:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9280181452
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D3F9A1BF47E
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 07:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B93FE414D1
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 07:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B93FE414D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FrETE23sJ2Pr for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 07:10:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C5BD41499
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C5BD41499
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 07:10:47 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D4528FF804;
 Wed, 15 Mar 2023 07:10:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pcLHW-001jCz-Sc; Wed, 15 Mar 2023 08:10:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20230228221625.32577-1-ps.report@gmx.net>
Date: Wed, 15 Mar 2023 08:10:42 +0100
In-Reply-To: <20230228221625.32577-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Tue, 28 Feb 2023 23:16:25 +0100")
Message-ID: <871qlq5w25.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/apr: security bump version to
 1.7.2
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > - remove 0001-cross-compile.patch
 >   (superseeded by upstream commit [1])

 > - rename 0002-sys-param-h.patch to 0001-sys-param-h.patch

 > - remove 0003-Merge-r1887279-from-trunk.patch
 >   (from upstream [2])

 > - remove 0004-apr-1.7.0-CVE-2021-35940.patch
 >   (superseeded by upstream commit [3], remove APR_IGNORE_CVES accordingly)

 > - set new configure option '--disable-sctp' (no libsctp provided by buildroot)

 > - set new 'ac_cv_strerror_r_rc_int' explicitly to no (default for
 >   cross compile)

 > - set new 'ac_cv_mmap__dev_zero' explicitly to yes

 > - revert two upstream commits ([4], [5]) to fix apr-util build, fails
 >   otherwise because of some path mismatch where to find apr_rules.mk copied
 >   to apr-util-1.6.3/build/rules.mk, fixes:

 >     Makefile:50: .../build/apr-util-1.6.3/build/rules.mk: No such file or directory

 > For details see [6].

 > [1] https://github.com/apache/apr/commit/866e1df66be6704a584feaf5c3d241e3d631d03a
 > [2] https://github.com/apache/apr/commit/0a763c5e500f4304b7c534fae0fad430d64982e8
 > [3] https://github.com/apache/apr/commit/e0be630b681fac7b8b5e2f2e402a8e18a147f966
 > [4] https://github.com/apache/apr/commit/f82374627b3a6500a7a6cb11e48bcac59bcbb6a1
 > [5] https://github.com/apache/apr/commit/b6dbbc77da35a7b46754c99f465827f2a583e23c
 > [6] https://downloads.apache.org/apr/CHANGES-APR-1.7

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
