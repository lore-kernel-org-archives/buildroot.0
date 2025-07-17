Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5C4C83F34
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 11:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F15561B3C;
	Sat, 19 Jul 2025 11:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fFqB1Jk7_iyR; Sat, 19 Jul 2025 11:23:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 320CF61447
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 320CF61447;
	Sat, 19 Jul 2025 11:23:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14D3F222
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 066AC84619
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8nDqlu54VjH for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 11:23:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 79C06845D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79C06845D9
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79C06845D9
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:23:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4A917B977B26; Sat, 19 Jul 2025 13:23:30 +0200 (CEST)
Message-ID: <5d5ed23b-bc80-427d-ba9c-2517de7558ee@rnout.be>
Date: Thu, 17 Jul 2025 23:16:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Brenke, Maik" <Maik.Brenke@continental-corporation.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <PA4PR03MB82453FEFC1AC64F478F632E4A056A@PA4PR03MB8245.eurprd03.prod.outlook.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <PA4PR03MB82453FEFC1AC64F478F632E4A056A@PA4PR03MB8245.eurprd03.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752924211; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Ii/NYA3RH7AjnbO3fFjuKcWP4Y9IR4wSBTXQ4cq+qqQ=;
 b=MZ/qr7akFDE89IhgpkKpCDXb/1Hz2xakbYkcWcLIJuXWhGca6XcCojwIe4f13bNB6fSIx0
 DsjK1BOa+yqQWxQHxkQUhNbcwvqWQmKRNcUZ5IZ0OLQQMxSk9oBg4zZiUnyPHZR4nfn0L8
 cT2RuhOvxCF60EQj9yPgWZkYp84/cFdBeHWJORh+LlTaJtwqEXRWLBf6aigP30WdAGpMoE
 jOJhYTSaksA9I3/wYdB8FG/61BpJe2diHT9hMhMVOuT8NqCaz+KGeUaZmoD7xpt6lX19xG
 eki/ECDGPJRfeT0XJqwd0PO0eNNozTimplz0gc9DlOvQSbnrwsNYutmujkcd8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=MZ/qr7ak
Subject: Re: [Buildroot] [PATCH 1/1] package/figlet: new package
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

  Hi Maik,

  Thank you for your patch! It looks good at first sight, but there are a few 
issues with it that make it impossible to apply it just yet.

  First of all, your mailer destroyed the whitespace in the patch. I think it 
was sent through a webmail client - that won't work. You should use git 
send-email. Hopefully, your exchange server is SMTP-capable and you can actually 
use it. Although it's possible that it still tries to f** things up...


On 16/07/2025 11:01, Brenke, Maik wrote:
> Add package FIGlet to creates large characters out of ordinary terminal characters.
> 
> 

  Spurious empty line.

> Signed-off-by: brenkem <Maik.Brenke@continental-corporation.com>

  The name in the Sob should be your real, full name. You probably need to set 
it with `git config --global user.name "Maik Brenke"`


> ---
> DEVELOPERS | 3 +++
> package/Config.in | 1 +
> package/figlet/Config.in | 12 ++++++++++++
> package/figlet/figlet.hash | 2 ++
> package/figlet/figlet.mk | 21 +++++++++++++++++++++
> 5 files changed, 39 insertions(+)
> create mode 100644 package/figlet/Config.in
> create mode 100644 package/figlet/figlet.hash
> create mode 100644 package/figlet/figlet.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1f04dd2a..89f30122 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2195,6 +2195,9 @@ F: package/mpv/
> F: package/rpi-firmware/
> F: package/rpi-userland/
> 
> +N: Maik Brenke <Maik.Brenke@continental-corporation.com>
> +F: package/figlet/
> +
> N: Marcin Bis <marcin@bis.org <mailto:marcin@bis.org>.pl>
> F: package/bluez5_utils/
> F: package/cc-tool/
> diff --git a/package/Config.in b/package/Config.in
> index 4a81a62e..2a220266 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -279,6 +279,7 @@ comment "Sounds"
> source "package/sound-theme-freedesktop/Config.in"
> 
> comment "Themes"
> + source "package/figlet/Config.in"

  Desktop themes sounds like a weird place to put this... Admittedly it's hard 
to find a good place, but I'd put it under Miscelaneous.


> source "package/gtk2-engines/Config.in"
> 
> endmenu
> diff --git a/package/figlet/Config.in b/package/figlet/Config.in
> new file mode 100644
> index 00000000..2808c048
> --- /dev/null
> +++ b/package/figlet/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_FIGLET
> + bool "figlet"
> + help
> + FIGlet is a program that creates large characters
> + out of ordinary screen characters
> + _ _ _ _ _ _
> + | (_) | _____ | |_| |__ (_)___
> + | | | |/ / _ \ | __| '_ \| / __|
> + | | | < __/ | |_| | | | \__ \_
> + |_|_|_|\_\___| \__|_| |_|_|___(_)

  Wow, completely unreadable, but I guess it says "figlet" :-)

> +
> + The official FIGlet web page: http://www.figlet.org/ <http://www.figlet.org/>

  It should be just the URL here, without "The official FIGlet web page".

> diff --git a/package/figlet/figlet.hash b/package/figlet/figlet.hash
> new file mode 100644
> index 00000000..442c197e
> --- /dev/null
> +++ b/package/figlet/figlet.hash
> @@ -0,0 +1,2 @@
> +# locally calculated
> +sha256 4d366c4a618ecdd6fdb81cde90edc54dbff9764efb635b3be47a929473f13930 
> figlet-2.2.5.tar.gz

  You should also include a hash for th elicense file.

> diff --git a/package/figlet/figlet.mk b/package/figlet/figlet.mk
> new file mode 100644
> index 00000000..c36d110b
> --- /dev/null
> +++ b/package/figlet/figlet.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# figlet
> +#
> +################################################################################
> +
> +FIGLET_VERSION = 2.2.5
> +FIGLET_SITE = $(call github,cmatsuoka,figlet,$(FIGLET_VERSION))
> +FIGLET_LICENSE = BSD-3-Clause
> +FIGLET_LICENSE_FILES = LICENSE
> +
> +define FIGLET_BUILD_CMDS
> + $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> + CC="$(TARGET_CC) -std=gnu89" LD="$(TARGET_CC)" figlet

  Wow, it really needs C90?

  We'd normally put gnu90, not gnu89.

  You also need to set prefix=/usr otherwise it will look for fonts in 
/usr/local/share.

> +endef
> +
> +define FIGLET_INSTALL_TARGET_CMDS
> + $(INSTALL) -m 0755 -D $(@D)/figlet $(TARGET_DIR)/usr/bin/figlet

  This doesn't install any fonts... Can it still do anything useful then? Does 
it have a built-in font?

  You could use `make install prefix=/usr DESTDIR=$(TARGET_DIR)` to install 
everything. The man page will be deleted by the buildroot infrastructure.

  Ideally there should be a menuconfig option with the list of fonts to install, 
supporting wildcards, and defaulting to just standard. But it's OK if for now 
you install only standard.flf without additional options.


  It would also be nice if you could add a runtime test [1]. You can compare the 
output of figlet with a predefined file. This validates that it can find its fonts.


  Regards,
  Arnout

[1] 
https://buildroot.org/downloads/manual/manual.html#_using_the_runtime_tests_framework


> +endef
> +
> +$(eval $(generic-package))
> --
> 2.25.1
> 
> 
> Internal
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
