Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6726ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 07:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF43F80C13;
	Wed, 14 Sep 2022 07:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF43F80C13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mhDEVrsFNYRG; Wed, 14 Sep 2022 07:33:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4C5F80BAC;
	Wed, 14 Sep 2022 07:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4C5F80BAC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E34E61BF909
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 07:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD8434022A
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 07:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD8434022A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4_dJgrhvj1EZ for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 07:33:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04C0A41710
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04C0A41710
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 07:33:38 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 030F820000F;
 Wed, 14 Sep 2022 07:33:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oYMtp-003l8O-Rq; Wed, 14 Sep 2022 09:33:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Alexandru Ardelean <ardeleanalex@gmail.com>
References: <20220727081953.38627-1-ardeleanalex@gmail.com>
Date: Wed, 14 Sep 2022 09:33:33 +0200
In-Reply-To: <20220727081953.38627-1-ardeleanalex@gmail.com> (Alexandru
 Ardelean's message of "Wed, 27 Jul 2022 11:19:52 +0300")
Message-ID: <87illqs94i.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/cog: add udev dependency to drm
 platform support
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
Cc: aperez@igalia.com, michael@nosthoff.rocks, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Alexandru" == Alexandru Ardelean <ardeleanalex@gmail.com> writes:

 > The DRM platform support already has the 'BR2_PACKAGE_HAS_UDEV' symbol in
 > package/cog/Config.in

 > We just need to specify 'udev' as a dependency in the cog.mk file.
 > The udev virtual package is pulled by libinput anyway, but this makes it
 > more explicit.

 > Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
 > ---

 > In continuation of:
 >   https://patchwork.ozlabs.org/project/buildroot/patch/20220722070150.40715-1-ardeleanalex@gmail.com/

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
