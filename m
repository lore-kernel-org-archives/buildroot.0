From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 27 Dec 2014 22:58:22 +0100
Subject: [Buildroot] [PATCH 04/10] package/keyutils: disable static library
	for shared only build
In-Reply-To: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
References: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1419717508-11627-5-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/keyutils/keyutils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
index 2038c0d..36588e6 100644
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -23,6 +23,10 @@ ifeq ($(BR2_STATIC_LIBS),y)
 KEYUTILS_MAKE_PARAMS += NO_SOLIB=1
 endif
 
+ifeq ($(BR2_SHARED_LIBS),y)
+KEYUTILS_MAKE_PARAMS += NO_ARLIB=1
+endif
+
 define KEYUTILS_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(KEYUTILS_MAKE_PARAMS) -C $(@D)
 endef
-- 
1.9.3
