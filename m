From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 12:37:59 +0200
Subject: [Buildroot] [V3 1/3] prosody: bump to version 0.10.0
In-Reply-To: <20171022071716.792-1-francois.perrad@gadz.org>
References: <20171022071716.792-1-francois.perrad@gadz.org>
Message-ID: <20171022123759.7bf669f9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Oct 2017 09:17:14 +0200, Francois Perrad wrote:
> this version is not restricted to Lua 5.1
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

I'm sorry, but it still doesn't build, with the same build error:

table.c: In function ?Lpack?:
table.c:14:2: error: ?for? loop initial declarations are only allowed in C99 or C11 mode
  for(int arg = n_args; arg >= 1; arg--) {
  ^
table.c:14:2: note: use option -std=c99, -std=gnu99, -std=c11 or -std=gnu11 to compile your code

With the same defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-1078-g95b1dae.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LUA=y
BR2_PACKAGE_PROSODY=y
# BR2_TARGET_ROOTFS_TAR is not set

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
