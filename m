From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 23:45:31 +0100
Subject: [Buildroot] [PATCH] package/qt5/qt5base: fix imx6 eglfs support
 with imx-gpu-viv
In-Reply-To: <20201027142833.1138548-1-gary.bisson@boundarydevices.com>
References: <20201027142833.1138548-1-gary.bisson@boundarydevices.com>
Message-ID: <20201031234531.6205501f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 27 Oct 2020 15:28:33 +0100
Gary Bisson <gary.bisson@boundarydevices.com> wrote:

> Last commit fixed eglfs_kms support for i.MX8 platforms that required to
> declare imx-gpu-viv as the gbm provider.
> However, this broke the eglfs "fbdev" imx6 support as gbm isn't provided
> in this case. So limit the gbm option to imx-gpu-viv when wayland
> backend is used only.
> 
> Fixes: 82fb51d3b5 ("package/qt5/qt5base: allow to use imx-gpu-viv as GBM
> provider")
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
