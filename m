From: Will Newton <will.newton@gmail.com>
Date: Sat, 6 Nov 2010 15:07:54 +0000
Subject: [Buildroot] Results of random configuration builds
In-Reply-To: <20101106134454.7769d258@surf>
References: <20101106134454.7769d258@surf>
Message-ID: <AANLkTimvA9Tr_Jd8pB1O0_ZtNu6v+tz5cBzGNhgCnME0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 6, 2010 at 12:44 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> I've run a few random build tests yesterday, and analyzed the results a
> bit today. I've set up a small webpage that gathers the results,
> together with the logfile and the configuration for each test.
>
> See http://free-electrons.com/~thomas/pub/buildroot-logs/
>
> Most of the builds are failing. The worst problem is that libglib2 does
> not build in many situations (see
> http://free-electrons.com/~thomas/pub/buildroot-logs/test-195/logfile-end).
> There are also problems with logrotate, gvfs, libgcrypt, olsr, libmad,
> netperf, magiccube4d, libmpeg2, xfsprogs, imagemagick, squid, ltrace,
> tcpdump, bash, gmp, gdb.

I've noticed ltrace breaks quite frequently because it is built from
the debian archive, which doesn't guarantee that the package will
remain available forever. I wonder whether we should be building
anything from the debian archive directly and build from
archive.debian.net instead.
