From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 21:11:58 +0100
Subject: [Buildroot] [PATCH 1/1] webkitgtk: Add upstream patch to ensure
 CMAKE_BUILD_TYPE is honored
In-Reply-To: <20171129141751.9325-1-aperez@igalia.com>
References: <20171129141751.9325-1-aperez@igalia.com>
Message-ID: <20171129211158.5a23c2bc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Nov 2017 16:17:51 +0200, Adrian Perez de Castro wrote:
> Make WebKitGTK+ honor the value of CMAKE_BUILD_TYPE defined in the CMake
> toolchain file by backporting the following upstream WebKit patch:
> 
>     https://trac.webkit.org/changeset/225168
> 
> This reduces the generated binary sizes when building in "Release" mode
> (BR2_ENABLE_DEBUG=n), for example when targeting ARMv8 the size reduction
> is ~17 MiB.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...s-of-CMAKE_BUILD_TYPE-from-toolchain-file.patch | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 package/webkitgtk/0001-CMake-Values-of-CMAKE_BUILD_TYPE-from-toolchain-file.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
