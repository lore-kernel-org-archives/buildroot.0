From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 7 Mar 2016 07:40:31 +0200
Subject: [Buildroot] [PATCH 1/2] Set PGROOT dir owner to be "postgres".
In-Reply-To: <20160307045142.GM2877@tarshish>
References: <1457296152-4047-1-git-send-email-alan@tkos.co.il>
 <20160307045142.GM2877@tarshish>
Message-ID: <20160307054031.GO2877@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alan,

On Mon, Mar 07, 2016 at 06:51:42AM +0200, Baruch Siach wrote:
> On Sun, Mar 06, 2016 at 10:29:09PM +0200, Alan Yaniger wrote:
> > Without setting the owner of /var/lib/pgsql to the user "postgres", 
> > the postgres server fails to start on boot.
> > 
> > Signed-off-by: Alan Yaniger <alan@tkos.co.il>
> > ---
> >  package/postgresql/postgresql.mk | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> > index 444c1b1..5906ce9 100644
> > --- a/package/postgresql/postgresql.mk
> > +++ b/package/postgresql/postgresql.mk
> > @@ -17,6 +17,10 @@ POSTGRESQL_CONF_ENV = ac_cv_type_struct_sockaddr_in6=yes \
> >  POSTGRESQL_AUTORECONF = YES
> >  POSTGRESQL_CONF_OPTS = --disable-rpath
> >  
> > +define POSTGRESQL_PERMISSIONS
> > +	/var/lib/pgsql d 755 postgres postgres - - - - -
> > +endef
> 
> A better place for this IMO would be near POSTGRESQL_USERS below.

One more comment that I forgot: patch subject line should not end with a full 
stop.

I believe that the maintainer applying these patches can fix those minor 
issues while applying, so unless someone else finds bigger issues with these 
patches you do not need to resend.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
