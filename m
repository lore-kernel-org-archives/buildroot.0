Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE35EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 13 Aug 2023 21:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7AA1405F2;
	Sun, 13 Aug 2023 21:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7AA1405F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o4ooJKrHJStM; Sun, 13 Aug 2023 21:59:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D92FE4048B;
	Sun, 13 Aug 2023 21:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D92FE4048B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89C821BF21A
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 21:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 702ED4048B
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 21:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 702ED4048B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yg7H1xmjMoKy for <buildroot@lists.busybox.net>;
 Sun, 13 Aug 2023 21:59:15 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D622C40488
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 21:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D622C40488
Received: by mail.gandi.net (Postfix) with ESMTPSA id C54D41BF204;
 Sun, 13 Aug 2023 21:59:11 +0000 (UTC)
Date: Sun, 13 Aug 2023 23:59:10 +0200
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230813235910.3b1e4be8@windsurf>
In-Reply-To: <20230604025204.324443-1-aduskett@gmail.com>
References: <20230604025204.324443-1-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691963952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=igMGzOsm6OsQNJ0SVRlsLOho4QkYrfyDUE0+S79OXTc=;
 b=cDSq1Ql8GLl8IjUAwjPBR7rWtcdDdQtzRW/MS5qPVCr6EN9kf0XhftZvD0DhD44OXFp1oe
 h3pWNwJ8bfimsKzXfSJ8zcZXhZy04mjO0dmXArx1FipFZT5BIvj/ja5X8KsfG24iR6V9+5
 p+hOn10HVpLQGFXC170P6vLdQpvKbbNgUnWGcSgV4pqDTOk05x7BWTxcipV1dGoFFtHYCu
 nNghCiIBmNuskchf0WSMi+z3OHjk7VS49FMM531GI5QEXoT8UZlq880aiSonh9UdOU24QU
 KfrR4TRPIaFwCWMu9s3R6NVEjkTtN7PQZ7q+nHBmRktB4be+ugWJJJpVshK2KA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cDSq1Ql8
Subject: Re: [Buildroot] [PATCH v2 1/1] package/firewalld: new package
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

Hello Adam,

On Sat,  3 Jun 2023 19:52:04 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> Firewalld provides a dynamically managed firewall with
> support for network or firewall zones to define the trust level of network
> connections or interfaces.

Thanks for the patch, which I have applied to our next branch, with a
few small changes. See below.

>  package/Config.in                |   1 +
>  package/firewalld/Config.in      |  43 ++++++
>  package/firewalld/S46firewalld   |  66 ++++++++
>  package/firewalld/firewalld.hash |   3 +
>  package/firewalld/firewalld.mk   | 257 +++++++++++++++++++++++++++++++
>  5 files changed, 370 insertions(+)

An entry in the DEVELOPERS file was missing, so I've added that.

> diff --git a/package/firewalld/Config.in b/package/firewalld/Config.in
> new file mode 100644
> index 0000000000..4f58a3ea05
> --- /dev/null
> +++ b/package/firewalld/Config.in
> @@ -0,0 +1,43 @@
> +config BR2_PACKAGE_FIREWALLD
> +	bool "firewalld"
> +	depends on BR2_USE_MMU # gobject-introspection, python-gobject
> +	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
> +	depends on BR2_USE_WCHAR # glib2, dbus-python, nftables
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-python
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
> +	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection -> host-qemu
> +	depends on BR2_PACKAGE_PYTHON3 # dbus-python, gobject-introspection

I think for a package like this a "select BR2_PACKAGE_PYTHON3" made
more sense than "depends on BR2_PACKAGE_PYTHON3", so I've changed that
and of course propagated the reverse dependencies as needed.

> +	select BR2_PACKAGE_DBUS # dbus-python
> +	select BR2_PACKAGE_DBUS_PYTHON
> +	select BR2_PACKAGE_GOBJECT_INTROSPECTION
> +	select BR2_PACKAGE_JANSSON # Uses the nftables json interface
> +	select BR2_PACKAGE_NFTABLES
> +	select BR2_PACKAGE_PYTHON_GOBJECT
> +	help
> +	  Firewalld provides a dynamically managed firewall with
> +	  support for network or firewall zones to define the trust
> +	  level of network connections or interfaces. It has support
> +	  for IPv4, IPv6 firewall settings and for ethernet bridges and
> +	  a separation of runtime and permanent configuration options.
> +	  It also provides an interface for services or applications to
> +	  add ip*tables and ebtables rules directly.
> +
> +	  Note: Firewalld uses nftables as the backend and requires
> +	  kernel version >= 5.3.
> +
> +	  https://github.com/firewalld/firewalld
> +
> +comment "firewalld needs python3"
> +	depends on !BR2_PACKAGE_PYTHON3
> +	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS

So I dropped this comment.

> +
> +comment "firewalld needs a glibc toolchain w/ wchar, dynamic library, headers >= 3.12, gcc >= 4.9, host gcc >= 8"

Interestingly, you mentioned "dynamic library" here, but there was
nothing related to BR2_STATIC_LIBS. Turned out that with Python3 being
selected, in fact !BR2_STATIC_LIBS has been added in the dependencies,
and therefore "needs [...] dynamic library" is indeed correct.

> +	depends on BR2_USE_MMU
> +	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
> +		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
> +		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		!BR2_HOST_GCC_AT_LEAST_8
> +ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
> +FIREWALLD_CONF_OPTS += --enable-nls
> +endif

This NLS option is already handled in a generic way by the
autotools-package infrastructure, so it is not necessary to do it here.

I did a build, which went well, so I've pushed your patch with the
above changes.

Thanks for this contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
