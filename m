From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 14:24:50 +0100
Subject: [Buildroot] [PATCH v2] package/bind: fix compile/linking failure
In-Reply-To: <20201217004818.GA349927@pevik> (Petr Vorel's message of "Thu, 17
 Dec 2020 01:48:18 +0100")
References: <20201214222407.23104-1-ps.report@gmx.net>
 <20201217004818.GA349927@pevik>
Message-ID: <8735zwhcyl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

 > Hi Peter,
 >> Fixes:

 >> - http://autobuild.buildroot.net/results/966a3de94aa97fa8e9895eede29c9cbfb4bd7301

 >> .../host/lib/gcc/arm-buildroot-linux-musleabihf/9.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: warning: libisccfg.so.163, needed by ../../lib/bind9/.libs/libbind9.so, not found (try using -rpath or -rpath-link)
 >> .../host/lib/gcc/arm-buildroot-linux-musleabihf/9.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: ../../lib/bind9/.libs/libbind9.so: undefined reference to `cfg_obj_line'

 >> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 >> ---
 >> Changes v1 -> v2:
 >> - ISCCFGDEPLIBS vs. ISCCFGLIBS

 > Thanks for upstreaming this fix (you could have added upstream status):
 > https://gitlab.isc.org/isc-projects/bind9/-/issues/2348

 > But it looks like upstream suggest different fix:
 > https://gitlab.isc.org/isc-projects/bind9/-/merge_requests/4497/diffs
 > (draft, actually two commits).

These have now been merged to the v9_11 branch. Committed after
replacing the patch by the upstream ones, thanks.

-- 
Bye, Peter Korsgaard
