From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 11:04:05 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/ffmpeg: fix nios2 fenv build
 failure
In-Reply-To: <1424459452-9485-1-git-send-email-bernd.kuhls@t-online.de>
References: <1424459452-9485-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150221110405.311de6e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 20 Feb 2015 20:10:52 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/216/216fbc33c4838b1414cb25f823fd1db5c92e33c6/
> http://autobuild.buildroot.net/results/800/800fe1d79ef2e52b86a97feeba85b5c47aff8dcd/
> http://autobuild.buildroot.net/results/8a6/8a6d24ecc6487fd20ba663f71996160124083a68/
> 
> Only the affected toolchains are disabled. When using branch next/ compilation
> works with a buildroot-compiled toolchain using this defconfig:
> 
> BR2_nios2=y
> BR2_PACKAGE_FFMPEG=y
> BR2_PACKAGE_FFMPEG_GPL=y
> BR2_PACKAGE_FFMPEG_NONFREE=y
> BR2_PACKAGE_FFMPEG_FFPLAY=y
> BR2_PACKAGE_FFMPEG_FFSERVER=y
> BR2_PACKAGE_FFMPEG_FFPROBE=y
> BR2_PACKAGE_FFMPEG_AVRESAMPLE=y
> BR2_PACKAGE_FFMPEG_POSTPROC=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ffmpeg/Config.in |    5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
