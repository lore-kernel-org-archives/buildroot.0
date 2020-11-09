From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2020 17:06:13 +0100
Subject: [Buildroot] [git commit branch/next] package/xen: disable go tools
Message-ID: <20201117203826.3289C8633A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c04a56af130a6d4276dbbd319639a3cdbf509229
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

go tools are enabled by default since version 4.14.0 and
https://github.com/xen-project/xen/commit/1e13ea98bbb8369d065af4666c45c26dab5240d5

Disable them to avoid the following build failure on arm or aarch64
(when host-go is built before xen):

aarch64-none-linux-gnu-gcc: error: unrecognized command line option '-m64'

Fixes:
 - http://autobuild.buildroot.org/results/08948e4c4a88fbf09cae524949e5b656882a6e9a
 - http://autobuild.buildroot.org/results/d966585c931ca4a4ae6a854a21e07eec4c277a02

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index a30e80e5e7..8f1fa7db76 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -18,6 +18,7 @@ XEN_ARCH = arm32
 endif
 
 XEN_CONF_OPTS = \
+	--disable-golang \
 	--disable-ocamltools \
 	--with-initddir=/etc/init.d
 
