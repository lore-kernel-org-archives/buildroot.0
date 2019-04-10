From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 19:13:07 +0200
Subject: [Buildroot] [PATCH 1/2] package/libva: remove optional mesa3d
 support
In-Reply-To: <20190407171318.19852-1-bernd.kuhls@t-online.de>
References: <20190407171318.19852-1-bernd.kuhls@t-online.de>
Message-ID: <20190410191307.1681df76@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Sun,  7 Apr 2019 19:13:17 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Kodi 18.0-Leia will support vaapi on r600 and radeonsi.
> We need libva support in mesa3d for this. To avoid the circular
> dependency we switch from using mesa3d in libva to use libva in mesa3d.
> 
> This patch is the first step: disable mesa3d support in libva.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libva/libva.mk | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

I understand the circular dependency issue, but what makes it
reasonable to drop mesa3d support in libva ? Until now, the choice was
rather the opposite: have mesa3d support in libva, and no libva support
in mesa3d. Is there a fundamental reason why one is more useful than
the other ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
