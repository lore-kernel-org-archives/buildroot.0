Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38649C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 17:51:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0367F60FED
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 17:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0367F60FED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A53D340303;
	Tue, 14 Sep 2021 17:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tWY_5ebldNPP; Tue, 14 Sep 2021 17:51:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D94F402C2;
	Tue, 14 Sep 2021 17:51:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C54F1BF990
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 17:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C52F60676
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 17:50:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1D98kON3b3h4 for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 17:50:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DAC160607
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 17:50:11 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 9022CCF2AD
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 17:44:18 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 61E7DE0004
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 17:44:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mQCTb-00072H-RL
 for buildroot@buildroot.org; Tue, 14 Sep 2021 19:44:11 +0200
Resent-To: buildroot@buildroot.org
Resent-From: Peter Korsgaard <peter@korsgaard.com>
Resent-Date: Tue, 14 Sep 2021 19:44:11 +0200
Resent-Message-ID: <871r5r2gt0.fsf@dell.be.48ers.dk>
X-From-Line: nobody Mon Sep 13 11:48:08 2021
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20210829024632.682029-1-james.hilliard1@gmail.com>
 <20210829024632.682029-5-james.hilliard1@gmail.com>
Date: Mon, 13 Sep 2021 11:48:08 +0200
In-Reply-To: <20210829024632.682029-5-james.hilliard1@gmail.com> (James
 Hilliard's message of "Sat, 28 Aug 2021 20:46:29 -0600")
Message-ID: <878s0024dj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 5/8] package/swupdate: add comment on
 origin of services/configs
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > ---
 >  package/swupdate/swupdate.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
 > index c9bd486127..256f0930ce 100644
 > --- a/package/swupdate/swupdate.mk
 > +++ b/package/swupdate/swupdate.mk
 > @@ -222,6 +222,8 @@ $(error No Swupdate configuration file specified, check your BR2_PACKAGE_SWUPDAT
 >  endif
 >  endif
 
 > +# Services and configs derived from meta-swupdate(MIT license)

It would have been nice with a space before '(MIT', but OK.

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
