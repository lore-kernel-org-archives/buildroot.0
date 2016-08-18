From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2016 22:27:43 +0200
Subject: [Buildroot] [PATCH] pkg-cmake.mk: set CMAKE_SYSROOT variable in
 toolchainfile.cmake
In-Reply-To: <20160817211936.18458-1-s.martin49@gmail.com>
References: <20160817211936.18458-1-s.martin49@gmail.com>
Message-ID: <20160818222743.0b711732@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Aug 2016 23:19:36 +0200, Samuel Martin wrote:
> This change enforces the CMAKE_SYSROOT value set in the toolchainfile.cmake.
> 
> This fix overrides the CMake heuristics used to guess it, and turns off some
> non-desirable behavior adding "-isystem ..." flags to the compiler command
> line, misleading the compiler and making the build failed due to some
> unfound standard headers.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/f7e/f7e92678e91a6cb15ccf32d4a7d75b39f49d6000/defconfig
>   (and others)
> 
> Cc: Ben Boeckel <mathstuf@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  support/misc/toolchainfile.cmake.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
