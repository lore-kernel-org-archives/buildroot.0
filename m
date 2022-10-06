Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7B5C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 19:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B6A941A03;
	Thu,  6 Oct 2022 19:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B6A941A03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iQ9NMbGrUKtY; Thu,  6 Oct 2022 19:43:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62DFD419FB;
	Thu,  6 Oct 2022 19:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62DFD419FB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 669691BF3C8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DA48419F9
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DA48419F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g9-58FThPy8o for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 19:43:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9247419FB
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9247419FB
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 19:43:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C6BC820003;
 Thu,  6 Oct 2022 19:42:57 +0000 (UTC)
Date: Thu, 6 Oct 2022 21:42:57 +0200
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20221006214257.47c453f5@windsurf>
In-Reply-To: <20221005212150.1384370-3-aduskett@gmail.com>
References: <20221005212150.1384370-1-aduskett@gmail.com>
 <20221005212150.1384370-3-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665085378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hQNz1129xZNc54hrCyHaokSRJL8hLlf0Rjp/r5tkh74=;
 b=E7q/bi/7a3EOpX9ee77LUAt5bhluLbPlAok9QHiu8P5x3T0X43XNNY0cqNjzxIOf2YXK//
 5AA/IgZ5+t1gGBrm4OOySAIgGzOXu6bvOYrjRhbvks60YjElzm5JmF8juNJkfw/oWlfWp1
 d5Yn0t3nKRpKa9QtphnTQFRpud47jczYvlg2ZtLROrrEB++BTPpTYX2233NKRVzV4KugNX
 gLIGUeUrX2PEiIBFAC6k+3Bv6xhkFvpWDp/UqDi9z6sj13znfVIyA5PW3bVohoA1q93KJ6
 ap3FLELpY27wxwYtBXrOP4B9OaH4CsrVEsAkcSFHt78gRtY0P4IUe5u2a4jTgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E7q/bi/7
Subject: Re: [Buildroot] [PATCH 3/4] package/mender-artifact: bump version
 to 3.9.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  5 Oct 2022 14:21:49 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> mender-artifact now requires OpenSSL, and is incompatible with OpenSSL3.
> As such, the host-pkgconf and host-libopenssl packages are now dependencies to
> prevent linking errors against OpenSSL3 on newer distributions such as
> Fedora 35.

Even if mender-artifact was compatible with OpenSSL3, it would be a bug
to rely on the system-provided OpenSSL library.

> +# Mender-artifact requires OpenSSL, and is not yet compatible with OpenSSL3.
> +# Mender-artifact also uses pkgconf to find the OpenSSL library.
> +# Use host-pkgconf to force mender-artifact to use Buildroots host-openssl, as
> +# newer distributions, such as Fedora, are starting to use OpenSSL3.
> +HOST_MENDER_ARTIFACT_GO_ENV = \
> +	GOFLAGS="-mod=vendor" \
> +	PKG_CONFIG_PATH="$(HOST_DIR)/lib/pkgconfig"

Why is -mod=vendor needed here?

Also for pkg-config, I would prefer if we were to use the same
variables as defined in HOST_MAKE_ENV (in package/Makefile.in), i.e:

HOST_MAKE_ENV = \
        PATH=$(BR_PATH) \
        PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
        PKG_CONFIG_SYSROOT_DIR="/" \
        PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
        PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
        PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig"

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
