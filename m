From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jan 2018 14:35:52 +0100
Subject: [Buildroot] Problem linking xlib_libXpm-3.5.12/sxpm
In-Reply-To: <1514981201.20163.27.camel@panix.com>
References: <1514949858.20163.19.camel@panix.com>
 <20180103111742.76c727d8@windsurf.lan>
 <1514979473.20163.23.camel@panix.com>
 <1514981201.20163.27.camel@panix.com>
Message-ID: <20180103143552.477325fd@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 03 Jan 2018 07:06:41 -0500, Ormund Williams wrote:

> > > What Buildroot version are you using ? Do you have a Buildroot
> > > configuration that allows to reproduce the problem ?
> > 
> > A git clone from yesterday, 2018-01-02.  Config attached.
> >   
> Sorry this config works but to see the problem enable the samba
> package.

This config fails to build here, with the exact same error as the one
you had:

  CCLD     sxpm
sxpm.o: In function `Usage':
sxpm.c:(.text+0x14): undefined reference to `libintl_gettext'
sxpm.c:(.text+0x30): undefined reference to `libintl_gettext'
sxpm.o: In function `ErrorMessage':
sxpm.c:(.text+0x170): undefined reference to `libintl_gettext'
sxpm.c:(.text+0x186): undefined reference to `libintl_gettext'
sxpm.c:(.text+0x1ba): undefined reference to `libintl_gettext'
sxpm.o:sxpm.c:(.text+0x1d0): more undefined references to `libintl_gettext' follow
sxpm.o: In function `main':
sxpm.c:(.text.startup+0x3a): undefined reference to `libintl_bindtextdomain'
sxpm.c:(.text.startup+0x46): undefined reference to `libintl_textdomain'
sxpm.c:(.text.startup+0x81): undefined reference to `libintl_gettext'
sxpm.c:(.text.startup+0xa17): undefined reference to `libintl_gettext'
collect2: error: ld returned 1 exit status
make[3]: *** [sxpm] Error 1
make[3]: Leaving directory `/home/test/buildroot/output/build/xlib_libXpm-3.5.12/sxpm'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/test/buildroot/output/build/xlib_libXpm-3.5.12'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/test/buildroot/output/build/xlib_libXpm-3.5.12'
make: *** [/home/test/buildroot/output/build/xlib_libXpm-3.5.12/.stamp_built] Error 2

I'll have to investigate.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
