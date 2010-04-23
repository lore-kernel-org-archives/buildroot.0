From: Nataraj S Narayan <natarajsn@gmail.com>
Date: Fri, 23 Apr 2010 12:25:02 +0000
Subject: [Buildroot] uclibc / glibc rfs issues
In-Reply-To: <87bpda5pid.fsf@macbook.be.48ers.dk>
References: <j2n630286c71004230401i8b185fd2jd5fa0a5465b577f@mail.gmail.com>
	<87ocha5s1z.fsf@macbook.be.48ers.dk>
	<w2k630286c71004230440w822541bdqc0bbd128fb4a2e5e@mail.gmail.com>
	<87fx2m5r3o.fsf@macbook.be.48ers.dk>
	<k2k630286c71004230507hf51966b6qd1d488ee90570fdb@mail.gmail.com>
	<87bpda5pid.fsf@macbook.be.48ers.dk>
Message-ID: <q2h630286c71004230525sf375eb0dg9475db5ed7846a70@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Changed only these by editing .config:-

BR2_DL_DIR="/home/nataraj/buildroot/dl"
 BR2_TARGET_GENERIC_ISSUE="Welcome to MMFSL ucLibc"

So I remove skeleton option?

regards

Nataraj

On Fri, Apr 23, 2010 at 12:20 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Nataraj" == Nataraj S Narayan <natarajsn@gmail.com> writes:
>
> ?Nataraj> Hi Jacmet
> ?Nataraj> My .config:-
>
> Thanks, don't forget to send it to the mailing list, and not just
> straight to me.
>
> ?Nataraj> BR2_HAVE_DOT_CONFIG=y
> ?Nataraj> BR2_VERSION="2010.05-git"
> ?Nataraj> BR2_arm=y
> ?Nataraj> BR2_arm926t=y
>
> ?Nataraj> BR2_ARM_TYPE="ARM926T"
> ?Nataraj> BR2_ARM_EABI=y
> ?Nataraj> BR2_ARCH="arm"
> ?Nataraj> BR2_ENDIAN="LITTLE"
> ?Nataraj> BR2_GCC_TARGET_TUNE="arm9tdmi"
> ?Nataraj> BR2_GCC_TARGET_ARCH="armv5te"
> ?Nataraj> BR2_GCC_TARGET_ABI="aapcs-linux"
>
>
> ?Nataraj> BR2_TARGET_GENERIC_HOSTNAME="buildroot"
> ?Nataraj> BR2_TARGET_GENERIC_ISSUE="Welcome to MMFSL ucLibc"
>
>
> ?Nataraj> BR2_WGET="wget --passive-ftp -nd"
> ?Nataraj> BR2_SVN_CO="svn co"
> ?Nataraj> BR2_SVN_UP="svn up"
> ?Nataraj> BR2_BZR_CO="bzr co"
> ?Nataraj> BR2_BZR_UP="bzr up"
> ?Nataraj> BR2_GIT="git clone"
> ?Nataraj> BR2_ZCAT="gzip -d -c"
> ?Nataraj> BR2_BZCAT="bzcat"
> ?Nataraj> BR2_TAR_OPTIONS=""
> ?Nataraj> BR2_DL_DIR="/home/nataraj/buildroot/dl"
> ?Nataraj> BR2_COPYTO=""
> ?Nataraj> BR2_STAGING_DIR="$(BASE_DIR)/staging"
>
> ?Nataraj> BR2_PRIMARY_SITE=""
> ?Nataraj> BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
> ?Nataraj> BR2_SOURCEFORGE_MIRROR="easynews"
> ?Nataraj> BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
> ?Nataraj> BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
> ?Nataraj> BR2_DEBIAN_MIRROR="http://ftp.debian.org"
> ?Nataraj> BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
> ?Nataraj> BR2_JLEVEL=2
> ?Nataraj> BR2_STRIP_strip=y
> ?Nataraj> BR2_OPTIMIZE_S=y
>
> ?Nataraj> BR2_CONFIG_CACHE=y
>
> ?Nataraj> BR2_TOOLCHAIN_BUILDROOT=y
>
> ?Nataraj> BR2_KERNEL_HEADERS_2_6_32=y
> ?Nataraj> BR2_DEFAULT_KERNEL_HEADERS="2.6.32.11"
>
> ?Nataraj> BR2_UCLIBC_VERSION_0_9_31=y
> ?Nataraj> BR2_UCLIBC_VERSION_STRING="0.9.31"
> ?Nataraj> BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.31.config"
>
> ?Nataraj> BR2_BINUTILS_VERSION_2_20=y
> ?Nataraj> BR2_BINUTILS_VERSION="2.20"
> ?Nataraj> BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
>
> ?Nataraj> BR2_GCC_VERSION_4_3_4=y
> ?Nataraj> BR2_GCC_SUPPORTS_SYSROOT=y
> ?Nataraj> BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
> ?Nataraj> BR2_GCC_VERSION="4.3.4"
> ?Nataraj> BR2_TOOLCHAIN_SYSROOT=y
> ?Nataraj> BR2_EXTRA_GCC_CONFIG_OPTIONS=""
> ?Nataraj> BR2_GCC_SHARED_LIBGCC=y
> ?Nataraj> BR2_GCC_ENABLE_TLS=y
>
>
>
>
> ?Nataraj> BR2_ENABLE_LOCALE=y
> ?Nataraj> BR2_ENABLE_LOCALE_PURGE=y
> ?Nataraj> BR2_ENABLE_LOCALE_WHITELIST="C en_US"
> ?Nataraj> BR2_USE_WCHAR=y
> ?Nataraj> BR2_PREFER_SOFT_FLOAT=y
> ?Nataraj> BR2_SOFT_FLOAT=y
> ?Nataraj> BR2_PTHREADS_OLD=y
> ?Nataraj> BR2_TARGET_OPTIMIZATION="-Os -pipe"
> ?Nataraj> BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
>
> ?Nataraj> BR2_PACKAGE_BUSYBOX=y
> ?Nataraj> BR2_BUSYBOX_VERSION_1_16_X=y
> ?Nataraj> BR2_BUSYBOX_VERSION="1.16.1"
> ?Nataraj> BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
> ?Nataraj> BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.16.x.config"
> ?Nataraj> BR2_PACKAGE_BUSYBOX_SKELETON=y
>
> The busybox skeleton is afaik not used much, so that might cause you
> trouble. That said, it does have a ?/proc entry and no reference to
> configfs - Have you changed anything yourself?
>
> --
> Bye, Peter Korsgaard
>
