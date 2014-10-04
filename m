From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Oct 2014 19:13:29 +0200
Subject: [Buildroot] [PATCH 05 of 15] packages: rename
 FOO_INSTALL_HOST_OPT into FOO_INSTALL_HOST_OPTS
In-Reply-To: <20141004185259.034d99a6@free-electrons.com>
References: <patchbomb.1411846357@localhost>
 <ba7545d68ae2f0383285.1411846362@localhost>
 <20140927221506.GO4298@free.fr>
 <20141004185259.034d99a6@free-electrons.com>
Message-ID: <20141004171328.GD3990@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-04 18:52 +0200, Thomas Petazzoni spake thusly:
> On Sun, 28 Sep 2014 00:15:06 +0200, Yann E. MORIN wrote:
> 
> > > diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> > > --- a/package/pkg-cmake.mk
> > > +++ b/package/pkg-cmake.mk
> > > @@ -41,7 +41,7 @@
> > >  $(2)_MAKE			?= $$(MAKE)
> > >  $(2)_MAKE_ENV			?=
> > >  $(2)_MAKE_OPTS			?=
> > > -$(2)_INSTALL_HOST_OPT		?= install
> > > +$(2)_INSTALL_HOST_OPTS		?= install
> > 
> > The other infras do not use a 'HOST_' in the middle of host-variant
> > variables; 'HOST_' is only present at the beginning.
> > 
> > For example, we have HOST_LIBFOO_INSTALL_CMDS that contrasts to
> > LIBFOO_INSTALL_{TARGET,STAGING,IMAGES}_CMDS.
> > 
> > So, I find there is a bit of discrepancy in this variable naming. Plus,
> > it is not documented in the manual.
> > 
> > Samuel, is there a reason for the naming of this variable?
> 
> I fully agree with Yann comments here. Samuel, could you answer Yann's
> question?
> 
> Is anyone willing to cook a patch to fix this?

I'll do, but not before this patch is applied ;-), otherwise it will
again be a nightmare to rebase...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
