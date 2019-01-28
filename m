From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jan 2019 18:27:12 +0100
Subject: [Buildroot] [PATCH 1/1] libmad: needs autoreconf
In-Reply-To: <20190117203605.7325-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 17 Jan 2019 21:36:05 +0100")
References: <20190117203605.7325-1-fontaine.fabrice@gmail.com>
Message-ID: <8736pcelqn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > libmad uses a very old configure script.
 > When the toolchain lacks C++ and the build machine lacks /lib/cpp, this
 > old configure script fails because it can't find a C++ preprocessor that
 > is valid:

 >     checking for arm-buildroot-linux-uclibcgnueabi-g++... no
 >     checking whether we are using the GNU C++ compiler... no
 >     checking whether no accepts -g... no
 >     checking dependency style of no... none
 >     checking how to run the C++ preprocessor... /lib/cpp
 >     configure: error: C++ preprocessor "/lib/cpp" fails sanity check
 >     See `config.log' for more details.

 > This is yet another case that was tentatively fixed by bd39d11d2e
 > (core/infra: fix build on toolchain without C++), further amended by
 > 4cd1ab15886 (core: alternate solution to disable C++).

 > However, this only works on libtool scripts that are recent enough, and
 > thus we need to autoreconf to get it.

 > We also need to patch configure.ac so that it does not fail on the
 > missing, GNU-specific files: NEWS, AUTHORS, and Changelog.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/6a6aa29295bd70679c3a22a149e79010fa20c1bf

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
