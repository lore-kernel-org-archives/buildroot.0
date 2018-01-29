From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 20:49:49 +0100
Subject: [Buildroot] [PATCH 1/1] libpqxx: needs at least gcc 4.8 for
 c++11 features
In-Reply-To: <20180123182443.3088-1-james.knight@rockwellcollins.com> (James
 Knight's message of "Tue, 23 Jan 2018 13:24:43 -0500")
References: <20180123182443.3088-1-james.knight@rockwellcollins.com>
Message-ID: <87wp005tsy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Knight <james.knight@rockwellcollins.com> writes:

 > This package uses autoconf (AX_CXX_COMPILE_STDCXX_11) to validate C++11
 > support. The test code uses an auto static data member for validation;
 > however, support for this only exists in GCC 4.8+ [1]. This causes the
 > configuration script to generated the following errors:

 >     checking whether .../host/bin/powerpc-ctng_e500v2-linux-gnuspe-g++ accepts -g... yes
 >     checking whether .../host/bin/powerpc-ctng_e500v2-linux-gnuspe-g++ supports C++11 features by default... no
 >     checking whether .../host/bin/powerpc-ctng_e500v2-linux-gnuspe-g++ supports C++11 features with -std=c++11... no
 >     checking whether .../host/bin/powerpc-ctng_e500v2-linux-gnuspe-g++ supports C++11 features with +std=c++11... no
 >     checking whether .../host/bin/powerpc-ctng_e500v2-linux-gnuspe-g++ supports C++11 features with -h std=c++11... no
 >     checking whether .../host/bin/powerpc-ctng_e500v2-linux-gnuspe-g++ supports C++11 features with -std=c++0x... no
 >     checking whether .../host/bin/powerpc-ctng_e500v2-linux-gnuspe-g++ supports C++11 features with +std=c++0x... no
 >     checking whether .../host/bin/powerpc-ctng_e500v2-linux-gnuspe-g++ supports C++11 features with -h std=c++0x... no

 > Bumping the required GCC version of this package to at least v4.8.

 > Fixes:

 >     http://autobuild.buildroot.net/results/fae9ccc37c31c6d1852d0dc11d43f9c6ecbf1fe4/

 > [1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=55003

 > Signed-off-by: James Knight <james.knight@rockwellcollins.com>
 > ---
 > See also:

 >     https://git.buildroot.net/buildroot/commit/?id=7ef807aba7a74ef57d6db7f5c3718d21df9db03e

Committed, thanks.

-- 
Bye, Peter Korsgaard
