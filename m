From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 12:07:28 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] package/pinentry: avoid
 building qt5 version if qt4 is enabled
Message-ID: <20180131123623.4FEA184E76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6eda76eb859863c2a960d6cb01e0730ec2051188
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

BR2_PACKAGE_PINENTRY_QT5 selects BR2_PACKAGE_QT5, which can lead to Qt
version clash if otherwise Qt4 is selected as well. Making
BR2_PACKAGE_PINENTRY_QT5 depending on !BR2_PACKAGE_QT to avoid this.

Fixes:
     http://autobuild.buildroot.net/results/3c537e1260dc9ce57657ca0d49e318a10aee111e

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d3c12b0cfc01081bac42e711c560bf0c1a1e46ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pinentry/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index 781901bbaf..5f2cb58fbb 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -63,6 +63,7 @@ config BR2_PACKAGE_PINENTRY_QT5
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_PACKAGE_PINENTRY_QT4
+	depends on !BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_WIDGETS
