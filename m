Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F28C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 10:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC1D641C8B;
	Sat, 18 Feb 2023 10:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC1D641C8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wvx009EE70DR; Sat, 18 Feb 2023 10:39:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48F5341C91;
	Sat, 18 Feb 2023 10:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48F5341C91
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FC311BF5DB
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 10:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E086C40441
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 10:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E086C40441
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Trw0rWYIKeRc for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 10:39:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3000F400E7
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3000F400E7
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 10:39:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 31A7EFF806;
 Sat, 18 Feb 2023 10:39:43 +0000 (UTC)
Date: Sat, 18 Feb 2023 11:39:39 +0100
To: Bagas Sanjaya <bagasdotme@gmail.com>
Message-ID: <20230218113939.526f0a76@windsurf>
In-Reply-To: <20230218101426.630874-1-bagasdotme@gmail.com>
References: <20230218101426.630874-1-bagasdotme@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676716783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FG5HfLXCZLtJ2K/+6pfmEGz8Q1cL0ovJQRLiRnPTYoI=;
 b=MefiJtOAF9Ufu/2RDHWqWDNLoORj/B3N9zrkHyupHfUV58WURFsMoHePbijYb/+r2GiC19
 Q7IsIuLw5wgiDMXim3LdOFcEh1Pd1AeMO9evR0Lbnkn3hjagZDVey45OQb4cbX1hxKUfdQ
 9hXqRvjmAZLp8XwYkkhDEBwHMRcLa0UHE7QrinPH/7cItiq7xMm8AYw8wfr+ASykXQTlTh
 OP5xszqNy5S4KBrYkGU4JwhucdAL+WX801pb4kqKs7HJIhYM5S/8rgK23VIYV0EsjvkBFa
 Mtx+OvH91tMTiG8UvL0LuJ2b8U8+FJKoIN4WUXgQoAL8sQPodyzjFxVrO/ctkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MefiJtOA
Subject: Re: [Buildroot] [PATCH] Revert "package/gnupg2: bump to version
 2.4.0"
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
Cc: Julien Olivain <ju.o@free.fr>, Buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bagas,

Let's add Julien Olivain in Cc, as he did the bump of gnupg2 to version
2.4.0.

Julien: could you have a look at the below issue, which is affecting
gnupg2 in the autobuilders?

Thanks a lot!

Thomas

