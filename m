Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CCEC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 20:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C4D040586;
	Sat,  5 Feb 2022 20:24:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k2uvDGvdx4Lx; Sat,  5 Feb 2022 20:24:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08C5D40550;
	Sat,  5 Feb 2022 20:23:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4D601BF39E
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 20:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFD6340550
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 20:23:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YhlEsvOVjhRs for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 20:23:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CE35400FE
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 20:23:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BDA851C0004;
 Sat,  5 Feb 2022 20:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644092633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NEOjocq3G2pbaWpjuWQG3ILC773aRuxkWwoHEqLWj0s=;
 b=p6Uj7aWNA8Ji3fr+ZvKDBB2Y02kz3sFdGN7K2oLxTKB0vPfr1KwkQL9TMnu+ly3IpUkPIL
 52CJJWBaqskdvl0uXp6x/3njGJP+VJOdqYzluAnb073PQHm/v2A+qmdo4iPp/P4x/ClKXf
 x0Sik3PrSMsoc4KJuZvXR+MLYf1qfFleiXp7uGHEa6tsgypQ4kwDO18BCsl93Fym+TRzpY
 8mO0NKKtm5qItQKdKr2YdYkDRNJbYTumSQqtYjXFJsUbHzKVsw5/cqc4Fcp1/fUr8JOD3N
 VnBsTIKWeJxe2C31nwFd23Z+Bc6jcB1OKVzL6Na8jf7npbkOR/gvd9jZ80ANow==
Date: Sat, 5 Feb 2022 21:23:49 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220205212349.17db6aa4@windsurf>
In-Reply-To: <20220205201837.3324085-4-james.hilliard1@gmail.com>
References: <20220205201837.3324085-1-james.hilliard1@gmail.com>
 <20220205201837.3324085-4-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v6 4/8] package/qt5/qt5base: enable ccache
 via configure option
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Gilles Talis <gilles.talis@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Martin Bark <martin@barkynet.com>,
 =?UTF-8?B?R2HDq2w=?= Portay <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  5 Feb 2022 13:18:33 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

>  # This allows to use ccache when available
> -define QT5BASE_CONFIGURE_HOSTCC
> -	$(SED) 's,^QMAKE_CC\s*=.*,QMAKE_CC = $(HOSTCC),' $(@D)/mkspecs/common/g++-base.conf
> -	$(SED) 's,^QMAKE_CXX\s*=.*,QMAKE_CXX = $(HOSTCXX),' $(@D)/mkspecs/common/g++-base.conf
> -endef

This this variable is dropped, then surely the place it was used should also be modified?

> +ifeq ($(BR2_CCACHE),y)
> +QT5BASE_CONFIGURE_OPTS += -ccache
> +endif

Are we sure this is going to use Buildroot's ccache and not the system
ccache?

Indeed, $(HOSTCC) and $(HOSTCXX) are defined as:

CCACHE = $(HOST_DIR)/bin/ccache
HOSTCC = $(CCACHE) $(HOSTCC_NOCCACHE)
HOSTCXX = $(CCACHE) $(HOSTCXX_NOCCACHE)

so we know that it's the Buildroot ccache that will be used.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
