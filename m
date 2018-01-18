From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 18 Jan 2018 11:41:49 +0100
Subject: [Buildroot] [PATCH] scanpypi: get rid of commented lines and also
 strip the package strings
Message-ID: <1516272109-16411-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 utils/scanpypi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/scanpypi b/utils/scanpypi
index 765bfdc..88fcb4a 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -293,6 +293,10 @@ class BuildrootPackage():
         self.pkg_req = self.setup_metadata['install_requires']
         self.pkg_req = [re.sub('([-.\w]+).*', r'\1', req)
                         for req in self.pkg_req]
+
+        # get rid of commented lines and also strip the package strings
+        self.pkg_req = [item.strip() for item in self.pkg_req if item[0] != '#']
+
         req_not_found = self.pkg_req
         self.pkg_req = map(pkg_buildroot_name, self.pkg_req)
         pkg_tuples = zip(req_not_found, self.pkg_req)
-- 
2.1.4
