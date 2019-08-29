From: Victor Huesca <victor.huesca@bootlin.com>
Date: Thu, 29 Aug 2019 15:23:41 +0200
Subject: [Buildroot] [PATCH buildroot-test 03/10] utils/daily-mail: new
 gitlab-ci data: runtime tests
In-Reply-To: <20190829132348.1603-1-victor.huesca@bootlin.com>
References: <20190829132348.1603-1-victor.huesca@bootlin.com>
Message-ID: <20190829132348.1603-4-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds runtime tests to the recognized gitlab-ci results.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/daily-mail b/utils/daily-mail
index 9dc9729..53500a6 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -532,6 +532,9 @@ def get_pipeline_jobs(project_id, pipeline, kinds=None, **request_kwargs):
         if name.endswith('_defconfig'):
             job['kind'] = 'defconfig'
             job['name'] = name[:-10]
+        elif name.startswith('tests.'):
+            job['kind'] = 'runtime-test'
+            job['name'] = name.split('.')[-1]
         else:
             job['kind'] = 'other'
     # Filter failed jobs then sort them
-- 
2.21.0
