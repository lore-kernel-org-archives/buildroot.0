From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 17:22:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/supertux: fix debug build on
 uclibc/musl
In-Reply-To: <20190526191814.3942-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 26 May 2019 21:18:14 +0200")
References: <20190526191814.3942-1-fontaine.fabrice@gmail.com>
Message-ID: <8736kmivs6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Always set CMAKE_BUILD_TYPE to Release otherwise supertux will be built
 > with -pg since:
 > https://github.com/SuperTux/supertux/commit/afd5f1b33c110104a7f286d6d7854157919a0a52

 > This will result in the following build failure on uclibc or musl:
 > [ 77%] Linking C executable sq_static
 > CMakeFiles/sq_static.dir/sq.c.o: In function `quit':
 > /home/buildroot/autobuild/instance-3/output/build/supertux-0.6.0/external/squirrel/sq/sq.c:42: undefined reference to `__gnu_mcount_nc'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/b0b2e25af198d01713d1e2bcf38c77ae8ffbd7de

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
