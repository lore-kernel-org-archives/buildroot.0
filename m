From: Martin Bark <martin@barkynet.com>
Date: Sat, 16 Jun 2018 23:06:00 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/ca-certificates: fix rebuilds
In-Reply-To: <20180616220601.4629-1-martin@barkynet.com>
References: <20180616220601.4629-1-martin@barkynet.com>
Message-ID: <20180616220601.4629-3-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebuilding ca-certificates using make ca-certificates-rebuild
caused duplicate certificates to be installed in the target.  Fix this
by cleaning the build directory before building the package.

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/ca-certificates/ca-certificates.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 9685d0e6f0..1df9543e03 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -16,7 +16,7 @@ CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
 
 define CA_CERTIFICATES_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean all
 endef
 
 define CA_CERTIFICATES_INSTALL_TARGET_CMDS
-- 
2.17.1
