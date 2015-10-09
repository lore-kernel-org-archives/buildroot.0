From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 23:27:04 +0200
Subject: [Buildroot] [PATCH 1/1] ntp: add ntptime option
In-Reply-To: <1444076966-9308-1-git-send-email-james.knight@rockwellcollins.com>
References: <1444076966-9308-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20151009232704.779305e1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Mon,  5 Oct 2015 16:29:26 -0400, James Knight wrote:

> +config BR2_PACKAGE_NTP_NTPTIME
> +	bool "ntptime"
> +	help
> +	  The ntptime utility program is used to read and set kernel time

Line slightly too long.

> diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
> index 5997247..a3818ea 100644
> --- a/package/ntp/ntp.mk
> +++ b/package/ntp/ntp.mk
> @@ -46,6 +46,7 @@ NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPDATE) += ntpdate/ntpdate
>  NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPDC) += ntpdc/ntpdc
>  NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPQ) += ntpq/ntpq
>  NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPSNMPD) += ntpsnmpd/ntpsnmpd
> +NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPTIME) += util/ntptime

This does not build here:

>>> ntp 4.2.8p3 Installing to target
install -m 755 /home/thomas/projets/buildroot/output/build/ntp-4.2.8p3/ntpd/ntpd /home/thomas/projets/buildroot/output/target/usr/sbin/ntpd
test -z "util/ntptime" || install -m 755 /home/thomas/projets/buildroot/output/build/ntp-4.2.8p3/util/ntptime /home/thomas/projets/buildroot/output/target/usr/bin/
install: cannot stat ?/home/thomas/projets/buildroot/output/build/ntp-4.2.8p3/util/ntptime?: No such file or directory
package/pkg-generic.mk:237: recipe for target '/home/thomas/projets/buildroot/output/build/ntp-4.2.8p3/.stamp_target_installed' failed

With the following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.08-rc1-38-gad0f85e.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_NTP=y
# BR2_TARGET_ROOTFS_TAR is not set

Can you look into this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
