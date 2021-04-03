From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 12:29:07 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libqmi: switch to
 the new option to disable -Werror
Message-ID: <20210403100914.B81228B547@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9a3ae5b90ca461b6a1a18c23e12af152963636c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

--enable-more-warnings has been dropped since version 1.26.0 and
https://github.com/freedesktop/libqmi/commit/9f31a45d5fc137431705d47b83669f35259932b4

Instead, a new --disable-Werror option has been added, through the use
of AX_COMPILER_FLAGS, so use that to explicitly request wrnings not be
treated as errors.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: use --disable-Werror instead of nothing]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0de1a23c7521d9fdfa20aff9d6608f7986a636ff)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libqmi/libqmi.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 6b5ccfcdea..5bd2aa1ed4 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -13,8 +13,7 @@ LIBQMI_INSTALL_STAGING = YES
 
 LIBQMI_DEPENDENCIES = libglib2
 
-# we don't want -Werror
-LIBQMI_CONF_OPTS = --enable-more-warnings=no
+LIBQMI_CONF_OPTS = --disable-Werror
 
 # if libgudev available, request udev support for a better
 # qmi-firmware-update experience
