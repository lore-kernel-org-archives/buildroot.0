Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7C7EB64DA
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 09:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9674840C0F;
	Tue, 18 Jul 2023 09:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9674840C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6W42b-IdWlD3; Tue, 18 Jul 2023 09:46:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0C0540C13;
	Tue, 18 Jul 2023 09:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0C0540C13
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 861381BF267
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 09:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 374EC60D71
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 09:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 374EC60D71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xlCMv2Khv5SQ for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 09:46:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C48F960F72
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C48F960F72
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 09:46:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6098C40015;
 Tue, 18 Jul 2023 09:46:10 +0000 (UTC)
Date: Tue, 18 Jul 2023 11:46:08 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230718114608.60593e6d@windsurf>
In-Reply-To: <20230716170126.438652-1-bernd@kuhls.net>
References: <20230716170126.438652-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689673571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jSAKWP5vcKW7fRIxpquBovu5RvOFpfvEopRXr1x+A4s=;
 b=ihw9mLA42hSIbkS35MfgpwChqH/qm5LRM4JM6tRrFvORafSzKN5llTBVYijOyqR5CWE4YW
 RLM8nGilygkD/uKS/HPYeGoDSYp0oVvZluU4zQlQU0dZ4c3cWGVYWLHJlf9eT0+t2UatIs
 DsZM4AfpENA02J3ezmlseV4YfQepRDLhcZXtmupOsqXWbB0sVqFOHZRo9I4TtaWej1m47h
 4K1RgFecSrNxZealXlXOG+IgsE6qyNhVH8men7HLANrYwN9kmey3igBunOCch9+N5k7KjQ
 ZG06QohPm/cH1ZM+LkS6Ers48C1m01kJnQmy2ibpblhdTUIFg1dYil1GqX2yBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ihw9mLA4
Subject: Re: [Buildroot] [PATCH 1/2] package/xscreensaver: fix build
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
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Sun, 16 Jul 2023 19:01:25 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> diff --git a/.checkpackageignore b/.checkpackageignore
> index 504b96951b..fa557733e8 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1638,6 +1638,8 @@ package/xinetd/0004-configure-rlim_t.patch Upstream
>  package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch Upstream
>  package/xl2tp/xl2tpd TrailingSpace
>  package/xml-security-c/0001-fix-build-with-libressl-3.5.0.patch Upstream
> +package/xscreensaver/0001-disable-check-for-pam.patch
> +package/xscreensaver/0002-build-Do-not-build-po-files.patch

Is this valid syntax? You're saying to ignore some warnings, but not
which ones.

Also, for new patches, adding them in the checkpackageignore file is
quite odd. We definitely want those new patches to have an "Upstream:"
tag.

>  package/xxhash/0001-fix-man-page-installation.patch Upstream
>  package/xxhash/0002-Makefile-add-dedicated-install-targets.patch Upstream
>  package/xxhash/0003-do-no-longer-depend-on-assert-h-for-XXH_STATIC_ASSERT.patch Upstream
> diff --git a/package/xscreensaver/0001-disable-check-for-pam.patch b/package/xscreensaver/0001-disable-check-for-pam.patch
> new file mode 100644
> index 0000000000..6d052a53e9
> --- /dev/null
> +++ b/package/xscreensaver/0001-disable-check-for-pam.patch
> @@ -0,0 +1,16 @@
> +Fix cross-build
> +
> +Detecting features of the host does not make sense when cross-compiling.
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Meh, no Git repository of the project to have a nice Git formatted patch? :-/

> diff --git a/package/xscreensaver/0002-build-Do-not-build-po-files.patch b/package/xscreensaver/0002-build-Do-not-build-po-files.patch
> new file mode 100644
> index 0000000000..03674f5d50
> --- /dev/null
> +++ b/package/xscreensaver/0002-build-Do-not-build-po-files.patch
> @@ -0,0 +1,58 @@
> +From 6b5d022f6dd9848a2d5ca08a1968929b8c140981 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 16 Jul 2022 09:59:40 -0700
> +Subject: [PATCH 2/2] build: Do not build po files

No patch numbering, this raises a check-package warning.

I see Khem has been able to generate a git formatted patch, I wonder
against which Git repository?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
