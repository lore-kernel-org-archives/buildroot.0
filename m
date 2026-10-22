Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC5C606A31E
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 17:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DrEIAKuK
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38C8E8119D;
	Thu, 22 Oct 2026 17:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kJwgGAPdXacY; Thu, 22 Oct 2026 17:41:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 065478117B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792690863;
	b=mExVe/e+iKnlsVaUsqAPrMYU201tIDOAYJdaiqFoqq2mjXVNB1N6Ra/R7j+/9weX2P9F
	 vmPNmtmJhbxCwhOST4qBFIvA8saMXqYEaOiLX+O+tnM7j+dKSdgSS3O0NlDCZdDaumTmj
	 7m+pOfJWyqpJf1kFEii4vqdVew9fx7ljleYpppXXy6Ju5DsjAMToR+CMsZLaN683COI4d
	 4Im/ys0LlACRwPXfN1wHeD+5ykELdd77OwFk2NuS9o/LKDAhQSpprP7J9h/zBWTrx+2/P
	 2I8MJBlF9GbDST/sogT90lSf4/bStWBDdULtxFAAej9CoeOytjF6Eimm0x8MKy8JmWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792690863;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=X+ko/oADIocZcOzuJ9LI9GKg8A8bZe5rmm8bD6/fvSw=;
	b=aUjUb8Ul0Qconz3pRNRNBNgwe8KqOHvDgO4+W1NcjPW0JKvkaBH6/aNkui0u6R16JZ9K
	 outwZS04UOfmhJ7nenV+7hnaQP1cCPwFpYzSjlxGRbLdwy7GBYlymHeez6nFt0J5T2hcq
	 D5c2AmgtMDBZSH9V/QGh1LR4Vv+U4LCWNzk8zzm8DB3y8+kbeqRixYc6iSCPklnn7K4KP
	 qTzkmXlZ06Mv72vkcxsqNRtqd0TYEMSnXQ8UZT2QkeNkOAJgeyM69U/YT4T7b7ej1or/n
	 +cBLeI/Okr0NuEdlRt1iXO2Ql8UkLwulDf4PjixamBBaBEwbE569uPomMH1ml71zbBg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792690863;
	bh=X+ko/oADIocZcOzuJ9LI9GKg8A8bZe5rmm8bD6/fvSw=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=DrEIAKuKmHMlqv1A+l3wspjwOPZyAnZhM+xkOt/MlWse1Rlwsi94mAw/sKFvNu9Zp
	 gh3VJw+bmUR1n5e1Y7PKkec/qJmRlnslFy8HbckmfBfSDQ2kVNypdayllvcBW1zMH3
	 h5vy83fhcZoziY8qhZ2V/DLJZtIG4mirkRbIOUKHCJTxl4JpKD6iBNvvvyLkx+lHQk
	 HfOZn/3Qzys68naVArhB/ohKBL0JmykK9qQKKwiHPqNrzj6Hfrg8NaCrHdGdBXwH4w
	 vvj+I6C7D9GHrgjqYlWe7uArjPDSx/cb9Q5kRt48DazEifSMJRpD7ezqpxlDu88ECu
	 hDtizunTlJoJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 065478117B;
	Thu, 22 Oct 2026 17:41:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E98F13A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 17:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D029E40199
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 17:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJMUCpBRraAi for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 17:40:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CE70640122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792690859;
 b=sz9kwTU5MIWfHPgEljVrGPxOSw5u7YJFs9n873cbVnIeaINgJezrXGULqqedQauBlKtX
 +FtY+qdeU1ethkw3vof12ELtBHsQzII5sA9xuIatBXMwuV+zIxy6ZBWEZ5fY7Hi3zPfbi
 cUBs9SvcYHPmDUU7yyEdiCqO8BKGaO3mMvIeMo/K2cJKCNvSUTmdyW2j39/OYUfeOvMYt
 +Y3fVnvhy9J4cUUfSwJyacB+EaerM7jTYQXvYOwGV7IQ1u17Z0g7f5CHSzgUysN05F5QB
 xl3I56e055WDjP6nz17QT96FiUrnKM6/ZKQpRJep3xpfWPITM9aPj1jbDI6NcI2RoxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792690859;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=wQbwcup3x6u2alPAJ/zBahKxI0ITImYA+dKUqpXJnZk=;
 b=bHkDO2e0zfElKCrh+IzazGCQJzG4kJPveqTyczZ2exMWONS9JR3SE8mFf7GkXGe6krRr
 Ej29DNeiFYQA/mtQW2amWHNKJvcyoUO0KRFa1tmvhhuGnbTXP+2jgBM5Q499luFJCeYsR
 +IWH2d0brRiPXTP/H3HSToB6aRdAhYnJAdIJYr/cNFAZqjXQmXogmm8CoRGDU3slpAe0m
 JhWI1W7F8WNrXfga6S5OsabY410mZFxCLkc9Qk46iIxzwORaVolH1t8FdjcQKT23SSVkI
 r5wvV5VPLCcjT/gZMSt5LH+/nqw1iCfNYT9znAu0VIXn7M5nomfon7qUJho0/DkxU7w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=NWW1dP9z; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE70640122
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 17:40:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CF22C4E412B3;
 Thu, 22 Oct 2026 17:40:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 867DA60763;
 Thu, 22 Oct 2026 17:40:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1933110328501; 
 Thu, 22 Oct 2026 19:40:47 +0200 (CEST)
