From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Mar 2016 00:13:36 +0100
Subject: [Buildroot] [PATCH 1/1] putty: add new package
In-Reply-To: <1457678759-11688-1-git-send-email-post@lespocky.de>
References: <1457678759-11688-1-git-send-email-post@lespocky.de>
Message-ID: <20160312231336.GN3745@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexander, All,

On 2016-03-11 07:45 +0100, Alexander Dahl spake thusly:
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
[--SNIP--]
> diff --git a/package/putty/putty.hash b/package/putty/putty.hash
> new file mode 100644
> index 0000000..4b02acc
> --- /dev/null
> +++ b/package/putty/putty.hash
> @@ -0,0 +1,5 @@
> +# Hashes from: http://the.earth.li/~sgtatham/putty/0.67/{md5,sha1,sha256,sha512}sums
> +md5 8d5d450e8f9a011e2e411e3f30827e9b                                                                                                    putty-0.67.tar.gz
> +sha1 132ff74266e590a007f86cbb4bea5642db7bdd76                                                                                           putty-0.67.tar.gz
> +sha256 80192458e8a46229de512afeca5c757dd8fce09606b3c992fbaeeee29b994a47                                                                 putty-0.67.tar.gz
> +sha512 c2b17da46b8db3fe3837a10cb9cf5dd4b3ef6bfa15cadab83f3b87cf1479ed31fced90b774297ae53bdcbbdf230fc80d5c73d5ff3be6916fb591fd7ce3d35eca putty-0.67.tar.gz

sha256 and sha512 are two strong hashes, so md5 and sha1 are not needed.

Otherwise, looks good. When you fix the hashes and tweak the help text
as mentionned in the other mail, you can add my:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> diff --git a/package/putty/putty.mk b/package/putty/putty.mk
> new file mode 100644
> index 0000000..ca86c47
> --- /dev/null
> +++ b/package/putty/putty.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# putty
> +#
> +################################################################################
> +
> +PUTTY_VERSION = 0.67
> +PUTTY_SOURCE = putty-$(PUTTY_VERSION).tar.gz
> +PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
> +PUTTY_SUBDIR = unix
> +PUTTY_LICENSE = MIT
> +PUTTY_LICENSE_FILES = LICENCE
> +PUTTY_CONF_OPTS = --disable-gtktest
> +
> +ifeq ($(BR2_PACKAGE_LIBGTK2),y)
> +PUTTY_CONF_OPTS += --with-gtk=2
> +PUTTY_DEPENDENCIES += libgtk2
> +else
> +PUTTY_CONF_OPTS += --without-gtk
> +endif
> +
> +$(eval $(autotools-package))
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
