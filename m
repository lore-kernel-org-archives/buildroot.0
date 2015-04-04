From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 19:56:12 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/softether: Fix iconv-related
 compile error
In-Reply-To: <1426408159-24817-1-git-send-email-bernd.kuhls@t-online.de>
References: <1426408159-24817-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150404195612.03843dfe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 15 Mar 2015 09:29:19 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/72e/72eab3a6f162e3c5eac380f88b54d4f314d52445/
> http://autobuild.buildroot.net/results/f47/f473882cd35445cbe5b3b15635d555340183951a/
> http://autobuild.buildroot.net/results/45b/45b54b59935c3994c526593836ad433b82148f12/
> http://autobuild.buildroot.net/results/1e4/1e4af4642691ea9681b39eb1ce4f8107e8c3ff5f/
> http://autobuild.buildroot.net/results/182/182e658723d654d45c683dc2bc0b959c82c37826/
> http://autobuild.buildroot.net/results/446/4467fd6aad86bf176625fdc74f5802f35519f157/
> http://autobuild.buildroot.net/results/4a2/4a2cafabe048c5255b21cf25f149542561f60935/
> http://autobuild.buildroot.net/results/12a/12a9de3d946b1379ed8bc772e556f163af758e6b/
> http://autobuild.buildroot.net/results/795/795b02b656e3a6f265a5182140f4be62cf22ae7f/
> 
> To reproduce the build error I used this defconfig
> 
> BR2_arm=y
> BR2_arm1176jzf_s=y
> BR2_COMPILER_PARANOID_UNSAFE_PATH=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv6-ctng-linux-uclibcgnueabi.tar.xz"
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="armv6-ctng-linux-uclibcgnueabi"
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_9=y
> BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
> BR2_TOOLCHAIN_EXTERNAL_WCHAR=y
> BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_PACKAGE_SOFTETHER=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Nor Peter nor I were able to reproduce the issue, and since then the
softether version has been bumped, and the issue hasn't appeared again
on the autobuilders. So let's assume the issue has been fixed. I'll
mark the patch as Rejected in patchwork.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
