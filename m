From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Aug 2016 15:03:57 +0200
Subject: [Buildroot] [PATCH 1/3] ffmpeg: disable for ARMv7-M
In-Reply-To: <1470864544-31919-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470864544-31919-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160811150357.02dcb440@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Aug 2016 23:29:02 +0200, Thomas Petazzoni wrote:
> In the ffmpeg code, libavutil/arm/asm.S makes some assumption about the
> ARM architecture for which the code is built. Only ARMv4, ARMv5, ARMv6
> and ARMv7-A is supported. Due to this, object files built out of
> ARM-optimized assembly code have the wrong architecture information,
> causing a failure at link time.
> 
> Adding ARMv7-M support would be possible, but it doesn't exist yet in
> ffmpeg, and it's pretty unlikely that ffmpeg will ever be needed on an
> ARMv7-M platform, so this commit takes the simple approach of disabling
> ffmpeg for ARMv7-M.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/ca4c67b093afd6f14349fcdc87b02e0480172e8c/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/ffmpeg/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
