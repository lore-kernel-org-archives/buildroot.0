From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Dec 2018 22:51:44 +0100
Subject: [Buildroot] [PATCH] package/libid3tag: needs autoreconf
In-Reply-To: <20181125144514.17611-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 25 Nov 2018 15:45:14 +0100")
References: <20181125144514.17611-1-yann.morin.1998@free.fr>
Message-ID: <87in0a46tr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > libid3tag uses a very old configure script.
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
 >     http://autobuild.buildroot.org/results/ac3/ac3870208aab6001db6b790b6c5dde64d08f7669/
 >     http://autobuild.buildroot.org/results/cc1/cc18397f38dfd4f1e6605f7a6f58edab49b396ac/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
