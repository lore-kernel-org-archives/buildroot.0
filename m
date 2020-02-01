From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Feb 2020 00:17:29 +0100
Subject: [Buildroot] [git commit] package/smartmontools: add libcap-ng
 optional dependency
Message-ID: <20200201230707.2818988116@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f692541dff3f89f10d16103b0b6e0c31bb9da4b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcap-ng is an optional dependency since a very long time (2010) and
https://github.com/mirror/smartmontools/commit/24882d3672b759c1125169420749e186a3816fe1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/smartmontools/smartmontools.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index 137c00a505..6c90538f70 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -9,4 +9,11 @@ SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smar
 SMARTMONTOOLS_LICENSE = GPL-2.0+
 SMARTMONTOOLS_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
+SMARTMONTOOLS_CONF_OPTS += --with-libcap-ng
+SMARTMONTOOLS_DEPENDENCIES += libcap-ng
+else
+SMARTMONTOOLS_CONF_OPTS += --without-libcap-ng
+endif
+
 $(eval $(autotools-package))
