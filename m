From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Jun 2014 22:22:49 +0200
Subject: [Buildroot] [git commit] pinentry: qt4 backend requires the Qt GUI
	module
Message-ID: <20140611202619.2D71C9B261@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=15106b0dee1e8d6d56e602dd009eda4f93a15c52
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/1d8/1d8a8ff1880549b2e2a24cc175dced1a51245cde/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pinentry/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index b163735..ae70257 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -44,6 +44,7 @@ config BR2_PACKAGE_PINENTRY_QT4
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# select qt
 	select BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  The pinentry-qt4 tool
 
