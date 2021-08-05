Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EADFC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:03:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0A1060F22
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0A1060F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4E7A60A38;
	Thu,  5 Aug 2021 20:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SiJJ3hSVCUpP; Thu,  5 Aug 2021 20:03:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02EF3608A1;
	Thu,  5 Aug 2021 20:03:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 083C41BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB36F4035F
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:03:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id spYcis_ysJse for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:03:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D28E740287
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:03:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id CEA48FF805;
 Thu,  5 Aug 2021 20:03:40 +0000 (UTC)
Date: Thu, 5 Aug 2021 22:03:39 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Mehmet Sami Tok <mehmetsamitok@gmail.com>
Message-ID: <20210805220339.112d2451@windsurf>
In-Reply-To: <20200107123209.6608-2-mehmetsamitok@gmail.com>
References: <20200107123209.6608-1-mehmetsamitok@gmail.com>
 <20200107123209.6608-2-mehmetsamitok@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5: remove optimize by default
 on debug builds made with qmake
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Mehmet,

On Tue,  7 Jan 2020 15:32:09 +0300
Mehmet Sami Tok <mehmetsamitok@gmail.com> wrote:

> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 774c771bc9..3415172fcb 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -34,8 +34,12 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
>  QT5BASE_CONFIGURE_OPTS += -no-optimize-debug
>  endif
>  
> -QT5BASE_CFLAGS = $(TARGET_CFLAGS)
> -QT5BASE_CXXFLAGS = $(TARGET_CXXFLAGS)
> +# Passing optimization flags directly to CFLAGS or CXXFLAGS makes qmake
> +# builds optimized by default. Decision of optimization while developing
> +# with qmake should be leaved to configuration of the project.
> +FILTERED_ITEMS = -O%
> +QT5BASE_CFLAGS = $(filter-out $(FILTERED_ITEMS),$(TARGET_CFLAGS))
> +QT5BASE_CXXFLAGS = $(filter-out $(FILTERED_ITEMS),$(TARGET_CXXFLAGS))

Thanks for your patch, and sorry for the long delay in providing
feedback to you and your patch. However, what the code currently does
it what we want: we want the optimization level defined at the
Buildroot configuration level to apply to all packages. We certainly do
not want individual packages to pick and chose their own optimization
level. So basically, your proposal unfortunately goes against the
very principle of Buildroot. For this reason, I'm afraid we have to
reject your patch.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
