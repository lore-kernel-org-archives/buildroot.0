From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 27 Feb 2012 10:27:00 +0100
Subject: [Buildroot] [PATCH] vlc: QT 4.8 support
In-Reply-To: <1330258433-28465-1-git-send-email-ismael.luceno@gmail.com>
References: <1330258433-28465-1-git-send-email-ismael.luceno@gmail.com>
Message-ID: <4F4B4C64.4040004@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ismael Luceno wrote:
> ---
>   .../multimedia/vlc/vlc-qt-4.8-include-paths.patch  | 2160 ++++++++++++++++++++
>   package/multimedia/vlc/vlc.mk                      |    2 +
>   2 files changed, 2162 insertions(+), 0 deletions(-)
>   create mode 100644 package/multimedia/vlc/vlc-qt-4.8-include-paths.patch

In general you should signoff your patches before submission.

But in the case of this one, it looks like a aprt of your other patch
("vlc: new package"). So it should be in the same commit.

> diff --git a/package/multimedia/vlc/vlc-qt-4.8-include-paths.patch b/package/multimedia/vlc/vlc-qt-4.8-include-paths.patch
> new file mode 100644
> index 0000000..4b2aa34
> --- /dev/null
> +++ b/package/multimedia/vlc/vlc-qt-4.8-include-paths.patch

Here as well you should state why the patch is needed and where
it comes from.

> @@ -0,0 +1,2160 @@
> +--- a/modules/gui/qt4/menus.cpp	2012-02-23 23:11:00.454727021 -0200
> ++++ b/modules/gui/qt4/menus.cpp	2012-02-24 00:06:07.643053650 -0200
> +@@ -50,14 +50,14 @@
> + #include "util/qmenuview.hpp"                     /* Simple Playlist menu */
> + #include "components/playlist/playlist_model.hpp" /* PLModel getter */
> +
> +-#include<QMenu>
> +-#include<QMenuBar>
> +-#include<QAction>
> +-#include<QActionGroup>
> +-#include<QSignalMapper>
> +-#include<QSystemTrayIcon>
> +-#include<QStatusBar>
> +-#include<QFontMetrics>
> ++#include<QtGui/QMenu>
> ++#include<QtGui/QMenuBar>
> ++#include<QtGui/QAction>
> ++#include<QtGui/QActionGroup>
> ++#include<QtCore/QSignalMapper>
> ++#include<QtGui/QSystemTrayIcon>
> ++#include<QtGui/QStatusBar>
> ++#include<QtGui/QFontMetrics>

This a very massive patch just for fixing include paths. Where does the
problem come from, and cannot it be fixed adding a few -I options on the
make commandline?

Luca
