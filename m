From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Oct 2015 10:51:27 +0100
Subject: [Buildroot] Help Adding Package to build root..
In-Reply-To: <CACvocV5tDRHUDzKkCyRt=w9MHdM0HAScUr_T=jajngRbWSvx9A@mail.gmail.com>
References: <CACvocV4-o7u1L52xP7YnVTgoi369NUDk6vP4=ng6cLuwzXOvVw@mail.gmail.com>
 <562FDA96.5020605@mind.be>
 <CACvocV5tDRHUDzKkCyRt=w9MHdM0HAScUr_T=jajngRbWSvx9A@mail.gmail.com>
Message-ID: <56309A9F.2090704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28-10-15 10:30, astrolite . wrote:
> Hi Arnout,
> In the
> directory /root/qt-dev/buildroot-qt-dev/buildroot-2015.05/output/build/libpigpio-38
> is present only config.in <http://config.in> libpigpio.mk <http://libpigpio.mk> 
> These are my files:
> Config.in
> 
> config BR2_PACKAGE_LIBPIGPIO
> bool "libpigpio"
> help
>  pigpio is a C library for the Raspberry Pi which allows control of the general
> purpose input outputs (gpios).
> 
> libpigpio.mk <http://libpigpio.mk>
> 
> LIBPIGPIO_VERSION = 38
> LIBPIGPIO_INSTALL_TARGET = YES
> LIBPIGPIO_INSTALL_STAGING = YES
> LIBPIGPIO_AUTORECONF = YES
> LIBPIGPIO_SITE = https://github.com/ciclonite/pigpio

 You have done something very weird, since
https://github.com/ciclonite/pigpio/libpigpio-38.tar.gz
doesn't exist. I guess you manually put that file into your dl directory, but
the file is just wrong, it contain the buildroot package files instead of the
sources.

 I think you should read the Buildroot manual about adding packages,
particularly the part about the github helper. You'll probably want to set the
version to 07e2a66f73c7bc5d60b373a2f8a25a4294f2d778 because everything you did
after that commit looks like rubbish to me.


> 
> ifeq ($(BR2_PACKAGE_LIBPIGPIO),y)
> TARGETS+=libpigpio
> endif

 This bit should be removed - it's done automatically by the autotools-package
macro.


 Regards,
 Arnout

> $(eval $(autotools-package))
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
