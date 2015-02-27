From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 27 Feb 2015 10:19:23 +0100
Subject: [Buildroot] [PATCH 6/7] package/efl/libevas: add optional
	dependency libfribidi
In-Reply-To: <1425028764-1146-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425028764-1146-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425028764-1146-7-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix the following message when libfribidi is enabled but not already
built:
Package fribidi was not found in the pkg-config search path.
Perhaps you should add the directory containing `fribidi.pc'
No package 'fribidi' found

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/efl/libevas/libevas.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 40a01e7..10c3bc3 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -225,6 +225,13 @@ else
 LIBEVAS_CONF_OPTS += --disable-fontconfig
 endif
 
+ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
+LIBEVAS_CONF_OPTS += --enable-fribidi
+LIBEVAS_DEPENDENCIES += libfribidi
+else
+LIBEVAS_CONF_OPTS += --disable-fribidi
+endif
+
 # libevas installs the source code of examples on the target, which
 # are generally not useful.
 define LIBEVAS_REMOVE_EXAMPLES
-- 
2.3.0
