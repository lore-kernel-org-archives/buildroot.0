From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 Nov 2019 11:39:50 +0100
Subject: [Buildroot] [git commit] package/python-sip: fix install with
 python 3.8
Message-ID: <20191101103304.F027E8E4CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=709449716ae22af2029e4aa94115762a785abe2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install python-sip in the correct directory otherwise build of
python-pyqt5 will fail

Fixes:
 - http://autobuild.buildroot.org/results/a471b33e8a9803dfe8b36e83647c98165873ddf1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sip/python-sip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 69019f5f19..1d6c205396 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -21,7 +21,7 @@ else ifeq ($(BR2_PACKAGE_PYTHON3),y)
 PYTHON_SIP_DEPENDENCIES += python3
 HOST_PYTHON_SIP_DEPENDENCIES += host-python3
 PYTHON_SIP_LIB_DIR = usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
-PYTHON_SIP_INCLUDE_DIR = usr/include/python$(PYTHON3_VERSION_MAJOR)m
+PYTHON_SIP_INCLUDE_DIR = usr/include/python$(PYTHON3_VERSION_MAJOR)
 endif
 
 define HOST_PYTHON_SIP_CONFIGURE_CMDS
