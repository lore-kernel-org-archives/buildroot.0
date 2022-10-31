Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF717ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 12:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7172F60BE3;
	Mon, 31 Oct 2022 12:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7172F60BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2KTgfObf5SGM; Mon, 31 Oct 2022 12:56:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25DE460BF2;
	Mon, 31 Oct 2022 12:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25DE460BF2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E3E21BF417
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E5AD80CE6
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E5AD80CE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Axc6pdpU2jrl for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 12:55:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29D5980C09
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29D5980C09
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 12:55:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E4AF340009;
 Mon, 31 Oct 2022 12:54:56 +0000 (UTC)
Date: Mon, 31 Oct 2022 13:54:55 +0100
To: Eero Aaltonen via buildroot <buildroot@buildroot.org>
Message-ID: <20221031135455.32d64698@windsurf>
In-Reply-To: <20221019143219.329504-1-eero.aaltonen@vaisala.com>
References: <20221019143219.329504-1-eero.aaltonen@vaisala.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667220897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3AEdc1t0Eq/gAM5klRa5mPKI6J70vJR+6F13iftNAEI=;
 b=R0cMiTiswo7+CIB8hOVk/8OHXjnF7Pu0YQsFWvNIIOlAqbsp6xhJ9HWJ3vqQAuW3YGdZAm
 mQFtoszb/Fcb4Ze/b4L5siK2PYIICnDmjWx89e6SfoEkBa9PzthGr5sUHsY+UKCp1Z8/PY
 cUhrFqxFKOajCfx5Xc1PUQdZgQx/EUjfo3UP/xrWfAVIPkXF47lo+wvCLejT945dj/Cn94
 Bl5ElFf0w+MpOXVJay4f22kJwmNT9EJgz5JN9t+GPTA8lxlFfebjELm2RhmhcVabrXMO9n
 rDP8t1lp/TggmXYQPTHfdUogpxJ031EqIhCZb/8bluyoESRUQu8tYl1WZxjzvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R0cMiTis
Subject: Re: [Buildroot] [PATCH 1/1] package/docopt.cpp: new package
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
Cc: Eero Aaltonen <eero.aaltonen@vaisala.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Eero,

On Wed, 19 Oct 2022 17:32:19 +0300
Eero Aaltonen via buildroot <buildroot@buildroot.org> wrote:

> Add docopt.cpp library that can be used to create intuitive command
> line interfaces with very little code by describing the valid calls
> using the (POSIX.1-2017) command line utility argument syntax.
> 
> Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>

Thanks a lot for your patch! I'm adding in Cc Angelo, who helped by
reviewing/testing your patch. I have applied your patch, but after
doing a number of changes, which are described below. Angelo: look
below as well, to see the few things that you missed as part of your
review, as it will definitely help in doing more detailed reviews in
the future!

>  DEVELOPERS                         |  3 +++
>  package/Config.in                  |  1 +
>  package/docopt.cpp/Config.in       | 15 +++++++++++++++
>  package/docopt.cpp/docopt.cpp.hash |  6 ++++++
>  package/docopt.cpp/docopt.cpp.mk   | 13 +++++++++++++
>  5 files changed, 38 insertions(+)

I renamed to package/docopt-cpp/. I don't think we have other packages
with a "." in their name, and I didn't want to create a new situation.


> diff --git a/package/docopt.cpp/Config.in b/package/docopt.cpp/Config.in
> new file mode 100644
> index 0000000000..655a656398
> --- /dev/null
> +++ b/package/docopt.cpp/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_DOCOPT_CPP
> +	bool "docopt.cpp"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
> +	help
> +	  docopt is a library that lets you define a command line
> +	  interface with the utility argument syntax that has been
> +	  used by command line utilities for decades (POSIX.1-2017).
> +	  From the description, docopt automatically generates a parser
> +	  for the command line arguments.
> +
> +	  docopt Command-line interface description language
> +	  http://docopt.org/
> +
> +	  docopt C++ port https://github.com/docopt/docopt.cpp

The last line of the help text should only contain the upstream URL of
the project, so I reformatted a bit to match this requirement.

Also, you had forgotten a Config.in comment to document the C++ and gcc
4.7+ dependencies, so I have added:

+comment "docopt-cpp needs a toolchain w/ C++, gcc >= 4.7"
+       depends on !BR2_INSTALL_LIBSTDCPP || \
+               !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7

> diff --git a/package/docopt.cpp/docopt.cpp.mk b/package/docopt.cpp/docopt.cpp.mk
> new file mode 100644
> index 0000000000..647071243a
> --- /dev/null
> +++ b/package/docopt.cpp/docopt.cpp.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# docopt.cpp
> +#
> +################################################################################
> +
> +DOCOPT_CPP_VERSION = 0.6.3
> +DOCOPT_CPP_SOURCE = v$(DOCOPT_CPP_VERSION).tar.gz
> +DOCOPT_CPP_SITE = https://github.com/docopt/docopt.cpp/archive/refs/tags

You should have use the github macro here:

+DOCOPT_CPP_VERSION = 0.6.3
+DOCOPT_CPP_SITE = $(call github,docopt,docopt.cpp,v$(DOCOPT_CPP_VERSION))

> +DOCOPT_CPP_INSTALL_STAGING = YES
> +DOCOPT_CPP_LICENSE_FILES = LICENSE-Boost-1.0 LICENSE-MIT

The LICENSE variable was missing, so I've added it:

+DOCOPT_CPP_LICENSE = BSL-1.0 or MIT

Again, applied with all those changes. See:

  https://gitlab.com/buildroot.org/buildroot/-/commit/43f96ced67c9a1f84d3f0edf5cd632178eb176b8

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
