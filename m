From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 Apr 2016 10:54:16 -0300
Subject: [Buildroot] [PATCH 1/2] uclibc/defconfig: enable XSI math
Message-ID: <1461246857-5634-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ARM926 size delta +12 KB.
It's required for the upcoming mpv package.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/uClibc-ng.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/uClibc-ng.config b/package/uclibc/uClibc-ng.config
index 66de5a9..2671e06 100644
--- a/package/uclibc/uClibc-ng.config
+++ b/package/uclibc/uClibc-ng.config
@@ -1,4 +1,5 @@
 DO_C99_MATH=y
+DO_XSI_MATH=y
 KERNEL_HEADERS="/usr/src/linux/include"
 # LDSO_CACHE_SUPPORT is not set
 # UCLIBC_STATIC_LDCONFIG is not set
-- 
2.7.3
