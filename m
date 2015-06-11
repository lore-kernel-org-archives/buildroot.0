From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Jun 2015 20:06:35 +0200
Subject: [Buildroot] [PATCH 02/11 v2] docs/manual: add kernel-module
In-Reply-To: <2037622940.1424474.1434007920086.JavaMail.root@openwide.fr>
References: <97e1da52cd44a346541ddb2e1c6a445fffb79c5b.1433964001.git.yann.morin.1998@free.fr>
 <2037622940.1424474.1434007920086.JavaMail.root@openwide.fr>
Message-ID: <20150611180635.GC3689@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jeremy, All,

On 2015-06-11 09:32 +0200, Jeremy Rosen spake thusly:
> > +Let's look at a more complex example:
> > +
> > +----
> > +01:
> > ################################################################################
> > +02: #
> > +03: # foo
> > +04: #
> > +05:
> > ################################################################################
> > +06:
> > +07: FOO_VERSION = 1.2.3
> > +08: FOO_SOURCE = foo-$(FOO_VERSION).tar.xz
> > +09: FOO_SITE = http://www.foosoftware.org/download
> > +10: FOO_LICENSE = GPLv2
> > +11: FOO_LICENSE_FILES = COPYING
> > +12:
> > +13: FOO_MODULE_SUBDIRS = driver/base
> > +14: FOO_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)
> 
> ^ This variable is not documented anywhere, you might want to do that...

Yup, thanks.

What about:
    http://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/kernel-modules&id=663ab1ec1c3e5b80eae0bdb355bc0e2e0d58497c

(toward the end).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
