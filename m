From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 6 Jul 2016 09:34:29 +0100
Subject: [Buildroot] [PATCH 2/3] flannel: depends on CGO linking being
	supported
In-Reply-To: <1467794070-44443-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1467794070-44443-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1467794070-44443-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/flannel/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/flannel/Config.in b/package/flannel/Config.in
index cfdb909..134111b 100644
--- a/package/flannel/Config.in
+++ b/package/flannel/Config.in
@@ -1,10 +1,12 @@
 comment "flannel needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS && \
+		BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_FLANNEL
 	bool "flannel"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Flannel is a virtual network that gives a subnet to each
-- 
2.7.3
