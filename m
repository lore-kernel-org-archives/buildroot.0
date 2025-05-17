Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A82C3ABDA
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 09:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43C2B408E7;
	Sat, 17 May 2025 09:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EfJQYmRYVhQY; Sat, 17 May 2025 09:50:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4398B408E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4398B408E3;
	Sat, 17 May 2025 09:50:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 90741223
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81587408E7
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oZSSZVC6joRh for <buildroot@buildroot.org>;
 Sat, 17 May 2025 09:50:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0BF83408E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BF83408E3
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BF83408E3
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:50:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9E1743224;
 Sat, 17 May 2025 09:50:02 +0000 (UTC)
Date: Sat, 17 May 2025 11:50:01 +0200
To: "Joseph Zikusooka (ZIK)" <josephzik@gmail.com>
Cc: buildroot@buildroot.org, "Joseph Zikusooka (ZIK)" <zik@jambula.net>
Message-ID: <20250517115001.720af8ad@windsurf>
In-Reply-To: <20250426075000.314807-1-zik@jambula.net>
References: <20250426075000.314807-1-zik@jambula.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudehfeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheetfedtvdeuvdfgheejveffvdeuheeguddtgfekleffueehjedtuedtudfgjeehnecuffhomhgrihhnpehishgtrdhorhhgpdgtlhhouhgushhmihhthhdrihhopdgsuhhilhgurhhoohhtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehjohhsvghphhiiihhksehgmhgrihhlrdgtohhmpdhrtghpthhtoheps
 ghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopeiiihhksehjrghmsghulhgrrdhnvght
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747475403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cfxn5BZeQc9SNP+T4VrnIpGpuOTcfdzi1hp1Q9yzevo=;
 b=PNBgw0l/pGHNVbBP09D1cpFa5g6hQ1oW/wjdK8IGzkxTWDWbI6hVe2cORWJalFDcXS/P10
 ITrkoSvdveGpOaQtxkyEAMAecT0X4eV1YUTfjgXe9Fua2xxjnJ5vtKcAdW9G4hj29NazZp
 sFNP5gygjPtzvPiDIjyACKA/McJVy/K5ZSIeNM6l1OShdPfD0ATPM8SuhcJw1Q80/y0k2s
 09hWHzlshsg6skMQ8+GpZiL8mnspj2oHGWk4y8wtfB9xOjuLYfy/D24G4pRayQ/gvfec5i
 P1L6nS4da+jmidXfbz2PhdWfuarxgzoXZ/x0P52JkrizPllZNdratGvGnowqEg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PNBgw0l/
Subject: Re: [Buildroot] [PATCH] Kea: new package - kea version 2.6.2
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

Hello Joseph,

Thanks for your contribution! See below a number of comments.

On Sat, 26 Apr 2025 10:50:00 +0300
"Joseph Zikusooka (ZIK)" <josephzik@gmail.com> wrote:

> Add Kea, an open-source Dynamic Host Configuration Protocol (DHCP)
> server developed by the Internet Systems Consortium (ISC).
> It's designed to provide dynamic IP address allocation and
> configuration for devices on a network. Kea is known for its
> modular architecture, allowing for easy extension and integration
> with other services.
> 
> Supersedes: a015291dc94b5497ac1fd60a2e4cf84fe3c82cb5

This is missing your Signed-off-by line, so unfortunately, we can't
apply it.

This "Supersedes:" line doesn't make sense, because
a015291dc94b5497ac1fd60a2e4cf84fe3c82cb5 isn't a reference that is
meaningful.

Also, the commit title should be:

	package/kea: new package

>  package/kea/Config.in | 17 +++++++++++++++++
>  package/kea/kea.hash  |  3 +++
>  package/kea/kea.mk    | 22 ++++++++++++++++++++++
>  3 files changed, 42 insertions(+)

You need to add an entry in the DEVELOPERS file.

> diff --git a/package/kea/Config.in b/package/kea/Config.in
> new file mode 100644
> index 0000000000..1b3bbe2e50
> --- /dev/null
> +++ b/package/kea/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_KEA
> +

This empty line shouldn't be there.

> +	bool "kea"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU

Indicate in a comment why those dependencies are present.

> +	select BR2_PACKAGE_BOOST

Boost also depends on BR2_INSTALL_LIBSTDCPP.

> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LOG4CPLUS

This one depends on a lot of stuff:

        depends on BR2_INSTALL_LIBSTDCPP
        depends on BR2_USE_WCHAR
        depends on BR2_TOOLCHAIN_HAS_THREADS
        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
        depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future

So basically, you should have:

        depends on BR2_INSTALL_LIBSTDCPP # boost, log4cplus
        depends on BR2_USE_WCHAR # log4cplus, boost
        depends on BR2_TOOLCHAIN_HAS_THREADS # log4cplus, boost
        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # log4cplus
        depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # log4cplus

I'm not sure where your BR2_USE_MMU dependencies comes from. Maybe from
the kea code itself?

> +	help
> +	  DHCP implementation from Internet Systems Consortium, Inc. that features fully
> +	  functional DHCPv4, DHCPv6 and Dynamic DNS servers.
> +	  Both DHCP servers fully support server discovery, address assignment, renewal,
> +	  rebinding and release. The DHCPv6 server supports prefix delegation. Both
> +	  servers support DNS Update mechanism, using stand-alone DDNS daemon

Please wrap at 72 columns. Run "make check-package" to check the coding
style.

> +          https://www.isc.org/kea

You also need a Config.in comment to explain the dependencies. Along
the lines of:

comment "kea needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
                !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8

comment "kea needs a toolchain not affected by GCC bug 64735"
        depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735

> diff --git a/package/kea/kea.mk b/package/kea/kea.mk
> new file mode 100644
> index 0000000000..d589d2c1c2
> --- /dev/null
> +++ b/package/kea/kea.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# kea
> +#
> +################################################################################
> +
> +KEA_VERSION = 2.6.2
> +KEA_SOURCE = kea-$(KEA_VERSION).tar.gz
> +KEA_SITE = https://dl.cloudsmith.io/public/isc/kea-2-6/raw/versions/$(KEA_VERSION)
> +KEA_LICENSE = MPL 2.0
> +KEA_LICENSE_FILES = COPYING
> +
> +KEA_DEPENDENCIES = host-pkgconf openssl boost log4cplus
> +
> +KEA_CONF_OPTS = "--with-openssl=$(STAGING_DIR)/usr" 
> +KEA_CONF_OPTS = "--with-log4cplus=$(STAGING_DIR)/usr"
> +#KEA_CONF_OPTS = "--with-boost-include=$(STAGING_DIR)/usr"

Comment lines are weird, if it's not needed, drop it. Also please write
this like this:

KEA_CONF_OPTS = \
	--with-openssl=$(STAGING_DIR)/usr \
	--with-log4cplus=$(STAGING_DIR)/usr

> +KEA_INSTALL_STAGING = YES
> +KEA_INSTALL_TARGET = YES

KEA_INSTALL_TARGET = YES is definitely not needed, as it's the default.

Why is KEA_INSTALL_STAGING = YES needed? Is kea installing some
libraries?

Could you fix those different issues, and come back with an updated
patch? Make sure to name it [PATCH v2], and provide a changelog. See
https://buildroot.org/downloads/manual/manual.html#submitting-patches
for some good description on how to contribute.

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
