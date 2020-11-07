From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Nov 2020 18:43:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/xen: disable go tools
Message-ID: <20201107174337.1076602-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

go tools are enabled by default since version 4.14.0 and
https://github.com/xen-project/xen/commit/1e13ea98bbb8369d065af4666c45c26dab5240d5

Disable them to avoid the following build failure on arm or aarch64
(when host-go is built before xen):

aarch64-none-linux-gnu-gcc: error: unrecognized command line option '-m64'

Fixes:
 - http://autobuild.buildroot.org/results/08948e4c4a88fbf09cae524949e5b656882a6e9a
 - http://autobuild.buildroot.org/results/d966585c931ca4a4ae6a854a21e07eec4c277a02

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xen/xen.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 2427fb9115..3b888137b4 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -18,6 +18,7 @@ XEN_ARCH = arm32
 endif
 
 XEN_CONF_OPTS = \
+	--disable-golang \
 	--disable-ocamltools \
 	--with-initddir=/etc/init.d
 
-- 
2.28.0
