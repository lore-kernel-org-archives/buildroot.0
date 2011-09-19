From: Rico Bachmann <bachmann@tofwerk.com>
Date: Mon, 19 Sep 2011 16:14:45 +0200
Subject: [Buildroot] add fcgi-2.4.0 package to buildroot
In-Reply-To: <20110916184409.2b4f53ae@skate>
References: <000301cc7486$0778f8f0$166aead0$@com>
 <20110916184409.2b4f53ae@skate>
Message-ID: <001601cc76d6$7c3d1ac0$74b75040$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Urspr?ngliche Nachricht-----
> Von: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Gesendet: Freitag, 16. September 2011 18:44
> An: buildroot at busybox.net
> Cc: bachmann at tofwerk.com
> Betreff: Re: [Buildroot] add fcgi-2.4.0 package to buildroot
> 
> Hello,
> 
> The global formatting of your e-mail is terrible. You should fix your 
> e-mail client.
> 
> Le Fri, 16 Sep 2011 17:33:47 +0200,
> "Rico Bachmann" <bachmann@tofwerk.com> a ?crit :
> 
> >                 LIBFCGI_VERSION = 2.4.0
> >                 LIBFCGI_SOURCE = fcgi-$(LIBFCGI_VERSION).tar.gz
> >                 LIBFCGI_SITE = http://www.fastcgi.com/dist
> >                 LIBFCGI_INSTALL_STAGING = YES
> >                 LIBFCGI_INSTALL_TARGET= YES
> 
> This last line is not needed.
> 
> >                 LIBFCGI_CONF_OPT = --enable-shared
> 
> This is not needed.

I've deleted this 2 lines.

> 
> > /mnt/clfs/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-
> uclibcgnue
> > abi-gcc -pipe -Os -Wall -o .libs/cgi-fcgi cgi-fcgi.o 
> > ../libfcgi/.libs/libfcgi.so -lnsl
> >
> >                 ../libfcgi/.libs/libfcgi.so: warning: gethostbyname
> is
> > obsolescent, use getnameinfo() instead.
> >
> >                 ../libfcgi/.libs/libfcgi.so: undefined reference to 
> > `frexp'
> 
> Looks like it forgets to link against the math library, i.e -lm is 
> missing from the link command line. Probably something not completely 
> correct in fcgi build system.
> 
> Regards,
> 
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux development, consulting, 
> training and support.
> http://free-electrons.com

If I see this right, I have to patch the buildsystem from the original fcgi package?
Then I could add the link to the math library and add the -lm to the command?
Is that the right way to go? Or didn't I understood you right?

I'm now try to understand the automake files of the fcgi.

Greetings Bluefire



Mit freundlichen Gr?ssen

Tofwerk AG, Rico Bachmann

+41 33 511 11 69
bachmann at tofwerk.com
http://www.tofwerk.com
Uttigenstrasse 22
CH - 3600 Thun
