From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Mar 2017 22:57:59 +0200
Subject: [Buildroot] [PATCH v2] libubox: enable static build
In-Reply-To: <1490784660-15897-1-git-send-email-Rahul.Jain@imgtec.com>
References: <1490784660-15897-1-git-send-email-Rahul.Jain@imgtec.com>
Message-ID: <20170329225759.10c37897@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Mar 2017 16:21:00 +0530, Rahul Jain wrote:
> upstream has added the support to build the static libraries.
> update comment for BR2_STATIC_LIBS for other packages having
> dependency on libubox.
> 
> Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>

Did you test this? libubox tries to unconditionally build a shared
library, so it breaks the build with a static only configuration. Try
this configuration with your patch applied:

BR2_arm=y
BR2_STATIC_LIBS=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2017.02-rc1-70-g7612a7d.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LIBUBOX=y
# BR2_TARGET_ROOTFS_TAR is not set

BR2_STATIC_LIBS is not about being able to build a static library, it's
about using static libraries *only*.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
