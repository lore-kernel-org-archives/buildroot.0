From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jun 2021 22:39:33 +0200
Subject: [Buildroot] [git commit branch/next] package/sysrepo: use default
 CMAKE_BUILD_TYPE for host package
Message-ID: <20210601201206.9C20681107@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a7afc0bb68163d30c0a10640cebc7d77723626d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use the default build type for host-sysrepo.
In the current version of sysrepo, this happens to be 'Debug'.
As 'Debug' also enables tests, explicitly disable them.

Suggested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sysrepo/sysrepo.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index dbc7b16b63..f5be29d2c9 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -26,8 +26,9 @@ define SYSREPO_INSTALL_INIT_SYSV
 endef
 
 HOST_SYSREPO_CONF_OPTS = \
-	-DCMAKE_BUILD_TYPE=Release \
 	-DBUILD_EXAMPLES=OFF \
+	-DENABLE_TESTS=OFF \
+	-DENABLE_VALGRIND_TESTS=OFF \
 	-DREPO_PATH=$(TARGET_DIR)/etc/sysrepo
 
 $(eval $(cmake-package))
