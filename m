Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D4FCA0EE4
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 16:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7ED7F40674;
	Mon, 18 Aug 2025 16:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SIf8QSdQpF6P; Mon, 18 Aug 2025 16:37:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85E784066E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85E784066E;
	Mon, 18 Aug 2025 16:37:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B33F5196
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 16:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E3064066E
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 16:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYdVJAUI_itV for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 16:37:18 +0000 (UTC)
X-Greylist: delayed 336 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 18 Aug 2025 16:37:18 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 957614066B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 957614066B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 957614066B
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 16:37:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2FF271A0C7D
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 16:31:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 02636606A6;
 Mon, 18 Aug 2025 16:31:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A80D91C22C950; 
 Mon, 18 Aug 2025 18:31:18 +0200 (CEST)
Date: Mon, 18 Aug 2025 18:31:15 +0200
To: Philip Molloy <philip@philipmolloy.com>
Cc: buildroot@buildroot.org, Philip Molloy <philip.molloy@analog.com>,
 Michael Hennerich <michael.hennerich@analog.com>
Message-ID: <20250818183115.2ffc683a@windsurf>
In-Reply-To: <20250818142203.421300-2-philip@philipmolloy.com>
References: <20250818142203.421300-1-philip@philipmolloy.com>
 <20250818142203.421300-2-philip@philipmolloy.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755534698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=PObNvOSH2eh9e7JHoRzRkEmkOKrldKQMyAPbNokpA24=;
 b=FKsgGINf7dxZNNJkCHsLGOBTH51Wq+T6b7Z1rN0zF14pk4kTiQftnAbA8uFpWgcHmWwYkw
 4OHV9+nrKQy/hOzh9H3e+JMgweFEZo3NZXFaP4RWwZOwiXx2c/TV8zH/LJO96kiE6xbJDT
 u/GECpoSiZrloOait9y22Vm/obAO/NOELWKQMCbSKnejiDABQbd+8KTnuje1s8FLdAn6Gb
 1V2VFD1V8m1ca+7YgB8B+MAA1wSeoGJMv6i+A2s/JSrTkMFMY0ehiW+ygTq21gWh3l4uIC
 2iDmzpDBTnzQb48ckWGXKjNWoebmdhnzcmq3mRt/38OQwQEh8ZQb3jAxEzKBTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=FKsgGINf
Subject: Re: [Buildroot] [PATCH 1/4] package/adsp-ldr: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Philip,

Thanks for this contribution! See below some feedback.

On Mon, 18 Aug 2025 14:22:30 +0000
Philip Molloy <philip@philipmolloy.com> wrote:

> From: Philip Molloy <philip.molloy@analog.com>
> 
> Signed-off-by: Philip Molloy <philip.molloy@analog.com>
> Signed-off-by: Philip Molloy <philip@philipmolloy.com>
> ---
>  package/Config.in              |  1 +
>  package/adsp-ldr/Config.in     |  9 +++++++++
>  package/adsp-ldr/adsp-ldr.hash |  3 +++
>  package/adsp-ldr/adsp-ldr.mk   | 19 +++++++++++++++++++
>  4 files changed, 32 insertions(+)

I see in PATCH 4/4 you add an entry in the DEVELOPERS file for this
package. You should squash PATCH 4/4 into this patch, so that the
addition in DEVELOPERS comes in the patch adding the package.


> diff --git a/package/Config.in b/package/Config.in
> index 579b5ffc87..63aee051e9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -470,6 +470,7 @@ endmenu
>  	source "package/acpica/Config.in"
>  	source "package/acpid/Config.in"
>  	source "package/acpitool/Config.in"
> +	source "package/adsp-ldr/Config.in"

This will not be needed (see below).

> diff --git a/package/adsp-ldr/Config.in b/package/adsp-ldr/Config.in
> new file mode 100644
> index 0000000000..a1806df576
> --- /dev/null
> +++ b/package/adsp-ldr/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_ADSP_LDR
> +	bool "adsp-ldr"
> +	depends on BR2_arm || BR2_aarch64

This file is not relevant: your package is a host only package. In
fact, if you enable this option and try to build, you should get a
failure as your .mk file does not create a target variant of this
package (which is correct).

> diff --git a/package/adsp-ldr/adsp-ldr.mk b/package/adsp-ldr/adsp-ldr.mk
> new file mode 100644
> index 0000000000..9fdf3c3c4e
> --- /dev/null
> +++ b/package/adsp-ldr/adsp-ldr.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# adsp-ldr
> +#
> +################################################################################
> +
> +ADSP_LDR_VERSION = 1.0.0
> +ADSP_LDR_SITE = $(call github,analogdevicesinc,adsp-ldr,v$(ADSP_LDR_VERSION))
> +ADSP_LDR_LICENSE = GPL-3.0
> +ADSP_LDR_LICENSE_FILES = LICENSE

Are you sure that this license file is correct? Indeed, all source
files seem to have a BSD-3-Clause license, for example:
https://github.com/analogdevicesinc/adsp-ldr/blob/main/src/ldr/lfd.c.

> +ADSP_LDR_SUBDIR = src/ldr
> +
> +define HOST_ADSP_LDR_INSTALL_CMDS
> +	$(INSTALL) -m 755 -D $(@D)/src/ldr/ldr \
> +		$(TARGET_CROSS)ldr

Why do you install it with a $(TARGET_CROSS) prefix?

Also, you seem to be the author of this repo. Why is the ldr code
burried in src/ldr, with not much outside of this folder? It would make
a lot more sense to have the code directly at the project root, and
avoid having to pass ADSP_LDR_SUBDIR = src/ldr.

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
