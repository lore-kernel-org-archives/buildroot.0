From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Aug 2014 11:35:35 +0200
Subject: [Buildroot] [PATCH v4 1/3] libgtk3: new package
In-Reply-To: <1406856828-17350-2-git-send-email-hadrien.boutteville@gmail.com>
References: <1406856828-17350-1-git-send-email-hadrien.boutteville@gmail.com>
 <1406856828-17350-2-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <20140803113535.00c160c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hadrien,

On Fri,  1 Aug 2014 03:33:46 +0200, Hadrien Boutteville wrote:
> Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks. Unfortunately, it still does not build here:

Making all in gtk
  CCLD     extract-strings
  GEN      stamp-gtktypebuiltins.h
  GEN      stamp-gtkprivatetypebuiltins.h
  GEN      stamp-gtkmarshalers.h
  GEN      stamp-icons
  GEN      gtkdbusgenerated.c
  GEN      gtkdbusgenerated.h
/usr/bin/ld: skipping incompatible /home/test/outputs/gtk3/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libintl.so when searching for -lintl
/usr/bin/ld: skipping incompatible /home/test/outputs/gtk3/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libintl.a when searching for -lintl
/usr/bin/ld: cannot find -lintl
collect2: ld returned 1 exit status
make[4]: *** [extract-strings] Error 1
make[4]: *** Waiting for unfinished jobs....
/home/test/outputs/gtk3/host/usr/bin/glib-mkenums: gtktextview.h:59: Failed to parse `  /*< private >*/ '
/home/test/outputs/gtk3/host/usr/bin/glib-mkenums: gtktextview.h:61: Failed to parse `  /*< public >*/ '
make[3]: *** [all-recursive] Error 1
make[2]: *** [all] Error 2
make[1]: *** [/home/test/outputs/gtk3/build/libgtk3-3.12.2/.stamp_built] Error 2
make: *** [_all] Error 2

With the following configuration:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2014.05-rc1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_14=y
BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_LIBGTK3=y
BR2_PACKAGE_LIBGTK3_DEMO=y
BR2_PACKAGE_LIBGTK3_TESTS=y

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
