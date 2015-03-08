From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 8 Mar 2015 11:53:18 +0200
Subject: [Buildroot] [PATCH 1/4 v5] package/cmake: make ctest a target
 package too
In-Reply-To: <1425808043-32292-2-git-send-email-s.martin49@gmail.com>
References: <1425808043-32292-1-git-send-email-s.martin49@gmail.com>
 <1425808043-32292-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20150308095318.GY2376@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel, Davide,

On Sun, Mar 08, 2015 at 10:47:20AM +0100, Samuel Martin wrote:
> From: Davide Viti <zinosat@tiscali.it>
> 
> Useful for packages shipped with a testsuite which makes use of ctest
> 
> Since ctest is just a tool provided by the cmake sources, this change
> introduces a hidden BR2_PACKAGE_CMAKE symbol which is automatically
> selected by the BR2_PACKAGE_CMAKE_CTEST one.
> This is like this mostly for consistency (cmake is the actual package,
> not ctest).
> 
> CMake is a particular package:

peculiar ?

> * CMake can be built using the generic infrastructure or the cmake one.
>   Since Buildroot has no requirement regarding the host system cmake
>   program presence, it uses the generic infrastructure to build the
>   host-cmake package, then the (target-)cmake package can be built
>   using the cmake infrastructure;
> * CMake bundles its dependencies within its sources. This is the reason
>   why the host-cmake package only has host-pkgconf as (runtime)
>   dependency, whereas the (target-)cmake package has a lot of
>   dependencies, using only the system-wide libraries instead of
>   rebuilding and staitcally linking with the ones bundles into the CMake
>   sources.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
