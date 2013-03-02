From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Mar 2013 14:50:43 +0100
Subject: [Buildroot] [PATCH 2/3] cpanminus: works with arm & mips
In-Reply-To: <1362220740-17593-2-git-send-email-francois.perrad@gadz.org>
References: <1362220740-17593-1-git-send-email-francois.perrad@gadz.org>
 <1362220740-17593-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <20130302145043.0f45c2f4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Sat,  2 Mar 2013 11:38:59 +0100, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/cpanminus/Config.in    |   15 +++++++++++----
>  package/cpanminus/cpanminus.mk |    2 +-
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/package/cpanminus/Config.in b/package/cpanminus/Config.in
> index b10d211..cf93a7e 100644
> --- a/package/cpanminus/Config.in
> +++ b/package/cpanminus/Config.in
> @@ -1,9 +1,16 @@
>  config BR2_PACKAGE_CPANMINUS
>  	bool "cpanminus"
> -	# Requires host-qemu, which cannot work properly due to kernel
> -	# headers mismatch between the build environment and the
> -	# target.
> -	depends on BR2_BROKEN

Sorry, but I don't see where the problem mentioned in the comment here
has been solved. Anything using host-qemu to help in cross-compilation
cannot work: it is very likely that the kernel headers used to build
the target toolchain are much more recent than the kernel running on
the build machine. Since the Qemu user-mode emulation works by
converting the target syscall into host syscall, it cannot work when
kernel headers are more recent than the kernel version running on the
build machine.

I don't see how this can be solved, it is a fundamental problem in the
approach.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
