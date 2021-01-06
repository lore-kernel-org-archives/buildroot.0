From: Yair Ben-Avraham <yairba@protonmail.com>
Date: Wed, 06 Jan 2021 07:30:09 +0000
Subject: [Buildroot] [PATCH 1/1] package/casync: new package
In-Reply-To: <20210102112643.3eef2517@windsurf>
References: <onIw25oyihuYWcFwG2rTgzAbEF414WTH7efI53xEOXW2moxamXDh7mG1rqvPJT_5HOZ4Z52JarqzkoUbzYBk6z_8Z7UWehjNqnmXtRo45oI=@protonmail.com>
 <20210102112643.3eef2517@windsurf>
Message-ID: <cmRJxgbM92iKZroRwfjJQcBCKzpt-RGBrc7lvyXodpcP4QbZKDFm8hd8jMKtVXBYk1Rtr_l8yLnF5ge94tukmOz51cBL_Xx4ZcUE-5otsdY=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please see inline,


??????? Original Message ???????
On Saturday, January 2, 2021 11:26 AM, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Yair,
>
> Thanks for this contribution! There's however a number of things to be
> changed. See below.
>
> On Sun, 06 Dec 2020 14:50:01 +0000
> Yair Ben-Avraham via buildroot buildroot at busybox.net wrote:
>
> > Content-Addressable Data Synchronization Tool
> >
> > Signed-off-by: Yair Ben-Avraham yairba at protonmail.com
> >
> > ------------------------------------------------------
> >
> > package/Config.in | 1 +
> > package/casync/Config.in | 16 ++++++++++++++++
> > package/casync/casync.hash | 3 +++
> > package/casync/casync.mk | 28 ++++++++++++++++++++++++++++
> > 4 files changed, 48 insertions(+)
>
> Could you add an entry to the DEVELOPERS file ?
>
> > diff --git a/package/casync/Config.in b/package/casync/Config.in
> > new file mode 100644
> > index 0000000000..2b00c849a3
> > --- /dev/null
> > +++ b/package/casync/Config.in
> > @@ -0,0 +1,16 @@
> > +config BR2_PACKAGE_CASYNC
> >
> > -   bool "casync"
> > -   depends on BR2_PACKAGE_EUDEV
>
> You should not use BR2_PACKAGE_EUDEV, but BR2_PACKAGE_HAS_UDEV, so that
> either eudev or systemd can be used as a udev provider. However, udev
> is not a mandatory dependency, so in fact this dependency is not needed.
>
> > -   depends on BR2_TOOLCHAIN_USES_GLIBC
>
> Please document why this is needed in a comment. If I get it correctly,
> it's because casync uses scandirat(), which is not implemented by
> current versions of musl and uclibc-ng.
>
> > -   select BR2_PACKAGE_ACL
> > -   select BR2_PACKAGE_LIBCURL
> > -   select BR2_PACKAGE_OPENSSL
> > -   select BR2_PACKAGE_XZ
>
> This dependency is not mandatory.
>

br-arm-cortex-a9-glibc failed because of:
../src/castore.c:5:10: fatal error: lzma.h: No such file or directory
    5 | #include <lzma.h>
      |          ^~~~~~~~
compilation terminated.

Is that make 'xz' mandatory?

Yair

> > -   select BR2_PACKAGE_ZSTD
>
> This dependency is not mandatory.
>
> Also, there's an optional dependency on zlib.

[snip]

> Best regards,
>
> Thomas Petazzoni
>
> --------------------------------------------------------------------
>
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--
Yair Ben-Avraham
yairba at protonmail.com
+31.6.1316.5535
