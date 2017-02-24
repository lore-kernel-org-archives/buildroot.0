From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Feb 2017 12:02:29 +0100
Subject: [Buildroot] [git commit] toolchain-external: install libanl.so for
	glibc
Message-ID: <20170225154244.60171804A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9abb4a8b4d9498a8eb4e0fdd3a625534adc9382
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libanl.so is needed for asynchronous network address and service
translation, declared in netdb.h

Signed-off-by: Jesper B??kdahl <jbb@gamblify.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
