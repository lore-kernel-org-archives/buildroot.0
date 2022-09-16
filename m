Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71ADC54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 639D682F6F;
	Fri, 16 Sep 2022 11:45:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 639D682F6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QDHDeysBr466; Fri, 16 Sep 2022 11:45:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89FFE84293;
	Fri, 16 Sep 2022 11:45:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89FFE84293
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EFA61BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED6EB4195E
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED6EB4195E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F655Gjmy2l25 for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:44:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04FFB41959
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04FFB41959
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:44:04 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5B56FE0003;
 Fri, 16 Sep 2022 11:44:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZ9lK-008bYd-Km; Fri, 16 Sep 2022 13:44:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
 <20220814233845.2247022-31-ricardo.martincoski@gmail.com>
Date: Fri, 16 Sep 2022 13:44:02 +0200
In-Reply-To: <20220814233845.2247022-31-ricardo.martincoski@gmail.com>
 (Ricardo Martincoski's message of "Sun, 14 Aug 2022 20:38:42 -0300")
Message-ID: <87tu578ry5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 30/33] package/gstreamer1/gst1-plugins-good:
 drop bogus BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB
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

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Commit 'dc7ca780a0 package/gstreamer1/gst1-plugins-good: convert package
 > type to meson' from 2019 removed the symbol, stating:
 >   Remove BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB
 >   Existing configs will already have BR2_PACKAGE_ZLIB selected, so no
 >   legacy entry is needed for BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB

 > So drop the reference to the symbol.

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
