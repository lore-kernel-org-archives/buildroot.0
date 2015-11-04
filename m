From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Wed, 04 Nov 2015 21:17:41 +0900
Subject: [Buildroot] [meiwaku] Re:  [PATCH v4 1/1] gauche: new package
In-Reply-To: Your message of Mon, 02 Nov 2015 16:50:16 +0100.
 <20151102165016.62635bd0@free-electrons.com>
Message-ID: <201511041217.tA4CHfYU006745@ms-omx03.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas.

Thank you for your comment.

Replied inline.

> > diff --git a/package/gauche/0002-fix-so-suffix-configure-ac.patch b/package
> /gauche/0002-fix-so-suffix-configure-ac.patch
> > new file mode 100644
> > index 0000000..f9b4459
> > --- /dev/null
> > +++ b/package/gauche/0002-fix-so-suffix-configure-ac.patch
> 
> ... and this should be in the same patch, since it's exactly the same
> change. Also it should carry an explanation as to why we are patching
> the configure script directly instead of patching just configure.ac and
> doing an autoreconf.

Ok, I will do.

> > +GAUCHE_VERSION = 0.9.4
> > +GAUCHE_SOURCE = Gauche-$(GAUCHE_VERSION).tgz
> > +GAUCHE_SITE = http://downloads.sourceforge.net/project/gauche/Gauche
> > +GAUCHE_LICENSE = BSD-3c, Boehm-gc, SRFI (srfi-11.scm), reload (reload.scm)
> > +GAUCHE_LICENSE_FILES = COPYING
> > +GAUCHE_DEPENDENCIES = host-gauche
> > +
> > +# Checking c99 support in configure fails without WCHAR. But we do not
> > +# need WCHAR at gauche runtime, so explicitly specify here.
> 
> This explanation doesn't seem properly worded, because it doesn't at
> all explain why passing -std=gnu99 is solving a wchar problem.

Sorry for my poor explanation.
Does following explanation make sense ?

# Detection of c99 support in configure fails without WCHAR. To enable
# automatic detection of c99 support by configure, we need to enable
# WCHAR in toolchain. But actually we do not need WCHAR at gauche runtime.
# So reuesting WCHAR in toolchain just for automatic detection will be
# overkill. To solve this, explicitly -std=gnu99 is specified here.

Regards,
Kawashima
============================================================
    Hiroshi Kawashima
