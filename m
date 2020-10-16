From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 16 Oct 2020 22:19:15 +0200
Subject: [Buildroot] [PATCH 1/2] package/mpdecimal: add optional C++
 dependency
Message-ID: <20201016201916.2082927-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 2.5.0 enables the new libmpdec++ library by default:
http://www.bytereef.org/mpdecimal/changelog.html#version-2-5-0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpdecimal/mpdecimal.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mpdecimal/mpdecimal.mk b/package/mpdecimal/mpdecimal.mk
index 00aa98e693..fa310a2274 100644
--- a/package/mpdecimal/mpdecimal.mk
+++ b/package/mpdecimal/mpdecimal.mk
@@ -22,4 +22,10 @@ MPDECIMAL_CONF_ENV += MACHINE=ansi32
 endif
 endif
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+MPDECIMAL_CONF_OPTS += --enable-cxx
+else
+MPDECIMAL_CONF_OPTS += --disable-cxx
+endif
+
 $(eval $(autotools-package))
-- 
2.28.0
