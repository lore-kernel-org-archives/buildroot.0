From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 22:05:11 +0100
Subject: [Buildroot] [PATCH 1/1] libgdiplus: fix cross-compilation error
In-Reply-To: <1450461645-28534-1-git-send-email-sergio.prado@e-labworks.com>
References: <1450461645-28534-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20151218220511.10f22648@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sergio Prado,

On Fri, 18 Dec 2015 16:00:45 -0200, Sergio Prado wrote:
> When cross-compiling with toolchains that validate things like headers
> and libraries paths, we were getting errors like:
> 
> sh-linux-gnu-gcc: ERROR: unsafe header/library path used in
> cross-compilation: '/lib'
> 
> That's because there was an error in the configure script that was not
> generating ldflags correctly, and the generated Makefile was trying to
> link with -L/lib.
> 
> Also, it is necessary to pass a prefix when compiling with libjpeg and
> libtiff support.
> 
> A patch has already been sent upstream.
> 
> Fixes:
> http://autobuild.buildroot.org/results/58cad610b1bde68de82e44bf3c87d7bfcc1fa816/
> http://autobuild.buildroot.org/results/649c258c05293fa5203d7d2c7b20a4265c2815ab/
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  ...01-Fix-compile-error-when-cross-compiling.patch | 35 ++++++++++++++++++++++
>  package/libgdiplus/libgdiplus.mk                   |  4 +--
>  2 files changed, 37 insertions(+), 2 deletions(-)
>  create mode 100644 package/libgdiplus/0001-Fix-compile-error-when-cross-compiling.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
