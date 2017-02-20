From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 21:54:26 +0100
Subject: [Buildroot] [PATCH 1/1] nfs-utils: bump to version 2.1.1
In-Reply-To: <20170220154452.22935-1-aduskett@codeblue.com>
References: <20170220154452.22935-1-aduskett@codeblue.com>
Message-ID: <20170220215426.085a560d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Feb 2017 10:44:52 -0500, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>
> ---
>  package/nfs-utils/nfs-utils.hash | 4 ++--
>  package/nfs-utils/nfs-utils.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

This patch breaks the build with a regular ARM/uClibc configuration:

In file included from network.c:41:0:
/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/linux/in6.h:30:8: error: redefinition of ?struct in6_addr?
 struct in6_addr {
        ^
In file included from /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/netdb.h:27:0,
                 from network.c:34:
/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/netinet/in.h:197:8: note: originally defined here
 struct in6_addr
        ^
In file included from network.c:41:0:
/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/linux/in6.h:41:8: error: redefinition of ?struct sockaddr_in6?
 struct sockaddr_in6 {
        ^
In file included from /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/netinet/in.h:24:0,
                 from /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/netdb.h:27,
                 from network.c:34:
/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/socket.h:91:17: note: originally defined here
 typedef union { __SOCKADDR_ALLTYPES
                 ^
In file included from network.c:41:0:
/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/linux/in6.h:49:8: error: redefinition of ?struct ipv6_mreq?
 struct ipv6_mreq {
        ^
In file included from /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/netdb.h:27:0,
                 from network.c:34:
/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/netinet/in.h:278:8: note: originally defined here
 struct ipv6_mreq
        ^

Please at least test the build with an ARM/uClibc toolchain before
submitting patches. See also support/scripts/test-pkg.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
