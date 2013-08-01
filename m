From: Nicolas =?utf-8?B?TcOpbsOpZ2FsZQ==?= <nicolas.menegale@openwide.fr>
Date: Thu, 1 Aug 2013 10:16:11 +0200 (CEST)
Subject: [Buildroot] [PATCH 1/1] cppcms: new package
In-Reply-To: <20130731190437.6757ad8e@skate>
Message-ID: <146708706.4277516.1375344971763.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks a lot for the investigation and the rework. 
I'll add these functionalities to cppcms in the future, now that we have a clean basis.

Thanks,
Nicolas.

----- Mail original -----
> De: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> ?: "Nicolas M?n?gale" <nicolas.menegale@openwide.fr>
> Cc: buildroot at busybox.net
> Envoy?: Mercredi 31 Juillet 2013 19:04:37
> Objet: Re: [Buildroot] [PATCH 1/1] cppcms: new package
> 
> Dear Nicolas M?n?gale,
> 
> On Thu, 11 Jul 2013 13:42:48 +0200 (CEST), Nicolas M?n?gale wrote:
> > Signed-off-by: Nicolas M?n?gale <nicolas.menegale@openwide.fr>
> > ---
> > v2: iconv/icu related modifications
> > The user can now choose if he want's to build cppcms using icu for
> > having
> > advanced localization features or using iconv.
> > Also in the case that the user uses iconv, if the toolchains
> > already integrate
> > it, iconv won't be compiled.
> > Sorry for the long time it took me to do this modification.
> > CppCMS is a C++ web framework. The cppcms.mk also copy into the
> > host after
> > staging install two scripts needed when you compile an application
> > using the
> > web framework (cppcms_tmpl_cc).
> > As discussed on IRC it's not worth creating an host-cppcms package
> > for one
> > script.
> > ---
> >  package/Config.in        |    1 +
> >  package/cppcms/Config.in |   30 ++++++++++++++++++++++++++++++
> >  package/cppcms/cppcms.mk |   24 ++++++++++++++++++++++++
> >  3 files changed, 55 insertions(+)
> >  create mode 100644 package/cppcms/Config.in
> >  create mode 100644 package/cppcms/cppcms.mk
> 
> I've applied this, but I had to do a bit of tuning, because this
> package doesn't build with uClibc, as it uses <monetary.h> functions,
> that don't exist in uClibc. I've added a glibc dependency, and
> removed
> the wchar dependency. Notice that my attempts to build with uClibc
> also
> allowed to discovered that the package should have depended on thread
> support.
> 
> Moreover, the package apparently offers optional zlib support,
> optional
> gcrypt support, optional OpenSSL support. It'd be good to support
> that
> in the future.
> 
> Thanks,
> 
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> 
