Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACABC4167B
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 17:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AF3B84CEF;
	Wed,  1 Nov 2023 17:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AF3B84CEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EJOejbAAsBGV; Wed,  1 Nov 2023 17:47:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCBB384CE4;
	Wed,  1 Nov 2023 17:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCBB384CE4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E7411BF2F1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 764B07047D
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 764B07047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9yr5F6jf2UzL for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 17:46:57 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92A6370452
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 17:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92A6370452
Received: by mail.gandi.net (Postfix) with ESMTPSA id AAA4A1BF206;
 Wed,  1 Nov 2023 17:46:53 +0000 (UTC)
Date: Wed, 1 Nov 2023 18:46:52 +0100
To: Michel Alex <Alex.Michel@wiedemann-group.com>
Message-ID: <20231101184652.412eb9cb@windsurf>
In-Reply-To: <AS1P250MB06088E27875FEBCE10F3B5F9A9D5A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
References: <AS1P250MB06088E27875FEBCE10F3B5F9A9D5A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698860813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5XwA+kp/Bq4918+6ImUiRu4BSOImOHqWpmI3t4NHEII=;
 b=aoQnf44czzWKRyN9kJ/cul+FhmNFNVi3O2fS42ZlVkm4c5MMKTG4sjVQCEJiE7yyOydEXU
 mf6wWkXR8uBY+yAC5hVv1Y8w3weEGPdS4acSpl+0cr9vBRmKLHFXA6RyiZz8v0koNuamj2
 IhveX89Q+IjaAK0aY67fQJBNLwv+lOJXlIsujD9SqEDaqcPKN7uy+lEJuu7YBe90evHg4t
 0gxify6TL1AxrrAqvzZBYtjP1lutSmKI/3kIJyR2pQMAdbPv15J6abKWrP/D1b6au1ySZX
 Hg3CLgvgZpswgdjyMzTax/2Sfut0iiFq/O4l2s1if9XefeavdZb6Kc1APyIqnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aoQnf44c
Subject: Re: [Buildroot] [PATCH] package/zenoh-c: new package
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alex,

On Wed, 18 Oct 2023 08:15:28 +0000
Michel Alex <Alex.Michel@wiedemann-group.com> wrote:

> This package provides a C binding based on the main
> Zenoh implementation written in Rust.
> 
> https://github.com/eclipse-zenoh/zenoh-c
> 
> Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>

Thanks for this contribution.

>  package/Config.in            |  1 +
>  package/zenoh-c/Config.in    |  9 +++++++++
>  package/zenoh-c/zenoh-c.hash |  3 +++
>  package/zenoh-c/zenoh-c.mk   | 26 ++++++++++++++++++++++++++
>  4 files changed, 39 insertions(+)

Entry in the DEVELOPERS file is missing.


> +ZENOH_C_VERSION = 0.10.0-rc
> +ZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(ZENOH_C_VERSION))
> +ZENOH_C_LICENSE = EPL-2.0

License is:

Apache-2.0 or EPL-2.0

> +ZENOH_C_LICENSE_FILES = LICENSE
> +
> +# Install default config file
> +define ZENOH_C_INSTALL_FILES
> +       $(INSTALL) -D -m 644 $(@D)/target/*/release/libzenohc.so $(TARGET_DIR)/usr/lib/
> +       $(INSTALL) -D -m 644 $(@D)/include/* $(STAGING_DIR)/usr/include/

Meh, you're installing things to staging in the post install target
hook. Also, the shared library should also be installed to staging.

> +endef
> +ZENOH_C_POST_INSTALL_TARGET_HOOKS += ZENOH_C_INSTALL_FILES
> +
> +# no install step necessary because it is not possible to install libraries using cargo command
> +# library and header files are installed above
> +define ZENOH_C_INSTALL_TARGET_CMDS
> +       # empty
> +endef

Then what you should do is:

define ZENOH_C_INSTALL_FILES
	$(INSTALL) -D -m 644 $(@D)/target/*/release/libzenohc.so $(1)/usr/lib/libzenohc.so
	mkdir -p $(STAGING_DIR)/usr/include/
	cp -dpfr $(@D)/include/* $(STAGING_DIR)/usr/include/
endif

define ZENOH_C_INSTALL_TARGET_CMDS
	$(call ZENOH_C_INSTALL_FILES,$(TARGET_DIR))
endef

define ZENOH_C_INSTALL_STAGING_CMDS
	$(call ZENOH_C_INSTALL_FILES,$(STAGING_DIR))
endef

However, I have some other questions:

- You're using cargo to build this package, but at
  https://github.com/eclipse-zenoh/zenoh-c they suggest to use CMake.
  Any opinion on this?

- When using cargo to build,
  https://github.com/eclipse-zenoh/zenoh-c/blob/master/Cargo.toml is
  used, and I'm worried by the following lines:

zenoh = { git = "https://github.com/eclipse-zenoh/zenoh.git", branch = "master", features = [ "shared-memory", "unstable" ] }
zenoh-protocol = { git = "https://github.com/eclipse-zenoh/zenoh.git", branch = "master", features = [ "shared-memory" ] }
zenoh-util = { git = "https://github.com/eclipse-zenoh/zenoh.git", branch = "master" }

  I'm not too familiar with Cargo, but to me this looks like it is
  going to pull the latest "master" branch of zenoh, zenoh-protocol,
  zenoh-util. So it means that the build of zenoh-c is not
  reproducible, as you will pull different things from those master
  branches depending on when you do your build. Could you comment on
  this?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
