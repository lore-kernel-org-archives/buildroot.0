From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  4 Nov 2015 23:11:23 +0100
Subject: [Buildroot] [PATCH] docs/manual: document $(FOO_PKGDIR)
Message-ID: <1446675083-22426-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the manual, add a note that packages can use $(FOO_PKGDIR) to get the
path to the directory containg the .mk and Config.in files, if they need
it to e.g. copy files from there, like startup scripts, systemd units or
any other resource.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes:
  - split out of the series since the corresponding code has been
    applied
---
 docs/manual/adding-packages-generic.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index a7143e4..02a43d6 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -495,6 +495,11 @@ endef
 
 In the action definitions, you can use the following variables:
 
+* +$(FOO_PKGDIR)+ contains the path to the directory containing the
+  +foo.mk+ and +Config.in+ files. This variable is useful when it is
+  necessary to install a file bundled in Buildroot, like a runtime
+  configuration file, a splashscren image...
+
 * +$(@D)+, which contains the directory in which the package source
   code has been uncompressed.
 
-- 
1.9.1
