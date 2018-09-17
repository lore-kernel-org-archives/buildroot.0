From: Mario Lang <mlang@blind.guru>
Date: Mon, 17 Sep 2018 15:39:48 +0200
Subject: [Buildroot] [PATCH 2/2] brltty: bump to version 5.6
In-Reply-To: <20180915102540.12012-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 15 Sep 2018 12:25:40 +0200")
References: <20180915102540.12012-1-fontaine.fabrice@gmail.com>
 <20180915102540.12012-2-fontaine.fabrice@gmail.com>
Message-ID: <87zhwg2qfv.fsf@home.blind.guru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

> - Remove first, second and third patch (already in version)

The third patch (which changes a linker call from ld to gcc)
is actually not merged upstream.  The upstream author
decided to "fix" the issue in a different way.

From looking at the git log, I think the new way of fixing things
is to override the MKREL make variable with something that calls gcc
instead of ld.

Longer story: Changing from ld to gcc fixed our cross-build
issue, but generated a failure while building on Mac OS X.
Forcing gcc over ld shouldn't matter for buildroot, since we
do not build on OS X.

> - Fix major/minor build failure with glibc 2.28, see:
>   https://github.com/brltty/brltty/commit/cee581fac78d29bdf9acb6d1378cf4d005ff3afd
> - Update web site URL to brltty.app, see
>   https://github.com/brltty/brltty/commit/97efaecd6cfb665c0b5f0ac8ec69416618d45635
> - Update license to LPGL-2.1+, see:
>   https://github.com/brltty/brltty/commit/16ccb7d13f018e7557633a24fc02866b85871fa0

All fine, thanks!

What is likely missing is systemd integration. 5.6 changed its
systemd files, in particular, it is now using .path instead of .target
units.  So brltty.mk likely needs updating.

P.S.: 5.7 is about to be released.  I was actually waiting for that to
happen.

-- 
CYa,
  ?????
