From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Sep 2014 14:57:52 +0200
Subject: [Buildroot] [PATCH] openvmtools: disable -Werror
In-Reply-To: <1410792995-28405-1-git-send-email-kaszak@gmail.com>
References: <1410792995-28405-1-git-send-email-kaszak@gmail.com>
Message-ID: <20140921125751.GC4299@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Karoly, All,

On 2014-09-15 16:56 +0200, Karoly Kasza spake thusly:
> Disable the mandatory flag -Werror in configure.ac.
> This also makes -Wno-deprecated-declarations flag unnecessary.
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I guess this is fixing a bunch of autobuild errors; these should have
been referenced in the commit log, as such:

Fixes:
    http://autobuild.buildroot.net/results/440/4400abc17115d0f5eb65c4eb012f11766cbe5a56/
    http://autobuild.buildroot.net/results/02b/02b24a012dbc76e366c10d3758978eba5e597499/
    [...]

(No need to put them all, just a few; the [...] means there are a lot
more, hence it is important to apply this patch.)

Regards,
Yann E. MORIN.

> ---
>  .../openvmtools/openvmtools-04-no_cflags_werror.patch |   17 +++++++++++++++++
>  package/openvmtools/openvmtools.mk                    |    4 ----
>  2 files changed, 17 insertions(+), 4 deletions(-)
>  create mode 100644 package/openvmtools/openvmtools-04-no_cflags_werror.patch
> 
> diff --git a/package/openvmtools/openvmtools-04-no_cflags_werror.patch b/package/openvmtools/openvmtools-04-no_cflags_werror.patch
> new file mode 100644
> index 0000000..96bd355
> --- /dev/null
> +++ b/package/openvmtools/openvmtools-04-no_cflags_werror.patch
> @@ -0,0 +1,17 @@
> +configure.ac: disable -Werror
> +
> +Disable the mandatory flag -Werror in configure.ac.
> +
> +Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> +
> +--- open-vm-tools-9.4.6-1770165.orig/configure.ac	2014-07-02 00:21:14.000000000 +0200
> ++++ open-vm-tools-9.4.6-1770165/configure.ac	2014-09-15 16:03:47.565900402 +0200
> +@@ -832,7 +832,7 @@
> + 
> + ### General flags / actions
> + CFLAGS="$CFLAGS -Wall"
> +-CFLAGS="$CFLAGS -Werror"
> ++# CFLAGS="$CFLAGS -Werror"
> + 
> + # -Wno-unknown-pragmas is due to gcc not understanding '#pragma ident' in Xlib.h on OpenSolaris.
> + for TEST_CFLAG in -Wno-pointer-sign -Wno-unused-value -fno-strict-aliasing \
> diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
> index 6361d6b..9191643 100644
> --- a/package/openvmtools/openvmtools.mk
> +++ b/package/openvmtools/openvmtools.mk
> @@ -13,10 +13,6 @@ OPENVMTOOLS_LICENSE_FILES = COPYING
>  # See http://sourceforge.net/p/open-vm-tools/mailman/message/32550385/
>  OPENVMTOOLS_AUTORECONF = YES
>  OPENVMTOOLS_CONF_OPT = --without-icu --without-x --without-gtk2 --without-gtkmm --without-kernel-modules
> -# -Wno-deprecated-declarations is a workaround for a bug in open-vm-tools
> -# See http://sourceforge.net/p/open-vm-tools/mailman/message/31473171/
> -OPENVMTOOLS_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -Wno-deprecated-declarations"
> -
>  OPENVMTOOLS_DEPENDENCIES = libglib2
>  
>  # When libfuse is available, openvmtools can build vmblock-fuse, so
> -- 
> 1.7.10.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
