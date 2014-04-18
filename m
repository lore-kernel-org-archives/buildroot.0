From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Apr 2014 21:40:40 +0200
Subject: [Buildroot] [git commit] nmap: make ndiff conditional on python2
Message-ID: <20140418194047.CBA779C8F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=126d5b5bb847c4c303267e128c80c30ce679498a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ndiff only works when target python2 is available, so disable it
completely when it's not. Fixes:
http://autobuild.buildroot.net/results/402/40269fd96a3b62fa187e9b26e5ab4ce4e7711f95/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nmap/nmap.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 4ed39bf..c7e2225 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -21,4 +21,11 @@ else
 NMAP_CONF_OPT += --without-openssl
 endif
 
+# ndiff only works with python2.x
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+NMAP_DEPENDENCIES += python
+else
+NMAP_CONF_OPT += --without-ndiff
+endif
+
 $(eval $(autotools-package))
