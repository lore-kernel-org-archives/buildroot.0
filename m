From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 27 Jul 2020 17:51:26 +0200
Subject: [Buildroot] [PATCHv3 5/6] gitlab-ci: check generated config files
In-Reply-To: <20200727155127.2703286-1-romain.naour@gmail.com>
References: <20200727155127.2703286-1-romain.naour@gmail.com>
Message-ID: <20200727155127.2703286-5-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the script added by the previous patch to check
generated config files.

Tested on gitlab:
https://gitlab.com/kubu93/buildroot/pipelines/137597966

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
-- 
2.25.4
