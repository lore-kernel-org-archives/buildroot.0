From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Dec 2016 10:11:41 +0100
Subject: [Buildroot] [git commit] linux: cleanup dead custom-local option
Message-ID: <20161220091252.4855680AD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a65d8678486a4510b07daf18286fe347daf6d76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The option `BR2_LINUX_KERNEL_CUSTOM_LOCAL` no longer exists (see commit
e782cd5b1bc231dda527d5d0a04e6a338669b92c [1]); removing the option. Note
that this legacy option has already been handled (Config.in.legacy) in
the mentioned commit.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index e43b88d..f64a8dc 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -110,7 +110,6 @@ config BR2_LINUX_KERNEL_VERSION
 
 config BR2_LINUX_KERNEL_PATCH
 	string "Custom kernel patches"
-	depends on !BR2_LINUX_KERNEL_CUSTOM_LOCAL
 	help
 	  A space-separated list of patches to apply to the
 	  kernel. Each patch can be described as an URL, a local file
