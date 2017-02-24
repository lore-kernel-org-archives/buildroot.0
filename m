From: =?UTF-8?q?Jesper=20B=C3=A6kdahl?= <jbb@gamblify.com>
Date: Fri, 24 Feb 2017 10:03:08 +0100
Subject: [Buildroot] [PATCH v2 2/2] toolchain-external: install libanl.so
	for glibc
In-Reply-To: <1487926988-32495-1-git-send-email-jbb@gamblify.com>
References: <1487848270-32609-1-git-send-email-jbb@gamblify.com>
 <1487926988-32495-1-git-send-email-jbb@gamblify.com>
Message-ID: <1487926988-32495-2-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libanl.so is needed for asynchronous network address and service
translation, declared in netdb.h

Signed-off-by: Jesper B?kdahl <jbb@gamblify.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 6658875..11a1bf5 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -124,7 +124,7 @@ endif # ! no threads
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
-TOOLCHAIN_EXTERNAL_LIBS += libnss_files.so.* libnss_dns.so.* libmvec.so.*
+TOOLCHAIN_EXTERNAL_LIBS += libnss_files.so.* libnss_dns.so.* libmvec.so.* libanl.so.*
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
-- 
2.7.4
