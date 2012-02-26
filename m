From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Sun, 26 Feb 2012 10:13:53 -0200
Subject: [Buildroot] [PATCH] vlc: QT 4.8 support
Message-ID: <1330258433-28465-1-git-send-email-ismael.luceno@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 .../multimedia/vlc/vlc-qt-4.8-include-paths.patch  | 2160 ++++++++++++++++++++
 package/multimedia/vlc/vlc.mk                      |    2 +
 2 files changed, 2162 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/vlc/vlc-qt-4.8-include-paths.patch

diff --git a/package/multimedia/vlc/vlc-qt-4.8-include-paths.patch b/package/multimedia/vlc/vlc-qt-4.8-include-paths.patch
new file mode 100644
index 0000000..4b2aa34
--- /dev/null
+++ b/package/multimedia/vlc/vlc-qt-4.8-include-paths.patch
@@ -0,0 +1,2160 @@
+--- a/modules/gui/qt4/menus.cpp	2012-02-23 23:11:00.454727021 -0200
++++ b/modules/gui/qt4/menus.cpp	2012-02-24 00:06:07.643053650 -0200
+@@ -50,14 +50,14 @@
+ #include "util/qmenuview.hpp"                     /* Simple Playlist menu */
+ #include "components/playlist/playlist_model.hpp" /* PLModel getter */
+ 
+-#include <QMenu>
+-#include <QMenuBar>
+-#include <QAction>
+-#include <QActionGroup>
+-#include <QSignalMapper>
+-#include <QSystemTrayIcon>
+-#include <QStatusBar>
+-#include <QFontMetrics>
++#include <QtGui/QMenu>
++#include <QtGui/QMenuBar>
++#include <QtGui/QAction>
++#include <QtGui/QActionGroup>
++#include <QtCore/QSignalMapper>
++#include <QtGui/QSystemTrayIcon>
++#include <QtGui/QStatusBar>
++#include <QtGui/QFontMetrics>
+ 
+ /*
+   This file defines the main menus and the pop-up menu (right-click menu)
+--- a/modules/gui/qt4/qt4.cpp	2012-02-23 22:42:45.760340077 -0200
++++ b/modules/gui/qt4/qt4.cpp	2012-02-24 00:13:04.878082822 -0200
+@@ -26,9 +26,9 @@
+ # include "config.h"
+ #endif
+ 
+-#include <QApplication>
+-#include <QDate>
+-#include <QMutex>
++#include <QtGui/QApplication>
++#include <QtCore/QDate>
++#include <QtCore/QMutex>
+ 
+ #include "qt4.hpp"
+ 
+--- a/modules/gui/qt4/util/qvlcframe.hpp	2012-02-23 23:19:02.211955885 -0200
++++ b/modules/gui/qt4/util/qvlcframe.hpp	2012-02-23 23:26:11.096468958 -0200
+@@ -24,15 +24,15 @@
+ #ifndef _QVLCFRAME_H_
+ #define _QVLCFRAME_H_
+ 
+-#include <QWidget>
+-#include <QDialog>
+-#include <QHBoxLayout>
+-#include <QApplication>
+-#include <QMainWindow>
+-#include <QKeyEvent>
+-#include <QDesktopWidget>
+-#include <QSettings>
+-#include <QStyle>
++#include <QtGui/QWidget>
++#include <QtGui/QDialog>
++#include <QtGui/QHBoxLayout>
++#include <QtGui/QApplication>
++#include <QtGui/QMainWindow>
++#include <QtGui/QKeyEvent>
++#include <QtGui/QDesktopWidget>
++#include <QtCore/QSettings>
++#include <QtGui/QStyle>
+ 
+ #include "qt4.hpp"
+ 
+--- a/modules/gui/qt4/util/qvlcapp.hpp	2012-02-23 23:37:37.700734143 -0200
++++ b/modules/gui/qt4/util/qvlcapp.hpp	2012-02-23 23:42:59.359609963 -0200
+@@ -25,8 +25,8 @@
+ #ifndef _QVLC_APP_H_
+ #define _QVLC_APP_H_
+ 
+-#include <QApplication>
+-#include <QEvent>
++#include <QtGui/QApplication>
++#include <QtCore/QEvent>
+ 
+ #if defined(Q_WS_WIN)
+ #   include "qt4.hpp"
+--- a/modules/gui/qt4/util/qmenuview.hpp	2012-02-23 23:51:47.915786736 -0200
++++ b/modules/gui/qt4/util/qmenuview.hpp	2012-02-23 23:52:11.772822936 -0200
+@@ -24,8 +24,8 @@
+ #ifndef _QMENU_VIEW_H_
+ #define _QMENU_VIEW_H_
+ 
+-#include <QMenu>
+-#include <QAbstractItemModel>
++#include <QtGui/QMenu>
++#include <QtCore/QAbstractItemModel>
+ 
+ class QMenuView : public QMenu
+ {
+--- a/modules/gui/qt4/recents.hpp	2012-02-23 23:36:38.941258079 -0200
++++ b/modules/gui/qt4/recents.hpp	2012-02-23 23:36:53.211074371 -0200
+@@ -26,7 +26,7 @@
+ 
+ #include "qt4.hpp"
+ 
+-#include <QObject>
++#include <QtCore/QObject>
+ class QStringList;
+ class QRegExp;
+ class QSignalMapper;
+--- a/modules/gui/qt4/actions_manager.hpp	2012-02-23 23:42:16.733192416 -0200
++++ b/modules/gui/qt4/actions_manager.hpp	2012-02-23 23:42:28.576697609 -0200
+@@ -30,7 +30,7 @@
+ 
+ #include "qt4.hpp"
+ 
+-#include <QObject>
++#include <QtCore/QObject>
+ typedef enum actionType_e
+ {
+     PLAY_ACTION,
+--- a/modules/gui/qt4/menus.hpp	2012-02-23 23:16:54.673746495 -0200
++++ b/modules/gui/qt4/menus.hpp	2012-02-23 23:17:22.212246434 -0200
+@@ -27,9 +27,9 @@
+ 
+ #include "qt4.hpp"
+ 
+-#include <QObject>
+-#include <QMenu>
+-#include <QVector>
++#include <QtCore/QObject>
++#include <QtGui/QMenu>
++#include <QtCore/QVector>
+ 
+ using namespace std;
+ 
+--- a/modules/gui/qt4/components/open_panels.hpp	2012-02-23 23:33:48.757631286 -0200
++++ b/modules/gui/qt4/components/open_panels.hpp	2012-02-23 23:34:02.433369399 -0200
+@@ -39,7 +39,7 @@
+ #include "ui/open_net.h"
+ #include "ui/open_capture.h"
+ 
+-#include <QFileDialog>
++#include <QtGui/QFileDialog>
+ 
+ #include <limits.h>
+ 
+--- a/modules/gui/qt4/components/preferences_widgets.hpp	2012-02-23 23:28:16.243370425 -0200
++++ b/modules/gui/qt4/components/preferences_widgets.hpp	2012-02-23 23:28:59.805907019 -0200
+@@ -33,18 +33,18 @@
+ #include "qt4.hpp"
+ #include <assert.h>
+ 
+-#include <QWidget>
++#include <QtGui/QWidget>
+ 
+-#include <QCheckBox>
+-#include <QComboBox>
+-#include <QLineEdit>
+-#include <QTreeWidget>
+-#include <QSpinBox>
+-#include <QLabel>
+-#include <QDoubleSpinBox>
+-#include <QPushButton>
+-#include <QDialog>
+-#include <QFontComboBox>
++#include <QtGui/QCheckBox>
++#include <QtGui/QComboBox>
++#include <QtGui/QLineEdit>
++#include <QtGui/QTreeWidget>
++#include <QtGui/QSpinBox>
++#include <QtGui/QLabel>
++#include <QtGui/QDoubleSpinBox>
++#include <QtGui/QPushButton>
++#include <QtGui/QDialog>
++#include <QtGui/QFontComboBox>
+ 
+ class QTreeWidget;
+ class QTreeWidgetItem;
+--- a/modules/gui/qt4/components/playlist/playlist_model.hpp	2012-02-24 00:00:36.969026679 -0200
++++ b/modules/gui/qt4/components/playlist/playlist_model.hpp	2012-02-24 00:01:11.911467683 -0200
+@@ -34,13 +34,13 @@
+ #include "vlc_model.hpp"
+ #include "playlist_item.hpp"
+ 
+-#include <QObject>
+-#include <QEvent>
+-#include <QSignalMapper>
+-#include <QMimeData>
+-#include <QAbstractItemModel>
+-#include <QVariant>
+-#include <QModelIndex>
++#include <QtCore/QObject>
++#include <QtCore/QEvent>
++#include <QtCore/QSignalMapper>
++#include <QtCore/QMimeData>
++#include <QtCore/QAbstractItemModel>
++#include <QtCore/QVariant>
++#include <QtCore/QModelIndex>
+ 
+ class PLItem;
+ class PLSelector;
+--- a/modules/gui/qt4/components/playlist/vlc_model.hpp	2012-02-23 23:43:38.676606952 -0200
++++ b/modules/gui/qt4/components/playlist/vlc_model.hpp	2012-02-23 23:44:37.144037860 -0200
+@@ -33,10 +33,10 @@
+ 
+ #include <vlc_input.h>
+ 
+-#include <QModelIndex>
+-#include <QPixmapCache>
+-#include <QSize>
+-#include <QAbstractItemModel>
++#include <QtCore/QModelIndex>
++#include <QtGui/QPixmapCache>
++#include <QtCore/QSize>
++#include <QtCore/QAbstractItemModel>
+ 
+ 
+ class VLCModel : public QAbstractItemModel
+--- a/modules/gui/qt4/extensions_manager.hpp	2012-02-23 23:46:56.428759504 -0200
++++ b/modules/gui/qt4/extensions_manager.hpp	2012-02-23 23:50:58.557513552 -0200
+@@ -32,9 +32,9 @@
+ 
+ #include "qt4.hpp"
+ 
+-#include <QObject>
+-#include <QMenu>
+-#include <QSignalMapper>
++#include <QtCore/QObject>
++#include <QtGui/QMenu>
++#include <QtCore/QSignalMapper>
+ 
+ class ExtensionsDialogProvider;
+ 
+--- a/modules/gui/qt4/dialogs_provider.hpp	2012-02-23 23:35:40.267803656 -0200
++++ b/modules/gui/qt4/dialogs_provider.hpp	2012-02-23 23:35:55.335718708 -0200
+@@ -34,8 +34,8 @@
+ #include "qt4.hpp"
+ 
+ #include "dialogs/open.hpp"
+-#include <QObject>
+-#include <QStringList>
++#include <QtCore/QObject>
++#include <QtCore/QStringList>
+ 
+ #define TITLE_EXTENSIONS_MEDIA qtr( "Media Files" )
+ #define TITLE_EXTENSIONS_VIDEO qtr( "Video Files" )
+--- a/modules/gui/qt4/main_interface.hpp	2012-02-23 23:26:35.957624631 -0200
++++ b/modules/gui/qt4/main_interface.hpp	2012-02-23 23:26:53.794891652 -0200
+@@ -33,8 +33,8 @@
+  #include <vlc_windows_interfaces.h>
+ #endif
+ 
+-#include <QSystemTrayIcon>
+-#include <QStackedWidget>
++#include <QtGui/QSystemTrayIcon>
++#include <QtGui/QStackedWidget>
+ 
+ class QSettings;
+ class QCloseEvent;
+--- a/modules/gui/qt4/qt4.hpp	2012-02-23 22:41:28.399507903 -0200
++++ b/modules/gui/qt4/qt4.hpp	2012-02-23 22:43:49.060385189 -0200
+@@ -34,7 +34,7 @@
+ #include <vlc_playlist.h>  /* playlist_t */
+ 
+ #define QT_NO_CAST_TO_ASCII
+-#include <QString>
++#include <QtCore/QString>
+ 
+ #if ( QT_VERSION < 0x040600 )
+ # error Update your Qt version to@least 4.6.0
+--- a/modules/gui/qt4/input_manager.hpp	2012-02-23 23:24:27.792335324 -0200
++++ b/modules/gui/qt4/input_manager.hpp	2012-02-23 23:24:48.374951422 -0200
+@@ -34,8 +34,8 @@
+ #include "qt4.hpp"
+ #include "util/singleton.hpp"
+ 
+-#include <QObject>
+-#include <QEvent>
++#include <QtCore/QObject>
++#include <QtCore/QEvent>
+ 
+ 
+ enum {
+--- a/modules/gui/qt4/components/playlist/playlist_item.hpp	2012-02-24 00:57:46.658922629 -0200
++++ b/modules/gui/qt4/components/playlist/playlist_item.hpp	2012-02-24 00:57:56.419163107 -0200
+@@ -28,7 +28,7 @@
+ # include "config.h"
+ #endif
+ 
+-#include <QList>
++#include <QtCore/QList>
+ 
+ class PLItem
+ {
+--- a/modules/gui/qt4/adapters/seekpoints.hpp	2012-02-24 03:54:50.911210467 -0200
++++ b/modules/gui/qt4/adapters/seekpoints.hpp	2012-02-24 04:26:02.312055887 -0200
+@@ -30,9 +30,9 @@
+ #include <vlc_interface.h>
+ #include <vlc_input.h>
+ 
+-#include <QObject>
+-#include <QList>
+-#include <QMutex>
++#include <QtCore/QObject>
++#include <QtCore/QList>
++#include <QtCore/QMutex>
+ 
+ class SeekPoint
+ {
+--- a/modules/gui/qt4/recents.cpp	2012-02-24 04:18:18.119059342 -0200
++++ b/modules/gui/qt4/recents.cpp	2012-02-24 04:22:23.037187179 -0200
+@@ -26,11 +26,11 @@
+ #include "dialogs_provider.hpp"
+ #include "menus.hpp"
+ 
+-#include <QStringList>
+-#include <QAction>
+-#include <QSettings>
+-#include <QRegExp>
+-#include <QSignalMapper>
++#include <QtCore/QStringList>
++#include <QtGui/QAction>
++#include <QtCore/QSettings>
++#include <QtCore/QRegExp>
++#include <QtCore/QSignalMapper>
+ 
+ #ifdef WIN32
+     #include <shlobj.h>
+--- a/modules/gui/qt4/variables.hpp	2012-02-24 03:54:51.057229030 -0200
++++ b/modules/gui/qt4/variables.hpp	2012-02-24 04:19:43.147866072 -0200
+@@ -25,7 +25,7 @@
+ # include <config.h>
+ #endif
+ 
+-#include <QObject>
++#include <QtCore/QObject>
+ #include <vlc_common.h>
+ 
+ class QVLCVariable : public QObject
+--- a/modules/gui/qt4/util/qt_dirs.hpp	2012-02-24 03:49:03.942112474 -0200
++++ b/modules/gui/qt4/util/qt_dirs.hpp	2012-02-24 03:49:22.391457292 -0200
+@@ -24,8 +24,8 @@
+ #ifndef _QT_DIR_H_
+ #define _QT_DIR_H_
+ 
+-#include <QString>
+-#include <QDir>
++#include <QtCore/QString>
++#include <QtCore/QDir>
+ 
+ #define toNativeSeparators( s ) QDir::toNativeSeparators ( s )
+ 
+--- a/modules/gui/qt4/util/pictureflow.hpp	2012-02-24 03:54:50.931213014 -0200
++++ b/modules/gui/qt4/util/pictureflow.hpp	2012-02-24 04:59:49.473697803 -0200
+@@ -28,7 +28,7 @@
+ #ifndef PICTUREFLOW_H
+ #define PICTUREFLOW_H
+ 
+-#include <qwidget.h>
++#include <QtGui/qwidget.h>
+ #include "../components/playlist/playlist_model.hpp" /* getArtPixmap etc */
+ 
+ class PictureFlowPrivate;
+--- a/modules/gui/qt4/util/searchlineedit.cpp	2012-02-24 04:33:19.459905643 -0200
++++ b/modules/gui/qt4/util/searchlineedit.cpp	2012-02-24 05:38:22.202633663 -0200
+@@ -33,10 +33,10 @@
+ 
+ #include "qt4.hpp" /*needed for qtr and CONNECT, but not necessary */
+ 
+-#include <QPainter>
+-#include <QRect>
+-#include <QStyle>
+-#include <QStyleOption>
++#include <QtGui/QPainter>
++#include <QtCore/QRect>
++#include <QtGui/QStyle>
++#include <QtGui/QStyleOption>
+ 
+ #include <vlc_intf_strings.h>
+ 
+--- a/modules/gui/qt4/util/timetooltip.hpp	2012-02-24 03:54:50.916211107 -0200
++++ b/modules/gui/qt4/util/timetooltip.hpp	2012-02-24 04:34:27.587273777 -0200
+@@ -22,8 +22,8 @@
+ #ifndef TIMETOOLTIP_H
+ #define TIMETOOLTIP_H
+ 
+-#include <QWidget>
+-#include <QBitmap>
++#include <QtGui/QWidget>
++#include <QtGui/QBitmap>
+ 
+ class QPaintEvent;
+ class QString;
+--- a/modules/gui/qt4/util/input_slider.cpp	2012-02-24 04:33:19.455907863 -0200
++++ b/modules/gui/qt4/util/input_slider.cpp	2012-02-24 05:37:49.331455910 -0200
+@@ -33,21 +33,21 @@
+ #include "adapters/seekpoints.hpp"
+ #include <vlc_aout_intf.h>
+ 
+-#include <QPaintEvent>
+-#include <QPainter>
+-#include <QBitmap>
+-#include <QPainter>
+-#include <QStyleOptionSlider>
+-#include <QLinearGradient>
+-#include <QTimer>
+-#include <QRadialGradient>
+-#include <QLinearGradient>
+-#include <QSize>
+-#include <QPalette>
+-#include <QColor>
+-#include <QPoint>
+-#include <QPropertyAnimation>
+-#include <QApplication>
++#include <QtGui/QPaintEvent>
++#include <QtGui/QPainter>
++#include <QtGui/QBitmap>
++#include <QtGui/QPainter>
++#include <QtGui/QStyleOptionSlider>
++#include <QtGui/QLinearGradient>
++#include <QtCore/QTimer>
++#include <QtGui/QRadialGradient>
++#include <QtGui/QLinearGradient>
++#include <QtCore/QSize>
++#include <QtGui/QPalette>
++#include <QtGui/QColor>
++#include <QtCore/QPoint>
++#include <QtCore/QPropertyAnimation>
++#include <QtGui/QApplication>
+ 
+ #define MINIMUM 0
+ #define MAXIMUM 1000
+--- a/modules/gui/qt4/util/input_slider.hpp	2012-02-24 03:54:50.918211363 -0200
++++ b/modules/gui/qt4/util/input_slider.hpp	2012-02-24 04:34:34.240119320 -0200
+@@ -33,7 +33,7 @@
+ #include <vlc_common.h>
+ #include "timetooltip.hpp"
+ 
+-#include <QSlider>
++#include <QtGui/QSlider>
+ 
+ #define MSTRTIME_MAX_SIZE 22
+ 
+--- a/modules/gui/qt4/util/timetooltip.cpp	2012-02-24 04:33:19.465902353 -0200
++++ b/modules/gui/qt4/util/timetooltip.cpp	2012-02-24 04:35:28.333994372 -0200
+@@ -21,12 +21,12 @@
+ 
+ #include "timetooltip.hpp"
+ 
+-#include <QApplication>
+-#include <QPainter>
+-#include <QPainterPath>
+-#include <QBitmap>
+-#include <QFontMetrics>
+-#include <QDesktopWidget>
++#include <QtGui/QApplication>
++#include <QtGui/QPainter>
++#include <QtGui/QPainterPath>
++#include <QtGui/QBitmap>
++#include <QtGui/QFontMetrics>
++#include <QtGui/QDesktopWidget>
+ 
+ #define TIP_HEIGHT 5
+ 
+--- a/modules/gui/qt4/util/customwidgets.hpp	2012-02-24 03:44:34.766901699 -0200
++++ b/modules/gui/qt4/util/customwidgets.hpp	2012-02-24 03:48:37.326729799 -0200
+@@ -27,14 +27,14 @@
+ #ifndef _CUSTOMWIDGETS_H_
+ #define _CUSTOMWIDGETS_H_
+ 
+-#include <QLineEdit>
+-#include <QPushButton>
+-#include <QLabel>
+-#include <QStackedWidget>
+-#include <QSpinBox>
+-#include <QList>
+-#include <QTimer>
+-#include <QToolButton>
++#include <QtGui/QLineEdit>
++#include <QtGui/QPushButton>
++#include <QtGui/QLabel>
++#include <QtGui/QStackedWidget>
++#include <QtGui/QSpinBox>
++#include <QtCore/QList>
++#include <QtCore/QTimer>
++#include <QtGui/QToolButton>
+ 
+ class QPixmap;
+ 
+--- a/modules/gui/qt4/util/buttons/RoundButton.cpp	2012-02-24 04:33:19.461904541 -0200
++++ b/modules/gui/qt4/util/buttons/RoundButton.cpp	2012-02-24 04:34:55.250789667 -0200
+@@ -21,8 +21,8 @@
+ 
+ #include "RoundButton.hpp"
+ 
+-#include <QPainter>
+-#include <QStyleOptionToolButton>
++#include <QtGui/QPainter>
++#include <QtGui/QStyleOptionToolButton>
+ 
+ RoundButton::RoundButton( QWidget* parent )
+             : QToolButton( parent )
+--- a/modules/gui/qt4/util/buttons/RoundButton.hpp	2012-02-24 03:54:50.926212379 -0200
++++ b/modules/gui/qt4/util/buttons/RoundButton.hpp	2012-02-24 04:35:22.403240604 -0200
+@@ -22,7 +22,7 @@
+ #ifndef ROUNDBUTTON_H
+ #define ROUNDBUTTON_H
+ 
+-#include <QToolButton>
++#include <QtGui/QToolButton>
+ 
+ class RoundButton : public QToolButton
+ {
+--- a/modules/gui/qt4/util/buttons/DeckButtonsLayout.hpp	2012-02-24 03:54:50.924212125 -0200
++++ b/modules/gui/qt4/util/buttons/DeckButtonsLayout.hpp	2012-02-24 04:52:25.739301348 -0200
+@@ -22,9 +22,9 @@
+ #ifndef DECKBUTTONLAYOUT_H
+ #define DECKBUTTONLAYOUT_H
+ 
+-#include <QLayout>
+-#include <QPointer>
+-#include <QAbstractButton>
++#include <QtGui/QLayout>
++#include <QtCore/QPointer>
++#include <QtGui/QAbstractButton>
+ 
+ class QWidget;
+ class QAbstractButton;
+--- a/modules/gui/qt4/util/buttons/BrowseButton.cpp	2012-02-24 04:33:19.463903444 -0200
++++ b/modules/gui/qt4/util/buttons/BrowseButton.cpp	2012-02-24 04:35:03.736868179 -0200
+@@ -21,8 +21,8 @@
+ 
+ #include "BrowseButton.hpp"
+ 
+-#include <QPainter>
+-#include <QStyleOptionToolButton>
++#include <QtGui/QPainter>
++#include <QtGui/QStyleOptionToolButton>
+ 
+ BrowseButton::BrowseButton( QWidget* parent, BrowseButton::Type type )
+     : RoundButton( parent )
+--- a/modules/gui/qt4/util/customwidgets.cpp	2012-02-24 04:33:19.467901266 -0200
++++ b/modules/gui/qt4/util/customwidgets.cpp	2012-02-24 05:36:51.944166345 -0200
+@@ -31,12 +31,12 @@
+ #include "customwidgets.hpp"
+ #include "qt4.hpp"               /* needed for qtr,  but not necessary */
+ 
+-#include <QPainter>
+-#include <QRect>
+-#include <QKeyEvent>
+-#include <QWheelEvent>
+-#include <QPixmap>
+-#include <QApplication>
++#include <QtGui/QPainter>
++#include <QtCore/QRect>
++#include <QtGui/QKeyEvent>
++#include <QtGui/QWheelEvent>
++#include <QtGui/QPixmap>
++#include <QtGui/QApplication>
+ #include <vlc_keys.h>
+ 
+ QFramelessButton::QFramelessButton( QWidget *parent )
+--- a/modules/gui/qt4/util/searchlineedit.hpp	2012-02-24 03:54:50.922211871 -0200
++++ b/modules/gui/qt4/util/searchlineedit.hpp	2012-02-24 04:29:22.850543306 -0200
+@@ -32,7 +32,7 @@
+ #else
+ #include "qt4.hpp"
+ #endif
+-#include <QLineEdit>
++#include <QtGui/QLineEdit>
+ 
+ #if HAS_QT47
+ class ClickLineEdit : public QLineEdit
+--- a/modules/gui/qt4/util/qmenuview.cpp	2012-02-24 04:33:19.453908980 -0200
++++ b/modules/gui/qt4/util/qmenuview.cpp	2012-02-24 05:38:52.142438858 -0200
+@@ -26,8 +26,8 @@
+ 
+ #include "components/playlist/vlc_model.hpp" /* data( IsCurrentRole ) */
+ 
+-#include <QFont>
+-#include <QVariant>
++#include <QtGui/QFont>
++#include <QtCore/QVariant>
+ #include <assert.h>
+ 
+ 
+--- a/modules/gui/qt4/util/pictureflow.cpp	2012-02-24 04:33:19.457906750 -0200
++++ b/modules/gui/qt4/util/pictureflow.cpp	2012-02-24 04:34:22.194588380 -0200
+@@ -28,15 +28,15 @@
+ #include "pictureflow.hpp"
+ #include "components/playlist/ml_model.hpp"
+ 
+-#include <QApplication>
+-#include <QImage>
+-#include <QKeyEvent>
+-#include <QPainter>
+-#include <QPixmap>
+-#include <QTimer>
+-#include <QVector>
+-#include <QWidget>
+-#include <QHash>
++#include <QtGui/QApplication>
++#include <QtGui/QImage>
++#include <QtGui/QKeyEvent>
++#include <QtGui/QPainter>
++#include <QtGui/QPixmap>
++#include <QtCore/QTimer>
++#include <QtCore/QVector>
++#include <QtGui/QWidget>
++#include <QtCore/QHash>
+ #include "../components/playlist/playlist_model.hpp" /* getArtPixmap etc */
+ #include "../components/playlist/sorting.h"          /* Columns List */
+ #include "input_manager.hpp"
+--- a/modules/gui/qt4/extensions_manager.cpp	2012-02-24 04:16:27.571009261 -0200
++++ b/modules/gui/qt4/extensions_manager.cpp	2012-02-24 04:16:54.431423250 -0200
+@@ -28,10 +28,10 @@
+ #include <vlc_modules.h>
+ #include "assert.h"
+ 
+-#include <QMenu>
+-#include <QAction>
+-#include <QSignalMapper>
+-#include <QIcon>
++#include <QtGui/QMenu>
++#include <QtGui/QAction>
++#include <QtCore/QSignalMapper>
++#include <QtGui/QIcon>
+ 
+ #define MENU_MAP(a,e) ((uint32_t)( (((uint16_t)a) << 16) | ((uint16_t)e) ))
+ #define MENU_GET_ACTION(a) ( (uint16_t)( ((uint32_t)a) >> 16 ) )
+--- a/modules/gui/qt4/main_interface.cpp	2012-02-24 04:09:43.653673442 -0200
++++ b/modules/gui/qt4/main_interface.cpp	2012-02-24 04:10:52.281395670 -0200
+@@ -45,18 +45,18 @@
+ #include "menus.hpp"                            // Menu creation
+ #include "recents.hpp"                          // RecentItems when DnD
+ 
+-#include <QCloseEvent>
+-#include <QKeyEvent>
++#include <QtGui/QCloseEvent>
++#include <QtGui/QKeyEvent>
+ 
+-#include <QUrl>
+-#include <QSize>
+-#include <QDate>
++#include <QtCore/QUrl>
++#include <QtCore/QSize>
++#include <QtCore/QDate>
+ 
+-#include <QMenu>
+-#include <QMenuBar>
+-#include <QStatusBar>
+-#include <QLabel>
+-#include <QStackedWidget>
++#include <QtGui/QMenu>
++#include <QtGui/QMenuBar>
++#include <QtGui/QStatusBar>
++#include <QtGui/QLabel>
++#include <QtGui/QStackedWidget>
+ 
+ #include <vlc_keys.h>                       /* Wheel event */
+ #include <vlc_vout_display.h>               /* vout_thread_t and VOUT_ events */
+--- a/modules/gui/qt4/components/interface_widgets.hpp	2012-02-24 03:54:50.973218353 -0200
++++ b/modules/gui/qt4/components/interface_widgets.hpp	2012-02-24 04:06:29.137951498 -0200
+@@ -38,10 +38,10 @@
+ #include "dialogs_provider.hpp"
+ #include "components/info_panels.hpp"
+ 
+-#include <QWidget>
+-#include <QFrame>
+-#include <QLabel>
+-#include <QMouseEvent>
++#include <QtGui/QWidget>
++#include <QtGui/QFrame>
++#include <QtGui/QLabel>
++#include <QtGui/QMouseEvent>
+ 
+ class ResizeEvent;
+ class QPixmap;
+--- a/modules/gui/qt4/components/preferences_widgets.cpp	2012-02-24 04:33:19.472898574 -0200
++++ b/modules/gui/qt4/components/preferences_widgets.cpp	2012-02-24 04:37:03.451083272 -0200
+@@ -40,17 +40,17 @@
+ #include <vlc_intf_strings.h>
+ #include <vlc_modules.h>
+ 
+-#include <QString>
+-#include <QVariant>
+-#include <QGridLayout>
+-#include <QSlider>
+-#include <QFileDialog>
+-#include <QGroupBox>
+-#include <QTreeWidgetItem>
+-#include <QSignalMapper>
+-#include <QDialogButtonBox>
+-#include <QKeyEvent>
+-#include <QColorDialog>
++#include <QtCore/QString>
++#include <QtCore/QVariant>
++#include <QtGui/QGridLayout>
++#include <QtGui/QSlider>
++#include <QtGui/QFileDialog>
++#include <QtGui/QGroupBox>
++#include <QtGui/QTreeWidgetItem>
++#include <QtCore/QSignalMapper>
++#include <QtGui/QDialogButtonBox>
++#include <QtGui/QKeyEvent>
++#include <QtGui/QColorDialog>
+ 
+ #define MINWIDTH_BOX 90
+ #define LAST_COLUMN 10
+--- a/modules/gui/qt4/components/complete_preferences.hpp	2012-02-24 03:54:50.937213776 -0200
++++ b/modules/gui/qt4/components/complete_preferences.hpp	2012-02-24 04:27:03.226797838 -0200
+@@ -31,7 +31,7 @@
+ #include <vlc_common.h>
+ #include <vlc_interface.h>
+ 
+-#include <QTreeWidget>
++#include <QtGui/QTreeWidget>
+ 
+ enum
+ {
+--- a/modules/gui/qt4/components/info_panels.hpp	2012-02-24 03:52:22.504348715 -0200
++++ b/modules/gui/qt4/components/info_panels.hpp	2012-02-24 03:53:06.314916819 -0200
+@@ -33,7 +33,7 @@
+ #include <vlc_common.h>
+ #include <vlc_meta.h>
+ 
+-#include <QWidget>
++#include <QtGui/QWidget>
+ 
+ #include <limits.h>
+ 
+--- a/modules/gui/qt4/components/controller_widget.hpp	2012-02-24 03:51:21.903646679 -0200
++++ b/modules/gui/qt4/components/controller_widget.hpp	2012-02-24 03:51:33.112071210 -0200
+@@ -32,9 +32,9 @@
+ #include "input_manager.hpp"
+ #include <vlc_vout.h>                       /* vout_thread_t for aspect ratio combobox */
+ 
+-#include <QWidget>
+-#include <QToolButton>
+-#include <QComboBox>
++#include <QtGui/QWidget>
++#include <QtGui/QToolButton>
++#include <QtGui/QComboBox>
+ 
+ class QLabel;
+ class QFrame;
+--- a/modules/gui/qt4/components/interface_widgets.cpp	2012-02-24 04:33:19.485891725 -0200
++++ b/modules/gui/qt4/components/interface_widgets.cpp	2012-02-24 04:55:51.571461559 -0200
+@@ -37,19 +37,19 @@
+ 
+ #include <vlc_vout.h>
+ 
+-#include <QLabel>
+-#include <QToolButton>
+-#include <QPalette>
+-#include <QEvent>
+-#include <QResizeEvent>
+-#include <QDate>
+-#include <QMenu>
+-#include <QWidgetAction>
+-#include <QDesktopWidget>
+-#include <QPainter>
+-#include <QTimer>
+-#include <QSlider>
+-#include <QBitmap>
++#include <QtGui/QLabel>
++#include <QtGui/QToolButton>
++#include <QtGui/QPalette>
++#include <QtCore/QEvent>
++#include <QtGui/QResizeEvent>
++#include <QtCore/QDate>
++#include <QtGui/QMenu>
++#include <QtGui/QWidgetAction>
++#include <QtGui/QDesktopWidget>
++#include <QtGui/QPainter>
++#include <QtCore/QTimer>
++#include <QtGui/QSlider>
++#include <QtGui/QBitmap>
+ 
+ #ifdef Q_WS_X11
+ #   include <X11/Xlib.h>
+--- a/modules/gui/qt4/components/epg/EPGRuler.hpp	2012-02-24 03:54:50.940214157 -0200
++++ b/modules/gui/qt4/components/epg/EPGRuler.hpp	2012-02-24 04:37:19.984184449 -0200
+@@ -24,8 +24,8 @@
+ #ifndef EPGRULER_H
+ #define EPGRULER_H
+ 
+-#include <QWidget>
+-#include <QDateTime>
++#include <QtGui/QWidget>
++#include <QtCore/QDateTime>
+ 
+ class EPGRuler : public QWidget
+ {
+--- a/modules/gui/qt4/components/epg/EPGChannels.hpp	2012-02-24 03:54:50.942214411 -0200
++++ b/modules/gui/qt4/components/epg/EPGChannels.hpp	2012-02-24 04:38:11.345712323 -0200
+@@ -23,7 +23,7 @@
+ #ifndef EPGCHANNELS_HPP
+ #define EPGCHANNELS_HPP
+ 
+-#include <QWidget>
++#include <QtGui/QWidget>
+ 
+ class EPGView;
+ 
+--- a/modules/gui/qt4/components/epg/EPGWidget.cpp	2012-02-24 04:33:19.480894334 -0200
++++ b/modules/gui/qt4/components/epg/EPGWidget.cpp	2012-02-24 04:39:10.156186831 -0200
+@@ -27,11 +27,11 @@
+ 
+ #include "EPGWidget.hpp"
+ 
+-#include <QStackedWidget>
+-#include <QVBoxLayout>
+-#include <QScrollBar>
+-#include <QLabel>
+-#include <QStringList>
++#include <QtGui/QStackedWidget>
++#include <QtGui/QVBoxLayout>
++#include <QtGui/QScrollBar>
++#include <QtGui/QLabel>
++#include <QtCore/QStringList>
+ #include "qt4.hpp"
+ #include "input_manager.hpp"
+ #include <vlc_common.h>
+--- a/modules/gui/qt4/components/epg/EPGChannels.cpp	2012-02-24 04:33:19.482893287 -0200
++++ b/modules/gui/qt4/components/epg/EPGChannels.cpp	2012-02-24 04:39:16.127945813 -0200
+@@ -23,9 +23,9 @@
+ #include "EPGChannels.hpp"
+ #include "EPGView.hpp"
+ 
+-#include <QPainter>
+-#include <QFont>
+-#include <QPaintEvent>
++#include <QtGui/QPainter>
++#include <QtGui/QFont>
++#include <QtGui/QPaintEvent>
+ 
+ EPGChannels::EPGChannels( QWidget *parent, EPGView *m_epgView )
+     : QWidget( parent ), m_epgView( m_epgView ), m_offset( 0 )
+--- a/modules/gui/qt4/components/epg/EPGItem.cpp	2012-02-24 04:33:19.474897506 -0200
++++ b/modules/gui/qt4/components/epg/EPGItem.cpp	2012-02-24 04:37:39.899715690 -0200
+@@ -21,16 +21,16 @@
+  * 51 Franklin Street, Fifth Floor, Boston MA 02110-1301, USA.
+  *****************************************************************************/
+ 
+-#include <QTransform>
+-#include <QFont>
+-#include <QFontMetrics>
+-#include <QDebug>
+-#include <QDateTime>
+-#include <QFocusEvent>
+-#include <QGraphicsScene>
+-#include <QStyleOptionGraphicsItem>
+-#include <QGraphicsSceneHoverEvent>
+-#include <QStyle>
++#include <QtGui/QTransform>
++#include <QtGui/QFont>
++#include <QtGui/QFontMetrics>
++#include <QtCore/QDebug>
++#include <QtCore/QDateTime>
++#include <QtGui/QFocusEvent>
++#include <QtGui/QGraphicsScene>
++#include <QtGui/QStyleOptionGraphicsItem>
++#include <QtGui/QGraphicsSceneHoverEvent>
++#include <QtGui/QStyle>
+ 
+ #include "EPGItem.hpp"
+ #include "EPGView.hpp"
+--- a/modules/gui/qt4/components/epg/EPGRuler.cpp	2012-02-24 04:33:19.476896444 -0200
++++ b/modules/gui/qt4/components/epg/EPGRuler.cpp	2012-02-24 04:38:04.302817206 -0200
+@@ -23,11 +23,11 @@
+ 
+ #include "EPGRuler.hpp"
+ 
+-#include <QPainter>
+-#include <QFont>
+-#include <QPaintEvent>
+-#include <QtDebug>
+-#include <QDateTime>
++#include <QtGui/QPainter>
++#include <QtGui/QFont>
++#include <QtGui/QPaintEvent>
++#include <QtCore/QtDebug>
++#include <QtCore/QDateTime>
+ 
+ EPGRuler::EPGRuler( QWidget* parent )
+     : QWidget( parent )
+--- a/modules/gui/qt4/components/epg/EPGView.cpp	2012-02-24 04:33:19.478895386 -0200
++++ b/modules/gui/qt4/components/epg/EPGView.cpp	2012-02-24 04:58:07.998800772 -0200
+@@ -24,12 +24,12 @@
+ #include "EPGView.hpp"
+ #include "EPGItem.hpp"
+ 
+-#include <QDateTime>
+-#include <QMatrix>
+-#include <QPaintEvent>
+-#include <QScrollBar>
+-#include <QtDebug>
+-#include <QGraphicsTextItem>
++#include <QtCore/QDateTime>
++#include <QtGui/QMatrix>
++#include <QtGui/QPaintEvent>
++#include <QtGui/QScrollBar>
++#include <QtCore/QtDebug>
++#include <QtGui/QGraphicsTextItem>
+ 
+ EPGGraphicsScene::EPGGraphicsScene( QObject *parent ) : QGraphicsScene( parent )
+ {}
+--- a/modules/gui/qt4/components/epg/EPGItem.hpp	2012-02-24 03:54:50.947215049 -0200
++++ b/modules/gui/qt4/components/epg/EPGItem.hpp	2012-02-24 04:38:58.733735097 -0200
+@@ -27,8 +27,8 @@
+ #include "qt4.hpp"
+ 
+ #include <vlc_epg.h>
+-#include <QGraphicsItem>
+-#include <QDateTime>
++#include <QtGui/QGraphicsItem>
++#include <QtCore/QDateTime>
+ 
+ class QPainter;
+ class QString;
+--- a/modules/gui/qt4/components/epg/EPGWidget.hpp	2012-02-24 03:54:50.944214667 -0200
++++ b/modules/gui/qt4/components/epg/EPGWidget.hpp	2012-02-24 04:38:40.465413282 -0200
+@@ -32,8 +32,8 @@
+ #include <vlc_common.h>
+ #include <vlc_epg.h>
+ 
+-#include <QWidget>
+-#include <QStackedWidget>
++#include <QtGui/QWidget>
++#include <QtGui/QStackedWidget>
+ 
+ class QDateTime;
+ 
+--- a/modules/gui/qt4/components/epg/EPGView.hpp	2012-02-24 03:54:50.946214922 -0200
++++ b/modules/gui/qt4/components/epg/EPGView.hpp	2012-02-24 04:38:49.741592238 -0200
+@@ -26,12 +26,12 @@
+ 
+ #include "EPGItem.hpp"
+ 
+-#include <QGraphicsView>
+-#include <QGraphicsScene>
+-#include <QList>
+-#include <QMap>
+-#include <QMutex>
+-#include <QDateTime>
++#include <QtGui/QGraphicsView>
++#include <QtGui/QGraphicsScene>
++#include <QtCore/QList>
++#include <QtCore/QMap>
++#include <QtCore/QMutex>
++#include <QtCore/QDateTime>
+ 
+ #define TRACKS_HEIGHT 60
+ 
+--- a/modules/gui/qt4/components/controller.hpp	2012-02-24 03:49:52.047226390 -0200
++++ b/modules/gui/qt4/components/controller.hpp	2012-02-24 03:50:14.935135401 -0200
+@@ -30,9 +30,9 @@
+ 
+ #include "qt4.hpp"
+ 
+-#include <QFrame>
+-#include <QString>
+-#include <QSizeGrip>
++#include <QtGui/QFrame>
++#include <QtCore/QString>
++#include <QtGui/QSizeGrip>
+ 
+ #define MAIN_TB1_DEFAULT "64;39;64;38;65"
+ #define MAIN_TB2_DEFAULT "0-2;64;3;1;4;64;7;9;64;10;20;19;64-4;37;65;35-4"
+--- a/modules/gui/qt4/components/open_panels.cpp	2012-02-24 04:33:19.508870983 -0200
++++ b/modules/gui/qt4/components/open_panels.cpp	2012-02-24 04:56:18.816924316 -0200
+@@ -41,17 +41,17 @@
+   #include <vlc_charset.h> /* FromWide for Win32 */
+ #endif
+ 
+-#include <QFileDialog>
+-#include <QDialogButtonBox>
+-#include <QLineEdit>
+-#include <QStackedLayout>
+-#include <QListView>
+-#include <QCompleter>
+-#include <QDirModel>
+-#include <QScrollArea>
+-#include <QUrl>
+-#include <QStringListModel>
+-#include <QDropEvent>
++#include <QtGui/QFileDialog>
++#include <QtGui/QDialogButtonBox>
++#include <QtGui/QLineEdit>
++#include <QtGui/QStackedLayout>
++#include <QtGui/QListView>
++#include <QtGui/QCompleter>
++#include <QtGui/QDirModel>
++#include <QtGui/QScrollArea>
++#include <QtCore/QUrl>
++#include <QtGui/QStringListModel>
++#include <QtGui/QDropEvent>
+ 
+ #define I_DEVICE_TOOLTIP \
+     I_DIR_OR_FOLDER( N_("Select a device or a VIDEO_TS directory"), \
+--- a/modules/gui/qt4/components/sout/profile_selector.hpp	2012-02-24 03:54:50.953215811 -0200
++++ b/modules/gui/qt4/components/sout/profile_selector.hpp	2012-02-24 04:12:01.507193915 -0200
+@@ -26,7 +26,7 @@
+ 
+ #include "qt4.hpp"
+ 
+-#include <QWidget>
++#include <QtGui/QWidget>
+ 
+ #include "util/qvlcframe.hpp"
+ #include "ui/profiles.h"
+--- a/modules/gui/qt4/components/sout/sout_widgets.hpp	2012-02-24 03:54:50.951215557 -0200
++++ b/modules/gui/qt4/components/sout/sout_widgets.hpp	2012-02-24 04:14:44.904960903 -0200
+@@ -26,7 +26,7 @@
+ 
+ #include "qt4.hpp"
+ 
+-#include <QGroupBox>
++#include <QtGui/QGroupBox>
+ 
+ class QLineEdit;
+ class QLabel;
+--- a/modules/gui/qt4/components/sout/sout_widgets.cpp	2012-02-24 04:33:19.489889678 -0200
++++ b/modules/gui/qt4/components/sout/sout_widgets.cpp	2012-02-24 04:40:17.495745343 -0200
+@@ -29,11 +29,11 @@
+ #include "util/qt_dirs.hpp"
+ #include <vlc_intf_strings.h>
+ 
+-#include <QGroupBox>
+-#include <QGridLayout>
+-#include <QLabel>
+-#include <QLineEdit>
+-#include <QFileDialog>
++#include <QtGui/QGroupBox>
++#include <QtGui/QGridLayout>
++#include <QtGui/QLabel>
++#include <QtGui/QLineEdit>
++#include <QtGui/QFileDialog>
+ 
+ #define I_FILE_SLASH_DIR \
+     I_DIR_OR_FOLDER( N_("File/Directory"), N_("File/Folder") )
+--- a/modules/gui/qt4/components/sout/profile_selector.cpp	2012-02-24 04:33:19.487890691 -0200
++++ b/modules/gui/qt4/components/sout/profile_selector.cpp	2012-02-24 04:40:10.966915561 -0200
+@@ -26,11 +26,11 @@
+ #include "components/sout/profiles.hpp"
+ #include "dialogs/sout.hpp"
+ 
+-#include <QHBoxLayout>
+-#include <QToolButton>
+-#include <QComboBox>
+-#include <QLabel>
+-#include <QMessageBox>
++#include <QtGui/QHBoxLayout>
++#include <QtGui/QToolButton>
++#include <QtGui/QComboBox>
++#include <QtGui/QLabel>
++#include <QtGui/QMessageBox>
+ 
+ #include <assert.h>
+ 
+--- a/modules/gui/qt4/components/info_panels.cpp	2012-02-24 04:33:19.491887702 -0200
++++ b/modules/gui/qt4/components/info_panels.cpp	2012-02-24 04:40:36.217124732 -0200
+@@ -38,15 +38,15 @@
+ #include <vlc_url.h>
+ #include <vlc_meta.h>
+ 
+-#include <QTreeWidget>
+-#include <QHeaderView>
+-#include <QList>
+-#include <QStringList>
+-#include <QGridLayout>
+-#include <QLineEdit>
+-#include <QLabel>
+-#include <QSpinBox>
+-#include <QTextEdit>
++#include <QtGui/QTreeWidget>
++#include <QtGui/QHeaderView>
++#include <QtCore/QList>
++#include <QtCore/QStringList>
++#include <QtGui/QGridLayout>
++#include <QtGui/QLineEdit>
++#include <QtGui/QLabel>
++#include <QtGui/QSpinBox>
++#include <QtGui/QTextEdit>
+ 
+ /************************************************************************
+  * Single panels
+--- a/modules/gui/qt4/components/complete_preferences.cpp	2012-02-24 04:33:19.468900725 -0200
++++ b/modules/gui/qt4/components/complete_preferences.cpp	2012-02-24 04:36:11.599493194 -0200
+@@ -24,17 +24,17 @@
+ # include "config.h"
+ #endif
+ 
+-#include <QApplication>
+-#include <QLabel>
+-#include <QTreeWidget>
+-#include <QTreeWidgetItem>
+-#include <QVariant>
+-#include <QString>
+-#include <QFont>
+-#include <QGroupBox>
+-#include <QScrollArea>
+-#include <QVBoxLayout>
+-#include <QGridLayout>
++#include <QtGui/QApplication>
++#include <QtGui/QLabel>
++#include <QtGui/QTreeWidget>
++#include <QtGui/QTreeWidgetItem>
++#include <QtCore/QVariant>
++#include <QtCore/QString>
++#include <QtGui/QFont>
++#include <QtGui/QGroupBox>
++#include <QtGui/QScrollArea>
++#include <QtGui/QVBoxLayout>
++#include <QtGui/QGridLayout>
+ 
+ #include "components/complete_preferences.hpp"
+ #include "components/preferences_widgets.hpp"
+--- a/modules/gui/qt4/components/extended_panels.cpp	2012-02-24 04:33:19.484892244 -0200
++++ b/modules/gui/qt4/components/extended_panels.cpp	2012-02-24 04:54:10.216579871 -0200
+@@ -28,14 +28,14 @@
+ # include "config.h"
+ #endif
+ 
+-#include <QLabel>
+-#include <QVariant>
+-#include <QString>
+-#include <QFont>
+-#include <QGridLayout>
+-#include <QComboBox>
+-#include <QTimer>
+-#include <QFileDialog>
++#include <QtGui/QLabel>
++#include <QtCore/QVariant>
++#include <QtCore/QString>
++#include <QtGui/QFont>
++#include <QtGui/QGridLayout>
++#include <QtGui/QComboBox>
++#include <QtCore/QTimer>
++#include <QtGui/QFileDialog>
+ 
+ #include "components/extended_panels.hpp"
+ #include "dialogs/preferences.hpp"
+@@ -1472,8 +1472,8 @@
+     //    var_AddCallback( p_aout, "Spatializer-preamp", EqzCallback, this );
+ }
+ 
+-#include <QToolButton>
+-#include <QGridLayout>
++#include <QtGui/QToolButton>
++#include <QtGui/QGridLayout>
+ 
+ #define SUBSDELAY_CFG_MODE                     "subsdelay-mode"
+ #define SUBSDELAY_CFG_FACTOR                   "subsdelay-factor"
+--- a/modules/gui/qt4/components/extended_panels.hpp	2012-02-24 03:54:50.957216319 -0200
++++ b/modules/gui/qt4/components/extended_panels.hpp	2012-02-24 04:07:36.764546484 -0200
+@@ -34,7 +34,7 @@
+ #include "ui/equalizer.h"
+ #include "ui/video_effects.h"
+ 
+-#include <QTabWidget>
++#include <QtGui/QTabWidget>
+ 
+ #define BANDS 10
+ #define NUM_CP_CTRL 7
+--- a/modules/gui/qt4/components/playlist/views.cpp	2012-02-24 04:33:19.500878697 -0200
++++ b/modules/gui/qt4/components/playlist/views.cpp	2012-02-24 05:07:31.766452717 -0200
+@@ -26,12 +26,12 @@
+ #include "components/playlist/sorting.h"          /* Columns List */
+ #include "input_manager.hpp"                      /* THEMIM */
+ 
+-#include <QPainter>
+-#include <QRect>
+-#include <QStyleOptionViewItem>
+-#include <QFontMetrics>
+-#include <QDrag>
+-#include <QDragMoveEvent>
++#include <QtGui/QPainter>
++#include <QtCore/QRect>
++#include <QtGui/QStyleOptionViewItem>
++#include <QtGui/QFontMetrics>
++#include <QtGui/QDrag>
++#include <QtGui/QDragMoveEvent>
+ 
+ #include "assert.h"
+ 
+@@ -372,7 +372,7 @@
+         QTreeView::keyPressEvent( event );
+ }
+ 
+-#include <QHBoxLayout>
++#include <QtGui/QHBoxLayout>
+ PicFlowView::PicFlowView( PLModel *p_model, QWidget *parent ) : QAbstractItemView( parent )
+ {
+     QHBoxLayout *layout = new QHBoxLayout( this );
+--- a/modules/gui/qt4/components/playlist/ml_model.cpp	2012-02-24 04:33:19.498880668 -0200
++++ b/modules/gui/qt4/components/playlist/ml_model.cpp	2012-02-24 04:41:22.311983154 -0200
+@@ -31,9 +31,9 @@
+ 
+ #ifdef MEDIA_LIBRARY
+ 
+-#include <QUrl>
+-#include <QMenu>
+-#include <QMimeData>
++#include <QtCore/QUrl>
++#include <QtGui/QMenu>
++#include <QtCore/QMimeData>
+ #include "ml_item.hpp"
+ #include "ml_model.hpp"
+ #include "dialogs/mediainfo.hpp"
+--- a/modules/gui/qt4/components/playlist/views.hpp	2012-02-24 03:54:50.968217716 -0200
++++ b/modules/gui/qt4/components/playlist/views.hpp	2012-02-24 04:42:29.179481671 -0200
+@@ -24,10 +24,10 @@
+ #ifndef _ICON_VIEW_H_
+ #define _ICON_VIEW_H_
+ 
+-#include <QStyledItemDelegate>
+-#include <QListView>
+-#include <QTreeView>
+-#include <QAbstractItemView>
++#include <QtGui/QStyledItemDelegate>
++#include <QtGui/QListView>
++#include <QtGui/QTreeView>
++#include <QtGui/QAbstractItemView>
+ #include "util/pictureflow.hpp"
+ 
+ class QPainter;
+--- a/modules/gui/qt4/components/playlist/standardpanel.hpp	2012-02-24 03:54:50.971218099 -0200
++++ b/modules/gui/qt4/components/playlist/standardpanel.hpp	2012-02-24 04:42:55.573836256 -0200
+@@ -31,7 +31,7 @@
+ #include "qt4.hpp"
+ #include "components/playlist/playlist.hpp"
+ 
+-#include <QWidget>
++#include <QtGui/QWidget>
+ 
+ #include <vlc_playlist.h> /* playlist_item_t */
+ 
+--- a/modules/gui/qt4/components/playlist/selector.cpp	2012-02-24 04:33:19.495883655 -0200
++++ b/modules/gui/qt4/components/playlist/selector.cpp	2012-02-24 04:41:01.757370769 -0200
+@@ -31,14 +31,14 @@
+ #include "playlist_model.hpp"                /* plMimeData */
+ #include "input_manager.hpp"                 /* MainInputManager, for podcast */
+ 
+-#include <QInputDialog>
+-#include <QMessageBox>
+-#include <QMimeData>
+-#include <QDragMoveEvent>
+-#include <QTreeWidgetItem>
+-#include <QHBoxLayout>
+-#include <QPainter>
+-#include <QPalette>
++#include <QtGui/QInputDialog>
++#include <QtGui/QMessageBox>
++#include <QtCore/QMimeData>
++#include <QtGui/QDragMoveEvent>
++#include <QtGui/QTreeWidgetItem>
++#include <QtGui/QHBoxLayout>
++#include <QtGui/QPainter>
++#include <QtGui/QPalette>
+ 
+ #include <vlc_playlist.h>
+ #include <vlc_services_discovery.h>
+--- a/modules/gui/qt4/components/playlist/playlist.cpp	2012-02-24 04:33:19.506872888 -0200
++++ b/modules/gui/qt4/components/playlist/playlist.cpp	2012-02-24 05:35:01.348105547 -0200
+@@ -38,10 +38,10 @@
+ #include "input_manager.hpp"                      /* art signal */
+ #include "main_interface.hpp"                     /* DropEvent TODO remove this*/
+ 
+-#include <QMenu>
+-#include <QSignalMapper>
+-#include <QSlider>
+-#include <QStackedWidget>
++#include <QtGui/QMenu>
++#include <QtCore/QSignalMapper>
++#include <QtGui/QSlider>
++#include <QtGui/QStackedWidget>
+ 
+ /**********************************************************************
+  * Playlist Widget. The embedded playlist
+@@ -257,9 +257,9 @@
+ {
+     PLModel::getPLModel( p_intf )->clearPlaylist();
+ }
+-#include <QSignalMapper>
+-#include <QMenu>
+-#include <QPainter>
++#include <QtCore/QSignalMapper>
++#include <QtGui/QMenu>
++#include <QtGui/QPainter>
+ LocationBar::LocationBar( PLModel *m )
+ {
+     model = m;
+--- a/modules/gui/qt4/components/playlist/selector.hpp	2012-02-24 03:54:50.966217462 -0200
++++ b/modules/gui/qt4/components/playlist/selector.hpp	2012-02-24 04:41:55.701226755 -0200
+@@ -32,7 +32,7 @@
+ #include "qt4.hpp"
+ #include "util/customwidgets.hpp" /* QFramelessButton */
+ 
+-#include <QTreeWidget>
++#include <QtGui/QTreeWidget>
+ 
+ class QHBoxLayout;
+ class QPainter;
+--- a/modules/gui/qt4/components/playlist/ml_item.cpp	2012-02-24 04:33:19.496882656 -0200
++++ b/modules/gui/qt4/components/playlist/ml_item.cpp	2012-02-24 04:41:08.418217326 -0200
+@@ -31,9 +31,9 @@
+ 
+ #ifdef MEDIA_LIBRARY
+ 
+-#include <QDateTime>
+-#include <QUrl>
+-#include <QFileInfo>
++#include <QtCore/QDateTime>
++#include <QtCore/QUrl>
++#include <QtCore/QFileInfo>
+ #include "ml_item.hpp"
+ #include <assert.h>
+ 
+--- a/modules/gui/qt4/components/playlist/standardpanel.cpp	2012-02-24 04:33:19.502876744 -0200
++++ b/modules/gui/qt4/components/playlist/standardpanel.cpp	2012-02-24 05:34:14.459146740 -0200
+@@ -38,14 +38,14 @@
+ 
+ #include <vlc_services_discovery.h>               /* SD_CMD_SEARCH */
+ 
+-#include <QHeaderView>
+-#include <QModelIndexList>
+-#include <QMenu>
+-#include <QKeyEvent>
+-#include <QWheelEvent>
+-#include <QStackedLayout>
+-#include <QSignalMapper>
+-#include <QSettings>
++#include <QtGui/QHeaderView>
++#include <QtCore/QModelIndexList>
++#include <QtGui/QMenu>
++#include <QtGui/QKeyEvent>
++#include <QtGui/QWheelEvent>
++#include <QtGui/QStackedLayout>
++#include <QtCore/QSignalMapper>
++#include <QtCore/QSettings>
+ 
+ #include <assert.h>
+ 
+--- a/modules/gui/qt4/components/playlist/playlist.hpp	2012-02-24 03:50:45.144973962 -0200
++++ b/modules/gui/qt4/components/playlist/playlist.hpp	2012-02-24 03:51:09.788106859 -0200
+@@ -34,11 +34,11 @@
+ 
+ //#include <vlc_playlist.h>
+ 
+-#include <QSplitter>
++#include <QtGui/QSplitter>
+ 
+-#include <QPushButton>
+-#include <QSplitterHandle>
+-#include <QMouseEvent>
++#include <QtGui/QPushButton>
++#include <QtGui/QSplitterHandle>
++#include <QtGui/QMouseEvent>
+ 
+ class StandardPLPanel;
+ class LocationBar;
+--- a/modules/gui/qt4/components/playlist/playlist_model.cpp	2012-02-24 04:33:19.504874807 -0200
++++ b/modules/gui/qt4/components/playlist/playlist_model.cpp	2012-02-24 04:42:21.987567606 -0200
+@@ -40,14 +40,14 @@
+ #include "sorting.h"
+ 
+ #include <assert.h>
+-#include <QIcon>
+-#include <QFont>
+-#include <QMenu>
+-#include <QUrl>
+-#include <QFileInfo>
+-#include <QDesktopServices>
+-#include <QInputDialog>
+-#include <QSignalMapper>
++#include <QtGui/QIcon>
++#include <QtGui/QFont>
++#include <QtGui/QMenu>
++#include <QtCore/QUrl>
++#include <QtCore/QFileInfo>
++#include <QtGui/QDesktopServices>
++#include <QtGui/QInputDialog>
++#include <QtCore/QSignalMapper>
+ 
+ #define I_NEW_DIR \
+     I_DIR_OR_FOLDER( N_("Create Directory"), N_( "Create Folder" ) )
+--- a/modules/gui/qt4/components/controller.cpp	2012-02-24 04:33:19.470899647 -0200
++++ b/modules/gui/qt4/components/controller.cpp	2012-02-24 04:56:52.263175162 -0200
+@@ -44,11 +44,11 @@
+ 
+ #include "adapters/seekpoints.hpp"
+ 
+-#include <QToolButton>
+-#include <QHBoxLayout>
+-#include <QRegion>
+-#include <QSignalMapper>
+-#include <QTimer>
++#include <QtGui/QToolButton>
++#include <QtGui/QHBoxLayout>
++#include <QtGui/QRegion>
++#include <QtCore/QSignalMapper>
++#include <QtCore/QTimer>
+ 
+ //#define DEBUG_LAYOUT 1
+ 
+@@ -631,7 +631,7 @@
+ #undef ENABLE_ON_VIDEO
+ #undef ENABLE_ON_INPUT
+ 
+-#include <QHBoxLayout>
++#include <QtGui/QHBoxLayout>
+ /*****************************
+  * DA Control Widget !
+  *****************************/
+--- a/modules/gui/qt4/components/simple_preferences.cpp	2012-02-24 04:33:19.510869099 -0200
++++ b/modules/gui/qt4/components/simple_preferences.cpp	2012-02-24 04:43:44.114005459 -0200
+@@ -35,17 +35,17 @@
+ #include <vlc_configuration.h>
+ #include <vlc_aout_intf.h>
+ 
+-#include <QString>
+-#include <QFont>
+-#include <QToolButton>
+-#include <QButtonGroup>
+-#include <QVBoxLayout>
+-#include <QScrollArea>
++#include <QtCore/QString>
++#include <QtGui/QFont>
++#include <QtGui/QToolButton>
++#include <QtGui/QButtonGroup>
++#include <QtGui/QVBoxLayout>
++#include <QtGui/QScrollArea>
+ 
+-#include <QStyleFactory>
+-#include <QSettings>
+-#include <QtAlgorithms>
+-#include <QDir>
++#include <QtGui/QStyleFactory>
++#include <QtCore/QSettings>
++#include <QtCore/QtAlgorithms>
++#include <QtCore/QDir>
+ 
+ #define ICON_HEIGHT 64
+ 
+--- a/modules/gui/qt4/components/controller_widget.cpp	2012-02-24 04:33:19.493885672 -0200
++++ b/modules/gui/qt4/components/controller_widget.cpp	2012-02-24 04:40:45.291278009 -0200
+@@ -33,11 +33,11 @@
+ 
+ #include <vlc_aout_intf.h>           /* Volume functions */
+ 
+-#include <QLabel>
+-#include <QHBoxLayout>
+-#include <QMenu>
+-#include <QWidgetAction>
+-#include <QMouseEvent>
++#include <QtGui/QLabel>
++#include <QtGui/QHBoxLayout>
++#include <QtGui/QMenu>
++#include <QtGui/QWidgetAction>
++#include <QtGui/QMouseEvent>
+ 
+ SoundWidget::SoundWidget( QWidget *_parent, intf_thread_t * _p_intf,
+                           bool b_shiny, bool b_special )
+--- a/modules/gui/qt4/components/simple_preferences.hpp	2012-02-24 03:54:50.938213903 -0200
++++ b/modules/gui/qt4/components/simple_preferences.hpp	2012-02-24 04:06:37.323991898 -0200
+@@ -41,7 +41,7 @@
+ # include "util/registry.hpp"
+ #endif
+ 
+-#include <QWidget>
++#include <QtGui/QWidget>
+ 
+ enum {
+     SPrefsInterface = 0,
+--- a/modules/gui/qt4/main_interface_win32.cpp	2012-02-24 04:33:19.512867229 -0200
++++ b/modules/gui/qt4/main_interface_win32.cpp	2012-02-24 04:43:50.901868161 -0200
+@@ -27,7 +27,7 @@
+ #include "input_manager.hpp"
+ #include "actions_manager.hpp"
+ 
+-#include <QBitmap>
++#include <QtGui/QBitmap>
+ #include <vlc_windows_interfaces.h>
+ 
+ #define WM_APPCOMMAND 0x0319
+--- a/modules/gui/qt4/dialogs/sout.cpp	2012-02-24 04:33:19.526854601 -0200
++++ b/modules/gui/qt4/dialogs/sout.cpp	2012-02-24 04:45:38.082490267 -0200
+@@ -31,10 +31,10 @@
+ #include "util/qt_dirs.hpp"
+ #include "components/sout/sout_widgets.hpp"
+ 
+-#include <QString>
+-#include <QFileDialog>
+-#include <QToolButton>
+-#include <QSpinBox>
++#include <QtCore/QString>
++#include <QtGui/QFileDialog>
++#include <QtGui/QToolButton>
++#include <QtGui/QSpinBox>
+ #include <assert.h>
+ 
+ SoutDialog::SoutDialog( QWidget *parent, intf_thread_t *_p_intf, const QString& inputMRL )
+--- a/modules/gui/qt4/dialogs/bookmarks.cpp	2012-02-24 04:27:45.346150994 -0200
++++ b/modules/gui/qt4/dialogs/bookmarks.cpp	2012-02-24 04:28:12.971662055 -0200
+@@ -27,10 +27,10 @@
+ #include "dialogs/bookmarks.hpp"
+ #include "input_manager.hpp"
+ 
+-#include <QHBoxLayout>
+-#include <QSpacerItem>
+-#include <QPushButton>
+-#include <QDialogButtonBox>
++#include <QtGui/QHBoxLayout>
++#include <QtGui/QSpacerItem>
++#include <QtGui/QPushButton>
++#include <QtGui/QDialogButtonBox>
+ 
+ BookmarksDialog::BookmarksDialog( intf_thread_t *_p_intf ):QVLCFrame( _p_intf )
+ {
+--- a/modules/gui/qt4/dialogs/external.cpp	2012-02-24 04:33:19.524856359 -0200
++++ b/modules/gui/qt4/dialogs/external.cpp	2012-02-24 04:45:23.249605085 -0200
+@@ -28,15 +28,15 @@
+ #include "errors.hpp"
+ #include <vlc_dialog.h>
+ 
+-#include <QDialog>
+-#include <QDialogButtonBox>
+-#include <QLabel>
+-#include <QLineEdit>
+-#include <QMessageBox>
+-#include <QProgressDialog>
+-#include <QMutex>
+-#include <QPushButton>
+-#include <QTimer>
++#include <QtGui/QDialog>
++#include <QtGui/QDialogButtonBox>
++#include <QtGui/QLabel>
++#include <QtGui/QLineEdit>
++#include <QtGui/QMessageBox>
++#include <QtGui/QProgressDialog>
++#include <QtCore/QMutex>
++#include <QtGui/QPushButton>
++#include <QtCore/QTimer>
+ 
+ DialogHandler::DialogHandler (intf_thread_t *intf, QObject *_parent)
+     : QObject( _parent ), intf (intf),
+--- a/modules/gui/qt4/dialogs/help.cpp	2012-02-24 04:33:19.515864457 -0200
++++ b/modules/gui/qt4/dialogs/help.cpp	2012-02-24 04:51:26.927826712 -0200
+@@ -37,14 +37,14 @@
+ # include <vlc_update.h>
+ #endif
+ 
+-#include <QTextBrowser>
+-#include <QTabWidget>
+-#include <QLabel>
+-#include <QString>
+-#include <QDialogButtonBox>
+-#include <QEvent>
+-#include <QDate>
+-#include <QPushButton>
++#include <QtGui/QTextBrowser>
++#include <QtGui/QTabWidget>
++#include <QtGui/QLabel>
++#include <QtCore/QString>
++#include <QtGui/QDialogButtonBox>
++#include <QtCore/QEvent>
++#include <QtCore/QDate>
++#include <QtGui/QPushButton>
+ 
+ #include <assert.h>
+ 
+--- a/modules/gui/qt4/dialogs/sout.hpp	2012-02-24 03:54:50.984219750 -0200
++++ b/modules/gui/qt4/dialogs/sout.hpp	2012-02-24 04:15:13.605608635 -0200
+@@ -33,7 +33,7 @@
+ #include "ui/sout.h"
+ #include "util/qvlcframe.hpp"
+ 
+-#include <QWizard>
++#include <QtGui/QWizard>
+ 
+ class QPushButton;
+ class QToolButton;
+--- a/modules/gui/qt4/dialogs/ml_configuration.cpp	2012-02-24 04:33:19.513866299 -0200
++++ b/modules/gui/qt4/dialogs/ml_configuration.cpp	2012-02-24 04:43:57.206669468 -0200
+@@ -32,9 +32,9 @@
+ 
+ #include "ml_configuration.hpp"
+ 
+-#include <QTreeView>
+-#include <QPushButton>
+-#include <QDialogButtonBox>
++#include <QtGui/QTreeView>
++#include <QtGui/QPushButton>
++#include <QtGui/QDialogButtonBox>
+ 
+ MLConfDialog *MLConfDialog::instance = NULL;
+ 
+--- a/modules/gui/qt4/dialogs/firstrun.cpp	2012-02-24 04:33:19.519860815 -0200
++++ b/modules/gui/qt4/dialogs/firstrun.cpp	2012-02-24 04:44:35.719564263 -0200
+@@ -23,13 +23,13 @@
+ 
+ #include "dialogs/firstrun.hpp"
+ 
+-#include <QGridLayout>
+-#include <QGroupBox>
+-#include <QCheckBox>
+-#include <QLabel>
+-#include <QDialogButtonBox>
+-#include <QPushButton>
+-#include <QSettings>
++#include <QtGui/QGridLayout>
++#include <QtGui/QGroupBox>
++#include <QtGui/QCheckBox>
++#include <QtGui/QLabel>
++#include <QtGui/QDialogButtonBox>
++#include <QtGui/QPushButton>
++#include <QtCore/QSettings>
+ 
+ FirstRun::FirstRun( QWidget *_p, intf_thread_t *_p_intf  )
+          : QWidget( _p ), p_intf( _p_intf )
+--- a/modules/gui/qt4/dialogs/extensions.hpp	2012-02-24 03:54:50.982219496 -0200
++++ b/modules/gui/qt4/dialogs/extensions.hpp	2012-02-24 04:15:51.734454621 -0200
+@@ -29,7 +29,8 @@
+ 
+ #include "assert.h"
+ 
+-#include <QDialog>
++#include <QtGui/QDialog>
++
+ class QObject;
+ class QGridLayout;
+ class QSignalMapper;
+--- a/modules/gui/qt4/dialogs/errors.cpp	2012-02-24 04:33:19.517862629 -0200
++++ b/modules/gui/qt4/dialogs/errors.cpp	2012-02-24 04:44:26.188352896 -0200
+@@ -27,12 +27,12 @@
+ 
+ #include "dialogs/errors.hpp"
+ 
+-#include <QTextCursor>
+-#include <QTextEdit>
+-#include <QCheckBox>
+-#include <QGridLayout>
+-#include <QDialogButtonBox>
+-#include <QPushButton>
++#include <QtGui/QTextCursor>
++#include <QtGui/QTextEdit>
++#include <QtGui/QCheckBox>
++#include <QtGui/QGridLayout>
++#include <QtGui/QDialogButtonBox>
++#include <QtGui/QPushButton>
+ 
+ ErrorsDialog::ErrorsDialog( intf_thread_t *_p_intf )
+              : QVLCDialog( (QWidget*)_p_intf->p_sys->p_mi, _p_intf )
+--- a/modules/gui/qt4/dialogs/plugins.cpp	2012-02-24 04:33:19.522858131 -0200
++++ b/modules/gui/qt4/dialogs/plugins.cpp	2012-02-24 04:50:54.552712003 -0200
+@@ -35,24 +35,24 @@
+ 
+ #include <vlc_modules.h>
+ 
+-#include <QTreeWidget>
+-#include <QStringList>
+-#include <QTabWidget>
+-#include <QHeaderView>
+-#include <QDialogButtonBox>
+-#include <QLineEdit>
+-#include <QLabel>
+-#include <QVBoxLayout>
+-#include <QComboBox>
+-#include <QHBoxLayout>
+-#include <QVBoxLayout>
+-#include <QSpacerItem>
+-#include <QListView>
+-#include <QPainter>
+-#include <QStyleOptionViewItem>
+-#include <QKeyEvent>
+-#include <QPushButton>
+-#include <QPixmap>
++#include <QtGui/QTreeWidget>
++#include <QtCore/QStringList>
++#include <QtGui/QTabWidget>
++#include <QtGui/QHeaderView>
++#include <QtGui/QDialogButtonBox>
++#include <QtGui/QLineEdit>
++#include <QtGui/QLabel>
++#include <QtGui/QVBoxLayout>
++#include <QtGui/QComboBox>
++#include <QtGui/QHBoxLayout>
++#include <QtGui/QVBoxLayout>
++#include <QtGui/QSpacerItem>
++#include <QtGui/QListView>
++#include <QtGui/QPainter>
++#include <QtGui/QStyleOptionViewItem>
++#include <QtGui/QKeyEvent>
++#include <QtGui/QPushButton>
++#include <QtGui/QPixmap>
+ 
+ static QPixmap *loadPixmapFromData( char *, int size );
+ 
+--- a/modules/gui/qt4/dialogs/preferences.cpp	2012-02-24 04:30:24.609392539 -0200
++++ b/modules/gui/qt4/dialogs/preferences.cpp	2012-02-24 04:30:50.892733008 -0200
+@@ -35,12 +35,12 @@
+ #include "util/searchlineedit.hpp"
+ #include "main_interface.hpp"
+ 
+-#include <QHBoxLayout>
+-#include <QGroupBox>
+-#include <QRadioButton>
+-#include <QPushButton>
+-#include <QMessageBox>
+-#include <QDialogButtonBox>
++#include <QtGui/QHBoxLayout>
++#include <QtGui/QGroupBox>
++#include <QtGui/QRadioButton>
++#include <QtGui/QPushButton>
++#include <QtGui/QMessageBox>
++#include <QtGui/QDialogButtonBox>
+ 
+ PrefsDialog::PrefsDialog( QWidget *parent, intf_thread_t *_p_intf )
+             : QVLCDialog( parent, _p_intf )
+--- a/modules/gui/qt4/dialogs/playlist.cpp	2012-02-24 04:27:51.627949380 -0200
++++ b/modules/gui/qt4/dialogs/playlist.cpp	2012-02-24 04:28:22.877921085 -0200
+@@ -30,8 +30,8 @@
+ 
+ #include "util/qt_dirs.hpp"
+ 
+-#include <QUrl>
+-#include <QHBoxLayout>
++#include <QtCore/QUrl>
++#include <QtGui/QHBoxLayout>
+ 
+ PlaylistDialog::PlaylistDialog( intf_thread_t *_p_intf )
+                 : QVLCMW( _p_intf )
+--- a/modules/gui/qt4/dialogs/open.cpp	2012-02-24 04:33:19.532849428 -0200
++++ b/modules/gui/qt4/dialogs/open.cpp	2012-02-24 04:46:37.954099642 -0200
+@@ -29,10 +29,10 @@
+ #include "recents.hpp"
+ #include "util/qt_dirs.hpp"
+ 
+-#include <QTabWidget>
+-#include <QGridLayout>
+-#include <QRegExp>
+-#include <QMenu>
++#include <QtGui/QTabWidget>
++#include <QtGui/QGridLayout>
++#include <QtCore/QRegExp>
++#include <QtGui/QMenu>
+ 
+ #ifndef NDEBUG
+ # define DEBUG_QT 1
+--- a/modules/gui/qt4/dialogs/bookmarks.hpp	2012-02-24 03:54:51.044227377 -0200
++++ b/modules/gui/qt4/dialogs/bookmarks.hpp	2012-02-24 04:05:39.855687970 -0200
+@@ -26,9 +26,9 @@
+ #define QVLC_BOOKMARKS_H_ 1
+ 
+ #include "util/qvlcframe.hpp"
+-#include <QStandardItemModel>
+-#include <QTreeView>
+-#include <QTreeWidget>
++#include <QtGui/QStandardItemModel>
++#include <QtGui/QTreeView>
++#include <QtGui/QTreeWidget>
+ #include "util/singleton.hpp"
+ 
+ class BookmarksDialog : public QVLCFrame, public Singleton<BookmarksDialog>
+--- a/modules/gui/qt4/dialogs/gototime.cpp	2012-02-24 04:33:19.521859022 -0200
++++ b/modules/gui/qt4/dialogs/gototime.cpp	2012-02-24 04:44:44.835722879 -0200
+@@ -28,12 +28,12 @@
+ 
+ #include "input_manager.hpp"
+ 
+-#include <QTabWidget>
+-#include <QLabel>
+-#include <QTimeEdit>
+-#include <QGroupBox>
+-#include <QDialogButtonBox>
+-#include <QPushButton>
++#include <QtGui/QTabWidget>
++#include <QtGui/QLabel>
++#include <QtGui/QTimeEdit>
++#include <QtGui/QGroupBox>
++#include <QtGui/QDialogButtonBox>
++#include <QtGui/QPushButton>
+ 
+ GotoTimeDialog::GotoTimeDialog( intf_thread_t *_p_intf)
+                : QVLCDialog( (QWidget*)_p_intf->p_sys->p_mi, _p_intf )
+--- a/modules/gui/qt4/dialogs/mediainfo.cpp	2012-02-24 04:30:24.607392283 -0200
++++ b/modules/gui/qt4/dialogs/mediainfo.cpp	2012-02-24 04:30:43.416782860 -0200
+@@ -31,11 +31,11 @@
+ 
+ #include <vlc_url.h>
+ 
+-#include <QTabWidget>
+-#include <QGridLayout>
+-#include <QLineEdit>
+-#include <QLabel>
+-#include <QPushButton>
++#include <QtGui/QTabWidget>
++#include <QtGui/QGridLayout>
++#include <QtGui/QLineEdit>
++#include <QtGui/QLabel>
++#include <QtGui/QPushButton>
+ 
+ /* This Dialog has two main modes:
+     - General Mode that shows the current Played item, and the stats
+--- a/modules/gui/qt4/dialogs/openurl.cpp	2012-02-24 04:33:19.541841924 -0200
++++ b/modules/gui/qt4/dialogs/openurl.cpp	2012-02-24 04:48:12.482113667 -0200
+@@ -28,15 +28,15 @@
+ #include "dialogs/openurl.hpp"
+ #include "util/searchlineedit.hpp"
+ 
+-#include <QPushButton>
+-#include <QDialogButtonBox>
+-#include <QApplication>
+-#include <QClipboard>
+-#include <QMimeData>
+-#include <QList>
+-#include <QUrl>
+-#include <QFile>
+-#include <QLabel>
++#include <QtGui/QPushButton>
++#include <QtGui/QDialogButtonBox>
++#include <QtGui/QApplication>
++#include <QtGui/QClipboard>
++#include <QtCore/QMimeData>
++#include <QtCore/QList>
++#include <QtCore/QUrl>
++#include <QtCore/QFile>
++#include <QtGui/QLabel>
+ 
+ #include <assert.h>
+ 
+--- a/modules/gui/qt4/dialogs/extended.cpp	2012-02-24 04:33:19.537845216 -0200
++++ b/modules/gui/qt4/dialogs/extended.cpp	2012-02-24 04:47:12.303465272 -0200
+@@ -30,10 +30,10 @@
+ #include "main_interface.hpp" /* Needed for external MI size */
+ #include "input_manager.hpp"
+ 
+-#include <QTabWidget>
+-#include <QGridLayout>
+-#include <QDialogButtonBox>
+-#include <QPushButton>
++#include <QtGui/QTabWidget>
++#include <QtGui/QGridLayout>
++#include <QtGui/QDialogButtonBox>
++#include <QtGui/QPushButton>
+ #include <vlc_modules.h>
+ 
+ ExtendedDialog::ExtendedDialog( intf_thread_t *_p_intf )
+--- a/modules/gui/qt4/dialogs/epg.cpp	2012-02-24 04:33:19.530851137 -0200
++++ b/modules/gui/qt4/dialogs/epg.cpp	2012-02-24 04:46:10.224575381 -0200
+@@ -29,14 +29,14 @@
+ #include "components/epg/EPGWidget.hpp"
+ #include <vlc_playlist.h>
+ 
+-#include <QVBoxLayout>
+-#include <QSplitter>
+-#include <QLabel>
+-#include <QGroupBox>
+-#include <QPushButton>
+-#include <QTextEdit>
+-#include <QDialogButtonBox>
+-#include <QTimer>
++#include <QtGui/QVBoxLayout>
++#include <QtGui/QSplitter>
++#include <QtGui/QLabel>
++#include <QtGui/QGroupBox>
++#include <QtGui/QPushButton>
++#include <QtGui/QTextEdit>
++#include <QtGui/QDialogButtonBox>
++#include <QtCore/QTimer>
+ 
+ #include "qt4.hpp"
+ #include "input_manager.hpp"
+--- a/modules/gui/qt4/dialogs/toolbar.cpp	2012-02-24 04:33:19.533848579 -0200
++++ b/modules/gui/qt4/dialogs/toolbar.cpp	2012-02-24 04:46:51.383806488 -0200
+@@ -39,17 +39,17 @@
+ #include "input_manager.hpp"
+ #include <vlc_vout.h>                       /* vout_thread_t for aspect ratio combobox */
+ 
+-#include <QScrollArea>
+-#include <QGroupBox>
+-#include <QLabel>
+-#include <QComboBox>
+-#include <QListWidget>
+-#include <QSpinBox>
+-#include <QRubberBand>
++#include <QtGui/QScrollArea>
++#include <QtGui/QGroupBox>
++#include <QtGui/QLabel>
++#include <QtGui/QComboBox>
++#include <QtGui/QListWidget>
++#include <QtGui/QSpinBox>
++#include <QtGui/QRubberBand>
+ 
+-#include <QDragEnterEvent>
+-#include <QDialogButtonBox>
+-#include <QInputDialog>
++#include <QtGui/QDragEnterEvent>
++#include <QtGui/QDialogButtonBox>
++#include <QtGui/QInputDialog>
+ 
+ #include <assert.h>
+ 
+--- a/modules/gui/qt4/dialogs/extensions.cpp	2012-02-24 04:33:19.535846891 -0200
++++ b/modules/gui/qt4/dialogs/extensions.cpp	2012-02-24 04:53:29.224369975 -0200
+@@ -26,19 +26,19 @@
+ 
+ #include <vlc_dialog.h>
+ 
+-#include <QGridLayout>
+-#include <QPushButton>
+-#include <QSignalMapper>
+-#include <QLabel>
+-#include <QPixmap>
+-#include <QLineEdit>
+-#include <QTextBrowser>
+-#include <QCheckBox>
+-#include <QListWidget>
+-#include <QComboBox>
+-#include <QCloseEvent>
+-#include <QCoreApplication>
+-#include <QKeyEvent>
++#include <QtGui/QGridLayout>
++#include <QtGui/QPushButton>
++#include <QtCore/QSignalMapper>
++#include <QtGui/QLabel>
++#include <QtGui/QPixmap>
++#include <QtGui/QLineEdit>
++#include <QtGui/QTextBrowser>
++#include <QtGui/QCheckBox>
++#include <QtGui/QListWidget>
++#include <QtGui/QComboBox>
++#include <QtGui/QCloseEvent>
++#include <QtCore/QCoreApplication>
++#include <QtGui/QKeyEvent>
+ #include "util/customwidgets.hpp"
+ 
+ ExtensionsDialogProvider *ExtensionsDialogProvider::instance = NULL;
+--- a/modules/gui/qt4/dialogs/toolbar.hpp	2012-02-24 03:54:51.034226107 -0200
++++ b/modules/gui/qt4/dialogs/toolbar.hpp	2012-02-24 04:15:57.896237745 -0200
+@@ -27,8 +27,8 @@
+ #include "util/qvlcframe.hpp"                                 /* QVLCDialog */
+ #include "components/controller.hpp"                  /* AbstractController */
+ 
+-#include <QListWidget>
+-#include <QCheckBox>
++#include <QtGui/QListWidget>
++#include <QtGui/QCheckBox>
+ 
+ #define PROFILE_NAME_1 "VLC 1.1.x Style"
+ #define VALUE_1 "0|64;39;64;38;65;|0-2;64;3;1;4;64;7;9;64;10;20;19;64-4;37;65;35-4;|12;11;13;14;|5-1;33;6-1;|0-2;64;3;1;4;64;37;64;38;64;8;65;25;35-4;34;"
+--- a/modules/gui/qt4/dialogs/external.hpp	2012-02-24 03:54:51.041226996 -0200
++++ b/modules/gui/qt4/dialogs/external.hpp	2012-02-24 04:21:47.111621232 -0200
+@@ -25,7 +25,7 @@
+ # include <config.h>
+ #endif
+ 
+-#include <QObject>
++#include <QtCore/QObject>
+ #include <vlc_common.h>
+ #include "variables.hpp"
+ 
+@@ -64,7 +64,7 @@
+ };
+ 
+ /* Put here instead of .cpp because of MOC */
+-#include <QProgressDialog>
++#include <QtGui/QProgressDialog>
+ 
+ class QVLCProgressDialog : public QProgressDialog
+ {
+--- a/modules/gui/qt4/dialogs/ml_configuration.hpp	2012-02-24 03:54:51.032225853 -0200
++++ b/modules/gui/qt4/dialogs/ml_configuration.hpp	2012-02-24 04:46:23.935297866 -0200
+@@ -39,10 +39,10 @@
+ 
+ #include "util/qvlcframe.hpp"
+ 
+-#include <QDirModel>
+-#include <QCheckBox>
+-#include <QDialogButtonBox>
+-#include <QPushButton>
++#include <QtCore/QDirModel>
++#include <QtGui/QCheckBox>
++#include <QtGui/QDialogButtonBox>
++#include <QtGui/QPushButton>
+ 
+ /** Classes in this header */
+ class MLDirModel;
+--- a/modules/gui/qt4/dialogs/firstrun.hpp	2012-02-24 03:54:50.993220895 -0200
++++ b/modules/gui/qt4/dialogs/firstrun.hpp	2012-02-24 04:08:00.069508431 -0200
+@@ -23,8 +23,8 @@
+ 
+ #include "qt4.hpp"
+ 
+-#include <QWidget>
+-#include <QSettings>
++#include <QtGui/QWidget>
++#include <QtCore/QSettings>
+ 
+ class QCheckBox;
+ class FirstRun : public QWidget
+--- a/modules/gui/qt4/dialogs/playlist.hpp	2012-02-24 03:52:40.015574304 -0200
++++ b/modules/gui/qt4/dialogs/playlist.hpp	2012-02-24 03:53:14.015895576 -0200
+@@ -28,7 +28,7 @@
+ #include "components/playlist/playlist.hpp"
+ #include "util/singleton.hpp"
+ 
+-#include <QModelIndex>
++#include <QtCore/QModelIndex>
+ 
+ class QSignalMapper;
+ class PLSelector;
+--- a/modules/gui/qt4/dialogs/plugins.hpp	2012-02-24 03:54:51.048227885 -0200
++++ b/modules/gui/qt4/dialogs/plugins.hpp	2012-02-24 04:17:42.790569277 -0200
+@@ -29,10 +29,10 @@
+ 
+ #include <vlc_extensions.h>
+ 
+-#include <QStringList>
+-#include <QTreeWidgetItem>
+-#include <QAbstractListModel>
+-#include <QStyledItemDelegate>
++#include <QtCore/QStringList>
++#include <QtGui/QTreeWidgetItem>
++#include <QtCore/QAbstractListModel>
++#include <QtGui/QStyledItemDelegate>
+ 
+ class QLabel;
+ class QTabWidget;
+--- a/modules/gui/qt4/dialogs/vlm.cpp	2012-02-24 04:33:19.543840299 -0200
++++ b/modules/gui/qt4/dialogs/vlm.cpp	2012-02-24 04:48:39.656567378 -0200
+@@ -34,24 +34,24 @@
+ #include "dialogs/sout.hpp"
+ #include "util/qt_dirs.hpp"
+ 
+-#include <QString>
+-#include <QComboBox>
+-#include <QVBoxLayout>
+-#include <QStackedWidget>
+-#include <QLabel>
+-#include <QWidget>
+-#include <QGridLayout>
+-#include <QLineEdit>
+-#include <QCheckBox>
+-#include <QToolButton>
+-#include <QGroupBox>
+-#include <QPushButton>
+-#include <QHBoxLayout>
+-#include <QDateTimeEdit>
+-#include <QDateTime>
+-#include <QSpinBox>
+-#include <QScrollArea>
+-#include <QFileDialog>
++#include <QtCore/QString>
++#include <QtGui/QComboBox>
++#include <QtGui/QVBoxLayout>
++#include <QtGui/QStackedWidget>
++#include <QtGui/QLabel>
++#include <QtGui/QWidget>
++#include <QtGui/QGridLayout>
++#include <QtGui/QLineEdit>
++#include <QtGui/QCheckBox>
++#include <QtGui/QToolButton>
++#include <QtGui/QGroupBox>
++#include <QtGui/QPushButton>
++#include <QtGui/QHBoxLayout>
++#include <QtGui/QDateTimeEdit>
++#include <QtCore/QDateTime>
++#include <QtGui/QSpinBox>
++#include <QtGui/QScrollArea>
++#include <QtGui/QFileDialog>
+ 
+ 
+ VLMDialog::VLMDialog( intf_thread_t *_p_intf ) : QVLCDialog( (QWidget*)_p_intf->p_sys->p_mi, _p_intf )
+--- a/modules/gui/qt4/dialogs/vlm.hpp	2012-02-24 03:54:50.988220259 -0200
++++ b/modules/gui/qt4/dialogs/vlm.hpp	2012-02-24 04:10:04.412311763 -0200
+@@ -36,7 +36,7 @@
+ #include "ui/vlm.h"
+ #include "util/qvlcframe.hpp"
+ #include "util/singleton.hpp"
+-#include <QDateTime>
++#include <QtCore/QDateTime>
+ 
+ enum{
+     QVLM_Broadcast,
+--- a/modules/gui/qt4/dialogs/convert.cpp	2012-02-24 04:33:19.528852860 -0200
++++ b/modules/gui/qt4/dialogs/convert.cpp	2012-02-24 04:45:48.873861797 -0200
+@@ -31,11 +31,11 @@
+ 
+ #include "util/qt_dirs.hpp"
+ 
+-#include <QLabel>
+-#include <QGroupBox>
+-#include <QDialogButtonBox>
+-#include <QFileDialog>
+-#include <QCheckBox>
++#include <QtGui/QLabel>
++#include <QtGui/QGroupBox>
++#include <QtGui/QDialogButtonBox>
++#include <QtGui/QFileDialog>
++#include <QtGui/QCheckBox>
+ 
+ ConvertDialog::ConvertDialog( QWidget *parent, intf_thread_t *_p_intf,
+                               const QString& inputMRL )
+--- a/modules/gui/qt4/dialogs/messages.cpp	2012-02-24 04:33:19.539843563 -0200
++++ b/modules/gui/qt4/dialogs/messages.cpp	2012-02-24 04:47:50.301294597 -0200
+@@ -27,17 +27,17 @@
+ #include "dialogs/messages.hpp"
+ #include <vlc_atomic.h>
+ 
+-#include <QTextEdit>
+-#include <QTextCursor>
+-#include <QFileDialog>
+-#include <QTextStream>
+-#include <QMessageBox>
+-#include <QTabWidget>
+-#include <QTreeWidget>
+-#include <QTreeWidgetItem>
+-#include <QMutex>
+-#include <QLineEdit>
+-#include <QScrollBar>
++#include <QtGui/QTextEdit>
++#include <QtGui/QTextCursor>
++#include <QtGui/QFileDialog>
++#include <QtCore/QTextStream>
++#include <QtGui/QMessageBox>
++#include <QtGui/QTabWidget>
++#include <QtGui/QTreeWidget>
++#include <QtGui/QTreeWidgetItem>
++#include <QtCore/QMutex>
++#include <QtGui/QLineEdit>
++#include <QtGui/QScrollBar>
+ 
+ #include <assert.h>
+ 
+--- a/modules/gui/qt4/input_manager.cpp	2012-02-24 04:13:53.265397811 -0200
++++ b/modules/gui/qt4/input_manager.cpp	2012-02-24 04:14:02.079518036 -0200
+@@ -37,7 +37,7 @@
+ #include <vlc_aout.h>
+ #include <vlc_aout_intf.h>
+ 
+-#include <QApplication>
++#include <QtGui/QApplication>
+ 
+ #include <assert.h>
+ 
+--- a/modules/gui/qt4/dialogs_provider.cpp	2012-02-24 04:24:37.761309926 -0200
++++ b/modules/gui/qt4/dialogs_provider.cpp	2012-02-24 04:25:28.050701446 -0200
+@@ -57,10 +57,10 @@
+ #include "dialogs/epg.hpp"
+ #include "dialogs/errors.hpp"
+ 
+-#include <QEvent>
+-#include <QApplication>
+-#include <QSignalMapper>
+-#include <QFileDialog>
++#include <QtCore/QEvent>
++#include <QtGui/QApplication>
++#include <QtCore/QSignalMapper>
++#include <QtGui/QFileDialog>
+ 
+ #define I_OP_DIR_WINTITLE I_DIR_OR_FOLDER( N_("Open Directory"), \
+                                            N_("Open Folder") )
diff --git a/package/multimedia/vlc/vlc.mk b/package/multimedia/vlc/vlc.mk
index 413dfd4..736e194 100644
--- a/package/multimedia/vlc/vlc.mk
+++ b/package/multimedia/vlc/vlc.mk
@@ -137,6 +137,8 @@ endif
 ifeq ($(BR2_PACKAGE_QT),y)
 VLC_DEPENDENCIES += qt
 VLC_CONF_OPTS += --enable-qt4
+# XXX: See qt.mk for details
+VLC_CFLAGS += -fno-strict-volatile-bitfields
 else
 VLC_CONF_OPTS += --disable-qt4
 endif
-- 
1.7.9.1
