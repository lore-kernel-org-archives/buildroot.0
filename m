From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 10 Mar 2015 20:32:14 +0100
Subject: [Buildroot] [PATCH v1 1/3] postgresql: enable uclibc build
Message-ID: <trinity-737a41e1-62af-4ed2-ad51-9bc03d001d62-1426015934558@3capp-gmx-bs12>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Tue, Mar 10, 2015 at 07:49:21AM +0200, Baruch Siach wrote:
> Hi Peter,
> 
> On Mon, Mar 09, 2015 at 11:12:45PM +0100, Peter Seiderer wrote:
> > On Mon, Mar 09, 2015 at 10:15:28PM +0200, Baruch Siach wrote:
> > > Hi Peter,
> > > 
> > > On Mon, Mar 09, 2015 at 08:42:56PM +0100, Peter Seiderer wrote:
> > > > diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
> > > > index 3ef5e6c..519b2a1 100644
> > > > --- a/package/postgresql/Config.in
> > > > +++ b/package/postgresql/Config.in
> > > > @@ -1,9 +1,5 @@
> > > >  config BR2_PACKAGE_POSTGRESQL
> > > >     bool "postgresql"
> > > > -   # PostgreSQL does not build against uClibc with locales
> > > > -   # enabled, due to an uClibc bug, see
> > > > -   # http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html.
> > > > -   depends on BR2_TOOLCHAIN_USES_GLIBC
> > > 
> > > Please also remove the BR2_TOOLCHAIN_USES_GLIBC dependency from packages 
> > > selecting BR2_PACKAGE_POSTGRESQL.
> > 
> > Thanks for the reminder, just send out a v2 patchset with the additonal
> > uclibc dependency removal from bandwidthd and qt5base/postgresql-plugin...
> 
> Thanks.
> 
> My grep shows a few more:
> 
> BR2_PACKAGE_COLLECTD_POSTGRESQL
> BR2_PACKAGE_QT_PSQL
> BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL
> 

Sorry, missed this ones, collectd was to new, the other two where not in Config.in
but hidden in Config.sql.in/Config.ext...

Will send an updated patchset...

Regards (and thanks for the review),
Peter

> baruch
> 
> -- 
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
