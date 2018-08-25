From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Aug 2018 11:16:55 +0200
Subject: [Buildroot] [PATCH/next 0/7] Preparation for libopenssl version bump
Message-ID: <20180825091702.28471-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this is the next bunch of patches to prepare the version bump of
libopenssl to version 1.1.x. These patches should keep compatability
with version 1.0.2o., tested with this defconfig:

BR2_x86_64=y
BR2_x86_core2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2018.05.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_ECRYPTFS_UTILS=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_RDESKTOP=y
BR2_PACKAGE_IBRCOMMON=y
BR2_PACKAGE_LIBOAUTH=y
BR2_PACKAGE_LIBTORRENT=y
BR2_PACKAGE_IPSEC_TOOLS=y
BR2_PACKAGE_IPSEC_TOOLS_NATT=y
BR2_PACKAGE_IPSEC_TOOLS_FRAG=y
BR2_PACKAGE_IPSEC_TOOLS_DPD=y
BR2_PACKAGE_IPSEC_TOOLS_READLINE=y
BR2_PACKAGE_IPSEC_TOOLS_HYBRID=y
BR2_PACKAGE_POUND=y

$ grep OPENSSL .config
  BR2_PACKAGE_OPENSSL=y
  BR2_PACKAGE_LIBOPENSSL=y
  # BR2_PACKAGE_LIBOPENSSL_BIN is not set
  # BR2_PACKAGE_LIBOPENSSL_ENGINES is not set
  BR2_PACKAGE_HAS_OPENSSL=y
  BR2_PACKAGE_PROVIDES_OPENSSL="libopenssl"
  BR2_PACKAGE_PROVIDES_HOST_OPENSSL="host-libopenssl"

Bernd Kuhls (7):
  package/ecryptfs-utils: Fix build with OpenSSL 1.1.x
  package/ibrcommon: add openssl 1.1 compatibility
  package/ipsec-tools: Fix build with OpenSSL 1.1.x
  package/liboauth: Fix build with OpenSSL 1.1.x
  package/libtorrent: Fix build with OpenSSL 1.1.x
  package/pound: Fix build with OpenSSL 1.1.x
  package/rdesktop: Fix build with OpenSSL 1.1.x

 package/ecryptfs-utils/0002-openssl110.patch  |  173 +++
 ...-added-openssl-1.1-compatibility-264.patch |  357 ++++++
 package/ibrcommon/ibrcommon.hash              |    2 +
 package/ipsec-tools/0006-openssl-1.1.patch    | 1104 +++++++++++++++++
 package/liboauth/0001-openssl-1.1.0.patch     |  154 +++
 package/libtorrent/0002-openssl110.patch      |  109 ++
 package/pound/0002-fix-openssl-1.1.0.patch    |  331 +++++
 package/rdesktop/0002-openssl11.patch         |  130 ++
 8 files changed, 2360 insertions(+)
 create mode 100644 package/ecryptfs-utils/0002-openssl110.patch
 create mode 100644 package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch
 create mode 100644 package/ipsec-tools/0006-openssl-1.1.patch
 create mode 100644 package/liboauth/0001-openssl-1.1.0.patch
 create mode 100644 package/libtorrent/0002-openssl110.patch
 create mode 100644 package/pound/0002-fix-openssl-1.1.0.patch
 create mode 100644 package/rdesktop/0002-openssl11.patch

-- 
2.18.0
