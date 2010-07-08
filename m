From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jul 2010 13:57:12 +0200
Subject: [Buildroot] [git commit master 1/1] openssl: don't override the CC
	passed at configure time
Message-ID: <20100708115826.298F08269B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9d6610f58fd8ab9afb677ccef2dc73dd0a7c187c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
1.7.1
