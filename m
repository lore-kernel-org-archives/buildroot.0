From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 23:54:53 +0200
Subject: [Buildroot] [PATCH 1/2] package/webkit: Fix detection of egl
 headers provided by rpi-userland
In-Reply-To: <1401366393-5815-2-git-send-email-bernd.kuhls@t-online.de>
References: <1401366393-5815-1-git-send-email-bernd.kuhls@t-online.de>
 <1401366393-5815-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140723235453.5ebea556@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu, 29 May 2014 14:26:32 +0200, Bernd Kuhls wrote:
> quote from webkit/config.log:
> /home/br2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/interface/vcos/vcos_types.h:38:33:
> fatal error: vcos_platform_types.h: No such file or directory
> 
> Package rpi-userland provides this header file, but in a non-default directory,
> therefore use pkg-config to add the appropriate flags.
> 
> Fixes
> http://autobuild.buildroot.net/results/bc0/bc0f9114f9dacf68a510f1e01f2dc3661c34f536/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/webkit/webkit.mk |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Could you update on whether this patch and patch 2/2 in this series are
still needed? There were also unanswered questions in your patch 2/2.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
