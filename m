From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Nov 2016 06:58:28 -0300
Subject: [Buildroot] [PATCH 02/14] gstreamer1: add explicit libunwind support
In-Reply-To: <1478167120-3285-1-git-send-email-gustavo@zacarias.com.ar>
References: <1478167120-3285-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1478167120-3285-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's a new feature for 1.10.0+, however it doesn't have an
enable/disable configure switch so just handle the dependency.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.7.3
