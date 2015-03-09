From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 9 Mar 2015 23:12:45 +0100
Subject: [Buildroot] [PATCH v1 1/3] postgresql: enable uclibc build
Message-ID: <trinity-70d0e92e-e432-4b23-bc61-4b06fe6b5a14-1425939165451@3capp-gmx-bs32>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hallo Baruch,

On Mon, Mar 09, 2015 at 10:15:28PM +0200, Baruch Siach wrote:
> Hi Peter,
> 
> On Mon, Mar 09, 2015 at 08:42:56PM +0100, Peter Seiderer wrote:
> > diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
> > index 3ef5e6c..519b2a1 100644
> > --- a/package/postgresql/Config.in
> > +++ b/package/postgresql/Config.in
> > @@ -1,9 +1,5 @@
> >  config BR2_PACKAGE_POSTGRESQL
> >     bool "postgresql"
> > -   # PostgreSQL does not build against uClibc with locales
> > -   # enabled, due to an uClibc bug, see
> > -   # http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html.
> > -   depends on BR2_TOOLCHAIN_USES_GLIBC
> 
> Please also remove the BR2_TOOLCHAIN_USES_GLIBC dependency from packages 
> selecting BR2_PACKAGE_POSTGRESQL.
> 

Thanks for the reminder, just send out a v2 patchset with the additonal
uclibc dependency removal from bandwidthd and qt5base/postgresql-plugin...

Regards,
Peter

> baruch
> 
> -- 
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
