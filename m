Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB9BC3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 31 Dec 2023 17:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 054EF40134;
	Sun, 31 Dec 2023 17:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 054EF40134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BsP2d3B46OjZ; Sun, 31 Dec 2023 17:28:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1A9340492;
	Sun, 31 Dec 2023 17:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1A9340492
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EAEA51BF3EB
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 17:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE3B040492
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 17:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE3B040492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mhqq1M8-Aoxx for <buildroot@lists.busybox.net>;
 Sun, 31 Dec 2023 17:28:26 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB87440134
 for <buildroot@buildroot.org>; Sun, 31 Dec 2023 17:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB87440134
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 31A45B004FF;
 Sun, 31 Dec 2023 18:28:18 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 31 Dec 2023 18:28:17 +0100
Date: Sun, 31 Dec 2023 18:28:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "J. Langholz" <jlangholzj@gmail.com>
Message-ID: <ZZGksUJvkY_8e8PV@landeda>
References: <20231220134816.6306-1-jlangholzj@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231220134816.6306-1-jlangholzj@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704043703;
 bh=3niK+9JrzcFlpx78QhsmSw+goIauarISmcp4XFd90ds=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uk+tyAyMccmRvpmLkf3Sx585mCBvs46ir+DzEhtP5ffpbdsQ/2kan+ggk+X3AosZH
 4D6N4ifi61J+7hCk6geFfzeUZdLJcDJZrFIsBU6WSXuPn0/WnY4OZK4cn4hfRj6Fg9
 GYBPyqjce4dy1sVfvND+22ROwDPWV0HhAkZe06PtThaBe8JkVmtgKhyiSTmfdM59Wc
 q6oAzdjwpq8B0qNIh57j6jzeguzAsEiK+31VM8P6jLuH1J8vQ9d2UICuJgQa5CaZeY
 3o5UoXQMZsrNsCBMDKVBIhJInXSa4oiytrGx1q3w7ksQBm26fbMWp/yJMT3Gf2AUfg
 DRnXiazMBXr+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Uk+tyAyM
Subject: Re: [Buildroot] [PATCH] package/python3: add tk as core module
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

John, All,

I see that Thomas already sent a review, and you had further questions,
so let me try and address them here, as a review of your patch; it's
going to be basically the same comments as Thomas already provided, but
I'll try to expand on those.

Also, please do not top-post; instead, reply in-line

On 2023-12-20 08:48 -0500, J. Langholz spake thusly:
> ---

First, your commit needs a commit log; here it was empty. A commit log
explains what the situation is, why it needs to change, and how it is
changed. The "how" part is not a description of the patch; it is an
explanation. It can all be very brief in the most basic cases, but here
you may have to explain why the Tk module in python is important.

Then, your commit will have to be signed-off. The sign-off is described
in the manual:
    https://buildroot.org/downloads/manual/manual.html#submitting-patches

Quoting:

    Finally, the patch should be signed off. This is done by adding
    Signed-off-by: Your Real Name <your@email.address> at the end of the
    commit message. [...] See the Developer Certificate of Origin [0]
    for details.

    [0] http://developercertificate.org/

>  package/python3/Config.in  | 6 ++++++
>  package/python3/python3.mk | 9 +++++++--
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python3/Config.in b/package/python3/Config.in
> index 38f0580aa4..65afd4e6e2 100644
> --- a/package/python3/Config.in
> +++ b/package/python3/Config.in
> @@ -108,6 +108,12 @@ config BR2_PACKAGE_PYTHON3_SQLITE
>  	help
>  	  SQLite database support
>  
> +config BR2_PACKAGE_PYTHON3_TK
> +	bool "tk module"
> +	select BR2_PACKAGE_TK
> +	help
> +	  tk (a.k.a. tkinter) module support

This new option is in the section dedicated to the python that will run
on the target. That is, it does not impact the python interpreter used
at build time.

Since you "select TK", you have to reproduce its dependencies. In this
case, all but one of the dependencies for TK are already dependencies
of Python3, and the probability python loses any of those dependencies
is extremely low, so we can just assume that will never happen, so we
don't need to expressly propagate them.

Except for the dependency on Xorg. That one you must propagate, because
Kconfig does not do it automatically. That then needs a little comment
to inform the user about the missing dependency.

