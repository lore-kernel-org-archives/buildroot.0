From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Oct 2016 10:26:41 +0200
Subject: [Buildroot] [PATCH 1/2] package/pseudo: new package
In-Reply-To: <cover.1477729581.git.yann.morin.1998@free.fr>
References: <cover.1477729581.git.yann.morin.1998@free.fr>
Message-ID: <05edc0b87e262b290da043479e16dd1b10c0ac70.1477729581.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pseudo is a program that can either be used directly or as an
LD_PRELOAD, which allows these operations to succeed as if the
user did have system administrator privileges even though they
are an ordinary user.

Pseudo has a lot of similarities to fakeroot but is a new
implementation that improves on the problems seen using fakeroot.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Andrey Yurovsky <yurovsky@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pseudo/pseudo.hash |  2 ++
 package/pseudo/pseudo.mk   | 15 +++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 package/pseudo/pseudo.hash
 create mode 100644 package/pseudo/pseudo.mk

diff --git a/package/pseudo/pseudo.hash b/package/pseudo/pseudo.hash
new file mode 100644
index 0000000..5822d0e
--- /dev/null
+++ b/package/pseudo/pseudo.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  d7767c9a73b0df4f1f26952cf5eca4c6ff6fc4bc5ef15a904ea3839c70161936  pseudo-7abc9396731149df5eaf43c84fed4f3053b64de6.tar.gz
diff --git a/package/pseudo/pseudo.mk b/package/pseudo/pseudo.mk
new file mode 100644
index 0000000..314fa82
--- /dev/null
+++ b/package/pseudo/pseudo.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# pseudo
+#
+################################################################################
+
+PSEUDO_VERSION = 7abc9396731149df5eaf43c84fed4f3053b64de6
+PSEUDO_SITE = https://git.yoctoproject.org/git/pseudo
+PSEUDO_SITE_METHOD = git
+
+# No "or later" clause.
+PSEUDO_LICENSE = LGPLv2.1
+PSEUDO_LICENSE_FILES = COPYING
+
+$(eval $(host-autotools-package))
-- 
2.7.4
