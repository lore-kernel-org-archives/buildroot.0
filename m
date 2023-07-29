Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15756C001DC
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 22:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B02A281FE7;
	Sat, 29 Jul 2023 22:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B02A281FE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mJYyvgLAYvWL; Sat, 29 Jul 2023 22:31:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C26AD81FEA;
	Sat, 29 Jul 2023 22:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C26AD81FEA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8C261BF40A
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B02C14016B
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B02C14016B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hj-jFUWiARBG for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 22:31:43 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C0F7400FD
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 22:31:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C0F7400FD
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFB86240002;
 Sat, 29 Jul 2023 22:31:40 +0000 (UTC)
Date: Sun, 30 Jul 2023 00:31:39 +0200
To: Maksim Kiselev <bigunclemax@gmail.com>
Message-ID: <20230730003139.23abda9a@windsurf>
In-Reply-To: <20230327165423.1059953-1-bigunclemax@gmail.com>
References: <20230327165423.1059953-1-bigunclemax@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690669901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zsj6pf6ZLTMQ0jfwam1tP03XX9k6wav2i4b9y1f7F7M=;
 b=OrqtoBkTSYb5QHyrpdIEgqnj2cWJ6ZgmTuNyusrZF8MAUSHw5RIH4arBXdVWORgb/9uhBq
 iCvXB/IMG8HCKu6szxdOxrKWjJEahdO/49oeACkcNq/i8oN/q0bVhWye3gsKBoAYAjlKuO
 rGhH+gwuk9XJ2kVZZXnl1U34yTr6rU4NyeV4IAeeF5BbCCRzAAgNQJk0ku/WReXvDnS2ss
 F83xS8lhVpxXW2EVRRj9ad/UVwSe+sEdErgjGizrinoyLhN6TrpyIJql22JjfklaLvXIlr
 XZgjyvNu/PAjbSxcrT9PZ+oGDI/EYAz89/F1PO5idGLe4mZ97gjkUXKNOcDb9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OrqtoBkT
Subject: Re: [Buildroot] [PATCH] package/ledmon: new package
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Maksim,

First of all, thanks a lot for your patch, and sorry for the very long
delay to provide feedback. We are currently doing an effort of handling
our backlog of patches, and therefore reviewing/merging old patches.

Your patch is almost ready to merge with some tweaks, but one of them
needs your support. See below.

On Mon, 27 Mar 2023 19:54:23 +0300
Maksim Kiselev <bigunclemax@gmail.com> wrote:

> Enclosure LED Utilities
> 
> ledmon and ledctl are userspace tools designed to control storage
> enclosure LEDs. The user must have root privileges to use these tools.
> 
> These tools use the SGPIO and SES-2 protocols to monitor and control LEDs.
> They been verified to work with Intel(R) storage controllers (i.e. the
> Intel(R) AHCI controller) and have not been tested with storage controllers of
> other vendors (especially SAS/SCSI controllers).
> 
> For backplane enclosures attached to ISCI controllers, support is limited to
> Intel(R) Intelligent Backplanes.
> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> ---
>  package/Config.in                             |  1 +
>  .../ledmon/0001-Add-disable-doc-option.patch  | 57 +++++++++++++++++++
>  package/ledmon/Config.in                      | 11 ++++
>  package/ledmon/ledmon.hash                    |  3 +
>  package/ledmon/ledmon.mk                      | 14 +++++
>  5 files changed, 86 insertions(+)
>  create mode 100644 package/ledmon/0001-Add-disable-doc-option.patch
>  create mode 100644 package/ledmon/Config.in
>  create mode 100644 package/ledmon/ledmon.hash
>  create mode 100644 package/ledmon/ledmon.mk

We need you to add an entry in the DEVELOPERS file for this package, so
that you're notified by e-mail when:

- There are build failures affecting your package
- A new version becomes available upstream and the package needs to be updated
- A CVE is reported on your package and needs to be fixed

