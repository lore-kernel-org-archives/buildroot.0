Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26599C4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 16:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74BF2848E9;
	Fri,  1 Dec 2023 16:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74BF2848E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MShClhhSt0pN; Fri,  1 Dec 2023 16:07:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80842848EA;
	Fri,  1 Dec 2023 16:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80842848EA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 945751BF3D0
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 16:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DA7E848EA
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 16:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DA7E848EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2msQhW-7-UbO for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 16:07:54 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E418D848E9
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 16:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E418D848E9
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4c68:322b:52a4:6805])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id B025D200417;
 Fri,  1 Dec 2023 17:07:47 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 01 Dec 2023 17:07:47 +0100
Date: Fri, 1 Dec 2023 17:07:47 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231201160747.GQ3177259@scaer>
References: <20231130221101.314097-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231130221101.314097-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701446870;
 bh=l0z1gXYtBjC2PH/jqe/GRqiEilFvGJgCb5KgMXr0tS8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N7VW0eD61gI/Gmdjy1rD/6J+fUkrvYU6rb65oGzLQCgWq1Q7HGbJX7JlBy6bhUzu9
 UXHOpfrGMji0Dmz1K0OdR+3sUXvG6DKliEWSbAPHtFSZP8elAWk+5LonHMDW6o1h1r
 DYXQfMThyA16J0cZh9RVN27WGzXpfkJaHpJRDF4psgi9+TkIYLxNWmSiSw7GnD+0tN
 VuMyTz5/qzNoLBikPf/w2j4mJXvJxEOuvjWl3Q1Xgsw57j+cC1pNjsy0OmHTEHMTam
 3blhlp3siRxlCxwsFx5Z1dXWWiBpH4tm5dK9mOfpwg2bD3aOoIYQJbRx9pv6Wu4bVf
 zR9UlePu/Pzxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N7VW0eD6
Subject: Re: [Buildroot] [PATCH 1/1] package/monit: fix openssl static build
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-11-30 23:11 +0100, Fabrice Fontaine spake thusly:
> --with-ssl-dir will exclusively search for dynamic library so use
> --with-ssl-static to fix the following openssl static build failure
> raised since bump to version 5.33.0 in commit
> 8cedb39764f70f9d467bf0cc1acc99a8bbb963d6:
> 
> checking for static SSL support... disabled
> checking for SSL support... enabled
> checking for SSL include directory... /home/buildroot/autobuild/instance-2/output-1/host/mipsel-buildroot-linux-uclibc/sysroot/usr/include
> checking for SSL library directory... /lib64
> 
> [...]
> 
> mipsel-buildroot-linux-uclibc-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/lib64'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4189decbafb5d28c11d89ddac792b4610abeaff1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/monit/monit.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/monit/monit.mk b/package/monit/monit.mk
> index 4766ce3d9e..f3e16a3e4f 100644
> --- a/package/monit/monit.mk
> +++ b/package/monit/monit.mk
> @@ -27,7 +27,12 @@ MONIT_CONF_OPTS += \
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  MONIT_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
> -MONIT_CONF_OPTS += --with-ssl --with-ssl-dir=$(STAGING_DIR)/usr
> +MONIT_CONF_OPTS += --with-ssl
> +ifeq ($(BR2_STATIC_LIBS),y)
> +MONIT_CONF_OPTS += --with-ssl-static=$(STAGING_DIR)/usr
> +else
> +MONIT_CONF_OPTS += --with-ssl-dir=$(STAGING_DIR)/usr
> +endif

The situation is a bit more complex than that, in fact.

What prompted me to investigate a bit further, is that I wanted to
checked if we could force --without-ssl-static or --without-ssl-dir.

However, both of those options only accept a path, not a yes/no answer

    https://bitbucket.org/tildeslash/monit/src/master/configure.ac#lines-766

    AC_ARG_WITH(ssl-static,
        [  --with-ssl-static=DIR       location of SSL installation],
        [
            dnl Check the specified location only
            for dir in "$withval" "$withval/include"; do
                checksslincldir "$dir"
            done
            for dir in "$withval" "$withval/lib"; do
                checkssllibdirstatic "$dir" && break
            done
            ....
        ],
        [
        with_sslstatic=0
            AC_MSG_RESULT([disabled])
        ]
    )

(similarly for --with-ssl-dir, see below)

So we can't specify --without-ssl-dir/static when the other is being
used.

But then I also noticed that the --with-ssl case is only tested if
--with-ssl-static was *not* used at all:

    https://bitbucket.org/tildeslash/monit/src/master/configure.ac#lines-794

    if test $with_sslstatic -eq 0
    then
        AC_MSG_CHECKING([for SSL support])

        AC_ARG_WITH(ssl,
            [  --without-ssl           disable the use of ssl (default: enabled)],
            [
                dnl Check the withvalue
                if test "x$withval" = "xno" ; then
                    with_ssl=0
                    AC_MSG_RESULT([disabled])
                fi
                if test "x$withval" = "xyes" ; then
                    with_ssl=1
                    AC_MSG_RESULT([enabled])
                fi
            ],
            [
                    # Note inverse test. On by default
                    with_ssl=1
                    AC_MSG_RESULT([enabled])
            ]
        )


        # Check for SSL directory
        if test $with_ssl -eq 1; then

            AC_ARG_WITH(ssl-dir,
                [  --with-ssl-dir=DIR       location of SSL installation],
                [
                    dnl Check the specified location only
                    for dir in "$withval" "$withval/include"; do
                        checksslincldir "$dir"
                    done
                    for dir in "$withval" "$withval/lib"; do
                        checkssllibdirdynamic "$dir" && break
                    done
                ]
            )

So, basically what makes sense is either one of (--with-ssl is the
default, but let's be explicit here, as we can be):

  * --with-ssl-static=/path/to/dir

  * --with-ssl --with-ssl-dir=/path/to/dir

  * --without-ssl

Can you please double-check that this is correct and works, and resubmit
a patch, please?

As an aside, there is a lurking bug later on in that configure.ac
script:

    https://bitbucket.org/tildeslash/monit/src/master/configure.ac#lines-931

        elif test -f "/usr/kerberos/include/krb5.h"; then
             # Redhat 9 compilation fix:
             CFLAGS="$CFLAGS -I$sslincldir -I/usr/kerberos/include"
             LIBS="$LIBS -L$ssllibdir -lssl -lcrypto"

So, if the user happens to have native development files for kerberos,
an unsafe path is forcibly shoehorned into the CFLAGS. It's been there
for as long as the repository has existed, so not a hugely critical
issue either. Still worth fixing, I'd say...

Regards,
Yann E. MORIN.

>  MONIT_DEPENDENCIES += host-pkgconf openssl
>  else
>  MONIT_CONF_OPTS += --without-ssl
> -- 
> 2.42.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
