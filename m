From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 13 Feb 2020 06:08:57 +0100
Subject: [Buildroot] [PATCH 3/3] package/gettext-tiny: bump version to
 0.3.1
In-Reply-To: <20200212225201.1919594-3-aduskett@gmail.com>
References: <20200212225201.1919594-1-aduskett@gmail.com>
 <20200212225201.1919594-3-aduskett@gmail.com>
Message-ID: <CAEyMn7ave0fMBUnPJO8Myy6p5i+SFjyp5Afh+uaa4kS-m7UzZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

Am Mi., 12. Feb. 2020 um 23:52 Uhr schrieb <aduskett@gmail.com>:
>
> From: Adam Duskett <Aduskett@gmail.com>
>
> Other changes:
>   - Update gettext to 0.20.1
>   - Remove share/gettext-tiny/m4/lock.m4 from GETTEXT_TINY_EXTRA_GETTEXT_FILES
>     and the install list, as this file was removed in commit
>     8c2bfdbddb13a480d88ceac4ab0e5886bda957cb.
>
> Tested with test-pkg -p gettext-tiny in Debian 10 and Centos 7
>
>             br-arm-full [1/6]: OK
>  br-arm-cortex-a9-glibc [2/6]: OK
>   br-arm-cortex-m4-full [3/6]: OK
>          br-x86-64-musl [4/6]: OK
>      br-arm-full-static [5/6]: OK
>            sourcery-arm [6/6]: OK
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/gettext-tiny/gettext-tiny.hash | 8 ++++----
>  package/gettext-tiny/gettext-tiny.mk   | 8 +++-----
>  2 files changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
> index 9232fe8530..91f6614cce 100644
> --- a/package/gettext-tiny/gettext-tiny.hash
> +++ b/package/gettext-tiny/gettext-tiny.hash
> @@ -1,7 +1,7 @@
>  # Locally Computed:
> -sha256 efc740007c82a9b3a0d382fb50d212fa7dc0beddb9695409ee79684f9f2124b2  gettext-tiny-adaa9c64921e80f2b8dd3610ffb508618b9204f3.tar.gz
> +sha256 654dcd52f2650476c8822b60bee89c20a0aa7f6a1bf6001701eeacd71a9e388b  gettext-tiny-0.3.1.tar.gz
>  sha256 b57aa4fdc1c614c28d41c1e2d5c4090935964c5f86291ba7d1c99ffd1d698b34  LICENSE
>  sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  extra/COPYING
> -# From http://lists.gnu.org/archive/html/bug-gettext/2016-06/msg00008.html
> -md5  df3f5690eaa30fd228537b00cb7b7590         gettext-0.19.8.1.tar.xz
> -sha1 e0fe90ede22f7f16bbde7bdea791a835f2773fc9 gettext-0.19.8.1.tar.xz
> +# From https://lists.gnu.org/archive/html/info-gnu/2019-05/msg00011.html
> +md5  9ed9e26ab613b668e0026222a9c23639         gettext-0.20.1.tar.xz
> +sha1 62f4a6a2fd5f80bfd0e66c497a04094fa3e07b90 gettext-0.20.1.tar.xz
> diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
> index 09a98f99b4..0aed1e4b1f 100644
> --- a/package/gettext-tiny/gettext-tiny.mk
> +++ b/package/gettext-tiny/gettext-tiny.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -GETTEXT_TINY_VERSION = adaa9c64921e80f2b8dd3610ffb508618b9204f3
> -GETTEXT_TINY_SITE = $(call github,sabotage-linux,gettext-tiny,$(GETTEXT_TINY_VERSION))
> +GETTEXT_TINY_VERSION = 0.3.1
> +GETTEXT_TINY_SITE = $(call github,sabotage-linux,gettext-tiny,v$(GETTEXT_TINY_VERSION))
>  GETTEXT_TINY_LICENSE = MIT, GPL-3.0+ (extra gettext)

The git version adaa9c64921e80f2b8dd3610ffb508618b9204f3 is newer than
the latest release 0.3.1.

>  GETTEXT_TINY_INSTALL_STAGING = YES
>  GETTEXT_TINY_LICENSE_FILES = LICENSE
> @@ -14,12 +14,11 @@ HOST_GETTEXT_TINY_LICENSE_FILES = LICENSE extra/COPYING
>  GETTEXT_TINY_PROVIDES = gettext
>
>  # needed for gettextize
> -GETTEXT_TINY_ARCHIVE_VERSION = 0.19.8
> +GETTEXT_TINY_ARCHIVE_VERSION = 0.20.1
>
>  GETTEXT_TINY_EXTRA_GETTEXT_FILES = \
>         gettext-tools/misc/gettextize.in \
>         gettext-tools/po/Makevars.template \
> -       gettext-runtime/m4/lock.m4 \
>         gettext-runtime/po/boldquot.sed \
>         gettext-runtime/po/en at boldquot.header \
>         gettext-runtime/po/en at quot.header \
> @@ -83,7 +82,6 @@ define HOST_GETTEXT_TINY_INSTALL_CMDS
>
>         $(INSTALL) -m 0755 -D $(@D)/gettextize $(HOST_DIR)/bin/gettextize
>         $(INSTALL) -m 0644 -D $(@D)/build-aux/config.rpath $(HOST_DIR)/share/gettext-tiny/config.rpath
> -       $(INSTALL) -m 0644 -D $(@D)/extra/lock.m4 $(HOST_DIR)/share/gettext-tiny/m4/lock.m4
>         $(INSTALL) -m 0644 -D $(@D)/extra/Makefile.in.in $(HOST_DIR)/share/gettext-tiny/po/Makefile.in.in
>         $(INSTALL) -m 0644 -D $(@D)/extra/boldquot.sed $(HOST_DIR)/share/gettext-tiny/po/boldquot.sed
>         $(INSTALL) -m 0644 -D $(@D)/extra/en at boldquot.header $(HOST_DIR)/share/gettext-tiny/po/en at boldquot.header
> --
> 2.24.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

--
Heiko
