From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 12:39:02 +0200
Subject: [Buildroot] [V2 2/3] prosody: bump to version 0.10.0
In-Reply-To: <20171018164650.514-2-francois.perrad@gadz.org>
References: <20171018164650.514-1-francois.perrad@gadz.org>
 <20171018164650.514-2-francois.perrad@gadz.org>
Message-ID: <20171021123902.3ba3ecf9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Oct 2017 18:46:49 +0200, Francois Perrad wrote:
> This version is not restricted to Lua 5.1.
> The configure script try to run lua, so it needs a host lua.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

This fails to build with the following configuration:

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
BR2_PACKAGE_LUA_5_1=y
BR2_PACKAGE_PROSODY=y
# BR2_TARGET_ROOTFS_TAR is not set

With this failure:

table.c: In function ?Lpack?:
table.c:14:2: error: ?for? loop initial declarations are only allowed in C99 or C11 mode
  for(int arg = n_args; arg >= 1; arg--) {
  ^
table.c:14:2: note: use option -std=c99, -std=gnu99, -std=c11 or -std=gnu11 to compile your code
make[3]: *** [<builtin>: table.o] Error 1
make[3]: *** Waiting for unfinished jobs....
rm net.o encodings.o pposix.o hashes.o signal.o
make[2]: *** [Makefile:25: all] Error 2

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
