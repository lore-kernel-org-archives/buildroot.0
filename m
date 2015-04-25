From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Apr 2015 08:38:27 +0200
Subject: [Buildroot] [PATCH] package/nvidia-driver: don't install gl.pc
	when not providing libgl
References: <1429911597-19411-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <XnsA48757E5DADD9berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
news:1429911597-19411-1-git-send-email-yann.morin.1998 at free.fr: 

> When nvidia-driver does not provide libgl (i.e. when it does not install
> the X.org driver), it should also not install gl.pc, otherwise, packages
> that depend on pkg-config will mis-detect presence of GL and fail to
> build, like vlc:
> 
>     http://autobuild.buildroot.org/results/724/724fce8ce51c2c0578192b1369
>     a1cfcea3d72638/ 
> 
> So, only install gl.pc when we install the X.org driver. Similarly, we
> do not need to install libGL.la either.
> 
> Reported-by: Bernd Kuhls
> <bernd.kuhls@t-online.de> Signed-off-by:
> "Yann E. MORIN" <yann.morin.1998@free.fr> Cc: Bernd
> Kuhls <bernd.kuhls@t-online.de> 

Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>
