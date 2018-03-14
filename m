From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 14 Mar 2018 21:18:35 +0100
Subject: [Buildroot] [PATCH 1/3] docs/manual: pass PARALLEL_JOBS to
 NINJA_OPTS
Message-ID: <20180314201837.21398-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ninja understands the `-j` option which defines how many jobs are
run in parallel.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 docs/manual/adding-packages-meson.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
index 65a0f6a962..f3b4b30e48 100644
--- a/docs/manual/adding-packages-meson.txt
+++ b/docs/manual/adding-packages-meson.txt
@@ -35,7 +35,7 @@ package. Let's start with an example:
 18: 	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
 19: 	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
 20:
-21: FOO_NINJA_OPTS = $(if $(VERBOSE),-v)
+21: FOO_NINJA_OPTS = $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
 22:
 23: ifeq ($(BR2_PACKAGE_BAZ),y)
 24: FOO_CONF_OPTS += -Dbaz
-- 
2.16.2
