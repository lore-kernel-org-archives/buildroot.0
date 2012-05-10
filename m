From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 10 May 2012 16:01:32 +0200
Subject: [Buildroot] [git commit] linux: document and default to sensible
	value for BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
Message-ID: <20120510142624.0FEA396CA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=babd953f5fdd682b6974904562758caf8c8848de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 148b858..7595a4a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -69,7 +69,11 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL
 
 config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 	string "Custom Git version"
+	default "HEAD"
 	depends on BR2_LINUX_KERNEL_CUSTOM_GIT
+	help
+	  Git revision to use in the format used by git rev-parse,
+	  E.G. a sha id, a tag, branch, ..
 
 config BR2_LINUX_KERNEL_VERSION
 	string
