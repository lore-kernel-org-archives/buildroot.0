Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E775DCA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 21:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94918607A8;
	Thu, 14 Aug 2025 21:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IwCkp_U2e6yt; Thu, 14 Aug 2025 21:10:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E90A607B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E90A607B6;
	Thu, 14 Aug 2025 21:10:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F32111BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 21:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA0674070C
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 21:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8RgzSdz-VyUz for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 21:10:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7739B406D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7739B406D4
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7739B406D4
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 21:10:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A86AFB977F86; Thu, 14 Aug 2025 23:09:57 +0200 (CEST)
Message-ID: <cecb803e-1707-43f4-be41-0b13acdf5112@rnout.be>
Date: Thu, 14 Aug 2025 23:09:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexander Shirokov <shirokovalexs@gmail.com>, buildroot@buildroot.org
References: <20250715125737.798491-1-shirokovalexs@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250715125737.798491-1-shirokovalexs@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1755205799; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=T5zvVZY5fzxKweTofvHzwSgFq33mauNmxmTjJqfm3fE=;
 b=pTXE7ryowyybmfxOZifimP36SZ04XVVS9BofI4bawuaKqYWGWfoo0iLGe7WsNTILT2rvw+
 HipmQ2mz8vS5ZTQnpiGwqzpDUFXnMDSkgmYxDp/i/gmRYPlMhwyM4IWlm9QeUrEW5JoaYm
 Aww1WHOUMEfaBAPk0rdiomTeUK/1mhp7HwLjWpEgo51IvDtyd12jMVT4RulLUGEvxDMYj/
 eFE622SPOjRNO7yO552126SL8RQse9+7dbEJsEMigxbcN+Y/2qDERJ0EYowSlMxvPDRdnp
 Iev+f4s5WFKMLoD6Z29kzbBNC0zE4eUcbVaGHvYeAVypj994zpMC6ikZa3PZtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=pTXE7ryo
Subject: Re: [Buildroot] [1/1] package/nnn: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Alexander,

  Thank you for our patch! I have a bunch of comments. Could you fix those and 
re-send? I've marked your patch as Changes Requested in patchwork.


On 15/07/2025 14:57, Alexander Shirokov wrote:
> nnn is a fast and minimal text-based file manager. It is written in C
> and has minimal dependencies, which makes it portable and suitable for
> embedded systems.
> 
> Project page: https://github.com/jarun/nnn
> Wiki: https://en.wikipedia.org/wiki/Nnn_(file_manager)
> 
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
> ---
>   package/Config.in     |  1 +
>   package/nnn/Config.in |  9 +++++++++
>   package/nnn/nnn.hash  |  3 +++
>   package/nnn/nnn.mk    | 32 ++++++++++++++++++++++++++++++++

  Please also add yourself to the DEVELOPERS file for this package.

>   4 files changed, 45 insertions(+)
>   create mode 100644 package/nnn/Config.in
>   create mode 100644 package/nnn/nnn.hash
>   create mode 100644 package/nnn/nnn.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 9a841082c6..c21c5a6332 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2805,6 +2805,7 @@ comment "Utilities"
>   	source "package/lowdown/Config.in"
>   	source "package/minisign/Config.in"
>   	source "package/neofetch/Config.in"
> +	source "package/nnn/Config.in"

  Midnight Commander is in the "Text editors and viewers" menu. Not sure if that 
is the best place, but at least mc and nnn should be in the same menu, since 
they do the same thing. Sort of.

>   	source "package/pdmenu/Config.in"
>   	source "package/pinentry/Config.in"
>   	source "package/qprint/Config.in"
> diff --git a/package/nnn/Config.in b/package/nnn/Config.in
> new file mode 100644
> index 0000000000..9c9db748ea
> --- /dev/null
> +++ b/package/nnn/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_NNN
> +	bool "nnn"
> +	depends on BR2_PACKAGE_READLINE && BR2_PACKAGE_NCURSES

  We as much as possible use "select" instead of "depends on", so users don't 
