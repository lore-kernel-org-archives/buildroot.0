From: Christian Stewart <christian@paral.in>
Date: Fri, 16 Feb 2018 03:26:11 -0500
Subject: [Buildroot] [PATCH 04/10] docker-engine: select static for tini and
 dumb-init
In-Reply-To: <20180216082617.12039-1-christian@paral.in>
References: <20180216082617.12039-1-christian@paral.in>
Message-ID: <20180216082617.12039-5-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In many cases docker-init backing processes like Tini and dumb-init must
be static, as they are executed inside a container in an unknown
environment. This patch selects the static compilation options on both
packages when used as docker-init backing processes.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 7d9a87f7bb..47ac7f57a3 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -44,6 +44,7 @@ choice
 config BR2_PACKAGE_DOCKER_ENGINE_INIT_TINI
 	bool "tini"
 	select BR2_PACKAGE_TINI
+	select BR2_PACKAGE_TINI_STATIC
 	help
 	  Use Tini as the container init process.
 
@@ -52,6 +53,7 @@ config BR2_PACKAGE_DOCKER_ENGINE_INIT_TINI
 config BR2_PACKAGE_DOCKER_ENGINE_INIT_DUMB_INIT
 	bool "dumb-init"
 	select BR2_PACKAGE_DUMB_INIT
+	select BR2_PACKAGE_DUMB_INIT_STATIC
 	help
 	  Use dumb-init as the container init process.
 
-- 
2.13.6