On Sat, 18 Feb 2023 17:14:26 +0700
Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> Bumping the package version to 2.4.0, it fails to cross-compile with
> unsafe cross-compile paths (for example recent build log at [1]):
> 
> make[4]: Entering directory '/home/thomas/autobuild/instance-3/output-1/build/gnupg2-2.4.0/common'
> /home/thomas/autobuild/instance-3/output-1/host/bin/aarch64-buildroot-linux-gnu-gcc -DHAVE_CONFIG_H -I. -I..  -DLOCALEDIR=\"/usr/share/locale\" -DGNUPG_BINDIR="\"/usr/bin\"" -DGNUPG_LIBEXECDIR="\"/usr/libexec\"" -DGNUPG_LIBDIR="\"/usr/lib/gnupg\"" -DGNUPG_DATADIR="\"/usr/share/gnupg\"" -DGNUPG_SYSCONFDIR="\"/etc/gnupg\"" -DGNUPG_LOCALSTATEDIR="\"/var\""        -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/libusb-1.0 -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/include -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/include -I/usr/include -I/usr/include -I/usr/include -Wall -Wno-format-zero-length -Wno-pointer-sign -Wpointer-arith -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g1 -D_FORTIFY_SOURCE=2 -c -o t-stringhelp.o t-stringhelp.c
> /home/thomas/autobuild/instance-3/output-1/host/bin/aarch64-buildroot-linux-gnu-gcc -DHAVE_CONFIG_H -I. -I..  -DLOCALEDIR=\"/usr/share/locale\" -DGNUPG_BINDIR="\"/usr/bin\"" -DGNUPG_LIBEXECDIR="\"/usr/libexec\"" -DGNUPG_LIBDIR="\"/usr/lib/gnupg\"" -DGNUPG_DATADIR="\"/usr/share/gnupg\"" -DGNUPG_SYSCONFDIR="\"/etc/gnupg\"" -DGNUPG_LOCALSTATEDIR="\"/var\""        -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/libusb-1.0 -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/include -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/include -I/usr/include -I/usr/include -I/usr/include -I/usr/include -DWITHOUT_NPTH=1 -Wall -Wno-format-zero-length -Wno-pointer-sign -Wpointer-arith -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g1 -D_FORTIFY_SOURCE=2 -c -o libcommon_a-i18n.o `test -f 'i
 18
>  n.c' || echo './'`i18n.c
> /home/thomas/autobuild/instance-3/output-1/host/bin/aarch64-buildroot-linux-gnu-gcc -DHAVE_CONFIG_H -I. -I..  -DLOCALEDIR=\"/usr/share/locale\" -DGNUPG_BINDIR="\"/usr/bin\"" -DGNUPG_LIBEXECDIR="\"/usr/libexec\"" -DGNUPG_LIBDIR="\"/usr/lib/gnupg\"" -DGNUPG_DATADIR="\"/usr/share/gnupg\"" -DGNUPG_SYSCONFDIR="\"/etc/gnupg\"" -DGNUPG_LOCALSTATEDIR="\"/var\""        -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/libusb-1.0 -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/include -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/include -I/usr/include -I/usr/include -I/usr/include -I/usr/include -DWITHOUT_NPTH=1 -Wall -Wno-format-zero-length -Wno-pointer-sign -Wpointer-arith -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g1 -D_FORTIFY_SOURCE=2 -c -o libcommon_a-mapstrings.o `test
  -
>  f 'mapstrings.c' || echo './'`mapstrings.c
> /home/thomas/autobuild/instance-3/output-1/host/bin/aarch64-buildroot-linux-gnu-gcc -DHAVE_CONFIG_H -I. -I..  -DLOCALEDIR=\"/usr/share/locale\" -DGNUPG_BINDIR="\"/usr/bin\"" -DGNUPG_LIBEXECDIR="\"/usr/libexec\"" -DGNUPG_LIBDIR="\"/usr/lib/gnupg\"" -DGNUPG_DATADIR="\"/usr/share/gnupg\"" -DGNUPG_SYSCONFDIR="\"/etc/gnupg\"" -DGNUPG_LOCALSTATEDIR="\"/var\""        -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/libusb-1.0 -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/include -I/home/thomas/autobuild/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/include -I/usr/include -I/usr/include -I/usr/include -I/usr/include -DWITHOUT_NPTH=1 -Wall -Wno-format-zero-length -Wno-pointer-sign -Wpointer-arith -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g1 -D_FORTIFY_SOURCE=2 -c -o libcommon_a-stringhelp.o `test
  -
>  f 'stringhelp.c' || echo './'`stringhelp.c
> aarch64-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'
> make[4]: *** [Makefile:1283: t-stringhelp.o] Error 1
> 
> Revert the bump for now until the issue can be fixed upstream.
> 
> [1]: http://autobuild.buildroot.net/results/5bf00af86da6e41d1a48abc7304bf339908a0150/build-end.log
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  package/gnupg2/0001-ks_ldap_free_state.patch | 21 ++++++++++++++++++++
>  package/gnupg2/gnupg2.hash                   | 10 +++++-----
>  package/gnupg2/gnupg2.mk                     |  2 +-
>  3 files changed, 27 insertions(+), 6 deletions(-)
>  create mode 100644 package/gnupg2/0001-ks_ldap_free_state.patch
> 
> diff --git a/package/gnupg2/0001-ks_ldap_free_state.patch b/package/gnupg2/0001-ks_ldap_free_state.patch
> new file mode 100644
> index 0000000000..fa55d27c04
> --- /dev/null
> +++ b/package/gnupg2/0001-ks_ldap_free_state.patch
> @@ -0,0 +1,21 @@
> +
> +Fix undefined reference to `ks_ldap_free_state' if OpenLDAP is not
> +installed
> +
> +Backported from: 7011286ce6e1fb56c2989fdafbd11b931c489faa
> +
> +Signed-off-by: Michael Fischer <mf@go-sys.de>
> +
> +--- a/dirmngr/server.c
> ++++ b/dirmngr/server.c
> +@@ -3137,8 +3137,10 @@ start_command_handler (assuan_fd_t fd, unsigned int session_id)
> +                ctrl->refcount);
> +   else
> +     {
> ++#if USE_LDAP
> +       ks_ldap_free_state (ctrl->ks_get_state);
> +       ctrl->ks_get_state = NULL;
> ++#endif
> +       release_ctrl_ocsp_certs (ctrl);
> +       xfree (ctrl->server_local);
> +       dirmngr_deinit_default_ctrl (ctrl);
> diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
> index c642862fe2..f9c071ad45 100644
> --- a/package/gnupg2/gnupg2.hash
> +++ b/package/gnupg2/gnupg2.hash
> @@ -1,7 +1,7 @@
> -# From  https://lists.gnupg.org/pipermail/gnupg-announce/2022q4/000477.html
> -sha1  63dde155a8df0d5e1987efa5fc17438beca83ac1  gnupg-2.4.0.tar.bz2
> +# From  https://lists.gnupg.org/pipermail/gnupg-announce/2022q4/000476.html
> +sha1  1f31b7b4c9c9adad97f94ea3acf1aa64c0424bcc  gnupg-2.3.8.tar.bz2
>  # Calculated based on the hash above and signature
> -# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.0.tar.bz2.sig
> -# using key 6DAA6E64A76D2840571B4902528897B826403ADA
> -sha256  1d79158dd01d992431dd2e3facb89fdac97127f89784ea2cb610c600fb0c1483  gnupg-2.4.0.tar.bz2
> +# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.3.8.tar.bz2.sig
> +# using key 6DAA6E64A76D2840571B4902528897B826403ADA and AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD
> +sha256  540b7a40e57da261fb10ef521a282e0021532a80fd023e75fb71757e8a4969ed  gnupg-2.3.8.tar.bz2
>  sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
> diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
> index 5935ce6939..9dc29ca99e 100644
> --- a/package/gnupg2/gnupg2.mk
> +++ b/package/gnupg2/gnupg2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GNUPG2_VERSION = 2.4.0
> +GNUPG2_VERSION = 2.3.8
>  GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
>  GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
>  GNUPG2_LICENSE = GPL-3.0+
> 
> base-commit: d00e437922fb1b611f35c3138b9fbf7bcff62757



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
