Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C2DEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 102B841D64;
	Fri, 28 Jul 2023 20:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 102B841D64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BlikyQgyvGgy; Fri, 28 Jul 2023 20:15:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0C9241F27;
	Fri, 28 Jul 2023 20:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0C9241F27
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 008E61BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0D4860BAA
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0D4860BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XQfsVr76LY1L for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:15:13 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8A8860B15
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8A8860B15
Received: by mail.gandi.net (Postfix) with ESMTPSA id 451871C0002;
 Fri, 28 Jul 2023 20:15:10 +0000 (UTC)
Date: Fri, 28 Jul 2023 22:15:09 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230728221509.1127286e@windsurf>
In-Reply-To: <20230726171923.334017-1-bernd@kuhls.net>
References: <20230726171923.334017-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690575311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0bRZxAVejA7ULKYf0ifTF8/r4hU8Jq63XBAfXm9n9L8=;
 b=ZxVidzLd/IUp35WlcLLto08to1m39pGtqYo+bwPwNPKW4RyEyLOk9MJifh1YF/t4t/wngw
 XwFGvIjpIaUBehr2lNCIOq0/VMqpmIuCjGlowpddNKUB+NbTe0SKVK3lh4xdLBToUIVRNb
 xrMrVzIFs6vd07IkpjUOZlqNQS2AezGG6ey4BeiT5wgirbDtTPifu/0giQlnyjyEuu696W
 NPJPgYc5PmVt4lH1MDHhr7XZok85CkjfId7IVluoO47+wrSfl9xazjipY17riA+HrXRIpY
 nBeuWX+PC50r2Hk9I8cR8fyTD6nxTuYHNKzvskLGD0U5dveTd8xJMWkWzd29Qg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZxVidzLd
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: bump version to 2.76.4
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
Cc: James Knight <james.d.knight@live.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Wed, 26 Jul 2023 19:19:23 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> From: James Knight <james.d.knight@live.com>
> 
> - Drop `iconv` option since it was obsolete and dropped [1][2].
> - Ensure `nls` is explicitly configured based on `BR2_SYSTEM_ENABLE_NLS`
>    being set.
> - Cleanup configuration and dependency options (ordering, having a
>    common variable to share between host/target builds, adding more
>    explicit assignment of options).
> - Drop "0002-Fix-error-format-in-gio-gunixconnection.c-part-2" since
>    upstream patch was applied in this release.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/f8b0e6f818297ce6a0c68e6e9dccc1eb4666cb73/
>  - http://autobuild.buildroot.net/results/aa8560b919732ee597b18c3e9b3315fa325ed489/
> 
> [1]: https://gitlab.gnome.org/GNOME/glib/-/commit/e71ecc8771a4f13bc6046438ab0845944831b9a6
> [2]: https://gitlab.gnome.org/GNOME/glib/-/commit/24ec80cfb4522d9819dbf5fd117665fef20b6418

These commits don't really say that iconv is no longer used, only that
the option is gone because Meson now checks iconv.

> -ifneq ($(BR2_ENABLE_LOCALE),y)
> -LIBGLIB2_DEPENDENCIES += libiconv
> -endif

Did you do a test build with a BR2_ENABLE_LOCALE disabled configuration?

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
