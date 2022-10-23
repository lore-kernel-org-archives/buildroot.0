Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0BEC433FE
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 08:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF98D401CC;
	Sun, 23 Oct 2022 08:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF98D401CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RUGDKFoJmeTt; Sun, 23 Oct 2022 08:37:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3FE74013D;
	Sun, 23 Oct 2022 08:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3FE74013D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3C5D1BF5B3
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 08:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBFE64013D
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 08:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBFE64013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zgg90OQusWDe for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 08:37:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFD7840012
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFD7840012
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 08:37:07 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXp5Q-1oaI4i2vRU-00YBEZ; Sun, 23
 Oct 2022 10:37:04 +0200
Date: Sun, 23 Oct 2022 10:37:03 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221023103703.0f0335bc@gmx.net>
In-Reply-To: <20221022214439.174830-1-fontaine.fabrice@gmail.com>
References: <20221022214439.174830-1-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:mmmAddCbpkb+H4YJyLicPHchwj+pVpVWAsac5aeu16z4WDHdABn
 AAfEq20OWqU2fbw5rYZlEc9zaAdEqY36fpk4IPE3pKvvSyTRpa5w+NV1EHbNHlm4U1J0KdQ
 NxpvVSWtJfi072E5EV/iCOeyHPLqcdqFlgwRiJXesiOdhuQelDvSlMH8iZpXt1BceTP96El
 wZLCDwIfDFiPXXtLUmufg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:O2WQpvNffxU=:922CpLumODvQwZlqPj80vF
 AczWnEj2y9nkDYqiGg0/9WaCe7tmPZjuOVjeAZxDqBmFgH3udGRuO5ozflHYAS9ZRLLKZmt9E
 Oubeuo0tEoaV4ghBksJMUxoNE4f78tJEGhWSNql0dyXiu+Q97u3veWCzPyVPNEbHLSJxT3dhk
 dnLptY7ElXdKUlACv78aY7d/jgL2uNp4lusb+9svpS07EtFLqIgyyR1PIdBDVkpWqBDctyQZD
 K50kiFrLnpTbfaVueENVLg/uZFHsgsNtFZjlta17qfWkN+TwSOlCnQ6Kvp8FI1IxIp15Nw24L
 JHZmt4irOwXSDtmXbxktfufH0pTJVyk0oaTXmTHAJU6e0vvGo0pzLBETwIP6t80qXrPJzsJ7m
 aQXsOweAJEPFRBhgR6k/UqB2TbrhnZdeAPNn5TGoKPvfV267sWBsWiKTQukeo+UUvCdRqkoW5
 vVVnXv1wxhgH6v/UosZFKvCCpWaVIsedTGOnQTk7mgfprOy9OvmekfCDM9U35qqWwiC7jP1UN
 uu+JZdsBmS6VJf6hsnK6tA+XIN3wAglsfaOfcaH4W748t1K/q5C6L6v9jWCIzUpBs0mYVLkK9
 LyDAkDaBvQOP9XbGbq66Ao7pwGeCK+NquPYZks2KY0eanS1J+KuANyeSRyesTKELcG8mYL/VL
 gksLUGCiUOKChEqV6olrRFdqXucDyj50ycnfh//sXQmF5h/nxkDA3/fgZRnKKMOLveqsB6Mmb
 Mq0Iodsub2nQhFeYHCbIoYyIzbH9zNQcpRfcg4yzm0P7qblB6d/T7XsKBnAjRrMlNuSbKSPqL
 v6qHSlhPzELMv1nqZyv8mMVrkQg7mqwlsNvYaQ6DCYtpcdEouoUBnscqiPnaid8EkR06JyChX
 51R+OZ3rgi9babV0D+Yq8FVzPgXz4W0KHKNZwvVy04xH7QgFnBozt9YpSGundErgOvC0k2LlM
 GHFFyxfeF3zqeGu2iqqUfHOv11UyArvUyxmR/3+hkiS7w/EL4mDdrk7qHan5VlfuJ8bYhx8a5
 6z/soepPt9FqYS8J3gBd2N62NX3sde6KVl5OgQG8x11t50+CGI1DlYe3DzNPXaNikaXok1qzJ
 KoS4LCzh6HwJTGaDCvexkBWnw0W7PFROnk+I3cgoWL3UoAZ0AEL3i4E5wT/6lGm/7ILqrt/bb
 CXtyNR67sI/sTN4CYz4vgcyO25FryhjGdB3yUersZ8HWV8v2gFurm1tqaHxBVlJVRvYhQDFF8
 UcIw+u89wQEau5Tk+4p15YPrGgBIixFFygyLaup/YoMt1n8l9TV//wbPln2QC7YOMXiQe4zR0
 TbNDmtd0NRYgjO6kRgSlJQ+qWhYzJ3Jn/MANs2KoRMBsG+58BB3btP9fs4wxukIKOz5wNeqjk
 aicPiZaI/N5r0Dv33RFhm994YzLR7GRiYAW6ObQS9pk3+cg6SAavvIXbAdjlGf5mS2cyi6pbj
 7fNLb24ueM0ixDBf9Y34cstwOaPhIcCIpQORRJgmdzTmnovPYZ82CxNXUqnTlm7mObHf2zbxo
 lA8tI8sBlaqn2Lry2ud1RR2J2PeKvnrWseNKnvB8BNU0p
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=badeba3b8450; t=1666514224;
 bh=DCTmRelk5oPQwA3IiEFHo7V7xDDi6/JmZkT+Mb267zk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Zha+iSaEWOoj+rj1BDavA1dit7Pcx81bPAeJSgmq0IV+NK2H8Jw565OsGlVRdwWGj
 jRX6jV4N2iW28pC5bEOsg993h9Lb46jc2+Vz+Gg1tsVPs1gq9an6kV4yGVmSkQEkem
 9ZLTkx7AOwCFGayBg9WLYRitm/sp1II+Ra2nB4/8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=badeba3b8450 header.b=Zha+iSaE
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/usbredir: bump to version 0.13.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Sat, 22 Oct 2022 23:44:39 +0200, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> usbredirserver was dropped by
> https://gitlab.freedesktop.org/spice/usbredir/-/commit/f4ffdce329305da2803684776f7659083a530819
>
> Add an option to enable tools (and usbredirect binary) as a replacement
> to usbredirserver
>
> https://gitlab.freedesktop.org/spice/usbredir/-/blob/usbredir-0.13.0/ChangeLog.md
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Peter Seiderer):
>  - Add an option to enable tools
>
>  Config.in.legacy               |  9 +++++++++
>  package/usbredir/Config.in     | 11 ++++++-----
>  package/usbredir/usbredir.hash |  4 ++--
>  package/usbredir/usbredir.mk   | 21 +++++++--------------
>  4 files changed, 24 insertions(+), 21 deletions(-)
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 0e63d59a98..efe35fde36 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,15 @@ endif
>
>  comment "Legacy options removed in 2022.11"
>
> +config BR2_PACKAGE_USBREDIR_SERVER
> +	bool "usbredirserver removed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_USBREDIR_TOOLS
> +	help
> +	  usbredirserver has been dropped by upstream since version
> +	  0.13.0. usbredir tools (which include usbredirect binary) has
> +	  been selected instead.
> +
>  config BR2_KERNEL_HEADERS_5_17
>  	bool "kernel headers version 5.17.x are no longer supported"
>  	select BR2_LEGACY
> diff --git a/package/usbredir/Config.in b/package/usbredir/Config.in
> index 8ce180a884..d546ac1025 100644
> --- a/package/usbredir/Config.in
> +++ b/package/usbredir/Config.in
> @@ -15,18 +15,19 @@ config BR2_PACKAGE_USBREDIR
>  	  protocol.
>
>  	  Note: only the library is installed, not the utilities. Say
> -	  'y' below if you want the server too.
> +	  'y' below if you want the tools too.
>
>  	  http://www.spice-space.org/page/UsbRedir
>
>  if BR2_PACKAGE_USBREDIR
>
> -config BR2_PACKAGE_USBREDIR_SERVER
> -	bool "usbredirserver on target"
> +config BR2_PACKAGE_USBREDIR_TOOLS
> +	bool "Enable tools"
>  	help
>  	  If you want to serve usbredir requests on your target, say
> -	  'y' here to have the usbredir server on the target.
> +	  'y' here to have the tools built and installed on the target
> +	  (including usbredirect binary).
>
> -	  Note: the server is not required to use the library.
> +	  Note: the tools are not required to use the library.
>
>  endif
> diff --git a/package/usbredir/usbredir.hash b/package/usbredir/usbredir.hash
> index f738c36690..577e08efba 100644
> --- a/package/usbredir/usbredir.hash
> +++ b/package/usbredir/usbredir.hash
> @@ -1,5 +1,5 @@
> -# https://spice-space.org/download/usbredir/usbredir-0.12.0.tar.xz.sha256sum
> -sha256  fbb44025bf55e1ce8d84afc7596bfa47c8a36cd603c6fa440f9102c1c9761e6d  usbredir-0.12.0.tar.xz
> +# https://spice-space.org/download/usbredir/usbredir-0.13.0.tar.xz.sha256sum
> +sha256  4ba6faa02c0ae6deeb4c53883d66ab54b3a5899bead42ce4ded9568b9a7dc46e  usbredir-0.13.0.tar.xz
>
>  # Hash for license files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
> index 6792a3e758..172f0d52a0 100644
> --- a/package/usbredir/usbredir.mk
> +++ b/package/usbredir/usbredir.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -USBREDIR_VERSION = 0.12.0
> +USBREDIR_VERSION = 0.13.0
>  USBREDIR_SOURCE = usbredir-$(USBREDIR_VERSION).tar.xz
>  USBREDIR_SITE = http://spice-space.org/download/usbredir
>  USBREDIR_LICENSE = LGPL-2.1+ (libraries)
> @@ -14,21 +14,14 @@ USBREDIR_DEPENDENCIES = host-pkgconf libusb
>  USBREDIR_CONF_OPTS = \
>  	-Dgit_werror=disabled \
>  	-Dstack_protector=disabled \
> -	-Dtests=disabled \
> -	-Dtools=disabled
> -
> -ifeq ($(BR2_PACKAGE_USBREDIR_SERVER),y)
> +	-Dtests=disabled
>
> +ifeq ($(BR2_PACKAGE_USBREDIR_TOOLS),y)
>  USBREDIR_LICENSE += , GPL-2.0+ (program)
>  USBREDIR_LICENSE_FILES += COPYING
> -
> -else # BR2_PACKAGE_USBREDIR_SERVER != y
> -
> -define USBREDIR_POST_INSTALL_TARGET_RM_SERVER
> -	rm -f $(TARGET_DIR)/usr/sbin/usbredirserver
> -endef
> -USBREDIR_POST_INSTALL_TARGET_HOOKS += USBREDIR_POST_INSTALL_TARGET_RM_SERVER
> -
> -endif # BR2_PACKAGE_USBREDIR_SERVER
> +USBREDIR_CONF_OPTS += -Dtools=enabled

Build failed with:

  Found pkg-config: .../host/bin/pkgconf (1.6.3)
  Run-time dependency libusb-1.0 found: YES 1.0.26
  Found CMake: /usr/bin/cmake (3.24.2)
  Run-time dependency glib-2.0 found: NO (tried pkgconfig and cmake)

  .../build/usbredir-0.13.0/tools/meson.build:17:4: ERROR: Dependency "glib-2.0" not found, tried pkgconfig and cmake

Regards,
Peter


> +else
> +USBREDIR_CONF_OPTS += -Dtools=disabled
> +endif
>
>  $(eval $(meson-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
