From: Victor Huesca <victor.huesca@bootlin.com>
Date: Sun,  4 Aug 2019 16:21:41 +0200
Subject: [Buildroot] [PATCH 1/3] utils/getdeveloperlib: add some debug
 informations
In-Reply-To: <20190804142143.10923-1-victor.huesca@bootlin.com>
References: <20190804142143.10923-1-victor.huesca@bootlin.com>
Message-ID: <20190804142143.10923-2-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/getdeveloperlib.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index 35c618f791..81eae7ee9b 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -97,6 +97,22 @@ class Developer:
                 return True
         return False
 
+    def __repr__(self):
+        name = '\'' + self.name.split(' <')[0][:20] + '\''
+        things = []
+        if len(self.files):
+            things.append('{} files'.format(len(self.files)))
+        if len(self.packages):
+            things.append('{} pkgs'.format(len(self.packages)))
+        if len(self.architectures):
+            things.append('{} archs'.format(len(self.architectures)))
+        if len(self.infras):
+            things.append('{} infras'.format(len(self.infras)))
+        if things:
+            return 'Developer <{} ({})>'.format(name, ', '.join(things))
+        else:
+            return 'Developer <' + name + '>'
+
 
 def parse_developer_packages(fnames):
     """Given a list of file patterns, travel through the Buildroot source
-- 
2.21.0
