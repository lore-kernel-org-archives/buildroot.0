From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 10 Mar 2015 07:49:21 +0200
Subject: [Buildroot] [PATCH v1 1/3] postgresql: enable uclibc build
In-Reply-To: <trinity-70d0e92e-e432-4b23-bc61-4b06fe6b5a14-1425939165451@3capp-gmx-bs32>
References: <trinity-70d0e92e-e432-4b23-bc61-4b06fe6b5a14-1425939165451@3capp-gmx-bs32>
Message-ID: <20150310054921.GM2518@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, Mar 09, 2015 at 11:12:45PM +0100, Peter Seiderer wrote:
> On Mon, Mar 09, 2015 at 10:15:28PM +0200, Baruch Siach wrote:
> > Hi Peter,
> > 
> > On Mon, Mar 09, 2015 at 08:42:56PM +0100, Peter Seiderer wrote:
> > > diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
> > > index 3ef5e6c..519b2a1 100644
> > > --- a/package/postgresql/Config.in
> > > +++ b/package/postgresql/Config.in
> > > @@ -1,9 +1,5 @@
> > >  config BR2_PACKAGE_POSTGRESQL
> > >     bool "postgresql"
> > > -   # PostgreSQL does not build against uClibc with locales
> > > -   # enabled, due to an uClibc bug, see
> > > -   # http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html.
> > > -   depends on BR2_TOOLCHAIN_USES_GLIBC
> > 
> > Please also remove the BR2_TOOLCHAIN_USES_GLIBC dependency from packages 
> > selecting BR2_PACKAGE_POSTGRESQL.
> 
> Thanks for the reminder, just send out a v2 patchset with the additonal
> uclibc dependency removal from bandwidthd and qt5base/postgresql-plugin...

Thanks.

My grep shows a few more:

BR2_PACKAGE_COLLECTD_POSTGRESQL
BR2_PACKAGE_QT_PSQL
BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
