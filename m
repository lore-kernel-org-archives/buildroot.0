From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 20:36:34 +0200
Subject: [Buildroot] [PATCH/next 01/10] package/libldns: new package
In-Reply-To: <1439317015-8031-2-git-send-email-bernd.kuhls@t-online.de>
References: <1439317015-8031-1-git-send-email-bernd.kuhls@t-online.de>
 <1439317015-8031-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150828203634.7ae06d9e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 11 Aug 2015 20:16:46 +0200, Bernd Kuhls wrote:

> diff --git a/package/libldns/libldns.hash b/package/libldns/libldns.hash
> new file mode 100644
> index 0000000..7cc3d43
> --- /dev/null
> +++ b/package/libldns/libldns.hash
> @@ -0,0 +1,2 @@
> +# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.6.17.tar.gz.sha1
> +sha1	4218897b3c002aadfc7280b3f40cda829e05c9a4	ldns-1.6.17.tar.gz

Could you add a locally calculated sha256 ?

> diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
> new file mode 100644
> index 0000000..e087207
> --- /dev/null
> +++ b/package/libldns/libldns.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# libldns
> +#
> +################################################################################
> +
> +LIBLDNS_VERSION = 1.6.17
> +LIBLDNS_SOURCE = ldns-$(LIBLDNS_VERSION).tar.gz
> +LIBLDNS_SITE = http://www.nlnetlabs.nl/downloads/ldns
> +LIBLDNS_LICENSE = BSD-2c

The license is actually BSD-3c.

However, it doesn't build here:

checking for EVP_sha256... no
configure: error: SHA2 enabled, but no SSL support
package/pkg-generic.mk:146: recipe for target '/home/thomas/projets/buildroot/output/build/libldns-1.6.17/.stamp_configured' failed
make[1]: *** [/home/thomas/projets/buildroot/output/build/libldns-1.6.17/.stamp_configured] Error 1

With the following configuration:

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
BR2_PACKAGE_LIBLDNS=y
# BR2_TARGET_ROOTFS_TAR is not set

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
