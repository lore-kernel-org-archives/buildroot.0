From: Christian Stewart <christian@paral.in>
Date: Wed, 19 Oct 2016 17:05:15 -0400
Subject: [Buildroot] [PATCH 1/1] docker-engine: add iptables runtime
	dependency
Message-ID: <1476911115-12760-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Docker engine calls iptables internally:

https://github.com/docker/libnetwork/blob/2c921b/iptables/iptables.go#L400

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index b9b9aac..c20df96 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_DOCKER_ENGINE_DAEMON
 	depends on BR2_USE_MMU # docker-containerd
 	depends on BR2_USE_WCHAR # docker-containerd
 	select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
+  select BR2_PACKAGE_IPTABLES # runtime dependency
 	select BR2_PACKAGE_SQLITE # runtime dependency
 	default y
 	help
-- 
2.7.3
