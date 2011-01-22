From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 22 Jan 2011 17:59:13 +0100
Subject: [Buildroot] [PATCH 1/4] Move fonts into a dedicated submenu
In-Reply-To: <1295715556-7239-1-git-send-email-luca@lucaceresoli.net>
References: <1295715556-7239-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1295715556-7239-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/Config.in                            |    3 ++-
 package/fonts/Config.in                      |    5 +++++
 package/fonts/fonts.mk                       |    1 +
 package/{ => fonts}/liberation/Config.in     |    0
 package/{ => fonts}/liberation/liberation.mk |    0
 5 files changed, 8 insertions(+), 1 deletions(-)
 create mode 100644 package/fonts/Config.in
 create mode 100644 package/fonts/fonts.mk
 rename package/{ => fonts}/liberation/Config.in (100%)
 rename package/{ => fonts}/liberation/liberation.mk (100%)

diff --git a/package/Config.in b/package/Config.in
index 48f245c..3ec9109 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -120,8 +120,9 @@ comment "other GUIs"
 source "package/qt/Config.in"
 source "package/x11r7/Config.in"
 
+source package/fonts/Config.in
+
 comment "X libraries and helper libraries"
-source "package/liberation/Config.in"
 source "package/libsexy/Config.in"
 
 comment "X Window managers"
diff --git a/package/fonts/Config.in b/package/fonts/Config.in
new file mode 100644
index 0000000..61072ad
--- /dev/null
+++ b/package/fonts/Config.in
@@ -0,0 +1,5 @@
+menu "Fonts"
+
+source "package/fonts/liberation/Config.in"
+
+endmenu
diff --git a/package/fonts/fonts.mk b/package/fonts/fonts.mk
new file mode 100644
index 0000000..f0447af
--- /dev/null
+++ b/package/fonts/fonts.mk
@@ -0,0 +1 @@
+include package/fonts/*/*.mk
diff --git a/package/liberation/Config.in b/package/fonts/liberation/Config.in
similarity index 100%
rename from package/liberation/Config.in
rename to package/fonts/liberation/Config.in
diff --git a/package/liberation/liberation.mk b/package/fonts/liberation/liberation.mk
similarity index 100%
rename from package/liberation/liberation.mk
rename to package/fonts/liberation/liberation.mk
-- 
1.7.1
