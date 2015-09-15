From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Sep 2015 10:23:52 +0200
Subject: [Buildroot] [PATCH] micropython: new package
In-Reply-To: <CAFOYHZDbMnHj=Lmh27YUSwpMSjD_9R4VFomXVo4nWF8Gg3c4tQ@mail.gmail.com>
References: <1442226102-15878-1-git-send-email-judge.packham@gmail.com>
 <20150914155829.1d326cc0@free-electrons.com>
 <CAFOYHZDbMnHj=Lmh27YUSwpMSjD_9R4VFomXVo4nWF8Gg3c4tQ@mail.gmail.com>
Message-ID: <20150915102352.2d4ab396@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris,

On Tue, 15 Sep 2015 11:01:08 +1200, Chris Packham wrote:

> >  * What happens if we have Micropython installed next to the regular
> >    Python 2 or Python 3 interpreters / standard library on the same
> >    system? Do they conflict or not?
> 
> They're installed in with different executable names and library paths
> so they should co-exist happily.

Good.

> >  * What about all the Python external modules (package/python-*/) we
> >    have in Buildroot? Do they work with Micropython?
> 
> Probably depends on the module, but I assume the answer is mostly no.

Ok. Anyway, the Python external modules are installed
in /usr/lib/python<version>/, so micropython will not see them. So
we're safe if someone enables both micropython, python 2 and a bunch of
python external modules: python 2 will allow to use the python external
modules, and micropython will live its own life without providing
access to the python external modules.

> Some of the "standard" libraries in micropython-lib are stubs to quote
> the readme: "micropython-lib is a highly experimental community
> project". Getting into buildroot is one way of helping them to move
> out of "experimental" status.

Sure, makes sense.

> >> +MICROPYTHON_LIB_VERSION = v0.5
> >> +MICROPYTHON_LIB_SITE = $(call github,micropython,micropython-lib,$(MICROPYTHON_LIB_VERSION))
> >> +MICROPYTHON_LIB_LICENSE_FILES = LICENSE
> >
> > You should define MICROPYTHON_LIB_LICENSE as well.
> 
> That's an interesting problem. It's actually multiple licenses
> (depending on the source of the library) so nothing in the "normal"[1]
> list fits. I could say "various" or enumerate the ones I can identify
> but it would be hard to be accurate.

Isn't it a bit problematic for an open-source project to not have a
clear license (or list of licenses) ? It basically means that you can't
safely redistribute it.

I believe listing all the licenses is the proper course of action here.
Something like:

<foo>_LICENSE = MIT (this, that), BSD-2c (foo, bar)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
