From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Jan 2019 16:07:27 +0100
Subject: [Buildroot] [PATCH 1/2] pkg-cmake: add CMAKE_SYSTEM_VERSION to
 toolchainfile.cmake
In-Reply-To: <20190110230529.29852-1-arnout@mind.be>
References: <20190110230529.29852-1-arnout@mind.be>
Message-ID: <20190112160727.43c0f7c0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Jan 2019 00:05:28 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Quoting the CMake documentation:
> 
>   When the CMAKE_SYSTEM_NAME variable is set explicitly to enable cross
>   compiling then the value of CMAKE_SYSTEM_VERSION must also be set
>   explicitly to specify the target system version.
> 
> Thus, we should also set CMAKE_SYSTEM_VERSION in toolchainfile.cmake. It
> is supposed to be set to the value of `uname -r` on the target. We don't
> have that exact value available (unless we build the kernel), but the
> value of BR2_TOOLCHAIN_HEADERS_AT_LEAST contains the (minimum) version
> of the kernel it will run on, so it should be OK for all practical
> purposes.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/pkg-cmake.mk                | 1 +
>  support/misc/toolchainfile.cmake.in | 1 +
>  2 files changed, 2 insertions(+)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
