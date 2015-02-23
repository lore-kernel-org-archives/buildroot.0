From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 23 Feb 2015 21:48:48 +0100
Subject: [Buildroot] [PATCH] qt5base: fix postgresql plugin compile
Message-ID: <trinity-029e1f11-1c38-45fc-978c-a13e07ec471f-1424724528830@3capp-gmx-bs21>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, Feb 23, 2015 at 07:02:52PM +0100, Thomas Petazzoni wrote:
> Dear Peter Seiderer,
> 
> On Thu, 19 Feb 2015 23:04:41 +0100, Peter Seiderer wrote:
> > Add qt5base '-psql_config' configure option and use it to set
> > pg_config path in configure step instead of legacy PSQL_LIBS
> > enviornment variable.
> > 
> > Fixes [1]:
> > 
> > PostgreSQL auto-detection... ()
> > make[1]: Entering directory `/home/peko/autobuild/instance-0/output/build/qt5base-5.4.0/config.tests/unix/psql'
> > /home/peko/autobuild/instance-0/output/host/usr/bin/sh-linux-gnu-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os --sysroot=/home/peko/autobuild/instance-0/output/host/usr/sh4a-buildroot-linux-gnu/sysroot -O2 -O3 -Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I. -I/usr/include/postgresql -o psql.o psql.cpp
> > sh-linux-gnu-g++: ERROR: unsafe header/library path used in cross-compilation: '/usr/include/postgresql'
> > make[1]: *** [psql.o] Error 1
> > make[1]: Leaving directory `/home/peko/autobuild/instance-0/output/build/qt5base-5.4.0/config.tests/unix/psql'
> > PostgreSQL disabled.
> > PostgreSQL support cannot be enabled due to functionality tests!
> >  Turn on verbose messaging (-v) to ./configure to see the final report.
> >  If you believe this message is in error you may use the continue
> >  switch (-continue) to ./configure to continue.
> > make: *** [/home/peko/autobuild/instance-0/output/build/qt5base-5.4.0/.stamp_configured] Error 101
> > make: Leaving directory `/home/peko/autobuild/instance-0/buildroot'
> > 
> > [1] http://autobuild.buildroot.net/results/354/354bae2337703ad8bfb9d33c79538df3017b7fe9/
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> 
> Applied to master, thanks.
>

Thanks from my side ;-)
 
> Can you please submit this patch upstream to the Qt developers?
> 

Done, see https://codereview.qt-project.org/107027

Regards,
Peter

> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
