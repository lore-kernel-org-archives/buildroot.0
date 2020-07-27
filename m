From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 18:13:44 +0200
Subject: [Buildroot] [git commit] gitlab-ci: check generated config files
Message-ID: <20200727161031.82BC68258C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52b8ebc088c494ca0ce76506683e6d3c55cbd7a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the script added by the previous patch to check
generated config files.

Tested on gitlab:
https://gitlab.com/kubu93/buildroot/pipelines/137597966

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/misc/gitlab-ci.yml.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index cf9bf5f9cf..01592f7155 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -38,6 +38,7 @@ check-package:
     script:
         - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
         - make ${DEFCONFIG_NAME}
+        - ./support/scripts/check-dotconfig.py .config ./configs/${DEFCONFIG_NAME}
         - echo 'Build buildroot'
         - |
             make > >(tee build.log |grep '>>>') 2>&1 || {
