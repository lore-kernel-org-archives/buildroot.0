From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 15 Jun 2020 21:46:32 +0300
Subject: [Buildroot] [PATCH 1/1] pkg-python.mk: use PYTHON3_PATH instead of
 duplicating its value
In-Reply-To: <20200615184632.493821-1-asafka7@gmail.com>
References: <20200615184632.493821-1-asafka7@gmail.com>
Message-ID: <20200615184632.493821-8-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/pkg-python.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 4bf762e662..e5cd52003e 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -21,7 +21,7 @@
 ################################################################################
 
 define PKG_PYTHON_SYSCONFIGDATA_NAME
-$(basename $(notdir $(wildcard $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/_sysconfigdata__linux_*.py)))
+$(basename $(notdir $(wildcard $(PYTHON3_PATH)/_sysconfigdata__linux_*.py)))
 endef
 
 # Target distutils-based packages
-- 
2.26.2
