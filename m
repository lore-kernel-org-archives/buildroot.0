From: astrolite . <ciclonite@gmail.com>
Date: Wed, 28 Oct 2015 10:30:16 +0100
Subject: [Buildroot] Help Adding Package to build root..
In-Reply-To: <562FDA96.5020605@mind.be>
References: <CACvocV4-o7u1L52xP7YnVTgoi369NUDk6vP4=ng6cLuwzXOvVw@mail.gmail.com>
 <562FDA96.5020605@mind.be>
Message-ID: <CACvocV5tDRHUDzKkCyRt=w9MHdM0HAScUr_T=jajngRbWSvx9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
In the directory
/root/qt-dev/buildroot-qt-dev/buildroot-2015.05/output/build/libpigpio-38
is present only config.in libpigpio.mk
These are my files:
Config.in

config BR2_PACKAGE_LIBPIGPIO
bool "libpigpio"
help
 pigpio is a C library for the Raspberry Pi which allows control of the
general purpose input outputs (gpios).

libpigpio.mk

LIBPIGPIO_VERSION = 38
LIBPIGPIO_INSTALL_TARGET = YES
LIBPIGPIO_INSTALL_STAGING = YES
LIBPIGPIO_AUTORECONF = YES
LIBPIGPIO_SITE = https://github.com/ciclonite/pigpio

ifeq ($(BR2_PACKAGE_LIBPIGPIO),y)
TARGETS+=libpigpio
endif
$(eval $(autotools-package))

Thanks a lot.
Giovanni


2015-10-27 21:12 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:

> On 27-10-15 18:52, astrolite . wrote:
> > Hi all sorry for my stupid question but i've a problem to adding a
> packages to
> > buid root..
> >
> > I need to add a package called pigpio.
> > I've create a .tar.gz on github with all the file required.
> > The link is : https://github.com/ciclonite/pigpio
> >
> >
> > Here what happens:
> > gzip -d -c
> > /root/qt-dev/buildroot-qt-dev/buildroot-2015.05/dl/libpigpio-38.tar.gz |
> tar
> > --strip-components=1 -C
> >
> /root/qt-dev/buildroot-qt-dev/buildroot-2015.05/output/build/libpigpio-38
> -xf -
> >>>> libpigpio 38 Patching
> >>>> libpigpio 38 Updating config.sub and config.guess
> > for file in config.guess config.sub; do for i in $(find
> >
> /root/qt-dev/buildroot-qt-dev/buildroot-2015.05/output/build/libpigpio-38
> -name
> > $file); do cp support/gnuconfig/$file $i; done; done
> >>>> libpigpio 38 Configuring
> >>>> libpigpio 38 Autoreconfiguring
> > autoreconf: 'configure.ac <http://configure.ac>' or 'configure.in
> > <http://configure.in>' is required
> > Why the autoreconf cannot find configure.ac <http://configure.ac>? in
> the tar.gz
> > it's present!
>
>  Is it in the build directory
> /root/qt-dev/buildroot-qt-dev/buildroot-2015.05/output/build/libpigpio-38 ?
>
>  Could you share your Config.in and pigpio.mk so we can check it? The
> version
> "38" is suspicious since there is no corresponding tag in the github repo,
> so I
> wonder if you really have the correct tarball.
>
>
>  Regards,
>  Arnout
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151028/a132fd1e/attachment.html>
