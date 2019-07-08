From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon,  8 Jul 2019 10:14:05 +0200
Subject: [Buildroot] [PATCH buildroot-test 3/4] utils/daily-mail: add some
 debug information for the Notification class
In-Reply-To: <20190708081406.28215-1-victor.huesca@bootlin.com>
References: <20190708081406.28215-1-victor.huesca@bootlin.com>
Message-ID: <20190708081406.28215-4-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It was useful to me when working on adding support for new notification
so it may help someone else.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/utils/daily-mail b/utils/daily-mail
index b4d0a56..85a1c4e 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -65,6 +65,18 @@ class Notification:
         self.arch_notifications = defaultdict(list)
         self.package_notifications = defaultdict(list)
         self.package_version_notification = []
+    def __repr__(self):
+        things = []
+        if len(self.arch_notifications):
+            things.append( '{} archs'.format(len(self.arch_notifications)) )
+        if len(self.package_notifications):
+            things.append( '{} pkgs'.format(len(self.package_notifications)) )
+        if len(self.package_version_notification):
+            things.append( '{} outdated pkgs'.format(len(self.package_version_notification)) )
+        if things:
+            return 'Notification <' + ', '.join(things) + '>'
+        else:
+            return None
 
 # Calculate the list of .mk files in the Buildroot source tree, will
 # be used to guess the name of the packages that caused build
-- 
2.21.0
