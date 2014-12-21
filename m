From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 22:40:50 +0100
Subject: [Buildroot] [git commit] package/pinentry: fix include paths
Message-ID: <20141221215109.4D72D805ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d58a27da458c438d375250c74fbc4444c9b5d3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The pinentry tarball contains generated .moc files that contains
incorrect include paths: they are probably specific to the machine of
the user who generated the tarball.

Fix those paths.

Fixes numerous autobuild failures:
    http://autobuild.buildroot.org/results/96c/96c68e9a6c528e15016cb10f0f73e52f58815bec/
    http://autobuild.buildroot.org/results/50e/50ecb6b347ab4970c701b1aed7b42518fef9a52c/
    http://autobuild.buildroot.org/results/fcb/fcbe8b971ef37c0e7c458bc32295a89be9872b61/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pinentry/0001-fix-include-paths.patch |   42 +++++++++++++++++++++++++
 1 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/package/pinentry/0001-fix-include-paths.patch b/package/pinentry/0001-fix-include-paths.patch
new file mode 100644
index 0000000..c18a613
--- /dev/null
+++ b/package/pinentry/0001-fix-include-paths.patch
@@ -0,0 +1,42 @@
+qt4: fix include paths
+
+Fix include paths in generated .moc files.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN pinentry-0.9.0.orig/qt4/pinentryconfirm.moc pinentry-0.9.0/qt4/pinentryconfirm.moc
+--- pinentry-0.9.0.orig/qt4/pinentryconfirm.moc	2014-09-18 10:35:48.000000000 +0200
++++ pinentry-0.9.0/qt4/pinentryconfirm.moc	2014-12-14 23:09:52.086048672 +0100
+@@ -6,7 +6,7 @@
+ ** WARNING! All changes made in this file will be lost!
+ *****************************************************************************/
+ 
+-#include "../../../s/pinentry/qt4/pinentryconfirm.h"
++#include "qt4/pinentryconfirm.h"
+ #if !defined(Q_MOC_OUTPUT_REVISION)
+ #error "The header file 'pinentryconfirm.h' doesn't include <QObject>."
+ #elif Q_MOC_OUTPUT_REVISION != 63
+diff -durN pinentry-0.9.0.orig/qt4/pinentrydialog.moc pinentry-0.9.0/qt4/pinentrydialog.moc
+--- pinentry-0.9.0.orig/qt4/pinentrydialog.moc	2014-09-18 10:35:48.000000000 +0200
++++ pinentry-0.9.0/qt4/pinentrydialog.moc	2014-12-14 23:09:36.357871032 +0100
+@@ -6,7 +6,7 @@
+ ** WARNING! All changes made in this file will be lost!
+ *****************************************************************************/
+ 
+-#include "../../../s/pinentry/qt4/pinentrydialog.h"
++#include "qt4/pinentrydialog.h"
+ #if !defined(Q_MOC_OUTPUT_REVISION)
+ #error "The header file 'pinentrydialog.h' doesn't include <QObject>."
+ #elif Q_MOC_OUTPUT_REVISION != 63
+diff -durN pinentry-0.9.0.orig/qt4/qsecurelineedit.moc pinentry-0.9.0/qt4/qsecurelineedit.moc
+--- pinentry-0.9.0.orig/qt4/qsecurelineedit.moc	2014-09-18 10:35:48.000000000 +0200
++++ pinentry-0.9.0/qt4/qsecurelineedit.moc	2014-12-14 23:09:18.693671498 +0100
+@@ -6,7 +6,7 @@
+ ** WARNING! All changes made in this file will be lost!
+ *****************************************************************************/
+ 
+-#include "../../../s/pinentry/qt4/qsecurelineedit.h"
++#include "qt4/qsecurelineedit.h"
+ #if !defined(Q_MOC_OUTPUT_REVISION)
+ #error "The header file 'qsecurelineedit.h' doesn't include <QObject>."
+ #elif Q_MOC_OUTPUT_REVISION != 63
