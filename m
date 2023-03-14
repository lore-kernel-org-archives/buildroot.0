Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A343C6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 07:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E765B81415;
	Tue, 14 Mar 2023 07:59:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E765B81415
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aKYX7Q4hd2lN; Tue, 14 Mar 2023 07:59:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34C53813D2;
	Tue, 14 Mar 2023 07:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34C53813D2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4DB1BF282
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 07:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E604741806
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 07:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E604741806
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VO7oGROj3yH7 for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 07:59:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A134417EF
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A134417EF
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 07:59:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AB7FB40002;
 Tue, 14 Mar 2023 07:59:48 +0000 (UTC)
Date: Tue, 14 Mar 2023 08:59:47 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230314085947.231281ad@windsurf>
In-Reply-To: <20230313221705.1121868-1-giulio.benetti@benettiengineering.com>
References: <20230313221705.1121868-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678780788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZOLOihkt4McENRlNZzPwXEUbDOJXvH4t8wXNHDbc5d0=;
 b=YRSS2Zfa3nkIE9aIZH1EHOW/0Izu2VbmkxGX87G6R8P+MvbJa4rFi7HzKlCfwxYozg1Rbm
 2VIxWuj1uj6ancNni35TBZd8dq1j78ecwNWR/8lnMN5qUxmkEP4bxakmrZnZK45Vx8Ak7v
 dah4h/AI9wp+Zsl0QAoB98APNCySDQCJ+KW3KxIwwvEf52if0LngvXGVWiMU1pGVaW2IHg
 Ks/pg3eR3c3J7EAclxd9m7Feukl8q73JFUKbIXmEkvWQj+OA/l0hgDyieUmSxY82KjloUT
 7OUMcgep77ogcBjTELtSFu42a+6QXhd1spqscPyNkSZLETsOL65P+7jU0s0trg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YRSS2Zfa
Subject: Re: [Buildroot] [PATCH] package/swugenerator: new package
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

Hello Giulio,

Thanks for this new package.

On Mon, 13 Mar 2023 23:17:05 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> +SWUGENERATOR_VERSION = 0.2
> +SWUGENERATOR_SITE = https://github.com/sbabic/swugenerator/archive/refs/tags/v$(SWUGENERATOR_VERSION)

Could you please use the $(call github,...,...,...) macro here?

> +SWUGENERATOR_LICENSE = GPL-3.0
> +SWUGENERATOR_LICENSE_FILES = LICENSE
> +HOST_SWUGENERATOR_SETUP_TYPE = setuptools
> +
> +$(eval $(host-python-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
