From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu, 22 Dec 2016 15:21:16 +0100
Subject: [Buildroot] [PATCH v4 10/10] poppler: Compile with -std=c++11
In-Reply-To: <1482416476-20306-1-git-send-email-anaumann@ultratronik.de>
References: <1482416476-20306-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <1482416476-20306-11-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt depends on C++11 support since version 5.7

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/poppler/poppler.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index f042914..dcb6fa1 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -14,6 +14,8 @@ POPPLER_INSTALL_STAGING = YES
 POPPLER_CONF_OPTS = --with-font-configuration=fontconfig \
 	--enable-xpdf-headers
 
+POPPLER_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+
 ifeq ($(BR2_PACKAGE_CAIRO),y)
 POPPLER_CONF_OPTS += --enable-cairo-output
 POPPLER_DEPENDENCIES += cairo
-- 
1.9.1
