From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 22:34:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-mga:
 disable DRI support when not available
In-Reply-To: <1447004673-18164-1-git-send-email-bernd.kuhls@t-online.de>
References: <1447004673-18164-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160531223456.6f245cc9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  8 Nov 2015 18:44:32 +0100, Bernd Kuhls wrote:
> configure.ac is not cross-compile aware, a patch fixing DRI detection
> was added in 2009
> http://git.buildroot.net/buildroot/commit/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga-1.4.9.patch?id=59b0aa7a7ee327688a77dd5d01d0b2032f6535a2
> 
> assuming DRI support being present if DRI support was not disabled.
> 
> By default configure.ac assumes "auto" which leads to DRI support being
> enabled even if DRI support is disabled in buildroot config. This patch
> adds --disable-dri to really disable DRI support, fixes:
> 
> http://autobuild.buildroot.net/results/5e5/5e5dbc30e1f30f7d2d614f4a9edb7fe439f73d61/
> http://autobuild.buildroot.net/results/a8f/a8fab920599e7dc77038f3d2a9a699d6823cf3ef/
> http://autobuild.buildroot.net/results/81d/81dbad489412cd28345de364624180cb082b3bb6/
> http://autobuild.buildroot.net/results/53f/53fc0031da2b65890223f3183c77eb66cf0b5273/
> http://autobuild.buildroot.net/results/544/54481a0f8d690e3878f4616ae1f331705e3c34be/
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
