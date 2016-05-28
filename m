From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 10:56:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/mplayer: add x86-specific
 configure options
In-Reply-To: <1464421808-26484-1-git-send-email-bernd.kuhls@t-online.de>
References: <1464421808-26484-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160528105627.60e29c17@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 May 2016 09:50:08 +0200, Bernd Kuhls wrote:
> The mplayer configure script tries to detect the capabilities of the CPU
> used by probing the host CPU. This leads to compilation failures if the
> target CPU has lesser features, like missing mmx support for
> BR2_x86_i686=y:
> 
> Checking for CPU vendor ... GenuineIntel (6:58:9)
> Checking for CPU type ...  Intel(R) Core(TM) i7-3770S CPU @ 3.10GHz
> Checking for kernel support of sse ... yes
> Checking for kernel support of sse2 ... yes
> Checking for kernel support of sse3 ... yes
> Checking for kernel support of ssse3 ... yes
> Checking for kernel support of sse4_1 ... yes
> Checking for kernel support of sse4_2 ... yes
> Checking for kernel support of avx ... yes
> 
> For this patch I copied most of ffmpeg configure options for x86 CPUs
> because mplayer contains its own copy of ffmpeg.
> 
> Fixes
> http://autobuild.buildroot.net/results/c5a/c5a722607ec9797c317b63b0fd3235608a340c98/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mplayer/mplayer.mk | 56 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 54 insertions(+), 2 deletions(-)

Applied to master, thanks a lot for having looked at this autobuilder
issue!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
