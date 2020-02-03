From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Feb 2020 22:01:20 +0100
Subject: [Buildroot] [git commit] package/smartmontools: add libselinux
 optional dependency
Message-ID: <20200203205331.2BEAD88F61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33b6b6b3e20609e1b99b3d2953b83bae2b6842bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libselinux is an optional dependency since a very long time (2010) and
https://github.com/mirror/smartmontools/commit/ab807ee43bd4821f5e0e010de08a746d88506b17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/smartmontools/smartmontools.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index 6c90538f70..bad7da2d16 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -16,4 +16,11 @@ else
 SMARTMONTOOLS_CONF_OPTS += --without-libcap-ng
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+SMARTMONTOOLS_CONF_OPTS += --with-selinux
+SMARTMONTOOLS_DEPENDENCIES += libselinux
+else
+SMARTMONTOOLS_CONF_OPTS += --without-selinux
+endif
+
 $(eval $(autotools-package))
