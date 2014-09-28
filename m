From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Sep 2014 17:13:44 +0200
Subject: [Buildroot] [PATCH 1/2] package/libcurl: Remove autoreconf
Message-ID: <1411917225-14081-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libcurl-0001-build-link-curl-to-NSS-libraries-when-NSS-support.patch
was removed the corresponding autoreconf was left behind:
http://git.buildroot.net/buildroot/commit/?id=9185b64ed5599622cb89ca4ee6ee29440b02ec8a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcurl/libcurl.mk |    2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 610efc1..74584a6 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -14,8 +14,6 @@ LIBCURL_DEPENDENCIES = host-pkgconf \
 LIBCURL_LICENSE = ICS
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_INSTALL_STAGING = YES
-# For libcurl-0001-build-link-curl-to-NSS-libraries-when-NSS-support.patch
-LIBCURL_AUTORECONF = YES
 
 # We disable NTLM support because it uses fork(), which doesn't work
 # on non-MMU platforms. Moreover, this authentication method is
-- 
1.7.10.4
