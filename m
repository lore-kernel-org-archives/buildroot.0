From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 15:54:39 +0200
Subject: [Buildroot] [git commit] qt5: disallow the selection of Qt4 and Qt5
Message-ID: <20130411140826.032439B586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76d9abd810a9739b78b818e982fd6f11ff4dbe67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As noticed by Arnout, Qt4 and Qt5 cannot be installed together,
because for example the qt.conf installed by one version cannot be
understood by the qmake of another version. We therefore make them
mutually exclusive, which sounds reasonable for the embedded systems
targeted by Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 1c9f8a6..9e9104a 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -7,6 +7,7 @@ menuconfig BR2_PACKAGE_QT5
 	depends on BR2_USE_WCHAR
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PACKAGE_QT
 	help
 	  This option enables the Qt5 framework. Sub-options allow to
 	  select which modules should be built.
