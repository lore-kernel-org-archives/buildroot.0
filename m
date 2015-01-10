From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 17:32:11 +0100
Subject: [Buildroot] [PATCH v6 1/1] glmark2: new package
In-Reply-To: <1418553022-24508-1-git-send-email-bernd.kuhls@t-online.de>
References: <1418553022-24508-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150110173211.765cd790@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 14 Dec 2014 11:30:22 +0100, Bernd Kuhls wrote:
> From: Spenser Gilliland <spenser@gillilanding.com>
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I'm sorry, but this still doesn't build for me:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2014.11.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_17=y
BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_GLMARK2=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_RPI_USERLAND=y

gives:

Checking for 'libdrm'                    : not found 
The configuration failed
(complete log in /home/thomas/projets/buildroot/output/build/glmark2-499aa81a68fb4c8aac1c80f0d6a4cce05941c4cc/build/config.log)
package/pkg-generic.mk:172: recipe for target '/home/thomas/projets/buildroot/output/build/glmark2-499aa81a68fb4c8aac1c80f0d6a4cce05941c4cc/.stamp_configured' failed

Can you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
