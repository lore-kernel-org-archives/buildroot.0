From: Paul Cercueil <paul@crapouillou.net>
Date: Sat, 05 Sep 2020 00:58:40 +0200
Subject: [Buildroot] [PATCH v2] package/libzip: add patch from upstream
 to fix build
In-Reply-To: <20200904172119.7d25a9e8@windsurf.home>
References: <20200904141839.29071-1-paul@crapouillou.net>
 <20200904172119.7d25a9e8@windsurf.home>
Message-ID: <S5P5GQ.E0W9FQH76M6J2@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le ven. 4 sept. 2020 ? 17:21, Thomas Petazzoni 
<thomas.petazzoni@bootlin.com> a ?crit :
> On Fri,  4 Sep 2020 16:18:39 +0200
> Paul Cercueil <paul@crapouillou.net> wrote:
> 
>>  Cherry-pick a patch from upstream project that fixes the build when 
>> used
>>  with a uClibc based toolchain.
>> 
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
> Could you provide a reasonably minimal defconfig that exhibits the
> issue? I'm not able to reproduce. libzip alone, or libzip + openssl
> builds fine here with a uClibc pre-built toolchain.


BR2_mipsel=y
BR2_mips_xburst=y
# BR2_MIPS_SOFT_FLOAT is not set
BR2_OPTIMIZE_2=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PTHREAD_DEBUG=y
BR2_BINUTILS_VERSION_2_34_X=y
BR2_GCC_VERSION_10_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_GCC_ENABLE_LTO=y
BR2_TARGET_OPTIMIZATION="-pipe"
BR2_TARGET_GENERIC_PASSWD_SHA512=y
BR2_ROOTFS_MERGED_USR=y
BR2_SYSTEM_ENABLE_NLS=y
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_LIBZIP=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_LIBRESSL=y

Cheers,
-Paul
