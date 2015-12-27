From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Dec 2015 21:44:46 +0100
Subject: [Buildroot] [PATCHv2] core: add defconfig to .gitignore
Message-ID: <1451249086-24341-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Karoly Kasza <kaszak@gmail.com>

After using "make safedefconfig", a defconfig file appears which is an
extract of the .config file. When running git, it incorrectly detects it as a
source code change.

Add /defconfig to .gitignore.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
[yann.morin.1998 at free.fr: do not remove on distclean]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - do not remove on distclean
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index bb02d9f..66f5ac1 100644
--- a/.gitignore
+++ b/.gitignore
@@ -5,6 +5,7 @@
 /.config.old
 /..config.tmp
 /.config
+/defconfig
 *.depend
 *.o
 /*.patch
-- 
1.9.1
