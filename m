Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4C0C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 16:49:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DCEB6103E
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 16:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4DCEB6103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C597380CA5;
	Sun, 24 Oct 2021 16:49:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ca_g0nsgFrKl; Sun, 24 Oct 2021 16:49:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48F0680CAD;
	Sun, 24 Oct 2021 16:49:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ABB781BF2FB
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 16:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EAAC40203
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 16:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gV5BeJaSr0b1 for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 16:49:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B041400DD
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 16:49:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id C3B74100002;
 Sun, 24 Oct 2021 16:49:24 +0000 (UTC)
Date: Sun, 24 Oct 2021 18:49:23 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: CHEN Xiangyu <xiangyu.chen@aol.com>
Message-ID: <20211024184923.6a70028a@windsurf>
In-Reply-To: <20211019080514.6189-1-xiangyu.chen@aol.com>
References: <20211019080514.6189-1-xiangyu.chen.ref@aol.com>
 <20211019080514.6189-1-xiangyu.chen@aol.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] boot/at91bootstrap3: add svn repository
 method
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
Cc: Simon Dawson <spdawson@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Chen,

Thanks for this patch. However, I see a problem, see below.

On Tue, 19 Oct 2021 16:05:14 +0800
CHEN Xiangyu via buildroot <buildroot@buildroot.org> wrote:


>  config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR
> diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
> index 1e2a3a44b0..f609176a3f 100644
> --- a/boot/at91bootstrap3/at91bootstrap3.mk
> +++ b/boot/at91bootstrap3/at91bootstrap3.mk
> @@ -15,6 +15,9 @@ else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT),y)
>  AT91BOOTSTRAP3_SITE = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL))
>  AT91BOOTSTRAP3_SITE_METHOD = git
>  BR_NO_CHECK_HASH_FOR += $(AT91BOOTSTRAP3_SOURCE)
> +else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN),y)
> +AT91BOOTSTRAP3_SITE_METHOD = svn
> +BR_NO_CHECK_HASH_FOR += $(AT91BOOTSTRAP3_SOURCE)

You're not defining AT91BOOTSTRAP3_SITE anywhere, so in fact it is
never assigned. The current code goes like this:

ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL),y)
AT91BOOTSTRAP3_TARBALL = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION))
AT91BOOTSTRAP3_SITE = $(patsubst %/,%,$(dir $(AT91BOOTSTRAP3_TARBALL)))
AT91BOOTSTRAP3_SOURCE = $(notdir $(AT91BOOTSTRAP3_TARBALL))
BR_NO_CHECK_HASH_FOR += $(AT91BOOTSTRAP3_SOURCE)
else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT),y)
AT91BOOTSTRAP3_SITE = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL))
AT91BOOTSTRAP3_SITE_METHOD = git
BR_NO_CHECK_HASH_FOR += $(AT91BOOTSTRAP3_SOURCE)
else
AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VERSION))
endif

So if you're adding a new case for
BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN, it should also define
AT91BOOTSTRAP3_SITE.

Am I missing something ? Did you test this change ?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
