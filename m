From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Sep 2017 20:39:33 +0200
Subject: [Buildroot] [PATCH 28/49 v2] package/spandsp: new package
In-Reply-To: <7d952133-13ac-56bf-c85c-2aaf37901367@mind.be>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
 <d89d72386ef004f0fdb39074ac4f8814411fe7c8.1504993178.git.yann.morin.1998@free.fr>
 <7d952133-13ac-56bf-c85c-2aaf37901367@mind.be>
Message-ID: <20170924183933.GD2660@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-09-23 18:40 +0200, Arnout Vandecappelle spake thusly:
> On 09-09-17 23:39, Yann E. MORIN wrote:
> [snip]
> > diff --git a/package/spandsp/0001-fix-msse4.x.patch b/package/spandsp/0001-fix-msse4.x.patch
> > new file mode 100644
> > index 0000000000..ba3a3e55e3
> > --- /dev/null
> > +++ b/package/spandsp/0001-fix-msse4.x.patch
> > @@ -0,0 +1,29 @@
> > +diff -durN spandsp-20170713.orig/configure.ac spandsp-20170713/configure.ac
> > +--- spandsp-20170713.orig/configure.ac	2014-08-09 10:19:27.000000000 +0200
> > ++++ spandsp-20170713/configure.ac	2017-09-07 21:38:36.990854021 +0200
> > +@@ -354,10 +354,10 @@
> 
>  Missing message + SoB. I'd add it myself but I'm not sure what to add :-)

Well, there's not much to say: the flags are incorrectly named in the
configure script, so we just fix them...

> > +         COMP_VENDOR_CFLAGS="-msse4a $COMP_VENDOR_CFLAGS"
> > +     fi
> > +     if test "$enable_sse4_2" = "yes" ; then
> > +-        COMP_VENDOR_CFLAGS="-msse42 $COMP_VENDOR_CFLAGS"
> > ++        COMP_VENDOR_CFLAGS="-msse4.2 $COMP_VENDOR_CFLAGS"
> 
>  Are we sure that e.g. GCC 4.3 didn't have the -msse42 flag? So I checked, and
> the flag was added in 4.3, so exactly right :-)

Thanks for answering your own question! ;-)

> > +
> > +SPANDSP_LICENSE = LGPLv2.1 (library), GPLv2 (test suite)
>  Please use SPDX license codes.

ACK.

> > +SPANDSP_LICENSE_FILES = COPYING
>  And add license hashes.

ACK.

>  I'm doing that for the other packages while I'm committing, but since you're
> going to respin this one...

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
