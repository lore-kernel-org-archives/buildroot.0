From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 31 Oct 2019 13:17:03 +0100
Subject: [Buildroot] [PATCH 3/3] package/sysrepo.mk: fix debug build
In-Reply-To: <20191031121703.7628-1-fontaine.fabrice@gmail.com>
References: <20191031121703.7628-1-fontaine.fabrice@gmail.com>
Message-ID: <20191031121703.7628-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set IS_DEVELOPER_CONFIGURATION to OFF to avoid a build failure due to
files being installed in wrong directory

Fixes:
 - http://autobuild.buildroot.org/results/bcd9bdd3bc83c1f2ab0b24348d51de27d88649b4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sysrepo/sysrepo.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index 72c380768d..8676158a19 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -13,6 +13,7 @@ SYSREPO_DEPENDENCIES = libev libnetconf2 libavl libyang pcre protobuf-c host-sys
 HOST_SYSREPO_DEPENDENCIES = host-libev host-libnetconf2 host-libavl host-libyang host-pcre host-protobuf-c
 
 SYSREPO_CONF_OPTS = \
+	-DIS_DEVELOPER_CONFIGURATION=OFF \
 	-DGEN_PYTHON2_TESTS=OFF \
 	-DENABLE_TESTS=OFF \
 	-DGEN_CPP_BINDINGS=OFF \
-- 
2.23.0
