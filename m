From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Oct 2013 17:36:21 +0200
Subject: [Buildroot] [PATCH 1/2] stress: fix download url
In-Reply-To: <1381200229.18302.0.camel@phoenix> (Axel Lin's message of "Tue,
 08 Oct 2013 10:43:49 +0800")
References: <1381200229.18302.0.camel@phoenix>
Message-ID: <874n8r7p1m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 Axel> Signed-off-by: Axel Lin <axel.lin@ingics.com>
 Axel> ---
 Axel>  package/stress/stress.mk | 2 +-
 Axel>  1 file changed, 1 insertion(+), 1 deletion(-)

 Axel> diff --git a/package/stress/stress.mk b/package/stress/stress.mk
 Axel> index df9065a..6e82b50 100644
 Axel> --- a/package/stress/stress.mk
 Axel> +++ b/package/stress/stress.mk
 Axel> @@ -5,7 +5,7 @@
 Axel>  ################################################################################
 
 Axel>  STRESS_VERSION = 1.0.4
 Axel> -STRESS_SITE    = http://weather.ou.edu/~apw/projects/stress
 Axel> +STRESS_SITE = http://people.seas.harvard.edu/~apw/stress

Interestingly enough, this is not identical to the tarball we used to
use:

md5sum stress-1.0.4.*
a607afa695a511765b40993a64c6e2f4  stress-1.0.4.tar.gz
7b0859a66fc14eddb349f2fd19cf023e  stress-1.0.4.tar.gz.new

diff -urpN 1 2|diffstat                                                                             /tmp/i
 ._stress-1.0.4                                |binary
 stress-1.0.4/.DS_Store                        |binary
 stress-1.0.4/._.DS_Store                      |binary
 stress-1.0.4/._AUTHORS                        |binary
 stress-1.0.4/._ChangeLog                      |binary
 stress-1.0.4/._INSTALL                        |binary
 stress-1.0.4/._Makefile.am                    |binary
 stress-1.0.4/._Makefile.in                    |binary
 stress-1.0.4/._NEWS                           |binary
 stress-1.0.4/._README                         |binary
 stress-1.0.4/._TODO                           |binary
 stress-1.0.4/._aclocal.m4                     |binary
 stress-1.0.4/._configure                      |binary
 stress-1.0.4/._configure.in                   |binary
 stress-1.0.4/._depcomp                        |binary
 stress-1.0.4/._doc                            |binary
 stress-1.0.4/._install-sh                     |binary
 stress-1.0.4/._missing                        |binary
 stress-1.0.4/._src                            |binary
 stress-1.0.4/._test                           |binary
 stress-1.0.4/COPYING                          |  897 ++++++++------------------
 stress-1.0.4/doc/._Makefile.am                |binary
 stress-1.0.4/doc/._Makefile.in                |binary
 stress-1.0.4/doc/._mdate-sh                   |binary
 stress-1.0.4/doc/._stamp-vti                  |binary
 stress-1.0.4/doc/._stress.1                   |binary
 stress-1.0.4/doc/._stress.html                |binary
 stress-1.0.4/doc/._stress.info                |binary
 stress-1.0.4/doc/._stress.texi                |binary
 stress-1.0.4/doc/._texinfo.tex                |binary
 stress-1.0.4/doc/._version.texi               |binary
 stress-1.0.4/src/._Makefile.am                |binary
 stress-1.0.4/src/._Makefile.in                |binary
 stress-1.0.4/src/._stress.c                   |binary
 stress-1.0.4/test/._Makefile.am               |binary
 stress-1.0.4/test/._Makefile.in               |binary
 stress-1.0.4/test/._check_usage_return_code   |binary
 stress-1.0.4/test/._check_version_return_code |binary
 38 files changed, 281 insertions(+), 616 deletions(-)

The new tarball has a bunch of binary .-files, and COPYING is GPL3
instead of GPL2:

diff -u 1/stress-1.0.4/COPYING 2/stress-1.0.4/COPYING|head                                          /tmp/i
--- 1/stress-1.0.4/COPYING	2010-03-19 08:21:09.000000000 +0100
+++ 2/stress-1.0.4/COPYING	2010-03-24 00:34:05.000000000 +0100
@@ -1,622 +1,281 @@
                     GNU GENERAL PUBLIC LICENSE
-                       Version 3, 29 June 2007
+                       Version 2, June 1991
 
- Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
+ 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA

-- 
Bye, Peter Korsgaard
