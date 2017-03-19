From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 21:22:40 +0100
Subject: [Buildroot] [PATCH] mesa3d: Add temporary fixes for etnaviv
 rendering
In-Reply-To: <1489951619-12389-1-git-send-email-festevam@gmail.com>
References: <1489951619-12389-1-git-send-email-festevam@gmail.com>
Message-ID: <20170319212240.6737ca0c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Mar 2017 16:26:59 -0300, Fabio Estevam wrote:
> Currently when running Qt5_CinematicExperience demo from Qt5.8 the
> covers of the movies appear with a black box instead of showing the 
> actual art cover.
> 
> Also, the fonts are incorrectly displayed in many cases.
> 
> Fix these issues by applying temporary patches to etnaviv.
> 
> According to Christian Gmeiner and Wladimir J. van der Laan
> the correct solution to this problem is to use shader variants [1].
> 
> Use these temporary patches until the correct solution appears in
> mesa mainline, so that etaniv users can run Qt successfully for
> the time being.
> 
> [1] https://lists.freedesktop.org/archives/mesa-dev/2017-March/147948.html
> 
> Tested on imx6q-sabresd board.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  ...naviv-Cannot-render-to-rb-swapped-formats.patch | 35 ++++++++++++++++++
>  ...ect-PATCH-etnaviv-add-RGBX-RGBA-pixel-for.patch | 41 ++++++++++++++++++++++
>  2 files changed, 76 insertions(+)
>  create mode 100644 package/mesa3d/0006-Revert-etnaviv-Cannot-render-to-rb-swapped-formats.patch
>  create mode 100644 package/mesa3d/0007-Revert-Subject-PATCH-etnaviv-add-RGBX-RGBA-pixel-for.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
