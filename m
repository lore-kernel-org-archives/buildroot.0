From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 22:30:22 +0200
Subject: [Buildroot] [PATCH 6/8 v11] package/nvidia-tegra23-binaries:
 new package
In-Reply-To: <951d8be6053afa65c7392b5e57987955eda7d43b.1429635674.git.yann.morin.1998@free.fr>
References: <cover.1429635674.git.yann.morin.1998@free.fr>
 <951d8be6053afa65c7392b5e57987955eda7d43b.1429635674.git.yann.morin.1998@free.fr>
Message-ID: <20150426223022.22c345d3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 21 Apr 2015 19:04:42 +0200, Yann E. MORIN wrote:
> From: Nicolas Serafini <nicolas.serafini@sensefly.com>
> 
> This patch adds a new package for all libraries and drivers
> provided by Nvidia Linux4Tegra release 16.5.
> 
> We have intermediate .mk and Config.in, because those values will be
> shared with the codecs package, to come in a follow-up patch, like we
> have for the Freescale stuff.
> 
> Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
> [yann.morin.1998 at free.fr:
>   - split jpeg into its own patch
>   - split codecs and gstreamer plugins out into their own packages
>   - do not patch for .pc files, just bundle them in $(@D)
> ]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ben Ben <carmazen84@gmail.com>
> 
> ---
> Changes v10 -> v11:
>   - add dependency on the proper VIDEODRV ABI, and drop all useless
>     ABI choices, since we only have one valid (ABI 14)  (Thomas)
>   - remove superfluous TAB

Applied, after doing a good number of changes:

    [Thomas:
      - don't select BR2_PACKAGE_XLIB_LIBXT, there is no reference to it
        in <pkg>_DEPENDENCIES, and it doesn't seem to be used by any
        library.
      - select BR2_PACKAGE_XLIB_LIBX11, which is referenced by the .mk
        file, and is actually used by the pre-built .so files.
      - do not select BR2_PACKAGE_XLIB_LIBXV, since it isn't used by the
        X.org libraries/drivers, but only the Gstreamer ones.
      - remove 'NVIDIA_TEGRA23_BINARIES_INSTALL_TARGET = YES', it is not
        needed since it is the default.
      - remove the definitions of NVIDIA_TEGRA23_BINARIES_FIRMWARE,
        NVIDIA_TEGRA23_BINARIES_LIBRARIES and
        NVIDIA_TEGRA23_BINARIES_PKGCONFIG, these are very long, and not
        really needed: just copy all the firmware, libraries and .pc files
        with a simple 'cp -dpfr'.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
