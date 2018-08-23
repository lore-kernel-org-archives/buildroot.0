From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 00:10:48 +0200
Subject: [Buildroot] [git commit] linuxptp: add patch to fix
 no-thread/linuxthreads uClibc builds
In-Reply-To: <20180805132759.F12828B4CF@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 5 Aug 2018 15:29:56 +0200")
References: <20180805132759.F12828B4CF@busybox.osuosl.org>
Message-ID: <87ftz4pwd3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=ae2cae70b82bbb1c85307c5947e1b441567038fd
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > linuxptp missing.h header implements a replacement clock_nanosleep()
 > function, which was used when the thread implementation was not NPTL,
 > because uClibc failed to provide clock_nanosleep() in such
 > configurations.

 > However, uClibc-ng has fixed this problem upstream, and has backported
 > this change in Buildroot in patch
 > package/uclibc/0002-librt-declare-clock_nanosleep-independent-of-thread-.patch
 > (the code is upstream and will be part of uClibc-ng 1.0.31). Due to
 > this, there is now a conflicting definition of clock_nanosleep()
 > between the C library and the linuxptp missing.h code, which manifests
 > itself by the following build failure:

 > missing.h:117:19: error: static declaration of 'clock_nanosleep' follows non-static declaration
 >  static inline int clock_nanosleep(clockid_t clock_id, int flags,
 >                    ^~~~~~~~~~~~~~~
 > In file included from clockadj.h:24:0,
 >                  from clockadj.c:24:

 > This commit fixes that by adding a patch that removes the replacement
 > clock_nanosleep() implementation from the linuxptp code base.

 > Fixes:

 >   http://autobuild.buildroot.net/results/bf400095a853f5beb28c77a50fcffefe52c3d769/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
