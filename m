From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 23:05:22 +0200
Subject: [Buildroot] [PATCH 1/2] fetchmail: gettext is not mandatory
In-Reply-To: <1495227881-1899-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1495227881-1899-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170531230522.14dbba29@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 May 2017 23:04:40 +0200, Thomas Petazzoni wrote:
> Even when locales are enabled, gettext is not mandatory to build
> fetchmail, i.e the following defconfig builds fine:
> 
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.02-1096-g54a5333.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> BR2_PACKAGE_FETCHMAIL=y
> 
> However, if gettext provides libintl, it gets used. Therefore this
> commit moves gettext from a mandatory dependency to an optional
> dependency.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/fetchmail/Config.in    | 1 -
>  package/fetchmail/fetchmail.mk | 8 ++++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)

Both applied to next.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
