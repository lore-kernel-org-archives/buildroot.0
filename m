From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Aug 2019 15:14:11 +0200
Subject: [Buildroot] [PATCH 2/3] package/gpsd: requires NTP time hinting
 support
In-Reply-To: <20190806051921.28680-2-bernd.kuhls@t-online.de>
References: <20190806051921.28680-1-bernd.kuhls@t-online.de>
 <20190806051921.28680-2-bernd.kuhls@t-online.de>
Message-ID: <20190806151411.69f45248@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Tue,  6 Aug 2019 07:19:20 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes
> http://autobuild.buildroot.net/results/446/44639b8fe407bee30ac96ab54b8037439f3dac88/
> 
> Mandatory LEAP* defines are only enabled when TIMEHINT_ENABLE is
> enabled: https://gitlab.com/gpsd/gpsd/blob/master/gpsd.h#L293
> 
> And TIMEHINT_ENABLE is only enabled when NTPSHM_ENABLE is enabled:
> https://gitlab.com/gpsd/gpsd/blob/master/gpsd.h#L109
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Perhaps it would be nice to check with upstream if this is intended or
not. Indeed, it is weird that they provide an option, but this option
cannot be disabled. At first sight, it feels like the solution is to
fix the build issue, rather than to always enable the option.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
