Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D09C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 13:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8663D813A9;
	Mon,  4 Apr 2022 13:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zkd3yM1Y6ihI; Mon,  4 Apr 2022 13:03:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86A0B81301;
	Mon,  4 Apr 2022 13:03:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D0F81BF3D1
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 13:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88DA140911
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 13:03:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cp03cvCgaLiN for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 13:03:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 88707408D0
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 13:03:46 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id w134so9622413ybe.10
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 06:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=SLMqZCKCpeHhHnQk+WOCvqKHzywMI5bp34LF/Gu6Xf4=;
 b=D5TGF5Nt9TpB4mUDix66EpmtraJS7NfgsAx1mQKpYY6miai41BX41AFK/o/YBDALqi
 rKkREYvqeXe4zgnbfhxG52pbM84/QXA2/8xde7AOs4ORpBZ8a93VXbVswiAPb8nXBjmk
 hcWZOVBosv+YvLykNSPQrtY9HjiClBY3Dc6kyvDSgLJH3G/8tD+HnzvOI4SI887UsRJ5
 hZxITSQkyL5AExninR+WygmszGB/Wj7/7tG92fdcTEN2/JvwakDhxdtflhhzrzakpFJc
 LkUBbAa2iiJ1NnMtCRM+8/Wg5M+aip371fdofYPn3N8qbn11NVtYOOhbjP5oVW1CXLZt
 5yuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=SLMqZCKCpeHhHnQk+WOCvqKHzywMI5bp34LF/Gu6Xf4=;
 b=MRAnlr6C3P//u+Xu6vRQe++mi9QELtXYCfJridnf1SJCD5SZao67Bz1y91moEo6A+B
 r9/JNb7f82fBSCXU4jM4HUBdWvgDuGl6yeSEU1I/YOJda+/B5saHB8c9R501taXkSvBc
 BmC+J7PEJRF7aXwAc4fq6yGWUHAbAsRiBjMqQ/NJzytQgQc6bR1Zm2PSVC6UTmw1WwC9
 lZWxteIyBjXKCClgmlsKQ/XFMbWjOuzTLEFSFFfSpfIfA+3WhBjvtOEnOuiC1rnpBbCi
 E0QLHae82IHTjGpMzXcjTQfqZS3BpkXjliabuHYnGRrNbRjASDDpyV5RnnWgMZu013eu
 n6Wg==
X-Gm-Message-State: AOAM531lipWl5v6ghNkTTwnD6db0c81BU2N65l/07OeoZDApWNQyQKM6
 THaaDmSYyc9UQc2XV1j8LtO/H2NcFRNvOtewel9M4UeI5os=
X-Google-Smtp-Source: ABdhPJygB/6Xtv/4lAFEWZPQZSEPL1zpFdnOd+hcpHExdVGMRGX4hPH+4oTteEoS4ueDmRknpeTucZFSxWmis9Ei6zE=
X-Received: by 2002:a25:b591:0:b0:63e:387:1350 with SMTP id
 q17-20020a25b591000000b0063e03871350mr1147640ybj.224.1649077424869; Mon, 04
 Apr 2022 06:03:44 -0700 (PDT)
MIME-Version: 1.0
From: Edmundo Ferreira <fc.edmundo@gmail.com>
Date: Mon, 4 Apr 2022 15:03:09 +0200
Message-ID: <CAFv936HZ-rgdQs5ZafyQsyy7NrPp7dK+zGV_O9nHubqhaFOmAQ@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] (no subject)
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 2022-04-03 at 12:03 +0200, Fabrice Fontaine wrote:

> Use internal bind as dhcp doesn't build since bump of bind to version
> 9.16.26 in commit 8adeaec8afacbc680edebae91524f6144926ac92 and
> upstream
> doesn't plan to fix it any time soon:
> https://gitlab.isc.org/isc-projects/dhcp/-/issues/233#note_276883
>
> In file included from ../includes/dhcpd.h:91,
>                  from ctrace.c:29:
> ../includes/omapip/isclib.h:51:10: fatal error: isc/boolean.h: No
> such file or directory
>    51 | #include <isc/boolean.h>
>       |          ^~~~~~~~~~~~~~~
>
> Fixes:
>  -
> http://autobuild.buildroot.org/results/d18b006dce7b46631ce8f4c72fb97eb861993939
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/dhcp/Config.in |  1 -
>  package/dhcp/dhcp.mk   | 19 ++++++++++++++++---
>  2 files changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
> index 515040c612..e0706efafb 100644
> --- a/package/dhcp/Config.in
> +++ b/package/dhcp/Config.in
> @@ -3,7 +3,6 @@ config BR2_PACKAGE_DHCP
>         # fork()
>         depends on BR2_USE_MMU
>         depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> -       select BR2_PACKAGE_BIND
>         help
>           DHCP relay agent from the ISC DHCP distribution.
>
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index 18765a3639..f1e3c22f1c 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -9,8 +9,10 @@ DHCP_SITE =
> https://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
>  DHCP_INSTALL_STAGING = YES
>  DHCP_LICENSE = MPL-2.0
>  DHCP_LICENSE_FILES = LICENSE
> -DHCP_DEPENDENCIES = bind host-gawk
> +DHCP_DEPENDENCIES = host-gawk
>  DHCP_CPE_ID_VENDOR = isc
> +# internal bind does not support parallel builds.
> +DHCP_MAKE = $(MAKE1)
>
>  # use libtool-enabled configure.ac
>  define DHCP_LIBTOOL_AUTORECONF
> @@ -21,11 +23,12 @@ DHCP_CONF_ENV = \
>         CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
>                 -D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
>         CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
> +DHCP_BIND_EXTRA_CONFIG = BUILD_CC='$(TARGET_CC)'
>
>  DHCP_CONF_ENV += ac_cv_prog_AWK=$(HOST_DIR)/bin/gawk
>
>  DHCP_CONF_OPTS = \
> -       --with-libbind=$(STAGING_DIR)/usr \
> +       --with-bind-extra-config="$(DHCP_BIND_EXTRA_CONFIG)" \
>         --with-randomdev=/dev/random \
>         --with-srv-lease-file=/var/lib/dhcp/dhcpd.leases \
>         --with-srv6-lease-file=/var/lib/dhcp/dhcpd6.leases \
> @@ -38,8 +41,18 @@ DHCP_CONF_OPTS = \
>         --with-relay-pid-file=/var/run/dhcrelay.pid \
>         --with-relay6-pid-file=/var/run/dhcrelay6.pid
>
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +DHCP_BIND_EXTRA_CONFIG += --with-zlib
> +DHCP_DEPENDENCIES += zlib
> +else
> +DHCP_BIND_EXTRA_CONFIG += --without-zlib
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +DHCP_CONF_ENV += LIBS=-latomic
> +endif
> +
>  ifeq ($(BR2_STATIC_LIBS),y)
> -DHCP_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/bind9-config --libs
> bind9`"
>  DHCP_CONF_OPTS += --disable-libtool
>  else
>  DHCP_POST_EXTRACT_HOOKS += DHCP_LIBTOOL_AUTORECONF

I can confirm that this issue is also present in 2022.02.x branch.
A backport to that branch would be nice.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
