From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 10:34:49 +0200
Subject: [Buildroot] [PATCH] package/nvidia-driver: don't install gl.pc
 when not providing libgl
In-Reply-To: <1429911597-19411-1-git-send-email-yann.morin.1998@free.fr>
References: <1429911597-19411-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150425103449.7013d56f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 24 Apr 2015 23:39:57 +0200, Yann E. MORIN wrote:
> When nvidia-driver does not provide libgl (i.e. when it does not install
> the X.org driver), it should also not install gl.pc, otherwise, packages
> that depend on pkg-config will mis-detect presence of GL and fail to
> build, like vlc:
> 
>     http://autobuild.buildroot.org/results/724/724fce8ce51c2c0578192b1369a1cfcea3d72638/
> 
> So, only install gl.pc when we install the X.org driver. Similarly, we
> do not need to install libGL.la either.
> 
> Reported-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/nvidia-driver/nvidia-driver.mk | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
