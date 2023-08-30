Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A11CC6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 20:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4B50417EB;
	Wed, 30 Aug 2023 20:36:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4B50417EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5dRkpQ1Ew19P; Wed, 30 Aug 2023 20:36:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C812417DB;
	Wed, 30 Aug 2023 20:36:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C812417DB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0BE2C1BF40B
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7E3E417DC
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7E3E417DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OrHLdmNhppfm for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 20:36:42 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4CF6B417DB
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 20:36:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CF6B417DB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22EE51BF203;
 Wed, 30 Aug 2023 20:36:39 +0000 (UTC)
Date: Wed, 30 Aug 2023 22:36:39 +0200
To: Sebastian Weyer <sebastian.weyer@smile.fr>
Message-ID: <20230830223639.76515cbd@windsurf>
In-Reply-To: <20230308131554.642965-2-sebastian.weyer@smile.fr>
References: <20230308131554.642965-1-sebastian.weyer@smile.fr>
 <20230308131554.642965-2-sebastian.weyer@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693427800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7nD/EDNUqH9+n4ksKppDJpK82cMT1ylk4rvRp11NXdk=;
 b=btziuKp1dJxiO/yMetCZx08M6Hv6GQvssfCPr3TeBTVtDy5sSVY90iKeWDIJPD6vF9j3QH
 M1AJyzSGKur8sGCEBLm4G7hbvBKd4wadSa+cP32lWVWM7PoFTmMzBMlFMVVPv7uG5cl6Cw
 C6m55iuA730I+90KIe3ZUUCYKzoBTQGBWnghegwTSYK0z7muOoq/faHy98tQku21AhXfv6
 deZ4bMLT1r6IgIMWKrvcSV80iICA8bYhAo09B1U4kzWCA/0Bpv4jmg0SCnFDEyhkwb/4I3
 rprmiG141GagQICyXmnZASEc9wHo9eT6QXEx1Lf2Unj/o6xFwZOh8FHcMdy43w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=btziuKp1
Subject: Re: [Buildroot] [PATCH v6 2/3] package/nushell: Add default configs
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  8 Mar 2023 14:15:52 +0100
Sebastian Weyer <sebastian.weyer@smile.fr> wrote:

> +define NUSHELL_INSTALL_DEFAULT_CONFIG
> +	$(INSTALL) -m 0644 -D $(@D)/crates/nu-utils/src/sample_config/default_config.nu \
> +		$(TARGET_DIR)/root/.config/nushell/config.nu
> +	$(INSTALL) -m 0644 -D $(@D)/crates/nu-utils/src/sample_config/default_env.nu \
> +		$(TARGET_DIR)/root/.config/nushell/env.nu
> +endef
> +NUSHELL_POST_INSTALL_TARGET_HOOKS += NUSHELL_INSTALL_DEFAULT_CONFIG

I did not apply this patch, because it installs a configuration only
for the root user, so its usefulness seems quite limited, and we
essentially never install special configuration specifically for the
root user (there's a very old exception in the fluxbox package, but
that's it).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