Date: Thu, 22 Oct 2026 19:40:46 +0200
To: Florian Fainelli <florian.fainelli@broadcom.com>
Message-ID: <atpJvzAWPfCcAFln@windsurf>
References: <20261022172753.1256542-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022172753.1256542-1-florian.fainelli@broadcom.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/linux-tools: fix PCI endpoint tests
 build with recent kernels
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com, yann.morin.1998@free.fr,
 buildroot@buildroot.org, fontaine.fabrice@gmail.com, markus.mayer@broadcom.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Florian,

Nice, nice, I stumbled across this issue yesterday, and I was
precisely looking at cooking a patch, but you beat me at it! Some
review/questions below.

On Thu, Oct 22, 2026 at 10:27:52AM -0700, Florian Fainelli wrote:
> Since Linux 6.14, the PCI endpoint tests have moved from tools/pci to
> tools/testing/selftests/pci_endpoint. The existing build commands still
> use the old location, causing the build to fail with newer kernels.
> 
> Detect the selftests directory and fall back to tools/pci for older
> kernels. Set OUTPUT and INSTALL_PATH to build and install the selftests
> under /usr/lib/kselftests/pci_endpoint, and pass the required libraries
> explicitly.
> 
> Add a threads dependency and update the help text to document the
> binary names and installation paths. Keep the minimum kernel version
> check for the legacy tools and report missing sources explicitly.
> 
> Fixes: 63e457639abb ("package/linux-tools: add support for pcitest tool")

Technically it doesn't fix this commit. At the time of 63e457639abb,
Linux 6.14 was not a thing, so 63e457639abb was correct. It's really
Linux 6.14 that broke stuff, so I don't think we can really point to a
particular Buildroot commit that is fixed by this change.

> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> index b9adc25ad51d..19d54cbbe707 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -59,13 +59,18 @@ config BR2_PACKAGE_LINUX_TOOLS_MM
>  
>  config BR2_PACKAGE_LINUX_TOOLS_PCI
>  	bool "pci"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_LINUX_TOOLS
>  	help
> -	  pcitest is a tool for testing capabilities related to a
> -	  PCI Endpoint (only works with specific Endpoints).
> +	  Build the PCI endpoint tests (only work with specific Endpoints).
> +	  Kernels before 6.14 provide pcitest in /usr/bin. Newer kernels
> +	  provide pci_endpoint_test in /usr/lib/kselftests/pci_endpoint.
>  
>  	  These tools are available only from kernel version 4.20.
>  
> +comment "pci needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

Hm is this thread dependency new? With the Linux 6.14 change, or
unrelated?

>  comment "perf needs a toolchain w/ dynamic library, threads"
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/linux-tools/linux-tool-pci.mk.in b/package/linux-tools/linux-tool-pci.mk.in
> index 17246f5d7ed2..f9acf8f041d8 100644
> --- a/package/linux-tools/linux-tool-pci.mk.in
> +++ b/package/linux-tools/linux-tool-pci.mk.in
> @@ -6,22 +6,36 @@
>  
>  LINUX_TOOLS += pci
>  
> -PCI_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
> +# Linux 6.14 moved the PCI endpoint tests into Kselftests.
> +PCI_SRCDIR = $(strip $(if $(wildcard $(LINUX_DIR)/tools/testing/selftests/pci_endpoint/Makefile),\
> +	$(LINUX_DIR)/tools/testing/selftests/pci_endpoint,$(LINUX_DIR)/tools/pci))

Aaaah nice. I hadn't thought of doing it like this.

> +PCI_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
> +	OUTPUT=$(PCI_SRCDIR)/ \
> +	LDFLAGS="$(TARGET_LDFLAGS)" \
> +	LDLIBS="-lrt -lpthread -lm"
>  
>  define PCI_BUILD_CMDS
> -	$(Q)if ! grep install $(LINUX_DIR)/tools/pci/Makefile >/dev/null 2>&1 ; then \
> +	$(Q)if test ! -f $(PCI_SRCDIR)/Makefile ; then \
> +		echo "Your kernel sources do not contain the PCI endpoint tests." ; \
> +		echo "Expected tools/pci or tools/testing/selftests/pci_endpoint." ; \
> +		exit 1 ; \
> +	fi
> +	$(Q)if test "$(PCI_SRCDIR)" = "$(LINUX_DIR)/tools/pci" && \
> +		! grep install $(PCI_SRCDIR)/Makefile >/dev/null 2>&1 ; then \

I'm wondering if we really need to grep for "install" in the
Makefile. Can't we just do:

	$(Q)if test ! -f $(PCI_SRCDIR)/Makefile; then
  		echo "Your kernel version is too old and does not have install section in the pci tools." ; \
  		echo "At least kernel 4.20 must be used." ; \
	fi

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
