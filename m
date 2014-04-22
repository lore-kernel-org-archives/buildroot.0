From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 22 Apr 2014 17:32:04 +0200
Subject: [Buildroot] [PATCH 0/2] postgresql fix and update
Message-ID: <trinity-f4dd828e-606b-4288-97cb-859c8576c57f-1398180724650@3capp-gmx-bs60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Mon, Apr 21, 2014 at 04:21:57PM +0200, Yann E. MORIN wrote:
> On 2014-04-21 11:50 +0200, Thomas Petazzoni spake thusly:
> > Dear Peter Seiderer,
> > 
> > On Mon, 21 Apr 2014 01:25:11 +0200, Peter Seiderer wrote:
> > 
> > > thanks for applying the postgresql package (and for reporting the
> > > uClibc bug upstream).
> > > 
> > > Here two follow up patches (sorry for missing to disable the
> > > automatic readline/zlib selection in the last version).
> > 
> > Related to postgresql, can you have a look at the build problem
> > reported at
> > http://autobuild.buildroot.org/results/32f/32fc178cc3875c32e9b722654676fc44eccde8f1/build-end.log ?
> 
> Oh, that one should be pretty easy, something like:
> 
>     ifeq ($(BR2_PACKAGE_TZDATA),y)
>     POSTGRESQL_DEPENDENCIES += tzdata
>     else
>     POSTGRESQL_DEPENDENCIES += host-zic
>     POSTGRESQL_CONF_ENV += ZIC=$$(ZIC)
>     endif
> 

o.k. works (and tested on a build machine without OS provided zic), will
provide a patch...

Thanks for the suggestion, Peter


> I doubt this one would kill baby seals, but it's totally untested. ;-)
> 
> Note: postgresql is only available with glibc, so we need not care about
> the tz package, which is only for uClibc. So we're fine with only tzdata,
> which is solely for glibc.
> 
> Regards,
> Yann E. MORIN.
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
