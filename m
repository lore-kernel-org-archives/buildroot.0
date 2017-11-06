From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 6 Nov 2017 16:03:05 +0100
Subject: [Buildroot] [PATCH] qt5base: add qmake.conf fixup for i.MX
 platforms
In-Reply-To: <20170815161428.7765-1-gary.bisson@boundarydevices.com>
References: <20170815161428.7765-1-gary.bisson@boundarydevices.com>
Message-ID: <20171106150305.7ifz7iv2gakyj47e@flea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Aug 15, 2017 at 06:14:28PM +0200, Gary Bisson wrote:
> As stated in QTBUG-61156 [1], since Qt5.9 all the Qt apps fail to start
> on i.MX platforms.
> 
> The reason is that the qmake.conf should apparently now specify which
> eglfs backend to use.
> 
> It can be seen in the qmake.conf example for i.MX [2].
> 
> It has also been integrated into the Yocto meta-freescale layer [3].
> 
> Although this issue can be worked around by exporting a variable
> (QT_QPA_EGLFS_INTEGRATION=eglfs_viv), this patch aims at providing
> a more user-friendly approach by modifying qmake.conf when created.
> 
> [1]: https://bugreports.qt.io/browse/QTBUG-61156
> [2]: https://github.com/qt/qtbase/blob/5.9/mkspecs/devices/linux-imx6-g%2B%2B/qmake.conf#L35
> [3]: https://github.com/Freescale/meta-freescale/blob/master/dynamic-layers/qt5-layer/recipes-qt/qt5/qtbase/0015-Add-eglfs-to-IMX-GPU.patch
>
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

I'm a bit late at the party, but I encountered the same bug, and that
fixed it.

Tested-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 801 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171106/690c0681/attachment.asc>
