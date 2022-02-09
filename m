Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1622FC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 15:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B48D1404AB;
	Wed,  9 Feb 2022 15:35:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gqlE_cN_E6XC; Wed,  9 Feb 2022 15:35:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FD044025D;
	Wed,  9 Feb 2022 15:35:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E37DB1BF5AE
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 15:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D256A41548
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 15:35:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ihtfp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dh8Y8Y1s6jBg for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 15:35:34 +0000 (UTC)
X-Greylist: delayed 00:07:19 by SQLgrey-1.8.0
Received: from mail2.ihtfp.org (MAIL2.IHTFP.ORG [204.107.200.7])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3324041521
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 15:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail2.ihtfp.org (Postfix) with ESMTP id BD87AE2044;
 Wed,  9 Feb 2022 10:28:12 -0500 (EST)
Received: from mail2.ihtfp.org ([127.0.0.1])
 by localhost (mail2.ihtfp.org [127.0.0.1]) (amavisd-maia, port 10024)
 with ESMTP id 00571-04; Wed,  9 Feb 2022 10:28:10 -0500 (EST)
Received: by mail2.ihtfp.org (Postfix, from userid 48)
 id A922CE2045; Wed,  9 Feb 2022 10:28:10 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ihtfp.com;
 s=default; t=1644420490;
 bh=bIp4YKJOMrLvdP2SUeRogujJTb/JP4O+903rHFCl6Lk=;
 h=Date:Subject:From:To:Cc;
 b=kcXwenl+JPbrBd8mIDQgOeZnFbTNEg+DQx8ITJAcQlL2i5jygwAIEOGRMnabgfLi3
 4+jih6JmOzP7S8oZw6++paQobpi4jjF8uCWZNldy0O9jb98H+ahM6wjLiNNhiyavCb
 QEbAwyVysZxYr26fVROiyxqRy81WNXIQ6HR1ZelQ=
Received: from 192.168.248.243 (SquirrelMail authenticated user warlord)
 by mail2.ihtfp.org with HTTP; Wed, 9 Feb 2022 10:28:10 -0500
Message-ID: <60d52762385d6ecff820bddc8f91d1af.squirrel@mail2.ihtfp.org>
Date: Wed, 9 Feb 2022 10:28:10 -0500
From: "Derek Atkins" <derek@ihtfp.com>
To: buildroot@buildroot.org
User-Agent: SquirrelMail/1.4.22-14.fc20
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
X-Virus-Scanned: Maia Mailguard 1.0.2a
Subject: Re: [Buildroot] Makefile: add target to clean targetfs
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
Cc: emeric.vigier@savoirfairelinux.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Sorry to raise up a 6-year-old thread, but I'm looking to use Jenkins to
implement a CI/CD solution to build a BuildRoot system, but I need to be
able to "clean out" the target directory between each build to ensure that
different branches don't contaminate each other.  I don't want to delete
all of 'build' because 90% (or more) of the build *is* consistent between
branches, and I'd like to not require 3 hours per build to rebuild e.g.
the whole toolchain.

I've found that the patch as updated per the thread from 2015 does mostly
work:

target-clean:
	$(RM) -rf $(BR_DIR)/output/target $(BR_DIR)/output/staging \
		$(BR_DIR)/output/build/.root \
		$(BR_DIR)/output/build/*/.stamp_target_installed \
		$(BR_DIR)/output/build/*/.stamp_staging_installed \
		$(BR_DIR)/output/build/host-gcc-final-*/.stamp_host_installed

When I rebuild using this rule, and then run the proposed rsync command
(see below), the resulting target directory matches -- except for a few
obvious changes like etc/issue and usr/lib/os-release (as the git release
is now "dirty").  Strangely, lib/libpthread-2.32.so is different.

rsync -rvncl --delete --exclude '*.pyc' --exclude '*.pyo' --exclude
'tmp/ldconfig/aux-cache' output/target/ output/target.orig/

HOWEVER, there are a few side-effects here that I'd like to ask about.

Specifically, it looks like GLIBC and parts of the final-stage gcc
actually recompile (I see a lot of instances of
arm-buildroot-linux-gnueabi-gcc and xgcc in the logs).  I would have just
expected it to reinstall.

Moreover, busybox seems to recompile, too.

I am happy to share my config and makelog output if it would help, but I
was trying to keep this message short.

Any suggestions would be highly appreciated.

Thanks,

-derek

PS: I have mail delivery turned off for the list, so I would appreciate if
you could CC me on any replies.  Thanks again.

-- 
       Derek Atkins                 617-623-3745
       derek@ihtfp.com             www.ihtfp.com
       Computer and Internet Security Consultant

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
