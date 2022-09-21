Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A291DC6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 18:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3380D40442;
	Wed, 21 Sep 2022 18:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3380D40442
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xjVxb4euEed6; Wed, 21 Sep 2022 18:13:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1DCC40340;
	Wed, 21 Sep 2022 18:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1DCC40340
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 436F41BF3FC
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A6E6401C4
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A6E6401C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gSWmG9E28jJg for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 18:13:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D90F40340
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D90F40340
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 18:13:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5D131240007;
 Wed, 21 Sep 2022 18:13:21 +0000 (UTC)
Date: Wed, 21 Sep 2022 20:13:20 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220921201320.0a7f80c0@windsurf>
In-Reply-To: <20220920194645.670432-1-yann.morin.1998@free.fr>
References: <20220920194645.670432-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663784002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PFEBBv6fsMum05z7tIyTtCkxxS7udHFhCpVUGfSHHoI=;
 b=jXpbdYaZ6ujgDdi2v/JPZsnk0ZtQoQw/PsQ4ZHts0qR2lK9t64vNrPmKV3u73x7WwRQeVm
 nPLRPV8q3LVY2oW034CFaXSk7xCXqI3Th57iQmapiDaF+IaTGmUMzzIiF8HMCftO/CbKRk
 IWCUI7cY0bG51+0ON3pTb1yLugw8R49+JVf2QtdmnayxDzXZ5YHyH4M6AINCtY41UsoT2a
 HBB5SgayOE1c+wYtnJ9oq0cjGwZdJkM9gK5AGIdIjvZckLxzfS2BY/dGKi3C+wDBG7ZuaN
 WLNqc6QnBsKrNAZ43zJEKpBo76BQVO5MfspfVJcO4/K5cREebPurxhHFO7/pEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jXpbdYaZ
Subject: Re: [Buildroot] [PATCH v3] Makefile: fix use of many br2-external
 trees
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
Cc: David Lawson <david.lawson1@tx.rr.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 20 Sep 2022 21:46:45 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> The top level Makefile in buildroot has a recursive rule which causes
> the appearance of a hang as the number of directories in BR2_EXTERNAL
> increases. When the number of directories in BR2_EXTERNAL is small, the
> recursion occurs, but make detects the recursion and determines the
> target does not have to be remade. This allows make to progress.
> 
> This is the failing rule:
> 
>     define percent_defconfig
>     # Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
>     %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig outputmakefile
>         @$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(1)/configs/$$@ \
>                 $$< --defconfig=$(1)/configs/$$@ $$(CONFIG_CONFIG_IN)
>     endef
>     $(eval $(foreach d,$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(call percent_defconfig,$(d))$(sep)))
> 
> The rule for %defconfig is created for each directory in BR2_EXTERNAL.
> When the rule is matched, the stem is 'defconfig_name'. The second
> prerequisite is expanded to $(1)/configs/defconfig_name_defconfig. The
> rule, and all of the other rules defined by this macro, are invoked
> again, but the stem is now $(1)/configs/defconfig_name_defconfig. The
> second prerequisite is now expanded to
> $(1)/configs/($1)/configs/defconfig_name_defconfig. This expansion
> continues until make detects the infinite recursion.
> 
> With up to 5 br2-external trees, the time is very small, so that it is
> not noticeable. But starting with 6 br2-external trees, the time is
> insanely big (so much so that we did not even let it finish after it ran
> for hours); see timings toward the end of the commit log.

Wow, insane stuff!

> One of the rationale behind this code, is that we want the defconfig
> files from br2-external trees further down the list, to override
> defconfig files from those earlier in the list, even overriding the
> defconfig files from Buildroot itself.

This is the part I would like to challenge. Why do we want to allow
BR2_EXTERNAL to override defconfigs from the main tree? We do not allow
this for packages, why should we allow it for defconfigs?

To me, allowing the override of defconfigs is actually a bad idea: when
you run "make foo_defconfig", it's no longer really clear which
"foo_defconfig" is really going to be used. Yes, it's well defined, but
it isn't "obvious".

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
