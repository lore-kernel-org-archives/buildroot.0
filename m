From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 9 Mar 2017 06:27:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-cmake: Use
 CMAKE_<LANG>_COMPILER_LAUNCHER for ccache
In-Reply-To: <20170309010911.1960-1-daniel.black@au.ibm.com>
References: <20170309010911.1960-1-daniel.black@au.ibm.com>
Message-ID: <20170309042720.or2hhr4zvgmrwcd2@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Daniel,

On Thu, Mar 09, 2017 at 12:09:11PM +1100, Daniel Black wrote:
> Since cmake version 3.4.3 CMAKE_<LANG>_COMPILER_LAUNCHER is used as
> the way to invoke things like ccache. We set this to ccache for
> the host and for cross compilers in toolchain.cmake.in. This
> leaves CMAKE_<C,CXX>_COMPILER pointing at the real compiler and
> still uses ccache.
> 
> ref: https://cmake.org/cmake/help/v3.4/variable/CMAKE_LANG_COMPILER_LAUNCHER.html

Currently the oldest version of host installed cmake version that Buildroot 
supports is 3.1. If the dependency checker finds cmake 3.1 and newer installed 
on the host, Buildroot will use it. For your patch to work, you need to bump 
the minimum to 3.4.3. See support/dependencies/check-host-cmake.mk.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
