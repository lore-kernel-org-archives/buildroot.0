From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 21:18:24 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/smartmontools:
 add libcap-ng optional dependency
Message-ID: <20200307202451.377B88FBF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23bfcbfbcfd09a34c3373f08215183bc3f32ca99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

libcap-ng is an optional dependency since a very long time (2010) and
https://github.com/mirror/smartmontools/commit/24882d3672b759c1125169420749e186a3816fe1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f692541dff3f89f10d16103b0b6e0c31bb9da4b3)
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
