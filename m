From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 09:09:45 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] package/python-pyqt5: fix
 build with Qt 5.6.3
Message-ID: <20171126184721.671A58110A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e22c1848bfe88904d4ed8c14d35007f90cd00499
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

This commit adds 5_6_3 to the Timeline patch that fixed the build with
Qt 5.6.2.

Signed-off-by: Scott Ellis <scott@jumpnowtek.com>
[Thomas: adjust patch existing patch description.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

(cherry picked from commit 063b2a8121530d72389ca5a3aad7c9647f5a5c5b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyqt5/0002-fix-qt-5.6.2.patch | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pyqt5/0002-fix-qt-5.6.2.patch b/package/python-pyqt5/0002-fix-qt-5.6.2.patch
index a56af09..fd2f9d9 100644
--- a/package/python-pyqt5/0002-fix-qt-5.6.2.patch
+++ b/package/python-pyqt5/0002-fix-qt-5.6.2.patch
@@ -1,15 +1,15 @@
-Fix the build with Qt 5.6.2
+Fix the build with Qt 5.6.{2,3}
 
 Building PyQt 5.7 with versions of Qt older than Qt 5.7 is supposed to
 work, but currently fails in practice. In fact, this is due to the
 fact that the %Timeline variable in QtCoremod.sip didn't contain the
-5.6.2 Qt version, so if this version was used, PyQt was assuming it
+5.6.{2,3} Qt versions, so if this version was used, PyQt was assuming it
 was the later version 5.7, and therefore started enabling APIs only
 available in Qt 5.7, causing build failures when building against Qt
-5.6.2.
+5.6.{2,3}.
 
-Adding Qt_5_6_2 to the timeline fixes this problem. This fix was
-suggested by Phil Thompson <phil@riverbankcomputing.com>.
+Adding Qt_5_6_2 and Qt_5_6_3 to the timeline fixes this problem. This
+fix was suggested by Phil Thompson <phil@riverbankcomputing.com>.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
@@ -22,7 +22,7 @@ Index: PyQt5_gpl-5.7/sip/QtCore/QtCoremod.sip
  %Module(name=PyQt5.QtCore, call_super_init=True, default_VirtualErrorHandler=PyQt5, keyword_arguments="Optional", version=1)
  
 -%Timeline {Qt_5_0_0 Qt_5_0_1 Qt_5_0_2 Qt_5_1_0 Qt_5_1_1 Qt_5_2_0 Qt_5_2_1 Qt_5_3_0 Qt_5_3_1 Qt_5_3_2 Qt_5_4_0 Qt_5_4_1 Qt_5_4_2 Qt_5_5_0 Qt_5_5_1 Qt_5_6_0 Qt_5_6_1 Qt_5_7_0}
-+%Timeline {Qt_5_0_0 Qt_5_0_1 Qt_5_0_2 Qt_5_1_0 Qt_5_1_1 Qt_5_2_0 Qt_5_2_1 Qt_5_3_0 Qt_5_3_1 Qt_5_3_2 Qt_5_4_0 Qt_5_4_1 Qt_5_4_2 Qt_5_5_0 Qt_5_5_1 Qt_5_6_0 Qt_5_6_1 Qt_5_6_2 Qt_5_7_0}
++%Timeline {Qt_5_0_0 Qt_5_0_1 Qt_5_0_2 Qt_5_1_0 Qt_5_1_1 Qt_5_2_0 Qt_5_2_1 Qt_5_3_0 Qt_5_3_1 Qt_5_3_2 Qt_5_4_0 Qt_5_4_1 Qt_5_4_2 Qt_5_5_0 Qt_5_5_1 Qt_5_6_0 Qt_5_6_1 Qt_5_6_2 Qt_5_6_3 Qt_5_7_0}
  
  %Platforms {WS_X11 WS_WIN WS_MACX}
  
