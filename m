From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 30 Dec 2013 18:57:53 +0100
Subject: [Buildroot] [PATCH 2/3] python: depend on libiconv if appropriate
In-Reply-To: <1388426274-17641-1-git-send-email-berndkuhls@hotmail.com>
References: <1388426274-17641-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP115A8961269068C95EAAECDD9CE0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/python/python.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index bc42e8f..bd60112 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -47,7 +47,7 @@ HOST_PYTHON_MAKE_ENV = \
 # MAKE1 has shown to workaround the problem.
 HOST_PYTHON_MAKE = $(MAKE1)
 
-PYTHON_DEPENDENCIES  = host-python libffi
+PYTHON_DEPENDENCIES  = host-python libffi $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(if $(BR2_NEEDS_GETTEXT),gettext)
 
 HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
 
-- 
1.7.9.5
