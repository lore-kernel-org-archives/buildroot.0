From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 27 Feb 2015 10:19:24 +0100
Subject: [Buildroot] [PATCH 7/7] package/libfribidi: add optional dependency
	libglib2
In-Reply-To: <1425028764-1146-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425028764-1146-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425028764-1146-8-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix the following message when libglib2 is enabled but not already
built:
Package glib-2.0 was not found in the pkg-config search path.
Perhaps you should add the directory containing `glib-2.0.pc'
No package 'glib-2.0' found

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/libfribidi/libfribidi.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index 20a5df0..12e7664 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -15,4 +15,10 @@ LIBFRIBIDI_INSTALL_STAGING = YES
 LIBFRIBIDI_AUTORECONF = YES
 LIBFRIBIDI_DEPENDENCIES = host-pkgconf
 
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+ LIBFRIBIDI_DEPENDENCIES += libglib2
+else
+ LIBFRIBIDI_CONF_OPTS += --with-glib=no
+endif
+
 $(eval $(autotools-package))
-- 
2.3.0