have to go and find those dependencies before they can enable nnn. See [1]. Note 
that you'll also need to propagate ncurses' dependencies and add a comment for it.


  Readline, however, is an optional dependency for nnn. You can specify O_NORL=1 
on the make command line to disable it.  See below.


> +	help
> +	  nnn is a lightweight yet powerful terminal file manager.
> +	  It is written in C, has minimal dependency, and works
> +	  out of the box.
> +
> +	  https://github.com/jarun/nnn
> diff --git a/package/nnn/nnn.hash b/package/nnn/nnn.hash
> new file mode 100644
> index 0000000000..0b93ebbdcf
> --- /dev/null
> +++ b/package/nnn/nnn.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  9faaff1e3f5a2fd3ed570a83f6fb3baf0bfc6ebd6a9abac16203d057ac3fffe3  nnn-v5.1.tar.gz
> +sha256  829f485dc4f2f51c2471b36a99e22f15ff214966e16b72cd79768b2338b4132b  LICENSE
> diff --git a/package/nnn/nnn.mk b/package/nnn/nnn.mk
> new file mode 100644
> index 0000000000..019c098761
> --- /dev/null
> +++ b/package/nnn/nnn.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# nnn
> +#
> +################################################################################
> +
> +NNN_VERSION = v5.1

  Try to keep VERSION at the "clean" version, i.e. 5.1

> +NNN_LICENSE = BSD-2-Clause
> +NNN_LICENSE_FILES = LICENSE
> +NNN_SITE = $(call github,jarun,nnn,$(NNN_VERSION))

  And here you use $(call github,jarun,nnn,v$(NNN_VERSION))

(note that the file name also changes so you have to update the hash file as well.

> +NNN_DEPENDENCIES = readline ncurses
> +NNN_INSTALL_STAGING = YES

  This only installs a binary so installation to staging is not needed.

> +NNN_BIN = usr/bin/nnn
> +
> +define NNN_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +	CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"

  The Makefile has a lot of options (O_xxx, documented at the top). We generally 
like to specify all of them explicitly, though in this case honestly it is a bit 
too much.

  There are a few options though that you do have to specify. O_NORL, as 
mentioned above. O_DEBUG is better to set explicitly to 0, we want to override 
it with Buildroot's debug options. Similarly, CFLAGS_OPTIMIZATION should be set 
to empty to remove the -O3.

  In addition, CPPFLAGS, LDFLAGS and PKG_CONFIG should be passed into the 
Makefile. These are in TARGET_CONFIGURE_OPTS, it's easiest to just pass those.

  So, that brings us to this:

NNN_MAKE_FLAGS = \
	$(TARGET_CONFIGURE_OPTS) \
	CFLAGS_OPTIMIZATION= \
	O_DEBUG=0

ifeq ($(BR2_PACKAGE_READLINE),y)
NNN_DEPENDENCIES += readline
NNN_MAKE_FLAGS += O_NORL=0
else
NNN_MAKE_FLAGS += O_NORL=1
endif

define NNN_BUILD_CMDS
	$(MAKE) -C $(@D) $(NNN_MAKE_FLAGS) all
endef

> +endef
> +
> +# Install the binaries, manuals, and other items described in the Makefile to the staging directory
> +define NNN_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +	DESTDIR=$(STAGING_DIR) PREFIX=/usr install

  For consistency, it is best to repeat NNN_MAKE_FLAGS also in the install step.

> +endef
> +
> +# Put a stripped binary into the target directory
> +define NNN_INSTALL_TARGET_CMDS
> +	$(INSTALL) -Dm755 $(STAGING_DIR)/$(NNN_BIN) $(TARGET_DIR)/$(NNN_BIN)
> +	$(TARGET_STRIP) $(TARGET_DIR)/$(NNN_BIN)

You can just use make install with DESTDIR set to TARGET_DIR. The man pages will 
be removed again during target finalization.


  Regards,
  Arnout


> +endef
> +
> +$(eval $(generic-package))


[1] https://buildroot.org/downloads/manual/manual.html#depends-on-vs-select



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
