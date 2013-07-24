From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 24 Jul 2013 09:22:59 +0200
Subject: [Buildroot] [PATCH 2 of 6 v2] linux: don't take HEAD as default for
 git repositories
In-Reply-To: <patchbomb.1374650577@BEANTN0L019720>
References: <patchbomb.1374650577@BEANTN0L019720>
Message-ID: <6d0a6d80647910c487ba.1374650579@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Specifying a floating tag like HEAD for a repository version is bad practice,
as it results in non-reproducible builds. This patch removes the default
assignment of HEAD as version when a custom git repository is used for the
Linux kernel.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
(v2): new patch in series after comment from Peter

 linux/Config.in |  1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -68,7 +68,6 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_
 
 config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 	string "Custom Git version"
-	default "HEAD"
 	depends on BR2_LINUX_KERNEL_CUSTOM_GIT
 	help
 	  Git revision to use in the format used by git rev-parse,
