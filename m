From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 6 Jul 2016 09:34:30 +0100
Subject: [Buildroot] [PATCH 3/3] runc: depends on CGO linking being supported
In-Reply-To: <1467794070-44443-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1467794070-44443-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1467794070-44443-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/runc/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/runc/Config.in b/package/runc/Config.in
index 1802e59..fd5dee7 100644
--- a/package/runc/Config.in
+++ b/package/runc/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_RUNC
 	bool "runc"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  runC is a CLI tool for spawning and running containers
@@ -9,5 +10,6 @@ config BR2_PACKAGE_RUNC
 	  https://github.com/opencontainers/runc
 
 comment "runc needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS && \
+		BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.7.3
