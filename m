From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 22:57:42 +0200
Subject: [Buildroot] [PATCH v1 1/3] package/qt5: bump version to 5.15.1
In-Reply-To: <20200915180004.2335-1-ps.report@gmx.net>
References: <20200915180004.2335-1-ps.report@gmx.net>
Message-ID: <20200917225742.0123a3ca@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Sep 2020 20:00:02 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> qt5base:
>  - remove 0005-evdevkeyboard-fix-input_event-time-related-compile.patch
>    (upstream [1])
>  - remove 0006-evdevtouch-fix-input_event-time-related-compile.patch
>    (upstream [2])
>  - remove 0007-qimage_conversions-arm-neon-draw-helper-only-availab.patch
>    (upstream [3])
> 
> qt5declarative:
>  - remove 0002-examples-fix-parallel-install.patch
>    (superseeded by upstream commit [4])
> 
> qt5imageformats:
>  - remove 0001-fix-build-on-Arch-Linux.patch
>    (upstream [5])
> 
> qt5tools:
>  - rebased 0001-Disable-designer-tool-fixes-configure-error.patch
> 
> [1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=c5b8b662105cc5ced968da9f567fe1134c52d6b5
> [2] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=71fb4d081c7f3675939ac8c62063631a18175fd1
> [3] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=2246f270ffd3875cad8c334fdf4878be48620514
> [4] https://code.qt.io/cgit/qt/qtdeclarative.git/commit/?id=1f0b3a54ffa2ab0dc0cdff1345980ea68d749d24
> [5] https://code.qt.io/cgit/qt/qtimageformats.git/commit/?id=704868db61be1542c2d9e2b75ead00c45c56cc36
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

There is a small issue when applied, due to the
0002-fix-bison-3.7.patch recently added in qt5webengine, and which is
part of 5.15.1 it seems.

Other than that, I did a legal-info on all qt5 packages, and it looked
good.

Have you updated the package/qt5/qt5webengine/chromium-latest.inc file
? Perhaps it doesn't need any update, I'm just checking.

I will however not apply this patch, as I have some concerns about
PATCH 2/3, which might impact this PATCH 1/3.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
