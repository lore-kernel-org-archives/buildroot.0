From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 00:19:06 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: always enable openGL
In-Reply-To: <1397944903-23168-1-git-send-email-yann.morin.1998@free.fr>
References: <1397944903-23168-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140420001906.6650c12a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 20 Apr 2014 00:01:43 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Currently, we only pass --enable-opengl is at least one DRI driver is
> enabled, since full OpenGL is only possible with a DRI driver (and the
> X.Org stack). Otherwise, we pass --disable-opengl on the assumption that
> OpenGL is not possible.
> 
> But mesa3d's ./configure is a bit weird: enabling OpenGL-ES and diabling
> full OpenGL is an error (see autobuild failure below).
> 
> It turns out that, if there is no DRI driver enabled, but --enable-opengl
> is passed, ./configure will behave properly wrt OpenGL-ES, and will not
> build the full OpenGL libgl.
> 
> Thanks to Paul for explaining this.
> 
> Fixes:
>     http://autobuild.buildroot.net/results/61c/61c1c566dc0e829cb663ca30b1fd6cf9cc6cd931/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Paul Cercueil <paul@crapouillou.net>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
