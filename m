From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 17 Oct 2017 17:42:13 +0300
Subject: [Buildroot] [PATCH 2/2] msgpack: fix static build
In-Reply-To: <10b0beaaa7f14fb4847cb2c1d7cdda39ce6aa566.1508251333.git.baruch@tkos.co.il>
References: <10b0beaaa7f14fb4847cb2c1d7cdda39ce6aa566.1508251333.git.baruch@tkos.co.il>
Message-ID: <cea0bf6f5635443cf457ec6e0bf13875b5de41bc.1508251333.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disabled shared libraries when building static only.

Fixes:
http://autobuild.buildroot.net/results/057/057d72bc84c467973ec3c076f5d8108e02d6e283/
http://autobuild.buildroot.net/results/499/499069f6821ddd2dcb83201b017a58eae00ebe16/
http://autobuild.buildroot.net/results/499/499069f6821ddd2dcb83201b017a58eae00ebe16/

Cc: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/msgpack/msgpack.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/msgpack/msgpack.mk b/package/msgpack/msgpack.mk
index ff8581ecb8c9..f43fcfb8639b 100644
--- a/package/msgpack/msgpack.mk
+++ b/package/msgpack/msgpack.mk
@@ -14,4 +14,8 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 MSGPACK_CONF_OPTS += -DMSGPACK_BUILD_EXAMPLES=OFF
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+MSGPACK_CONF_OPTS += -DMSGPACK_ENABLE_SHARED=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.14.2
