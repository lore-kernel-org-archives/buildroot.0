From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 22:31:14 +0200
Subject: [Buildroot] [PATCH 8/8 v11] package/nvidia-tegra23-codecs: new
 package
In-Reply-To: <01c5d72e1eae387c59c3e674635b2e6e5a564a1c.1429635674.git.yann.morin.1998@free.fr>
References: <cover.1429635674.git.yann.morin.1998@free.fr>
 <01c5d72e1eae387c59c3e674635b2e6e5a564a1c.1429635674.git.yann.morin.1998@free.fr>
Message-ID: <20150426223114.73a4f42b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 21 Apr 2015 19:04:44 +0200, Yann E. MORIN wrote:
> From: Nicolas Serafini <nicolas.serafini@sensefly.com>
> 
> nvidia-tegra23-codecs provides various HW-accelerated media codecs, such
> as: AAC3, h264, jpeg, MP3...
> 
> Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
> [me:
>   - split codecs from binaries into this patch
>   - use our extractor helpers
> ]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Changes v9 -> v10:
>   - bump version  (Nicolas)
> ---
>  package/nvidia-tegra23/Config.in                   |  1 +
>  .../nvidia-tegra23/nvidia-tegra23-codecs/Config.in |  7 ++++
>  .../nvidia-tegra23-codecs.hash                     |  3 ++
>  .../nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk | 41 ++++++++++++++++++++++
>  4 files changed, 52 insertions(+)
>  create mode 100644 package/nvidia-tegra23/nvidia-tegra23-codecs/Config.in
>  create mode 100644 package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.hash
>  create mode 100644 package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk

Applied, after doing some changes:

    [Thomas:
      - Remove <pkg>_DEPENDENCIES variable that contained
        nvidia-tegra23-binaries, since this dependency is a runtime
        dependency only.
      - Remove 'NVIDIA_TEGRA23_CODECS_INSTALL_STAGING = NO', since this is
        the default.
      - Remove 'NVIDIA_TEGRA23_CODECS_INSTALL_TARGET = YES', since this is
        the default.
      - Instead of using a NVIDIA_TEGRA23_CODECS_FIRMWARE variable listing
        the firmware files to copy, simply copy all firmware files.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
