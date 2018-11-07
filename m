From: Brad Love <brad@nextdimension.cc>
Date: Wed, 7 Nov 2018 10:38:45 -0600
Subject: [Buildroot] Altering a package to pull from GIT
In-Reply-To: <CAJ+vNU2bzK3AD8BV6u_F-eXGdyKjGrrmGkyGT-e2kyRNxEE+zg@mail.gmail.com>
References: <CAJ+vNU2bzK3AD8BV6u_F-eXGdyKjGrrmGkyGT-e2kyRNxEE+zg@mail.gmail.com>
Message-ID: <56d800fc-d0a5-1517-4e13-8d3b411245a8@nextdimension.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tim,


On 07/11/2018 10.17, Tim Harvey wrote:
> Greetings,
>
> I'm trying to alter the openocd package to pull code from a specific
> git sha. Looking over the manual and searching a bit it seems like the
> following is the thing to do:
>
> diff --git a/package/openocd/openocd.mk <http://openocd.mk>
> b/package/openocd/openocd.mk <http://openocd.mk>
> index 548d8b8..76594fe 100644
> --- a/package/openocd/openocd.mk <http://openocd.mk>
> +++ b/package/openocd/openocd.mk <http://openocd.mk>
> @@ -4,9 +4,10 @@
> ?#
> ?################################################################################
> ?
> -OPENOCD_VERSION = 0.10.0
> +OPENOCD_VERSION = da4b2d5beb
> ?OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
> -OPENOCD_SITE =
> http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
> +OPENOCD_SITE = git://git.code.sf.net/p/openocd/code
> <http://git.code.sf.net/p/openocd/code>
> +OPENCOD_SITE_METHOD = git


Note your spelling error:

OPENCOD_SITE_METHOD


Cheers,

Brad



> ?OPENOCD_LICENSE = GPL-2.0+
> ?OPENOCD_LICENSE_FILES = COPYING
> ?# 0002-configure-enable-build-on-uclinux.patch patches configure.ac
> <http://configure.ac>
>
>
> In other words _SITE needs to be the git:// URL and _VERSION should be
> the branch/tag/sha. However when I build I get:
>
> >>> openocd da4b2d5beb Extracting
> bzcat /usr/src/ventana/buildroot/dl/openocd/openocd-da4b2d5beb.tar.bz2
> | tar --s
> trip-components=1 -C
> /usr/src/ventana/buildroot/output/build/openocd-da4b2d5beb?
> ? -xf -
> bzcat:
> /usr/src/ventana/buildroot/dl/openocd/openocd-da4b2d5beb.tar.bz2 is not a
> ?bzip2 file.
> tar: This does not look like a tar archive??
> tar: Exiting with failure status due to previous errors
> package/pkg-generic.mk:160 <http://pkg-generic.mk:160>: recipe for
> target '/usr/src/ventana/buildroot/output
> /build/openocd-da4b2d5beb/.stamp_extracted' failed
> make[1]: ***
> [/usr/src/ventana/buildroot/output/build/openocd-da4b2d5beb/.stamp_
> extracted] Error 2
> Makefile:84: recipe for target '_all' failed
> make: *** [_all] Error 2
>
> I thought it was the fact there was an openocd.hash but removing it
> still fails. Any ideas?
>
> Best regards,
>
> Tim
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181107/0c90c317/attachment.html>
