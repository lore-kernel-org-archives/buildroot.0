From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 22:19:01 +0200
Subject: [Buildroot] [PATCH 01/47] package/libsquish: New package
In-Reply-To: <1437597069-6448-2-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
 <1437597069-6448-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150727221901.3f8f9eda@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 22 Jul 2015 22:30:23 +0200, Bernd Kuhls wrote:
> Kodi 15.0 contains an updated version of libsquish:
> https://github.com/xbmc/xbmc/tree/master/tools/depends/native/libsquish-native
> 
> The OpenElec project provides a separate tarball including the Kodi-
> specific patches:
> http://sources.openelec.tv/devel/libsquish-1.10-openelec.tar.gz
> 
> This patch contains the relevant diff between upstream libsquish 1.13
> and the OpenElec tarball.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/Config.in                 |    1 +
>  package/libsquish/0001-kodi.patch |  327 +++++++++++++++++++++++++++++++++++++
>  package/libsquish/Config.in       |   13 ++
>  package/libsquish/libsquish.hash  |    2 +
>  package/libsquish/libsquish.mk    |   35 ++++
>  5 files changed, 378 insertions(+)
>  create mode 100644 package/libsquish/0001-kodi.patch
>  create mode 100644 package/libsquish/Config.in
>  create mode 100644 package/libsquish/libsquish.hash
>  create mode 100644 package/libsquish/libsquish.mk

Applied after doing some changes:

    [Thomas:
     - don't create the usr/lib/pkgconfig directory in STAGING_DIR and
       TARGET_DIR, since libsquish installation doesn't install a .pc
       file.
     - instead, create usr/include and usr/lib.
     - fixup the symlink logic so that the target directory only has a
       symbolic link named after the library SONAME, while the staging dir
       has both usual symlinks: one named after the SONAME, one just
       libsquish.so. Suggested by Yann E. Morin.]

Bernd, if you can contribute upstream a bit to improve the Makefile and
therefore make the build logic in Buildroot simpler, it would be nice.
Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
