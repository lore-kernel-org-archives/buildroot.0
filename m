From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 11:59:57 +0200
Subject: [Buildroot] [git commit] linux: don't take HEAD as default for git
	repositories
Message-ID: <20130813095956.CF5A39A69C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a7a0a707be0f0a4b115990ce704a730b85ee3e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Specifying a floating tag like HEAD for a repository version is bad practice,
as it results in non-reproducible builds. This patch removes the default
assignment of HEAD as version when a custom git repository is used for the
Linux kernel.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 065696a..f6acddf 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -68,7 +68,6 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL
 
 config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 	string "Custom Git version"
-	default "HEAD"
 	depends on BR2_LINUX_KERNEL_CUSTOM_GIT
 	help
 	  Git revision to use in the format used by git rev-parse,
