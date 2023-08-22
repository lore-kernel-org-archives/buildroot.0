Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309FBEE49A5
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 19:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4027160A95;
	Tue, 22 Aug 2023 19:48:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4027160A95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pQn4PxcvY_v2; Tue, 22 Aug 2023 19:48:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 827D260A70;
	Tue, 22 Aug 2023 19:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 827D260A70
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8DE911BF35E
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 591CB40920
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 591CB40920
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qg3MWUs-y1ZC for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 19:47:59 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA1724035C
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 19:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA1724035C
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDE3820003;
 Tue, 22 Aug 2023 19:47:56 +0000 (UTC)
Date: Tue, 22 Aug 2023 21:47:55 +0200
To: Gregor Haas <gregorhaas1997@gmail.com>
Message-ID: <20230822214755.1af65bb4@windsurf>
In-Reply-To: <20230814215233.745573-1-gregorhaas1997@gmail.com>
References: <20230814215233.745573-1-gregorhaas1997@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692733677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q6vm3DIbBRXkwt+qHYeyYb3Olt0KT9PafelaQjYfewU=;
 b=dkKlQo78ulbx++7nYQ2uhOYCV6nP62+JHYQY/gajdt35dlWEre/Rmd+soOVMOR8GKjEgy9
 X1EW2AQVCAHTZuprpSrijtjZ27hEbuvAgelEy/Wd9MWwSpgaUqA1JrsByX53fIAtypSHsf
 Wfvr3MQZsv2Iw1p7QX4lRYtNhPStQ1ZiSjizGuaJcMZo2GFvTpqDUVQxSoN2OxSOyNafWQ
 U1LgjJrt4NOHgQFAPkOZX5aWwqTmLWHiD+dwRhGvtM63AEGGFeRQITCDy/2lbLyMsjwH0n
 ZNl01/gTvvsQSrh60MiJflTb9XN7s2AwEqXEPUFIC9Y1BaLdE/vwBYm4oXRytw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dkKlQo78
Subject: Re: [Buildroot] [PATCH 1/1] package/bmap-tools: add dependency on
 python-six
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Gregor,

On Mon, 14 Aug 2023 14:52:33 -0700
Gregor Haas <gregorhaas1997@gmail.com> wrote:

> The core bmaptool program provided by this package depends on python-six to run.
> It is normally not an issue to use this program to e.g. finalize target images
> since all host dependencies are copied to the same place. However, it seems that
> bmaptool is configured (at package install time) to use the current host python
> interpreter -- and in the case of per-package builds, this is the interpreter in
> the per-package directory. Finally, without the explicit dependency on
> python-six, this per-package interpreter will not have the necessary packages.
> Therefore, add the required dependencies on python-six to ensure that the
> bmaptool program can work correctly
> 
> Signed-off-by: Gregor Haas <gregorhaas1997@gmail.com>
> ---
>  package/bmap-tools/bmap-tools.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/bmap-tools/bmap-tools.mk b/package/bmap-tools/bmap-tools.mk
> index 32399ca151..350286777c 100644
> --- a/package/bmap-tools/bmap-tools.mk
> +++ b/package/bmap-tools/bmap-tools.mk
> @@ -9,6 +9,8 @@ BMAP_TOOLS_SITE = $(call github,intel,bmap-tools,v$(BMAP_TOOLS_VERSION))
>  BMAP_TOOLS_LICENSE = GPL-2.0
>  BMAP_TOOLS_LICENSE_FILES = COPYING
>  BMAP_TOOLS_SETUP_TYPE = setuptools
> +BMAP_TOOLS_DEPENDENCIES += python-six

I think this one should not be needed. The "select" in the Config.in
should be sufficient.

> +HOST_BMAP_TOOLS_DEPENDENCIES += host-python-six

For the host package, I can indeed reproduce the problem. But I think
the issue really is that in the final $(HOST_DIR), we keep the shebang
of the Python interpreter pointing to the per-package directory.
Indeed, my reasoning is that otherwise we will have many similar
problems with other packages, as this is breaking a fundamental
assumption in Buildroot.

I'm thinking about something like this:

diff --git a/Makefile b/Makefile
index f0ff9a1480..00ce64ab15 100644
--- a/Makefile
+++ b/Makefile
@@ -713,6 +713,15 @@ STAGING_DIR_FILES_LISTS = $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.t
 host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
        @$(call MESSAGE,"Finalizing host directory")
        $(call per-package-rsync,$(sort $(PACKAGES)),host,$(HOST_DIR))
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+       $(Q)grep --binary-files=without-match -lrZ '$(PER_PACKAGE_DIR)/[^/]\+/host' $(HOST_DIR) \
+       |while read -d '' f; do \
+               file -b --mime-type "$${f}" | grep -q '^text/' || continue; \
+               printf '%s\0' "$${f}"; \
+       done \
+       |xargs -0 --no-run-if-empty \
+               $(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/host:$(HOST_DIR):g'
+endif
 
 .PHONY: staging-finalize
 staging-finalize: $(STAGING_DIR_SYMLINK)

Yann, what do you think? (Logic is taken from package/pkg-generic.mk,
which does the conversion from per-package directories of dependencies
to the per-package directory of the package being built, the logic here
is similar, but we switch from the per-package directories to the
global host directory)

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
