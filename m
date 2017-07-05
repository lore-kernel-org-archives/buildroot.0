From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue,  4 Jul 2017 17:30:38 -0700
Subject: [Buildroot] [PATCH] package/libglib2: add missing dependency on
	host-python[3]
Message-ID: <20170705003038.5318-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building gio/gdbus-2.0/codegen/ subdirectory requires host to have a
python interpreter. Add 'host-python'/'host-python3' as a dependency
to reflect that fact and prevent build failures.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/libglib2/libglib2.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 47d9f63..ba4c015 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -112,6 +112,14 @@ HOST_LIBGLIB2_DEPENDENCIES = \
 	host-util-linux \
 	host-zlib
 
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+HOST_LIBGLIB2_DEPENDENCIES += host-python3
+LIBGLIB2_DEPENDENCIES      += host-python3
+else
+HOST_LIBGLIB2_DEPENDENCIES += host-python
+LIBGLIB2_DEPENDENCIES      += host-python
+endif
+
 LIBGLIB2_CONF_OPTS = \
 	--with-pcre=system
 
-- 
2.9.4
