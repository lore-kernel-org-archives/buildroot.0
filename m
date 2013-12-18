From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Dec 2013 12:08:34 +0100
Subject: [Buildroot] [git commit] qt5webkit: disable for MIPS64
Message-ID: <20131219153646.2299C9C0AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=60e9010ec843c736ce5d1d34d7a60a0abab23d84
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt5webkit is not currently supported on MIPS64 platforms, so disable the
possibility of selecting this package in that platform.

In the future the following changes would be needed to fix this problem:
A new Source/JavaScriptCore/assembler/MacroAssemblerMIPS64.h file needs
to be created in order to add support for MIPS64 and MacroAssembler.h
needs to be modified to include that file in case of CPU(MIPS64).
Also Source/WTF/wtf/Platform.h and Source/WTF/wtf/dtoa/utils.h need to
be modified to add MIPS64 support.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5webkit/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 9eb5ef8..4a578ff 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -8,6 +8,8 @@ config BR2_PACKAGE_QT5WEBKIT
 	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_QT5BASE_XCB
 	# This module does not support static linking
 	depends on !BR2_PREFER_STATIC_LIB
+	# This package is not supported on MIPS 64-bit architecture
+	depends on !BR2_mips64 && !BR2_mips64el
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
