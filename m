From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Nov 2016 12:56:47 +0100
Subject: [Buildroot] [PATCH v1] qt5base: fix eglfs compile for
 odroid-mali
In-Reply-To: <1479165400-13248-1-git-send-email-ps.report@gmx.net>
References: <1479165400-13248-1-git-send-email-ps.report@gmx.net>
Message-ID: <20161115125647.26846b6c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Nov 2016 00:16:40 +0100, Peter Seiderer wrote:
> Avoid duplicated struct fbdev_window definition (introduced by [1]) by
> renaming struct fbdev_window to shadow_fbdev_window.
> 
> Fixes [2]:
> 
> qeglfsmaliintegration.cpp:45:8: error: redefinition of 'struct fbdev_window'
>  struct fbdev_window {
>         ^
> In file included from /accts/mlweber1/rc-buildroot-test/scripts/instance-0/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.h:28:0,
>                  from /accts/mlweber1/rc-buildroot-test/scripts/instance-0/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/egl.h:36,
>                  from ../../../eglfs/qeglfsglobal.h:45,
>                  from ../../../eglfs/qeglfsdeviceintegration.h:48,
>                  from qeglfsmaliintegration.h:37,
>                  from qeglfsmaliintegration.cpp:34:
> 
> [1] https://code.qt.io/cgit/qt/qtbase.git/commit/?h=dev&id=58bed4cda98e8e25db8adc61c7db73b6853077dc
> [2] http://autobuild.buildroot.net/results/48c/48c458c035162169e8ca7c34ae65e9064822f25a
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...fs-fix-eglfs_mali-compile-for-odroid-mali.patch | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 package/qt5/qt5base/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