So, ultimately, this new option may look something like:

    config BR2_PACKAGE_PYTHON3_TK
        bool "tk module"
        # All other tk dependencies already python dependencies
        depends on BR2_PACKAGE_XORG7 # tk
        select BR2_PACKAGE_TK
        help
          tk (a.k.a. tkinter) module support

    comment "Tk module needs Xorg"
        depends on !BR2_PACKAGE_XORG7

>  config BR2_PACKAGE_PYTHON3_PYEXPAT
>  	bool "xml module"
>  	select BR2_PACKAGE_EXPAT
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index b9c5054a21..ca797f8cda 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -20,7 +20,6 @@ HOST_PYTHON3_CONF_OPTS += \
>  	--without-ensurepip \
>  	--without-cxx-main \
>  	--disable-sqlite3 \
> -	--disable-tk \

[1] This part of the change affects the python interpreter that is built
for the build machine, not the one that runs on the target, i.e. not the
one the option defined above applies to.

See later for a further discussion on that matter.

>  	--with-expat=system \
>  	--disable-curses \
>  	--disable-codecs-cjk \
> @@ -114,6 +113,13 @@ else
>  PYTHON3_CONF_OPTS += --disable-openssl
>  endif
>  
> +ifeq ($(BR2_PACKAGE_PYTHON3_TK),y)
> +PYTHON3_DEPENDENCIES += tk
> +PYTHON3_CONF_OPTS += --enable-tk
> +else
> +PYTHON3_CONF_OPTS += --disable-tk
> +endif

This change, and...

>  ifneq ($(BR2_PACKAGE_PYTHON3_CODECSCJK),y)
>  PYTHON3_CONF_OPTS += --disable-codecs-cjk
>  endif
> @@ -184,7 +190,6 @@ PYTHON3_CONF_OPTS += \
>  	--with-system-ffi \
>  	--disable-pydoc \
>  	--disable-test-modules \
> -	--disable-tk \

... this change, do apply to the target python, so they are correct.

So, if all you wanted was the Tk module on the target, what you did was
almost correct, except for the part [1], and for a non-empty commit log.
In this case, just fix those little nits, and respin a v2 of your patch.

Now, if you (also?) wanted the Tk module in the host python interpreter,
this is going to be a bit more involved. In this case, you'll hit a few
more issues.

First, we do not have ahost variant of Tk, so you would first need to
introduce it. We do have a variant of tcl, though, but you'll have to
see if it is fit (I noticed host-tcl has no dependency on host-zlib;
that's probably an oversight, and may also need to be fixed).

Then, Tk depends on xlib_libXft, so host-tk would probably also need to
depend on host-xlib_libXft, but we do not have a host variant of it, so
you'd need to introduce that as well. And that in turn, has a lot of
dependencies: fontconfig, freetype, xlib_libX11, xlib_libXext,
xlib_libXrender, and xorgproto, and you'd need you have a host variant
for each of them and so on, recursively...

Sine this is going to be a big stack of dependencies, we do not want to
enable it systematically, so we'd need an option to enable Tk, in a
similar manner as for the target variant, something like the following,
in package/python3/Config.in.host:

    config BR2_PACKAGE_HOST_PYTHON3_SSL
        bool "tk"
        help
          Tk module for host python3.

and in package/python3/python3.mk:

    ifeq ($(BR2_PACKAGE_HOST_PYTHON3_TK),y)
    HOST_PYTHON3_DEPENDENCIES += host-tk
    HOST_PYTHON3_CONF_OPTS += --enable-tk
    else
    HOST_PYTHON3_CONF_OPTS += --disable-tk
    endif

I am not sure what you explained in your other reply to Thomas, but if
the underlying explanation was "that will rely on the Tk library as
provided on the build machine distribution", then this is not going to
be OK, because we don't require that to be available. So, all the
dependencies will have to be available in Buildroot if you want to add
the Tk module in the host python interpreter.

And finally, if you need to have the Tk module in the host python
interpreter, you'll have to provide a commit log that explains the
use-case.

As Thomas noted: do we need the host python to have Tk support, so that
we can build the target python with tk support?

So, if you don't need the Tk module on the host python interpreter, then
do not add it just for the sake of adding it.

I hope that the above will answer your questions on Thomas' reply.

Do not hesitate to reply further if that was not clear enough.

In the meantime, I'll mark your patch as "changes requested" in
patchwork.

Regards,
Yann E. MORIN.

>  	--disable-nis \
>  	--disable-idle3 \
>  	--disable-pyc-build
> -- 
> 2.34.1
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
