From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 12 Mar 2008 14:05:12 +0100
Subject: [Buildroot] [patch] Fix Qtopia Core 4 compile and
	installtion	and bump to version 4.4.0 snapshot
In-Reply-To: <d6cda7730803120550t6db30ba0v4d96abf905818ef8@mail.gmail.com>
References: <1205316445.8480.20.camel@localhost>
	<d6cda7730803120516h4025e60bt2c6d1051690963e7@mail.gmail.com>
	<1205325580.8459.3.camel@localhost>
	<d6cda7730803120550t6db30ba0v4d96abf905818ef8@mail.gmail.com>
Message-ID: <1205327112.8459.8.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2008-03-12 at 09:50 -0300, Thiago A. Corr?a wrote:
> >
> >  Like all other packages, set the PATH variable correct, which is done by
> >  TARGET_CONFIGURE_OPTS.
> 
> How exactly? I have a .mk with:
> $(MYPACKAGE_DIR)/.configured: $(MYPACKAGE_DIR)/.unpacked
>         (cd $(MYPACKAGE_DIR); rm -rf Makefile; \
>          $(QTOPIA4_QMAKE) -spec

Change to

$(TARGET_CONFIGURE_OPTS) qmake -spec

> qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++ \
>         )
>         touch $@
> 
> What should I change?
> 
> >  With the old Makefile for Qtopia Core non of the executables made were
> >  executable on target because of weird paths used.
> >
> >  Works for me as it is now, I use the TARGET_CONFIGURE_OPTS and do qmake.
> 
> It worked for me as it was then. The executable on the target ran just fine.
> 

I find that weird, since the libraries had a path issue depending on the
directory you built Qtopia Core.

> >  I guess it would be possible to change the installed mkspecs files, but
> >  I do not see the need.
> 
> AFAIK, makes the life of users of the lib easier, so they can call
> qmake without having to know buildroot specific issues.
> 

Well, when I use the toolchain in Buildroot by placing it first in my
PATH it works strait forward; qmake&&make

When you make a package you must look into how Buildroot does this
anyway.

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
