From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Nov 2015 00:01:23 +0100
Subject: [Buildroot] [git commit] docs/manual: document $(FOO_PKGDIR)
Message-ID: <20151104230133.ACEF17FCEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7dcd2296b6ce8ccf47f844dc844d9150ec665ca0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the manual, add a note that packages can use $(FOO_PKGDIR) to get the
path to the directory containg the .mk and Config.in files, if they need
it to e.g. copy files from there, like startup scripts, systemd units or
any other resource.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-generic.txt |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

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
 
