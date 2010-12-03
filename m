From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  3 Dec 2010 16:51:50 -0300
Subject: [Buildroot] [PATCH] openssl: security bump to version 1.0.0c
In-Reply-To: <1291405910-28686-1-git-send-email-gustavo@zacarias.com.ar>
References: <1291405910-28686-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1291405910-28686-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssl/openssl-r19998.patch |   16 ----------------
 package/openssl/openssl.mk           |    2 +-
 2 files changed, 1 insertions(+), 17 deletions(-)
 delete mode 100644 package/openssl/openssl-r19998.patch

diff --git a/package/openssl/openssl-r19998.patch b/package/openssl/openssl-r19998.patch
deleted file mode 100644
index d986ae5..0000000
--- a/package/openssl/openssl-r19998.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Index: openssl/ssl/t1_lib.c
-RCS File: /v/openssl/cvs/openssl/ssl/t1_lib.c,v
-rcsdiff -q -kk '-r1.64.2.15' '-r1.64.2.16' -u '/v/openssl/cvs/openssl/ssl/t1_lib.c,v' 2>/dev/null
---- t1_lib.c	2010/11/16 13:26:24	1.64.2.15
-+++ t1_lib.c	2010/11/16 22:41:07	1.64.2.16
-@@ -779,8 +779,8 @@
- 				{
- 				if(s->session->tlsext_ecpointformatlist)
- 					{
--					*al = TLS1_AD_DECODE_ERROR;
--					return 0;
-+					OPENSSL_free(s->session->tlsext_ecpointformatlist);
-+					s->session->tlsext_ecpointformatlist = NULL;
- 					}
- 				s->session->tlsext_ecpointformatlist_length = 0;
- 				if ((s->session->tlsext_ecpointformatlist = OPENSSL_malloc(ecpointformatlist_length)) == NULL)
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 4d50146..ff807c9 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENSSL_VERSION = 1.0.0b
+OPENSSL_VERSION = 1.0.0c
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_INSTALL_STAGING = YES
 OPENSSL_DEPENDENCIES = zlib
-- 
1.7.2.2
