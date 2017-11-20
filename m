From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Nov 2017 09:28:15 +0100
Subject: [Buildroot] [PATCH 1/1] motion: bump to version 4.1
In-Reply-To: <20171120084521.410ba491@windsurf>
References: <20171119142641.1867-1-fontaine.fabrice@gmail.com>
 <20171120084521.410ba491@windsurf>
Message-ID: <CAPi7W80Zq9CqcyYk_P3Cr-B_XjP-Au7q6xF3=w9jKe0MWd6=VQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2017-11-20 8:45 GMT+01:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Sun, 19 Nov 2017 15:26:41 +0100, Fabrice Fontaine wrote:
> > - Remove 0001-configure.ac-use-given-CFLAGS-LIBS-for-mysqlclient-l.
> patch,
> > it does not have been sent upstream but issue has been fixed by
> > https://github.com/Motion-Project/motion/commit/
> 3b7164f7f9c2b123f850f8cd1bc0a860ca51c0fe#diff-
> 67e997bcfdac55191033d57a16d1408a
> > - 0002-Rename-base64_encode.patch has been integrated into this version
> > - --without-jpeg-turbo has been deleted from configure.ac
> > - libsdl dependency has been removed
>
> Thanks for this detailed commit log. However..
>
> >  ifeq ($(BR2_PACKAGE_FFMPEG_SWSCALE),y)
> >  MOTION_DEPENDENCIES += ffmpeg
> > @@ -29,10 +27,6 @@ MOTION_CONF_OPTS += \
> >       --with-mysql \
> >       --with-mysql-include=$(STAGING_DIR)/usr/include/mysql \
> >       --with-mysql-lib=$(STAGING_DIR)/usr/lib
> > -# static link of mysql needs -lz
> > -ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_ZLIB),yy)
> > -MOTION_CONF_ENV += LIBS="-lz"
> > -endif
>
> ... this particular change isn't described. Is it done intentionally?
>
This part was linked to 0001-configure.ac-use-given-
CFLAGS-LIBS-for-mysqlclient-l.patch (see
https://git.buildroot.net/buildroot/commit/package/motion?id=b83107e53ceace4f6d95520a193545bec729cae6
).

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171120/f63b9832/attachment.html>
