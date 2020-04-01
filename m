From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Apr 2020 21:51:06 +0200
Subject: [Buildroot] [git commit] package/tinyproxy: disable a2x
Message-ID: <20200401193732.A44EA8A4F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebc0c50d42878e0830f537ab36e03bb2b3c8c4fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If a2x is found, tinyproxy won't touch the configuration files and will
try to regenerate them which will result in the following build failure:

make[4]: Entering directory `/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output/build/tinyproxy-1.10.0/docs/man5'
  GEN      tinyproxy.conf.5
  File "/accts/mlweber1/bin/a2x", line 76
    print '%s: %s' % (PROG,msg)
          ^
SyntaxError: invalid syntax

Fixes:
 - http://autobuild.buildroot.org/results/fbd81c05f37a3db6df1cbc3495a89957c6587d25

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tinyproxy/tinyproxy.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tinyproxy/tinyproxy.mk b/package/tinyproxy/tinyproxy.mk
index 305be922f5..6120d183cc 100644
--- a/package/tinyproxy/tinyproxy.mk
+++ b/package/tinyproxy/tinyproxy.mk
@@ -9,5 +9,6 @@ TINYPROXY_SITE = https://github.com/tinyproxy/tinyproxy/releases/download/$(TINY
 TINYPROXY_SOURCE = tinyproxy-$(TINYPROXY_VERSION).tar.bz2
 TINYPROXY_LICENSE = GPL-2.0+
 TINYPROXY_LICENSE_FILES = COPYING
+TINYPROXY_CONF_ENV = ac_cv_path_A2X=no
 
 $(eval $(autotools-package))
