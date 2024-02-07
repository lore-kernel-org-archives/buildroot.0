Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A54C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 09:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 898AC81F11;
	Wed,  7 Feb 2024 09:37:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XoVPs6w29QqW; Wed,  7 Feb 2024 09:37:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A742581F8E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A742581F8E;
	Wed,  7 Feb 2024 09:37:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 547671BF868
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4134D81F8E
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:37:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q5kDlbwQaCeu for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 09:37:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5FA0881F11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FA0881F11
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FA0881F11
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 09:37:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 908466000C;
 Wed,  7 Feb 2024 09:37:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rXeMt-00F0Sk-0Y;
 Wed, 07 Feb 2024 10:37:23 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240207092447.2094160-1-dario.binacchi@amarulasolutions.com>
 <20240207092447.2094160-2-dario.binacchi@amarulasolutions.com>
Date: Wed, 07 Feb 2024 10:37:23 +0100
In-Reply-To: <20240207092447.2094160-2-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Wed, 7 Feb 2024 10:24:46 +0100")
Message-ID: <875xz01up8.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v3 2/3] package/davinci-bootcount: rename to
 uboot-bootcount
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > Born as a project to read/write the bootcount on the TI am3xx platform,
 > over time it has introduced bootcount management on EEPROM and for the
 > stm32mp1 platform. As a result, the project removed the 'davinci' tag
 > from its name and GitHub link.
 > The patch aligns the package name in Buildroot with the current one on
 > GitHub.

 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 > ---
 >  Config.in.legacy                                  |  6 ++++++
 >  DEVELOPERS                                        |  2 +-
 >  package/Config.in                                 |  2 +-
 >  package/davinci-bootcount/Config.in               | 11 -----------
 >  package/davinci-bootcount/davinci-bootcount.mk    | 15 ---------------
 >  package/uboot-bootcount/Config.in                 | 10 ++++++++++
 >  .../uboot-bootcount.hash}                         |  2 +-
 >  package/uboot-bootcount/uboot-bootcount.mk        | 15 +++++++++++++++
 >  8 files changed, 34 insertions(+), 29 deletions(-)
 >  delete mode 100644 package/davinci-bootcount/Config.in
 >  delete mode 100644 package/davinci-bootcount/davinci-bootcount.mk
 >  create mode 100644 package/uboot-bootcount/Config.in
 >  rename package/{davinci-bootcount/davinci-bootcount.hash =>
 > uboot-bootcount/uboot-bootcount.hash} (80%)
 >  create mode 100644 package/uboot-bootcount/uboot-bootcount.mk

 > diff --git a/Config.in.legacy b/Config.in.legacy
 > index 5fbe5d903074..cf32f887d4b0 100644
 > --- a/Config.in.legacy
 > +++ b/Config.in.legacy
 > @@ -146,6 +146,12 @@ endif
 
 >  comment "Legacy options removed in 2024.02"
 
 > +config BR2_PACKAGE_DAVINCI_BOOTCOUNT
 > +	bool "davinci-bootcount has been renamed"
 > +	select BR2_LEGACY

We normally add the legacy handling here, so I've added select
BR2_PACKAGE_UBOOT_BOOTCOUNT (and dropped it from the package).

 > +	help
 > +	  The davinci-bootcount package has been renamed.

And extended this to mention the new name.

Committed with these changes, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
