From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 09:41:07 +0100
Subject: [Buildroot] [PATCH 0/5] package/cmake: re-introduce cmake-3.7
In-Reply-To: <20170301221413.6cb8f56d@free-electrons.com>
References: <cover.1488305206.git.yann.morin.1998@free.fr>
 <20170301221413.6cb8f56d@free-electrons.com>
Message-ID: <20170302094107.0f66f2c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Mar 2017 22:14:13 +0100, Thomas Petazzoni wrote:

> > Thomas Petazzoni (1):
> >       cmake: adjust dependencies added for libuv
> > 
> > Vicente Olivert Riera (3):
> >       cmake: bump version to 3.7.0
> >       cmake: bump version to 3.7.1
> >       cmake: bump version to 3.7.2
> > 
> > Yann E. MORIN (1):
> >       core/pkg-cmake: provide our own platform description  
> 
> All applied to master. Thanks!

Well, it seems like this introduced some issues.

Look for example at:

  http://autobuild.buildroot.net/?reason=paho-mqtt-c-v1.1.0

paho-mqtt-c builds fine at commit
9951d5c931c419a32d31cc2a67d3a5c388efbed6 (before the CMake changes),
but fails to build at commit 609df3acf644e97d0aa4a66db8998d93f8543f3b
(right after the CMake changes).

Here is a minimal defconfig to reproduce the problem:

BR2_arcle=y
BR2_archs38=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_PAHO_MQTT_C=y
# BR2_TARGET_ROOTFS_TAR is not set

The fastd problems could also be related, but I haven't checked, see
http://autobuild.buildroot.net/?reason=fastd-18.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
