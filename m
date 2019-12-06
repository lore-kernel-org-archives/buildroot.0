From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 23:20:45 +0100
Subject: [Buildroot] [git commit] package/python-twisted: add config for
 HTTP2 support
Message-ID: <20191206222413.C0905884C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6dce8f59df2912a32ec5066aec2fa2f5b272cbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an option that selects all of the necessary python packages to
ensure that twisted has HTTP2 support.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-twisted/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index 805f1bc5d6..4e24a3f71a 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -15,6 +15,11 @@ config BR2_PACKAGE_PYTHON_TWISTED
 
 if BR2_PACKAGE_PYTHON_TWISTED
 
+config BR2_PACKAGE_PYTHON_TWISTED_HTTP2
+	bool "HTTP2 support"
+	select BR2_PACKAGE_PYTHON_H2 # runtime
+	select BR2_PACKAGE_PYTHON_PRIORITY # runtime
+
 config BR2_PACKAGE_PYTHON_TWISTED_TLS
 	bool "TLS support"
 	depends on BR2_INSTALL_LIBSTDCPP # python-{pyopenssl,service-identity}
