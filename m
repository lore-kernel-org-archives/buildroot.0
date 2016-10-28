From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Fri, 28 Oct 2016 10:18:21 -0300
Subject: [Buildroot] [PATCH 03/11] lzip: use $(TARGET_MAKE_ENV) for
	configure as well
In-Reply-To: <1477660709-5935-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1477660709-5935-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1477660709-5935-3-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/lzip/lzip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index ecf70a3..8180fd0 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -10,7 +10,7 @@ LZIP_LICENSE = GPLv3+
 LZIP_LICENSE_FILES = COPYING
 
 define LZIP_CONFIGURE_CMDS
-	(cd $(@D); ./configure --prefix=/usr \
+	(cd $(@D); $(TARGET_MAKE_ENV) ./configure --prefix=/usr \
 		$(TARGET_CONFIGURE_OPTS) )
 endef
 
-- 
2.7.3
