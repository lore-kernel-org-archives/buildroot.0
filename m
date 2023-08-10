Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37437C04A6A
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 21:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5F5840A70;
	Thu, 10 Aug 2023 21:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5F5840A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xGjzZcOiUwOd; Thu, 10 Aug 2023 21:33:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E39FF4061F;
	Thu, 10 Aug 2023 21:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E39FF4061F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE7821BF4DB
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 21:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4C6880F54
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 21:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4C6880F54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tdWo-bEzs1b8 for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 21:33:32 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A85A80DF9
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 21:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A85A80DF9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3746FC0003;
 Thu, 10 Aug 2023 21:33:30 +0000 (UTC)
Date: Thu, 10 Aug 2023 23:33:28 +0200
To: Colin Foster <colin.foster@in-advantage.com>
Message-ID: <20230810233328.5dbf77a3@windsurf>
In-Reply-To: <20230208185516.858096-1-colin.foster@in-advantage.com>
References: <20230208185516.858096-1-colin.foster@in-advantage.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691703210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iZOEuukVKqYeo4XKnD7IA0aB196hU+yt50gp3mfipZQ=;
 b=BJEFPzkO/wJhWVplHbA9O0BKi4IqJ7I63ehQYYNUDl80+mgCKKlYzOMBEPOignl1dhbySw
 qqI8B0fipW8pmORUJMaryDgTjR2DR5oEu27zj0LcCOEFrRhOkEcPkKGRFWuIFYFjXwCsDN
 LJTYtzK8z+vt0EYgCV95vSYk8jWZIwJ+z4trFXTOuIZ8saedd9SFXeZvJ0aGg5qrggow2a
 uU3VXm0hniTOkGhfClrqehCIAvWTFG4Ncsd3T6JYfRRdc8DTWmwAaYkpX0u5FMVvx1tWn3
 gzGsc9LYUs9ecDVRK33bF3Ky54llZPKhArfENqVbnktRabRE3Fzy3hQgYPiQjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BJEFPzkO
Subject: Re: [Buildroot] [PATCH] package/rauc-hawkbit-updater: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Colin,

On Wed,  8 Feb 2023 10:55:16 -0800
Colin Foster <colin.foster@in-advantage.com> wrote:

> Add useful tool for bridging RAUC with the Hawkbit API.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>

Sorry for the very slow feedback, but I have finally reviewed... and
applied your patch! See below some comments.

> ---
>  package/Config.in                                 |  1 +
>  package/rauc-hawkbit-updater/Config.in            | 14 ++++++++++++++
>  .../rauc-hawkbit-updater.hash                     |  3 +++
>  .../rauc-hawkbit-updater/rauc-hawkbit-updater.mk  | 15 +++++++++++++++
>  4 files changed, 33 insertions(+)

Entry in the DEVELOPERS file was missing.


> diff --git a/package/rauc-hawkbit-updater/Config.in b/package/rauc-hawkbit-updater/Config.in
> new file mode 100644
> index 0000000000..bd7b8d7cf5
> --- /dev/null
> +++ b/package/rauc-hawkbit-updater/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_RAUC_HAWKBIT_UPDATER
> +    bool "rauc-hawkbit-updater"
> +    depends on BR2_PACKAGE_RAUC
> +    depends on BR2_PACKAGE_JSON_GLIB

We want those dependencies to be using "select" instead. Also the
dependency on libcurl was missing.

The indentation of the file was also not correct (we use one tab for
depends on/bool/select), and one tab + 2 spaces for the help text. This
is checked by running "make check-package".

Overall, Config.in now looks like this:

+config BR2_PACKAGE_RAUC_HAWKBIT_UPDATER
+       bool "rauc-hawkbit-updater"
+       depends on BR2_TOOLCHAIN_HAS_THREADS # rauc, json-glib
+       depends on BR2_USE_MMU # rauc, json-glib
+       depends on BR2_USE_WCHAR # rauc, json-glib
+       select BR2_PACKAGE_JSON_GLIB
+       select BR2_PACKAGE_LIBCURL
+       # runtime
+       select BR2_PACKAGE_RAUC
+       help
+         rauc-hawkbit-updater is a link between Pengutronix RAUC and
+         the Eclipse Hawkbit API. Hawkbit can communicate to remote
+         update servers, and use the d-bus interface to trigger
+         updates from RAUC.
+
+         http://rauc.io/
+
+comment "rauc-hawkbit-updater needs a toolchain w/ wchar, threads"
+       depends on BR2_USE_MMU
+       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS


> diff --git a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash
> new file mode 100644
> index 0000000000..c65ead3784
> --- /dev/null
> +++ b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  42318e96a464e6c716edb45c48bd3ec3b874462973db902fbe099a395e4acb4b  rauc-hawkbit-updater-1.3.tar.xz
> +sha256  041234c81fd6fe6c531ea1a886b9e740b9ee06759d1a910a14edbd06f4aa62c7  LICENSE
> diff --git a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
> new file mode 100644
> index 0000000000..5a74181361
> --- /dev/null
> +++ b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
> @@ -0,0 +1,15 @@
> +###############################################################################
> +#
> +# rauc-hawkbit-updater
> +#
> +###############################################################################

This comment header was also causing some "make check-package" warnings
due to an incorrect number of # signs.

> +
> +RAUC_HAWKBIT_UPDATER_VERSION = 1.3
> +RAUC_HAWKBIT_UPDATER_SITE = https://github.com/rauc/rauc-hawkbit-updater/releases/download/v$(RAUC_HAWKBIT_UPDATER_VERSION)
> +RAUC_HAWKBIT_UPDATER_SOURCE = rauc-hawkbit-updater-$(RAUC_HAWKBIT_UPDATER_VERSION).tar.xz
> +RAUC_HAWKBIT_UPDATER_LICENSE = LGPL-2.1
> +RAUC_HAWKBIT_UPDATER_LICENSE_FILES = LICENSE
> +RAUC_HAWKBIT_UPDATER_CPE_ID_VENDOR = pengutronix
> +RAUC_HAWKBIT_UPDATER_DEPENDENCIES = json-glib

libcurl was missing here

Applied to next with those different changes. Thanks for your
contribution, and again sorry for the very late feedback.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
