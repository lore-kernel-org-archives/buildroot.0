From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  2 Apr 2021 18:33:43 +0200
Subject: [Buildroot] [PATCH 3/3] package/qpid-proton: fix build without C++
In-Reply-To: <20210402163343.1254491-1-fontaine.fabrice@gmail.com>
References: <20210402163343.1254491-1-fontaine.fabrice@gmail.com>
Message-ID: <20210402163343.1254491-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/05f344151100219c159ca4d466a453df96bf07fa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qpid-proton/qpid-proton.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
index bbf953c472..ce1f0af773 100644
--- a/package/qpid-proton/qpid-proton.mk
+++ b/package/qpid-proton/qpid-proton.mk
@@ -31,6 +31,12 @@ QPID_PROTON_CONF_OPTS = \
 	-DENABLE_WARNING_ERROR=OFF \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python2
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+QPID_PROTON_CONF_OPTS += -DBUILD_CPP=ON
+else
+QPID_PROTON_CONF_OPTS += -DBUILD_CPP=OFF
+endif
+
 # epoll proactor unconditionally uses pthread and cpp binding unconditionally
 # uses proactor
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
-- 
2.30.2
