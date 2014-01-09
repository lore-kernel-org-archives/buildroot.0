From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  9 Jan 2014 13:35:44 +0000 (UTC)
Subject: [Buildroot] [Bug 6770] openssl bump
In-Reply-To: <bug-6770-163@https.bugs.busybox.net/>
References: <bug-6770-163@https.bugs.busybox.net/>
Message-ID: <20140109133544.8691F9C40E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6770

--- Comment #4 from mlweber1 at rockwellcollins.com 2014-01-09 13:35:44 UTC ---
It looks like it's ccache related, below is output from the build of openssl. 
It wasn't creating libcrypto.so, which would explain netsnmp and wpa_supplicant
failing.
I would add ccache to your test build and that should reproduce it.

This was caught by our nightly builder, I think the only difference between the
autobuilder builds and what we do, is that we use ccache (So that might explain
why it didn't catch it).  



make[5]: Entering directory
`/accts/mlweber1/proj/br-continuous/cfgs/10-omap-arm-eglibc-ext/build/openssl-1.0.1f'
/accts/mlweber1/proj/br-continuous/cfgs/10-omap-arm-eglibc-ext/host/usr/bin/ccache:
invalid option -- 'f'
Usage:
    ccache [options]
    ccache compiler [compiler options]
    compiler [compiler options]          (via symbolic link)

Options:
    -c, --cleanup         delete old files and recalculate size counters
                          (normally not needed as this is done automatically)
    -C, --clear           clear the cache completely
    -F, --max-files=N     set maximum number of files in cache to N (use 0 for
                          no limit)
    -M, --max-size=SIZE   set maximum size of cache to SIZE (use 0 for no
                          limit; available suffixes: G, M and K; default
                          suffix: G)
    -s, --show-stats      show statistics summary
    -z, --zero-stats      zero statistics counters

    -h, --help            print this help text
    -V, --version         print version and copyright information

See also <http://ccache.samba.org>.
make[5]: *** [link_a.gnu] Error 1
make[5]: Leaving directory
`/accts/mlweber1/proj/br-continuous/cfgs/10-omap-arm-eglibc-ext/build/openssl-1.0.1f'
make[4]: *** [do_linux-shared] Error 2
make[4]: Leaving directory
`/accts/mlweber1/proj/br-continuous/cfgs/10-omap-arm-eglibc-ext/build/openssl-1.0.1f'
make[4]: Entering directory
`/accts/mlweber1/proj/br-continuous/cfgs/10-omap-arm-eglibc-ext/build/openssl-1.0.1f'

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
