Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5907DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 21:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B9F440C88;
	Mon, 30 May 2022 21:31:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b0T0xiE981eR; Mon, 30 May 2022 21:31:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D28040C14;
	Mon, 30 May 2022 21:31:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 933E21BF276
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 816A061227
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:31:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DLk5tR54t1f0 for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 21:31:30 +0000 (UTC)
X-Greylist: delayed 01:12:40 by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36BC361222
 for <buildroot@buildroot.org>; Mon, 30 May 2022 21:31:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D54BA1BF203;
 Mon, 30 May 2022 21:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653946287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A1tVZH1XMsTjVVysuoes553sUKF/xIXZAu4jeKzzvV8=;
 b=NmVDNfgQNmWG0pzZ3hLM795gKBFCv/MZO0U7wCz6XbAd624pzJbaQ2uuM4WE2AH6nmfKc1
 b+TuImRXQUix1LHn9NmS+4phasAxwt7QIaxmKwsCwWDk2NRc5HYKwDWSed2rpputgTeuqp
 DsFgmEfikHNC1lK0ZUkF4h/qZQu8aLeZ6BCvwYev07X4K3HcfV7OkW2fZd3UPorQw0XrS4
 G+rWqOlbTG5OWwFIkAPB69nPGlx6w1O0qJnm/CXFdfObfS0TDFWdH16Z1zNRhfhoTOnRqw
 V5BR5Cv/48sic6slvZzX95+5sJtO6tO8EqsyDJhMCLP8BMHPADVpJogl4UrmKw==
Date: Mon, 30 May 2022 23:31:25 +0200
To: Dimi Tomov <dimi@tpm.dev>
Message-ID: <20220530233125.1f257276@windsurf>
In-Reply-To: <20220530203001.574908-1-dimi@tpm.dev>
References: <20220508212014.629607-1-dimi@tpm.dev>
 <20220530203001.574908-1-dimi@tpm.dev>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/wolftpm: new package,
 wolfTPM library for TPM2.0
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

Hello,

The commit title should be just:

	package/wolftpm: new package

See below for more comments.

On Mon, 30 May 2022 23:30:00 +0300
Dimi Tomov <dimi@tpm.dev> wrote:

>  package/Config.in            |  1 +
>  package/wolftpm/Config.in    | 14 ++++++++++++++
>  package/wolftpm/wolftpm.hash |  2 ++
>  package/wolftpm/wolftpm.mk   | 29 +++++++++++++++++++++++++++++
>  4 files changed, 46 insertions(+)

An entry in the DEVELOPERS file is missing.

> diff --git a/package/wolftpm/Config.in b/package/wolftpm/Config.in
> new file mode 100644
> index 0000000000..497f5ae6e9
> --- /dev/null
> +++ b/package/wolftpm/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_WOLFTPM
> +	bool "wolftpm"
> +	depends on BR2_PACKAGE_WOLFSSL

This should be a "select", and you need to propagate the "depends on
BR2_TOOLCHAIN_HAS_THREADS" from wolfssl.

> +    select BR2_PACKAGE_WOLFSSL_ALL

Indentation is incorrect here, it should be intended with one tab.

> +	help
> +	  wolfTPM is a portable, open-source TPM 2.0 stack with
> +	  backward API compatibility, designed for embedded use.
> +	  No external dependencies, compact code size with low
> +	  resource usage.
> +
> +	  https://www.wolfssl.com/
> +
> +comment "wolfTPM needs the wolfSSL cryptographic library"
> +	depends on !BR2_PACKAGE_WOLFSSL

Replace this with:

comment "wolftpm needs a toolchain w/ threads"
	depends on !BR2_TOOLCHAIN_HAS_THREADS

> +WOLFTPM_VERSION = 2.3.1
> +WOLFTPM_SITE = $(call github,wolfSSL,wolfTPM,v$(WOLFTPM_VERSION))
> +WOLFTPM_INSTALL_STAGING = YES
> +

Empty line not needed.

> +WOLFTPM_LICENSE = GPL-2.0+
> +WOLFTPM_LICENSE_FILES = LICENSE
> +WOLFTPM_CPE_ID_VENDOR = wolfssl
> +
> +WOLFTPM_DEPENDENCIES = host-pkgconf
> +
> +# wolfTPM's source code is released without a configure script,
> +# therefore we need autoreconf
> +WOLFTPM_AUTORECONF = YES
> +
> +WOLFTPM_CONF_OPTS = --disable-examples --enable-devtpm --with-wolfcrypt=$(TARGET_DIR)/usr/

This --with-wolfcrypt option value looks suspicious. What is this
option meant for?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
