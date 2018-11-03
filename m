From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 14:49:17 +0100
Subject: [Buildroot] [PATCH] qt5: use ccache for building host code
In-Reply-To: <20181020132535.24508-1-thomas.petazzoni@bootlin.com>
References: <20181020132535.24508-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181103144917.05c221c1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Sat, 20 Oct 2018 15:25:35 +0200, Thomas Petazzoni wrote:
> qt5 currently doesn't use HOSTCC/HOSTCXX, so it doesn't use ccache
> when building all its host code (especially qmake). This means that
> even with ccache enabled and a hot cache, it still takes a long time
> to build qt5base.
> 
> Before this patch, building qt5base takes:
> 
>  - 446 seconds with a cold ccache
>  - 185 seconds with a hot ccache
> 
> This is because the ccache is not used for host code.
> 
> After this patch, building qt5base takes:
> 
>  - 450 seconds with a cold ccache
>  - 15 seconds with a hot ccache
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Any comment on this patch ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
