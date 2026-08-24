Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F7EC5DF9C
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 20:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A4AA6063A;
	Mon, 24 Aug 2026 20:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B_A_FE6GF_Ml; Mon, 24 Aug 2026 20:24:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787603092;
	bh=0SWVWh8a80v8uKk0COfI0h0VlAUhLxlhkKoSRfWVK2c=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LqELGQKgSKsiZE+hmBxT1og6ZxBc/DDQDWm1Yid8ZaOIQ1BbuZ2Odk+cJYtHYPZYW
	 o9qj7KsKlkk+gh7mnsqAwTOfXukhqvepcCWMXF8wTi7l4Hz2/dsZRBX1SYsaNyNDJP
	 0W2B7h3RCUjfLqpqRPEwHYh54PXbrvJOs75EN+w0EQ2y+by0gTNWXX5pX1blnh7+ox
	 VNeaGElSAD7ircxenEbbYTumwVkPAfVx4twKGB1R1xwGdzzpZ2N8ecS7saGhuwu25f
	 22ZSKs4WYFncJGhP+DOIMP/6Bs25hUvBBJ4UVejLkix0e7hmdXHclO9m0u+pKhVoGP
	 nAOi0frg5ZnmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33F2C60608;
	Mon, 24 Aug 2026 20:24:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 861C9118
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 20:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74A5F4052F
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 20:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sdj0EHoL3Pty for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 20:24:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60DCF404E8
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 20:24:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4C3811A1806;
 Mon, 24 Aug 2026 20:24:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1927A5FFC1;
 Mon, 24 Aug 2026 20:24:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2A98911C79BD1; 
 Mon, 24 Aug 2026 22:24:41 +0200 (CEST)
Date: Mon, 24 Aug 2026 22:24:41 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aoyoCY6c2qTJcRxz@windsurf>
References: <20260503081204.963653-1-chakrabortyshubham66@gmail.com>
 <20260810113154.1955756-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260810113154.1955756-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/tcl: bump to version 9.0.3
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

Hello,

On Mon, Aug 10, 2026 at 05:01:52PM +0530, Shubham Chakraborty wrote:
> -TCL_VERSION_MAJOR = 8.6
> -TCL_VERSION = $(TCL_VERSION_MAJOR).15
> +TCL_VERSION_MAJOR = 9.0
> +TCL_VERSION = $(TCL_VERSION_MAJOR).3
>  TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
>  TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION)
>  TCL_LICENSE = TCL
> @@ -73,9 +73,19 @@ define TCL_REMOVE_EXTRA
>  endef
>  TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_EXTRA
>  
> +define HOST_TCL_SYMLINK_TCLSH
> +	ln -sf tclsh$(TCL_VERSION_MAJOR) $(HOST_DIR)/bin/tclsh
> +endef
> +HOST_TCL_POST_INSTALL_HOOKS += HOST_TCL_SYMLINK_TCLSH

Are you sure you need to symlink, since...

> +
> +TCL_MAKE_OPTS = \
> +	TCLSH="$(HOST_DIR)/bin/tclsh$(TCL_VERSION_MAJOR)" \
> +	TCLSH_PROG="$(HOST_DIR)/bin/tclsh$(TCL_VERSION_MAJOR)"

... you're passing the full path to
$(HOST_DIR)/bin/tclsh$(TCL_VERSION_MAJOR) here?

From my quick experiment, it seems like the symlink is not needed.

Also, could you verify that both TCLSH= and TCLSH_PROG= are needed?

> +
>  TCL_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite) \
>  	$(if $(BR2_PACKAGE_MARIADB),mariadb) \
>  	$(if $(BR2_PACKAGE_POSTGRESQL),postgresql) \
> +	host-tcl \
>  	zlib

With your patch:

- host-tcl fails to build because <zlib.h> is not found. Seems like
  host-zlib is now needed as a dependency of host-tcl. Make sure to
  build in a minimal Docker container to figure out this kind of
  issue. You can trivially do that in Buildroot: "./utils/docker-run
  make".

- tcllib fails to build, because version 1.21 is not designed to work
  with Tcl 9.0, you need to bump tcllib to 2.0 apparently.

Could you look into these different issues, and get back to us with an
updated patch?

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
