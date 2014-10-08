From: David Bachelart <david.bachelart@bbright.com>
Date: Wed,  8 Oct 2014 17:00:02 +0200
Subject: [Buildroot] [PATCH v2 0/1] ipmiutil: new package
Message-ID: <1412780403-11092-1-git-send-email-david.bachelart@bbright.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This is my second attempt to add ipmitutil package to buildroot. As suggested by 
Thomas Petazzoni, I added a dependency on BR2_USE_MMU and thread support. I also
removed the dependency on zlib.

The package builds fine using an internal toolchain that has SSP enabled.

I also tried these configs :
http://autobuild.buildroot.org/toolchains/configs/br-arm-basic.config
http://autobuild.buildroot.org/toolchains/configs/br-arm-full.config
http://autobuild.buildroot.org/toolchains/configs/bfin-linux-uclibc.config
http://autobuild.buildroot.org/toolchains/configs/bfin-uclinux.config

Since SSP or MMU is not enabled in those configs, the package can't be built.

David Bachelart (1):
  ipmiutil: new package

 package/Config.in            |    1 +
 package/ipmiutil/Config.in   |   15 +++++++++++++++
 package/ipmiutil/ipmiutil.mk |   15 +++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 package/ipmiutil/Config.in
 create mode 100644 package/ipmiutil/ipmiutil.mk

-- 
1.7.10.4
