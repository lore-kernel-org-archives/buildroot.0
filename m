From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 22:56:46 +0200
Subject: [Buildroot] [git commit] package/mkpasswd: expose the host variant
	in menuconfig
Message-ID: <20161007205704.932EF80ACF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=702bf6597dd6445c3c00b7142f67195ac8d9b5e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some people may need it to generate passwords (not necessarily for
users) from post-build scripts.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in.host          | 1 +
 package/mkpasswd/Config.in.host | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 6d61f19..1140c70 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -23,6 +23,7 @@ menu "Host utilities"
 	source "package/jsmin/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/mke2img/Config.in.host"
+	source "package/mkpasswd/Config.in.host"
 	source "package/mtd/Config.in.host"
 	source "package/mtools/Config.in.host"
 	source "package/mxsldr/Config.in.host"
diff --git a/package/mkpasswd/Config.in.host b/package/mkpasswd/Config.in.host
new file mode 100644
index 0000000..fb5bc80
--- /dev/null
+++ b/package/mkpasswd/Config.in.host
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_HOST_MKPASSWD
+	bool "host-mkpasswd"
