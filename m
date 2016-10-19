From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 23:18:45 +0200
Subject: [Buildroot] [git commit] docker-engine: add iptables runtime
	dependency
Message-ID: <20161019211855.09BA181D54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=092d3e5e0c28f131e1a6bf375273f4d8f7c2f16d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Docker engine calls iptables internally:

https://github.com/docker/libnetwork/blob/2c921b/iptables/iptables.go#L400

Signed-off-by: Christian Stewart <christian@paral.in>
[Thomas: fix indentation.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/docker-engine/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index b9b9aac..5c4e0ee 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_DOCKER_ENGINE_DAEMON
 	depends on BR2_USE_MMU # docker-containerd
 	depends on BR2_USE_WCHAR # docker-containerd
 	select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
+	select BR2_PACKAGE_IPTABLES # runtime dependency
 	select BR2_PACKAGE_SQLITE # runtime dependency
 	default y
 	help