> diff --git a/package/ledmon/0001-Add-disable-doc-option.patch b/package/ledmon/0001-Add-disable-doc-option.patch
> new file mode 100644
> index 0000000000..4803c37698
> --- /dev/null
> +++ b/package/ledmon/0001-Add-disable-doc-option.patch
> @@ -0,0 +1,57 @@
> +From 4c356662faaa5aa2dc0b0eb713dc5134a70eb3b0 Mon Sep 17 00:00:00 2001
> +From: Maksim Kiselev <bigunclemax@gmail.com>
> +Date: Mon, 27 Mar 2023 17:45:15 +0300
> +Subject: [PATCH] Add '--disable-doc' option
> +
> +Introduce a configure option to disable documentation installation in case if it is not required.
> +
> +Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>

We need all patches to have an Upstream: tag that indicates where the
patch has been submitted upstream. This project has a Github repo, so
it should be trivial to submit this patch through a pull request, and
indicate the URL of that pull request as the value of the Upstream: tag.

> diff --git a/package/ledmon/Config.in b/package/ledmon/Config.in
> new file mode 100644
> index 0000000000..467a75fa56
> --- /dev/null
> +++ b/package/ledmon/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_LEDMON
> +	bool "ledmon"
> +	depends on BR2_PACKAGE_PCIUTILS
> +	depends on BR2_PACKAGE_SG3_UTILS
> +	depends on BR2_PACKAGE_HAS_UDEV

For pciutils and sg3_utils, we definitely want to use "select" instead
of "depends on".

So, we need:

	depends on BR2_PACKAGE_HAS_UDEV
	depends on BR2_TOOLCHAIN_HAS_THREADS # sg3_utils
	select BR2_PACKAGE_PCIUTILS
	select BR2_PACKAGE_SG3_UTILS

> +	help
> +	  Enclosure LED Utilities. The ledmon application is
> +	  a daemon process used to monitor a state of software
> +	  RAID devices (md only) or a state of block devices.
> +
> +	  https://github.com/intel/ledmon

And then:

comment "ledmon needs udev and a toolchain w/ threads"
	depends on !BR2_PACKAGE_UDEV || !BR2_TOOLCHAIN_HAS_THREADS

Another aspect: did you try to build ledmon with different toolchains
in Buildroot? In particular I see a pull request at
https://github.com/intel/ledmon/pull/139 that fixes build issues with
the Musl C library, so I'm wondering if it builds with musl. I can
suggest you to do a run of ./utils/test-pkg for ledmon to verify that
it builds with a set of toolchains.

> diff --git a/package/ledmon/ledmon.mk b/package/ledmon/ledmon.mk
> new file mode 100644
> index 0000000000..dba8a99b8c
> --- /dev/null
> +++ b/package/ledmon/ledmon.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# ledmon
> +#
> +################################################################################
> +
> +LEDMON_VERSION = v0.96
> +LEDMON_SITE = $(call github,intel,ledmon,$(LEDMON_VERSION))

Please use:

LEDMON_VERSION = 0.96
LEDMON_SITE = $(call github,intel,ledmon,v$(LEDMON_VERSION))

So that the LEDMON_VERSION variable only includes the version, without
the "v" prefix. This will require a small change in the .hash file, as
the tarball name will change.

> +LEDMON_DEPENDENCIES = pciutils sg3_utils udev

You need to add host-pkgconf to this list, as the configure script uses
pkg-config.

> +LEDMON_LICENSE = GPL-2.0
> +LEDMON_LICENSE_FILES = COPYING

Perhaps we can add a comment here that says:

# The code base also include a COPYING.LIB file with the LGPL-2.1 text,
# and some source files are published under LGPL-2.1, but all of them are
# at some point linked with GPL-2.0 code, making the resulting binaries
# GPL-2.0 licensed

(hoping that this statement is correct of course)

Could you rework those different details and send an updated version of
your patch? It would be very useful!

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
