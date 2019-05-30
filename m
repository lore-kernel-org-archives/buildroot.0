From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 May 2019 12:33:34 +0200
Subject: [Buildroot] [git commit branch/next] support/gnuconfig: update
 README.buildroot with reality
Message-ID: <20190530103124.3B1B780163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93e4f2d5ed52e04f99797790af1c489770b9d9d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

4 out of 5 packages who are not using autotools but needed their
gnuconfig files updated were not complying with the recommandation in
support/gnuconfig/README.buildroot. The fifth package was converted to
be like the others: use UPDATE_CONFIG_HOOK as a <pkg>_POST_PATCH_HOOKS
rather than calling the CONFIG_UPDATE macro directly.

Now that all packages are consistent, update the README.buildroot file
to match the reality.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/gnuconfig/README.buildroot | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/gnuconfig/README.buildroot b/support/gnuconfig/README.buildroot
index a71ed93010..7ba2a332a4 100644
--- a/support/gnuconfig/README.buildroot
+++ b/support/gnuconfig/README.buildroot
@@ -10,7 +10,7 @@ If for some reason your package does not use the autotools-package
 infrastructure, you can request the config.guess and/or config.sub
 files of your package to be updated by using:
 
-      $(call CONFIG_UPDATE,directory-of-your-package-sources)
+<pkg>_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 
 --- UPDATE ---
 GNU config is now managed in git, so to update:
