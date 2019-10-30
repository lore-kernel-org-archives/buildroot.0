From: Matthew Weber <matthew.weber@collins.com>
Date: Wed, 30 Oct 2019 04:54:16 -0500
Subject: [Buildroot] [External] Re: [PATCH 2/3] support/testing: add
 netdata test
In-Reply-To: <87k18mpojr.fsf@grinn-global.com>
References: <20191028161418.163056-1-m.niestroj@grinn-global.com>
 <20191028161418.163056-2-m.niestroj@grinn-global.com>
 <CANQCQpb4UAU96+Jx+mtw=ZGdYWqxv2kZ5vpFGR7LDoPLfT82Cw@mail.gmail.com>
 <87k18mpojr.fsf@grinn-global.com>
Message-ID: <CANQCQpbXi=9usmxvKRXrQOBwr7etJx+tQCBvmSWApk9_9ZGEPQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcin,

On Wed, Oct 30, 2019 at 4:31 AM Marcin Niestr?j
<m.niestroj@grinn-global.com> wrote:
>
> Hi Matt,
>
> Matthew Weber <matthew.weber@collins.com> writes:
>
> > Marcin,
> >
> > On Mon, Oct 28, 2019 at 11:14 AM Marcin Niestroj
> > <m.niestroj@grinn-global.com> wrote:
> >>
> >> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> >
> > $ ./support/testing/run-tests -d dl -k -o test_build_runtest
> > tests.package.test_netdata.TestNetdata
> > 17:11:55 TestNetdata                              Starting
> > 17:11:57 TestNetdata                              Building
> > E
> > ======================================================================
> > ERROR: test_run (tests.package.test_netdata.TestNetdata)
> > ----------------------------------------------------------------------
> > Traceback (most recent call last):
> >   File "/home/user/tmp.X4roUERz2n-buildroot/support/testing/infra/basetest.py",
> > line 77, in setUp
> >     self.b.build()
> >   File "/home/user/tmp.X4roUERz2n-buildroot/support/testing/infra/builder.py",
> > line 75, in build
> >     raise SystemError("Build failed")
> > SystemError: Build failed
> >
> > ----------------------------------------------------------------------
> > Ran 1 test in 250.961s
> >
> > FAILED (errors=1)
> >
> > When I look at the build log, here's the last 20 lines.
> >
> >  /usr/bin/install -c -m 644 packaging/installer/.keep
> > '/home/user/tmp.X4roUERz2n-buildroot/test_build_runtest/TestNetdata/target/var/lib/netdata/registry'
> >  /usr/bin/install -c -m 644 packaging/installer/.keep
> > '/home/user/tmp.X4roUERz2n-buildroot/test_build_runtest/TestNetdata/target/var/cache/netdata'
> >  /usr/bin/install -c -m 644 packaging/installer/.keep
> > '/home/user/tmp.X4roUERz2n-buildroot/test_build_runtest/TestNetdata/target/var/lib/netdata'
> >   /usr/bin/install -c netdata
> > '/home/user/tmp.X4roUERz2n-buildroot/test_build_runtest/TestNetdata/target/usr/sbin'
> > /usr/bin/install: cannot create regular file
> > '/home/user/tmp.X4roUERz2n-buildroot/test_build_runtest/TestNetdata/target/var/log/netdata/.keep':
> > File exists
> >   /usr/bin/install -c apps.plugin cgroup-network perf.plugin
> > slabinfo.plugin
> > '/home/user/tmp.X4roUERz2n-buildroot/test_build_runtest/TestNetdata/target/usr/libexec/netdata/plugins.d'
> > Makefile:3319: recipe for target 'install-dist_logDATA' failed
> > make[5]: *** [install-dist_logDATA] Error 1
> > make[5]: *** Waiting for unfinished jobs....
> > Makefile:3864: recipe for target 'install-am' failed
> > make[4]: *** [install-am] Error 2
> > Makefile:3389: recipe for target 'install-recursive' failed
> > make[3]: *** [install-recursive] Error 1
> > Makefile:3858: recipe for target 'install' failed
> > make[2]: *** [install] Error 2
> > package/pkg-generic.mk:331: recipe for target
> > '/home/user/tmp.X4roUERz2n-buildroot/test_build_runtest/TestNetdata/build/netdata-1.18.1/.stamp_target_installed'
> > failed
> > make[1]: *** [/home/user/tmp.X4roUERz2n-buildroot/test_build_runtest/TestNetdata/build/netdata-1.18.1/.stamp_target_installed]
> > Error 2
> > Makefile:23: recipe for target '_all' failed
> > make: *** [_all] Error 2
> > make: Leaving directory
> > '/home/user/tmp.X4roUERz2n-buildroot/test_build_runtest/TestNetdata'
>
> First of all thank you for review and testing this package!

Np, this one had been on my list for awhile to add.  Thanks for sending it!

>
> Howeve I was not able to reproduce this issue on my PC as well as inside
> Docker image for Gitlab CI. What I understand from the logs is that
> 'cannot create regular file' is the reason for failure. But I still have
> no clue why this file could not be created... In the meantime I will
> send v2 of this patch series. Do you have some idea what could go wrong

> with your test build?

I'll kick off a build and see what I can figure out.  My buildmachine info....
gcc (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0
GNU Make 4.1

Regards,
Matt
