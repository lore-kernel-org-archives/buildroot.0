From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 25 May 2021 22:29:44 +0200
Subject: [Buildroot] [git commit] package/Makefile.in: pass '-g0' explicitly
 if !BR2_ENABLE_DEBUG
Message-ID: <20210607144658.0078B814BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebc1ded1913875869eb5cfb27c4100da737e225b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If BR2_ENABLE_DEBUG is not set, Buildroot did not pass any flag
to control debug level. This means that the build system of the package
itself would control it.

Instead, provide an explicit '-g0' (no debugging symbols) to get consistent
behavior across packages.

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Makefile.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index f4028bc67c..86db62ba5b 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -136,6 +136,9 @@ endif
 ifeq ($(BR2_OPTIMIZE_FAST),y)
 TARGET_OPTIMIZATION = -Ofast
 endif
+ifeq ($(BR2_ENABLE_DEBUG),)
+TARGET_DEBUGGING = -g0
+endif
 ifeq ($(BR2_DEBUG_1),y)
 TARGET_DEBUGGING = -g1
 endif
