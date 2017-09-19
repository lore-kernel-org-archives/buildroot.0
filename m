From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 19 Sep 2017 21:44:28 +0200
Subject: [Buildroot] [git commit] pkgconf: expose the host variant in
	menuconfig
Message-ID: <20170919193719.90C207FC4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7eb21b66cf53872d19e3dea097bef64793173b1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the addition of the sdk support it may be interesting to build
host-pkgconf even though no packages need it, so expose it in menuconfig.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in.host         | 1 +
 package/pkgconf/Config.in.host | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index c5a852b..df3893a 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -33,6 +33,7 @@ menu "Host utilities"
 	source "package/opkg-utils/Config.in.host"
 	source "package/parted/Config.in.host"
 	source "package/patchelf/Config.in.host"
+	source "package/pkgconf/Config.in.host"
 	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
 	source "package/python-lxml/Config.in.host"
diff --git a/package/pkgconf/Config.in.host b/package/pkgconf/Config.in.host
new file mode 100644
index 0000000..437a7bf
--- /dev/null
+++ b/package/pkgconf/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_PKGCONF
+	bool "host pkgconf"
+	help
+	  pkgconf is a program which helps to configure compiler and linker
+	  flags for development frameworks. It is similar to pkg-config,
+	  but was written from scratch in the summer of 2011 to replace
+	  pkg-config, which now needs itself to build itself
+
+	  https://github.com/pkgconf/pkgconf
