From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 26 Mar 2021 20:08:55 +0100
Subject: [Buildroot] [PATCH 1/2] package/sofia-sip: bump version to 1.13.3
Message-ID: <20210326190856.704217-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patches which were applied upstream:
https://github.com/freeswitch/sofia-sip/commit/f6f29b483e9c31ce8d3e87419ec3deea8679312d
https://github.com/freeswitch/sofia-sip/commit/d568475eb7291bc72f585a116319b05d80b818e1

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...reintroduce-soatag_local_sdp_str_ref.patch | 30 ---------------
 .../0002-sofia-sip-fix-s2tcase.c.patch        | 38 -------------------
 package/sofia-sip/sofia-sip.hash              |  2 +-
 package/sofia-sip/sofia-sip.mk                |  2 +-
 4 files changed, 2 insertions(+), 70 deletions(-)
 delete mode 100644 package/sofia-sip/0001-soa_tag.h-reintroduce-soatag_local_sdp_str_ref.patch
 delete mode 100644 package/sofia-sip/0002-sofia-sip-fix-s2tcase.c.patch

diff --git a/package/sofia-sip/0001-soa_tag.h-reintroduce-soatag_local_sdp_str_ref.patch b/package/sofia-sip/0001-soa_tag.h-reintroduce-soatag_local_sdp_str_ref.patch
deleted file mode 100644
index 57c0bfe250..0000000000
--- a/package/sofia-sip/0001-soa_tag.h-reintroduce-soatag_local_sdp_str_ref.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From bcd0f17fd83f2dfe570a3ab17249a5c7290b27f2 Mon Sep 17 00:00:00 2001
-From: Pekka Pessi <Pekka.Pessi@nokia.com>
-Date: Thu, 24 Mar 2011 14:45:21 +0200
-Subject: [PATCH] soa_tag.h: reintroduce soatag_local_sdp_str_ref
-
-Thanks to Erik Habicht <e.habicht@thiesen.com> for spotting it
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[rebased for sofia-sip 1.13.1-d10a3d268c, patch sent upstream
- https://github.com/freeswitch/sofia-sip/pull/23]
----
- libsofia-sip-ua/soa/sofia-sip/soa_tag.h |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/libsofia-sip-ua/soa/sofia-sip/soa_tag.h b/libsofia-sip-ua/soa/sofia-sip/soa_tag.h
-index 723ca02..d9448d6 100644
---- a/libsofia-sip-ua/soa/sofia-sip/soa_tag.h
-+++ b/libsofia-sip-ua/soa/sofia-sip/soa_tag.h
-@@ -130,7 +130,7 @@ SOFIAPUBVAR tag_typedef_t soatag_local_sdp_ref;
- SOFIAPUBVAR tag_typedef_t soatag_local_sdp_str;
- #define SOATAG_LOCAL_SDP_STR_REF(x) \
-   soatag_local_sdp_str_ref, tag_str_vr(&(x))
--SOFIAPUBVAR tag_typedef_t soatag_session_sdp_str_ref;
-+SOFIAPUBVAR tag_typedef_t soatag_local_sdp_str_ref;
- 
- #define SOATAG_AF(x)             soatag_af, tag_int_v((x))
- SOFIAPUBVAR tag_typedef_t soatag_af;
--- 
-1.7.7
-
diff --git a/package/sofia-sip/0002-sofia-sip-fix-s2tcase.c.patch b/package/sofia-sip/0002-sofia-sip-fix-s2tcase.c.patch
deleted file mode 100644
index a2cc412843..0000000000
--- a/package/sofia-sip/0002-sofia-sip-fix-s2tcase.c.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From d66a2e55daf223737c07c59b1be45a2d91212ef6 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 26 Jul 2020 13:47:16 +0200
-Subject: [PATCH] [sofia-sip] fix s2tcase.c
-
-Fixes build error with recent libcheck:
-https://github.com/freeswitch/sofia-sip/issues/22
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- s2check/s2tcase.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libs/sofia-sip/s2check/s2tcase.c b/libs/sofia-sip/s2check/s2tcase.c
-index 382aaa3ad7..d67694c2ce 100644
---- a/s2check/s2tcase.c
-+++ b/s2check/s2tcase.c
-@@ -57,7 +57,7 @@ void s2_tcase_add_test(TCase *tc, TFun tf, char const *name,
-       if (strcmp(*patterns, "*")) {
- 	printf("%s: selected\n", name);
-       }
--      _tcase_add_test(tc, tf, name, signo, 0, start, end);
-+      _tcase_add_test(tc, tf, name, signo, start, end);
-       return;
-     }
-   }
-@@ -67,7 +67,7 @@ void s2_tcase_add_test(TCase *tc, TFun tf, char const *name,
-       if (strcmp(*patterns, "*")) {
- 	printf("%s: selected\n", name);
-       }
--      _tcase_add_test(tc, tf, name, signo, 0, start, end);
-+      _tcase_add_test(tc, tf, name, signo, start, end);
-       return;
-     }
-   }
--- 
-2.27.0
-
diff --git a/package/sofia-sip/sofia-sip.hash b/package/sofia-sip/sofia-sip.hash
index 99b315e276..0484cc1501 100644
--- a/package/sofia-sip/sofia-sip.hash
+++ b/package/sofia-sip/sofia-sip.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  4cf0de1aaa1e1737db5a8fe4104021a8e60a148a4534f92b5affdd9782e404aa  sofia-sip-1.13.1-d10a3d268c.tar.gz
+sha256  b539444a5d03e281b829ee9133ae9e717f2d2a03399808365e5ab85574e25d95  sofia-sip-1.13.3-8071e8accd.tar.gz
 sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  COPYING
 sha256  b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  COPYRIGHTS
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index ef1b35fa2c..5c383400ff 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOFIA_SIP_VERSION = 1.13.1-d10a3d268c
+SOFIA_SIP_VERSION = 1.13.3-8071e8accd
 SOFIA_SIP_SITE = https://files.freeswitch.org/downloads/libs
 SOFIA_SIP_INSTALL_STAGING = YES
 SOFIA_SIP_DEPENDENCIES = host-pkgconf
-- 
2.29.2
