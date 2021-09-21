Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64C7C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 14:10:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBEB260FE8
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 14:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EBEB260FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 881BD607B3;
	Tue, 21 Sep 2021 14:10:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QKEAEkVp2gwG; Tue, 21 Sep 2021 14:10:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF701607BB;
	Tue, 21 Sep 2021 14:10:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 94CDD1BF2B6
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 14:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83B0181916
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 14:10:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iChiU6JFNUEv for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 14:10:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4250E81902
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 14:10:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 50DC0240010;
 Tue, 21 Sep 2021 14:10:42 +0000 (UTC)
Date: Tue, 21 Sep 2021 16:10:41 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Message-ID: <20210921161041.7083650b@windsurf>
In-Reply-To: <20210921130326.3462783-3-kamel.bouhara@bootlin.com>
References: <20210921130326.3462783-1-kamel.bouhara@bootlin.com>
 <20210921130326.3462783-3-kamel.bouhara@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/8] package/opengl/libgbm: introduce api
 features
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

Hello Kamel,

On Tue, 21 Sep 2021 15:03:19 +0200
Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:

> We introduce two feature that shall help user choosing the version
> implemented by a libgbm provider. This foresightly avoid building package
> without having the required libgbm version (e.g. kmscube, qt5, sdl2
> etc.)
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>

I think this should be squashed into PATCH 1.

> diff --git a/package/opengl/libgbm/Config.in b/package/opengl/libgbm/Config.in
> index ee18c4e6cb..f6d68e847a 100644
> --- a/package/opengl/libgbm/Config.in
> +++ b/package/opengl/libgbm/Config.in
> @@ -4,3 +4,15 @@ config BR2_PACKAGE_HAS_LIBGBM
>  config BR2_PACKAGE_PROVIDES_LIBGBM
>  	string
>  	depends on BR2_PACKAGE_HAS_LIBGBM
> +
> +config BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
> +	bool
> +	depends on BR2_PACKAGE_HAS_LIBGBM
> +
> +comment "feature implemented in mesa gbm api version 17 or later"

I'm not sure this makes sense as a comment visible in menuconfig, as
the option itself is not even visible. I would rather suggest something
like this:

# gbm implementations should select this option if they provide the
# format modifier plane count feature. This API was initially introduced
# in mesa3d version 17. A gbm implementation provides this feature if it
# is implement function A, B, C.

> +config BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
> +	bool
> +	depends on BR2_PACKAGE_HAS_LIBGBM
> +
> +comment "feature implemented in mesa gbm api 10 or later"

Same here.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
