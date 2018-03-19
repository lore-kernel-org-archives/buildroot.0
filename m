From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Mar 2018 23:22:37 +0100
Subject: [Buildroot] [git commit] docs/manual: pass PARALLEL_JOBS to
 NINJA_OPTS
Message-ID: <20180319222354.B4D42837FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7479b538a3e1548172ba256001ebd96f1e7076c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ninja understands the `-j` option which defines how many jobs are
run in parallel.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
