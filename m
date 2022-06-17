Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CB0C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Jun 2022 21:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32A494179B;
	Fri, 17 Jun 2022 21:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32A494179B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dgfQdRHs0h68; Fri, 17 Jun 2022 21:16:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1BDE41796;
	Fri, 17 Jun 2022 21:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1BDE41796
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3AC5D1BF4D5
 for <buildroot@lists.busybox.net>; Fri, 17 Jun 2022 21:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15BD740186
 for <buildroot@lists.busybox.net>; Fri, 17 Jun 2022 21:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15BD740186
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4mfC2ULnK-Fj for <buildroot@lists.busybox.net>;
 Fri, 17 Jun 2022 21:16:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00D4340012
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00D4340012
 for <buildroot@buildroot.org>; Fri, 17 Jun 2022 21:16:46 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4E824240003
 for <buildroot@buildroot.org>; Fri, 17 Jun 2022 21:16:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1o2JKe-005QvO-I0
 for buildroot@buildroot.org; Fri, 17 Jun 2022 23:16:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20220517194505.59B4585F44@busybox.osuosl.org>
Date: Fri, 17 Jun 2022 23:16:44 +0200
In-Reply-To: <20220517194505.59B4585F44@busybox.osuosl.org> (Peter Korsgaard's
 message of "Tue, 17 May 2022 21:55:54 +0200")
Message-ID: <87fsk3uh1f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/qt5/qt5webengine: bump to
 version 5.15.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit:
 > https://git.buildroot.net/buildroot/commit/?id=675cbaf9aa8ac082087def432bff1b8449c0653d
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > We need to use the separate package for the chromium submodule
 > which has python3 support patches.

 > We also need to apply a patch to qt5webengine to allow building with
 > python3.

 > Drop a patch which is now upstream.

 > We need to set QT5WEBENGINE_SYNC_QT_HEADERS = YES as we are building
 > from a repository archive instead of a release archive.

 > We need to add some new required dependencies to qt5webengine so that
 > it will build.

 > Switch libraries to system libraries instead of bundled when possible.

 > Migrate unsupported WEBENGINE_CONFIG to new config flag option.

 > Override feature detection using config override flags to ensure we
 > get the expected features enabled/disabled as autodetection logic
 > may otherwise disable features without throwing build errors.

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
