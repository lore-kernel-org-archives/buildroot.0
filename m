From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 23:39:55 +0200
Subject: [Buildroot] [git commit] utils/getdeveloperlib: add some debug
 information
Message-ID: <20190804220044.193A782C8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb5576db9b9cf06b5f2d2f9a888730503c730462
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
