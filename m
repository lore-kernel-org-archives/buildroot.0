From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Feb 2013 22:34:54 +0100
Subject: [Buildroot] [PATCH 6/7] package/dtc: new package
In-Reply-To: <5110B1C5.3040200@mind.be>
References: <cover.1359993560.git.yann.morin.1998@free.fr>
 <cee97011df7a8e715cbb2faad083a8e928f103a2.1359993560.git.yann.morin.1998@free.fr>
 <5110B1C5.3040200@mind.be>
Message-ID: <201302062234.54899.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Tuesday 05 February 2013 Arnout Vandecappelle wrote:
> On 04/02/13 17:01, Yann E. MORIN wrote:
> > dtc is the Device Tree Compiler, and manipulates device trees.
[--SNIP--]
> > +diff -durN dtc-e4b497f367a3b2ae99cc52089a14a221b13a76ef.orig/Makefile dtc-e4b497f367a3b2ae99cc52089a14a221b13a76ef/Makefile
> > +--- dtc-e4b497f367a3b2ae99cc52089a14a221b13a76ef.orig/Makefile	2012-10-22 22:02:47.541240846 +0200
> > ++++ dtc-e4b497f367a3b2ae99cc52089a14a221b13a76ef/Makefile	2012-10-22 22:03:21.151047833 +0200
> > +@@ -18,7 +18,7 @@
> > + CPPFLAGS = -I libfdt -I .
> > + WARNINGS = -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
> > + 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls
> > +-CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
> > ++CFLAGS += -g -Os -fPIC -Werror $(WARNINGS)
> 
>   Actually this is not yet entirely perfect, because the -g -Os -W... 
> should be overridable by the user. I would have put:
> 
> CFLAGS ?= -g -Os -Werror $(WARNINGS)
> CFLAGS += -fPIC
> 
>   (but that's a matter of opinion, I guess.

I like it better, too. Thanks!

> > diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
> > new file mode 100644
> > index 0000000..a0e1e35
> > --- /dev/null
> > +++ b/package/dtc/dtc.mk
> > @@ -0,0 +1,34 @@
> > +#############################################################
> > +#
> > +# dtc
> > +#
> > +#############################################################
> > +
> > +DTC_VERSION         = e4b497f367a3b2ae99cc52089a14a221b13a76ef
> > +DTC_SITE            = git://git.jdl.com/software/dtc.git
> 
>   I realize the choice between the in-kernel or external version was 
> discussed before, but isn't it a bit strange that host-dtc is created 
> from the in-kernel tree, while target-dtc uses the external tree?
> 
>   (this doesn't affect this patch, of course, since host support can be 
> added later).

The dtc in ther kernek tree is built by the kernel's build system and
does not build libfdt. It also lacks a complete and proper Makefile.

The upstream dtc (from which the kernel-bundled one is synced from time
to time) has a complete build system, and is more up-to-date (which
reminds me to bump the sha1 before re-pushing...).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
