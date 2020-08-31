From: Tian Yuanhao <tianyuanhao@aliyun.com>
Date: Mon, 31 Aug 2020 10:16:41 +0800
Subject: [Buildroot] [PATCH] libcap: disable GOLANG
Message-ID: <1f3d9456-9ca2-75f4-7e15-d851e65005ea@aliyun.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libcap is a pure C library before 2.27, it lacks some environment
variables set in pkg-golang.mk.

Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
---
 ?package/libcap/libcap.mk | 4 ++--
 ?1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 08c1bc9..5843ef9 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -62,12 +62,12 @@ endef

 ?define HOST_LIBCAP_BUILD_CMDS
 ???? $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)\
-??? ??? RAISE_SETFCAP=no
+??? ??? GOLANG=no RAISE_SETFCAP=no
 ?endef

 ?define HOST_LIBCAP_INSTALL_CMDS
 ???? $(HOST_MAKE_ENV) $(MAKE) -C $(@D) prefix=$(HOST_DIR) \
-??? ??? RAISE_SETFCAP=no lib=lib install
+??? ??? GOLANG=no RAISE_SETFCAP=no lib=lib install
 ?endef

 ?$(eval $(generic-package))
-- 
2.7.4
