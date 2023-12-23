Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD6DC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 17:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBCD241807;
	Sat, 23 Dec 2023 17:39:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBCD241807
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GFZYyo6ivMlU; Sat, 23 Dec 2023 17:39:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CE8D417BC;
	Sat, 23 Dec 2023 17:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CE8D417BC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 92B431BF2C2
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7863881911
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7863881911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lw9YuYs7iz4Z for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 17:39:50 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E12E78190B
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 17:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E12E78190B
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC26740004;
 Sat, 23 Dec 2023 17:39:47 +0000 (UTC)
Date: Sat, 23 Dec 2023 18:39:47 +0100
To: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Message-ID: <20231223183947.1586f122@windsurf>
In-Reply-To: <20231219075352.1048958-1-fido_max@inbox.ru>
References: <20231219075352.1048958-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703353188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Il87/5ECh0irf6QrFGs+7bpuIBQy508S7iz8Cs8E5c=;
 b=fj8EGrcqKy0lnPDVNDgc7Gazbz5RGwBC+jXME88m53kh3rbPX7hwATcuVx71Or1tMBOVCR
 eQ3iHavMUwETiFF0r+qWUJ+4Kx73/QtuFArMDlcOTMMK/I9TMXiD7AcaBh5Na0odjNMxkS
 CiRsbJYS4qEA20uy3f5qMB8fr+XRcUmMvcFZUncZIpdZXMbZFgc5jAXwzRf1TQR5J2UQps
 iP9IFOggNwEz1d37EQRNegTVnfhRdtgqj/BBJBjngY2NUVGluZikHl7DhnqfoeS9rQO8qm
 OHgIVs9YLN6wQRUS05vUZQqq8WdlGxuIR26QZj6qg+F4hreikX8CSIqZjt/aIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fj8EGrcq
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: bump version to 16.1
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 19 Dec 2023 10:53:52 +0300
Maxim Kochetkov via buildroot <buildroot@buildroot.org> wrote:

> +ifeq ($(BR2_PACKAGE_ICU),y)
> +POSTGRESQL_DEPENDENCIES += icu
> +POSTGRESQL_CONF_OPTS += --with-icu
> +else
> +POSTGRESQL_CONF_OPTS += --without-icu
> +endif

Unless I'm wrong, this change is unrelated to the bump to 16.1. The
--with-icu/--without-icu options already exist in the currently
packaged version of Postgresql in Buildroot. Therefore, could you split
this into two patches?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
