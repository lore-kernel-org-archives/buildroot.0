From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Sep 2015 18:12:39 +0200
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
 to be symlinks into /usr
In-Reply-To: <55E94CE5.1010308@imgtec.com>
References: <1441324062-31743-1-git-send-email-yann.morin.1998@free.fr>
 <55E94CE5.1010308@imgtec.com>
Message-ID: <20150904161239.GB4540@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2015-09-04 08:48 +0100, Vicente Olivert Riera spake thusly:
> I think you forgot to add "v2" to the subject prefix and also list the
> changes between v1 and v2.

Yup. I rushed that submission. That's bad on my part. Sorry.

> On 09/04/2015 12:47 AM, Yann E. MORIN wrote:
> > Furthermore, this means we're no longer supporting a split-usr setup, so
> > the corresponding configure options have been removed as well for
> > systemd and, when using a merged /usr, for eudev as well.
> 
> taking the last line of that comment into account...
> 
> > diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> > index 1aa74b3..24fe4ed 100644
> > --- a/package/eudev/eudev.mk
> > +++ b/package/eudev/eudev.mk
> > @@ -22,11 +22,9 @@ EUDEV_CONF_ENV += LIBS=-lrt
> >  EUDEV_CONF_OPTS =		\
> >  	--disable-manpages	\
> >  	--sbindir=/sbin		\
> > -	--with-rootlibdir=/lib	\
> >  	--libexecdir=/lib	\
> >  	--with-firmware-path=/lib/firmware	\
> >  	--disable-introspection			\
> > -	--enable-split-usr			\
> >  	--enable-libkmod
> >  
> >  EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
> 
> shouldn't you do that _ONLY_ when BR2_ROOTFS_MERGED_USR is selected?

Yeah. I forgot to git-add before I git-commit --amend.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
