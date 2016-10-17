From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:05:59 -0300
Subject: [Buildroot] [PATCH 12/93] openssl: use $(HOST_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-13-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/openssl/openssl.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 5f6267c..814c435 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -102,7 +102,7 @@ OPENSSL_POST_CONFIGURE_HOOKS += OPENSSL_FIXUP_STATIC_MAKEFILE
 endif
 
 define HOST_OPENSSL_BUILD_CMDS
-	$(MAKE) -C $(@D)
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define OPENSSL_BUILD_CMDS
@@ -114,7 +114,7 @@ define OPENSSL_INSTALL_STAGING_CMDS
 endef
 
 define HOST_OPENSSL_INSTALL_CMDS
-	$(MAKE) -C $(@D) install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
 define OPENSSL_INSTALL_TARGET_CMDS
-- 
2.7.3
