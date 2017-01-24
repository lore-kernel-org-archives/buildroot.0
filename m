From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 23:30:39 +1300
Subject: [Buildroot] [2/5] libselinux: bump version to 2.6
In-Reply-To: <20170109161523.6855-2-aduskett@codeblue.com>
References: <20170109161523.6855-1-aduskett@codeblue.com>
 <20170109161523.6855-2-aduskett@codeblue.com>
Message-ID: <20170124233039.1f0813e9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  9 Jan 2017 11:15:20 -0500, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>
> ---
>  package/libselinux/libselinux.hash | 2 +-
>  package/libselinux/libselinux.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

I've tried a build with this entire series of patches applied, and I'm
getting:

/usr/bin/gcc -O2 -I/home/test/buildroot/output/host/usr/include -I../include -I/home/test/buildroot/output/host/usr/include -D_GNU_SOURCE  -DNO_ANDROID_BACKEND   -c -o regex.o regex.c
regex.c:16:2: error: #error __BYTE_ORDER__ not defined. Unable to determine endianness.
make[2]: *** [regex.o] Error 1
make[2]: Leaving directory `/home/test/buildroot/output/build/host-libselinux-2.6/src'
make[1]: *** [all] Error 1
make[1]: Leaving directory `/home/test/buildroot/output/build/host-libselinux-2.6'
make: *** [/home/test/buildroot/output/build/host-libselinux-2.6/.stamp_built] Error 2

The configuration to reproduce is:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_POLICYCOREUTILS=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_CHECKPOLICY=y

Could you have a look?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
