From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 May 2019 22:12:32 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/python-ply: add
 host variant
Message-ID: <20190501201631.C842A839E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db1f62c7a32093188e7eaba348a9c25f9321d69c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Commit 89e70a7077 (package/bind: fix python build) added a dependency on
host-python-ply to bind, which doesn't exist. Add it.

Fixes:
 - http://autobuild.buildroot.org/results/a68251773f61c3463f4d18aa626c83df70126afc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: reword / add commit reference]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 3d8e1ad1f36392a68ea7291c8da1e978b7e99dd8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-ply/python-ply.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-ply/python-ply.mk b/package/python-ply/python-ply.mk
index 95a290a7c4..5dc7964d5f 100644
--- a/package/python-ply/python-ply.mk
+++ b/package/python-ply/python-ply.mk
@@ -12,3 +12,4 @@ PYTHON_PLY_LICENSE = BSD-3-Clause
 PYTHON_PLY_LICENSE_FILES = README.md
 
 $(eval $(python-package))
+$(eval $(host-python-package))
