From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 16:43:01 +0200
Subject: [Buildroot] [PATCH v6 3/9] toolchainfile.cmake: set per-config
 appended {C, CXX}FLAGS
In-Reply-To: <20161016111245.1847-4-s.martin49@gmail.com>
References: <20161016111245.1847-1-s.martin49@gmail.com>
 <20161016111245.1847-4-s.martin49@gmail.com>
Message-ID: <20161022164301.01c0a11a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Oct 2016 13:12:39 +0200, Samuel Martin wrote:

> +# Set the {C,CXX}FLAGS appended by CMake depending on the build type
> +# sets by Buildroot.
> +#
> +# Note:
> +#   if the project forces some of these flag variables, Buildroot is
> +#   screwed up and there is nothing Buildroot can do about that :(
> +set(CMAKE_C_FLAGS_DEBUG "" CACHE STRING "Debug CFLAGS")
> +set(CMAKE_CXX_FLAGS_DEBUG "" CACHE STRING "Debug CXXFLAGS")
> +set(CMAKE_C_FLAGS_RELEASE " -DNEBUG" CACHE STRING "Release CFLAGS")
> +set(CMAKE_CXX_FLAGS_RELEASE " -DNEBUG" CACHE STRING "Release CXXFLAGS")

As suggested by Arnout, I've changed this commit to also adjust
CMAKE_Fortran_FLAGS_{DEBUG,RELEASE}. Please double check what I've done.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
