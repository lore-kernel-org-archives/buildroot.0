From: Rico Bachmann <bachmann@tofwerk.com>
Date: Tue, 17 Apr 2012 12:31:29 +0200
Subject: [Buildroot] [PATCH] Add libapr-package
In-Reply-To: <CAGm1_kuJmt4Z3G-JpODcdZ=UNg7+ZjRN-A30Wq8WvYoQ2eUvFQ@mail.gmail.com>
References: <1334657125-30406-1-git-send-email-bachmann@tofwerk.com>
 <CAGm1_kuJmt4Z3G-JpODcdZ=UNg7+ZjRN-A30Wq8WvYoQ2eUvFQ@mail.gmail.com>
Message-ID: <000f01cd1c85$406a7880$c13f6980$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank for the fast response

I'll implement your changes, and try it without LIBAPR_SOURCE


> -----Urspr?ngliche Nachricht-----
> Von: Yegor Yefremov [mailto:yegorslists at googlemail.com]
> Gesendet: Dienstag, 17. April 2012 12:25
> An: Rico Bachmann
> Cc: buildroot at uclibc.org
> Betreff: [**SPAM**] Re: [Buildroot] [PATCH] Add libapr-package
> 
> Hi Rico,
> 
> see comments below.
> 
> On Tue, Apr 17, 2012 at 12:05 PM, Rico Bachmann <bachmann@tofwerk.com>
> wrote:
> > Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
> > ---
> >  package/Config.in        |    1 +
> >  package/libapr/Config.in |    7 +++++++
> >  package/libapr/libapr.mk |   13 +++++++++++++
> >  3 files changed, 21 insertions(+), 0 deletions(-)
> >  create mode 100644 package/libapr/Config.in
> >  create mode 100644 package/libapr/libapr.mk
> >
> > diff --git a/package/Config.in b/package/Config.in index
> > 4c6d4d8..ceb5f6d 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -376,6 +376,7 @@ source "package/fftw/Config.in"
> >  source "package/libargtable2/Config.in"
> >  source "package/argp-standalone/Config.in"
> >  source "package/boost/Config.in"
> > +source "package/libapr/Config.in"
> >  source "package/libatomic_ops/Config.in"
> >  source "package/libcap/Config.in"
> >  source "package/libcap-ng/Config.in"
> > diff --git a/package/libapr/Config.in b/package/libapr/Config.in new
> > file mode 100644 index 0000000..51dea91
> > --- /dev/null
> > +++ b/package/libapr/Config.in
> > @@ -0,0 +1,7 @@
> > +config BR2_PACKAGE_LIBAPR
> > +
> > +       bool "libapr"
> > +       help
> > +         The mission of the Apache Portable Runtime (APR) project is
> > + to create and maintain software libraries that provide a
> predictable
> > + and consistent interface to underlying platform-specific
> > + implementations
> > +
> > +         http://apr.apache.org/
> > diff --git a/package/libapr/libapr.mk b/package/libapr/libapr.mk new
> > file mode 100644 index 0000000..3bd5eec
> > --- /dev/null
> > +++ b/package/libapr/libapr.mk
> > @@ -0,0 +1,13 @@
> > +#############################################################
> > +#
> > +# libapr
> > +#
> > +#############################################################
> > +LIBAPR_VERSION = 1.4.6
> > +LIBAPR_SOURCE = apr-$(LIBAPR_VERSION).tar.gz
> 
> remove apr-1.4.6-tar.gz from dl folder and try without LIBAPR_SOURCE
> macro
> 
> > +LIBAPR_SITE = http://mirror.switch.ch/mirror/apache/dist/apr/
> > +LIBAPR_INSTALL_STAGING = YES
> > +LIBAPR_INSTALL_TARGET = YES
> 
> remove LIBAPR_INSTALL_TARGET
> 
> > +LIBAPR_CONF_OPT = ac_cv_file__dev_zero=yes
> > +ac_cv_func_setpgrp_void=yes apr_cv_process_shared_works=yes
> > +apr_cv_mutex_robust_shared=no apr_cv_tcp_nodelay_with_cork=yes
> > +ac_cv_sizeof_struct_iovec=8 apr_cv_mutex_recursive=yes
> > +--enable-shared
> > +
> > +$(eval $(call AUTOTARGETS,package,LIBAPR))
> > --
> > 1.7.2.5
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
