From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Jul 2010 08:21:09 +0200
Subject: [Buildroot] [PATCH 16/20] openssl: don't override the CC passed at
	configure time
In-Reply-To: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
References: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9d6610f58fd8ab9afb677ccef2dc73dd0a7c187c.1278483657.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openssl/openssl.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 330b604..edbfe8b 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -43,8 +43,8 @@ define OPENSSL_CONFIGURE_CMDS
 endef
 
 define OPENSSL_BUILD_CMDS
-	$(MAKE1) CC=$(TARGET_CC) -C $(@D) all build-shared
-	$(MAKE1) CC=$(TARGET_CC) -C $(@D) do_linux-shared
+	$(MAKE1) -C $(@D) all build-shared
+	$(MAKE1) -C $(@D) do_linux-shared
 endef
 
 define OPENSSL_INSTALL_STAGING_CMDS
-- 
1.7.0.4
