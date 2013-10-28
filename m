From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Sun, 27 Oct 2013 22:09:15 -0200
Subject: [Buildroot] [git commit] qt5base: fix QtGUI build without PNG
	support
In-Reply-To: <20131027072650.994C89BB81@busybox.osuosl.org>
References: <20131027072650.994C89BB81@busybox.osuosl.org>
Message-ID: <CAAEAJfDV+Q+6fGM41L9ddckkJaFzOsc5AGWN447bm01fi5FR+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On 26 October 2013 12:58, Peter Korsgaard <peter@korsgaard.com> wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=0764b1cf4573f7fdae9faa280898a7a9950da100
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Patch from upstream bug report:
> https://bugreports.qt-project.org/browse/QTBUG-33496
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../qt5base-0005-fix-gui-build-without-png.patch   |   22 ++++++++++++++++++++
>  1 files changed, 22 insertions(+), 0 deletions(-)
>
> diff --git a/package/qt5/qt5base/qt5base-0005-fix-gui-build-without-png.patch b/package/qt5/qt5base/qt5base-0005-fix-gui-build-without-png.patch
> new file mode 100644
> index 0000000..ea0a7e3
> --- /dev/null
> +++ b/package/qt5/qt5base/qt5base-0005-fix-gui-build-without-png.patch
> @@ -0,0 +1,22 @@
> +[PATCH] fix QtGUI build without PNG support
> +
> +Upstream bug: https://bugreports.qt-project.org/browse/QTBUG-33496
> +
> +Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> +---
> + src/gui/kernel/qplatformtheme.cpp |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +Index: qt5base-5.1.1/src/gui/kernel/qplatformtheme.cpp
> +===================================================================
> +--- qt5base-5.1.1.orig/src/gui/kernel/qplatformtheme.cpp
> ++++ qt5base-5.1.1/src/gui/kernel/qplatformtheme.cpp
> +@@ -48,7 +48,7 @@
> + #include <QtCore/qfileinfo.h>
> + #include <qpalette.h>
> + #include <qtextformat.h>
> +-#include <qiconloader_p.h>
> ++#include <private/qiconloader_p.h>
> +
> + QT_BEGIN_NAMESPACE
> +

Unless I'm missing something, I think Fatih sent a fix with the same
upstream patch for this issue a long while ago:

http://patchwork.ozlabs.org/patch/280804/

Thanks!
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
