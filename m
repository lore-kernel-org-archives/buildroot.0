From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 00:31:20 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/mesa3d: Remove libGL
 headers/pkgconfig when OpenGL is disabled
In-Reply-To: <1433711482-32265-1-git-send-email-bernd.kuhls@t-online.de>
References: <1433711482-32265-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150711003120.1b6a720f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun,  7 Jun 2015 23:11:22 +0200, Bernd Kuhls wrote:
> mesa3d defaults to --enable-opengl due to its weird configure.ac:
> http://git.buildroot.net/buildroot/commit/package/mesa3d/mesa3d.mk?id=384d601d4ea2c41bb7928f756bfe88af4d38b38b
> 
> This leads to include/GL/*.h and lib/pkgconfig/gl.pc being installed to
> STAGING_DIR. These files are enough for other packages to wrongly assume
> that libGL.so is present, like vlc.
> 
> Fixes
> http://autobuild.buildroot.net/results/e63/e639dabfb260006acb8a204851b96f9275ce53a7/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: Instead of fixing vlc?s libGL detection let?s remove the superfluous
>     files installed by mesa3d (Yann)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
