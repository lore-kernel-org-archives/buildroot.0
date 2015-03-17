From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Mar 2015 20:57:26 +0100
Subject: [Buildroot] [PATCH v1] collectd: add configure hint for
 pg_config
Message-ID: <trinity-1c90f458-4333-4f06-917c-9df0e5804bce-1426622246174@3capp-gmx-bs26>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, Mar 17, 2015 at 01:55:47PM +0100, Thomas Petazzoni wrote:
> Dear Peter Seiderer,
> 
> On Tue, 10 Mar 2015 23:08:07 +0100, Peter Seiderer wrote:
> > Fixes [1] in case postgresql-devel package is installed on the host:
> > 
> >     libpq . . . . . . . . no (libpq-fe.h not found)
> >     postgresql  . . . . . no (dependency error)
> >     configure: error: "Some plugins are missing dependencies - see the summary above for details"
> > 
> > Otherwise fixes the following configure warning:
> > 
> >     configure: WARNING: pg_config returned with status 127
> > 
> > [1] http://autobuild.buildroot.net/results/336/336b3e932be245faa04969af960702af672916dc
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> 
> Seems like it doesn't work:
> http://autobuild.buildroot.org/results/926/926a43b8f635790d7e9abdc977ea803ddaf8a523/build-end.log.
>

Different error:

  checking libpq-fe.h usability... yes
  checking libpq-fe.h presence... yes
  checking for libpq-fe.h... yes
  checking for PQconnectdb in -lpq... no

Will investigate....

Regards,
Peter

> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
