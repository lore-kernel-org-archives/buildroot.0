From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 23:02:56 +0100
Subject: [Buildroot] [git commit branch/next] gstreamer1: add explicit
	libunwind support
Message-ID: <20161107205049.A30787FB7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bef9a1fbeb45c3c30d9e00de7ea1742012e538b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

It's a new feature for 1.10.0+, however it doesn't have an
enable/disable configure switch so just handle the dependency.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index f0afdd9..cb111f2 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -34,6 +34,11 @@ GSTREAMER1_CONF_OPTS = \
 	$(if $(BR2_PACKAGE_GSTREAMER1_PLUGIN_REGISTRY),,--disable-registry) \
 	$(if $(BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS),,--disable-tools)
 
-GSTREAMER1_DEPENDENCIES = libglib2 host-pkgconf host-bison host-flex
+GSTREAMER1_DEPENDENCIES = \
+	host-bison \
+	host-flex \
+	host-pkgconf \
+	libglib2 \
+	$(if $(BR2_PACKAGE_LIBUNWIND),libunwind)
 
 $(eval $(autotools-package))
