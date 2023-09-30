Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A56E77360
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 07:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8194C415EB;
	Sat, 30 Sep 2023 07:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8194C415EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RVWlWaRHAYPB; Sat, 30 Sep 2023 07:36:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B7454160D;
	Sat, 30 Sep 2023 07:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B7454160D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C5BB61BF397
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 07:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E1994154A
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 07:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E1994154A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ctta_l1aoZd2 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 07:36:04 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AE5D40136
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 07:36:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AE5D40136
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86B7D60005;
 Sat, 30 Sep 2023 07:36:00 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qmUW7-00AGNY-Ry; Sat, 30 Sep 2023 09:35:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20230927092847.503224-1-giulio.benetti@benettiengineering.com>
Date: Sat, 30 Sep 2023 09:35:59 +0200
In-Reply-To: <20230927092847.503224-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Wed, 27 Sep 2023 11:28:47 +0200")
Message-ID: <874jjccduo.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: fix build failure with
 Linux 6.3+
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
Cc: Kris Bahnsen <kris@embeddedTS.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Add local patches pending upstream to fix build failure on Linux 6.3+
 > Fixes:
 > http://autobuild.buildroot.net/results/3b954399aa3ffab9609da1fc381f38f28bd8eb9f

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > ---
 >  .../wilc-driver/0006-Support-Linux-6.3.patch  | 48 +++++++++++++++++++
 >  .../wilc-driver/0007-Support-Linux-6.4.patch  | 36 ++++++++++++++
 >  2 files changed, 84 insertions(+)
 >  create mode 100644 package/wilc-driver/0006-Support-Linux-6.3.patch
 >  create mode 100644 package/wilc-driver/0007-Support-Linux-6.4.patch

 > diff --git a/package/wilc-driver/0006-Support-Linux-6.3.patch b/package/wilc-driver/0006-Support-Linux-6.3.patch
 > new file mode 100644
 > index 0000000000..58239b5dc9
 > --- /dev/null
 > +++ b/package/wilc-driver/0006-Support-Linux-6.3.patch
 > @@ -0,0 +1,48 @@
 > +From 1b6e5e4acfcca58094fb4bb6e2bfc0461c5b411d Mon Sep 17 00:00:00 2001
 > +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > +Date: Wed, 27 Sep 2023 10:54:18 +0200
 > +Subject: [PATCH] Support Linux 6.3
 > +
 > +With Linux 6.3 commit:
 > +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=40fc56ee608cdb20022c225ac6f1e4b7ba63f8f1
 > +function of_get_named_gpio_flags() has been dropped but it was only a
 > +wrapper to call of_get_named_gpio() if the flags passed was NULL and this
 > +is the case. So let's use of_get_named_gpio() in place of
 > +of_get_named_gpio_flags() if Linux version >= 6.3

So if of_get_named_gpio() is equivalent to of_get_named_gpio_flags(..,
NULL), why don't we unconditionally use that instead of the version
check?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
