Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE04C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 09:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF88B82187;
	Thu,  9 Nov 2023 09:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF88B82187
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1v85dsqjhr0g; Thu,  9 Nov 2023 09:47:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DF0382181;
	Thu,  9 Nov 2023 09:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DF0382181
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CF5D01BF40E
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 09:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5CBC40108
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 09:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5CBC40108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aotmB0SIORbu for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 09:47:28 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DA7B400EA
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 09:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DA7B400EA
Received: by mail.gandi.net (Postfix) with ESMTPSA id 16DA61BF209;
 Thu,  9 Nov 2023 09:47:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r11dE-001nWB-0j;
 Thu, 09 Nov 2023 10:47:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
References: <20231009161817.2832969-1-adam.duskett@amarulasolutions.com>
Date: Thu, 09 Nov 2023 10:47:24 +0100
In-Reply-To: <20231009161817.2832969-1-adam.duskett@amarulasolutions.com>
 (Adam Duskett's message of "Mon, 9 Oct 2023 18:18:17 +0200")
Message-ID: <87h6lvp8b7.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic: Auto-install
 selinux modules only for upstream refpolicy
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

>>>>> "Adam" == Adam Duskett <adam.duskett@amarulasolutions.com> writes:

 > The description of REFPOLICY_CUSTOM_GIT states:
 > The custom refpolicy must define the full policy explicitly,
 > and must be a fork of the original refpolicy, to have the
 > same build system.  When this is selected, only the custom
 > policy definition are taken into account and all the modules
 > of the policy are built into the binary policy.

 > Currently, if a user definess their own policy, a package containing a selinux
 > directory would add to their custom policy, which is not what they would want.
 > Disable applying selinux policies in selinux/ directories for custom git
 > refpolicies.

 > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
