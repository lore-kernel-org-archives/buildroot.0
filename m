From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Feb 2015 19:00:40 +0100
Subject: [Buildroot] [PATCH] package/libevent: fix static build
In-Reply-To: <1424035980-17049-1-git-send-email-romain.naour@openwide.fr>
References: <1424035980-17049-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150223190040.70f41d55@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun, 15 Feb 2015 22:33:00 +0100, Romain Naour wrote:
> For some reason, libevent silently fail to enable openssl support
> even when it's explicitly requested.
> 
> Somes flags are missing when checking for zlib and openssl.
> 
> Fixes:
> http://autobuild.buildroot.net/results/713/71362af474461e99b7c188a316aa644a0faaad2e
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Do you have a defconfig that exhibits the build failure? I've tried the
following minimal defconfig, and it builds fine here:

BR2_bfin=y
BR2_BINFMT_FLAT=y
BR2_COMPILER_PARANOID_UNSAFE_PATH=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_LIBEVENT=y
# BR2_TARGET_ROOTFS_TAR is not set

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
